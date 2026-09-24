#!/usr/bin/env python3
"""Trích mọi khối ```sql``` trong docs/ ra một file .sql để chạy kiểm thử trên PostgreSQL thật.

Một khối bị BỎ QUA khi ngay phía trên nó có một trong các đánh dấu sau
(đánh dấu viết bằng HTML comment nên người đọc website không nhìn thấy):

    <!-- sql:khong-chay -->   mã minh hoạ, bảng chưa tồn tại, hoặc mã giả
    <!-- sql:co-y-loi -->     câu lệnh CỐ Ý sai để dạy thông báo lỗi

KHẲNG ĐỊNH SỐ DÒNG
------------------
Bài học thường viết "kết quả: 5 dòng". Trước đây CI chỉ xác nhận câu lệnh CHẠY ĐƯỢC,
không xác nhận nó trả về đúng số dòng bài nói — và đã có bài ghi sai (nói 2 dòng,
thực tế 5 dòng). Để đóng lỗ hổng đó, đặt một dòng comment SQL ngay trên câu SELECT
CUỐI CÙNG của khối:

    ```sql
    -- KỲ VỌNG: 5 dòng
    SELECT ho_ten_hs FROM bang_bet WHERE ... ORDER BY ho_ten_hs;
    ```

Script sẽ sinh thêm một khối kiểm tra khiến CI đỏ nếu số dòng thật khác con số khai báo.
Comment này hiện trên website, và đó là điều tốt: người học biết mình phải thấy gì.

Ràng buộc: đánh dấu phải nằm ngay trên MỘT câu SELECT duy nhất kết thúc khối.

Cách dùng:  python3 scripts/trich_sql.py > /tmp/sql_bai_hoc.sql
"""
import glob
import os
import re
import sys

DANH_DAU = ("<!-- sql:khong-chay -->", "<!-- sql:co-y-loi -->")
KHOI_SQL = re.compile(r"```sql\n(.*?)```", re.S)
KY_VONG = re.compile(r"^[ \t]*--[ \t]*KỲ VỌNG:[ \t]*(\d+)[ \t]*dòng[ \t]*$", re.M)
# Khoảng văn bản ngay trước khối, đủ dài để chứa đánh dấu và vài dòng trống.
CUA_SO_TRUOC = 120


def main() -> int:
    goc = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
    duong_dan = sorted(glob.glob(os.path.join(goc, "docs", "**", "*.md"), recursive=True))
    so_chay, so_bo_qua, so_kv = 0, 0, 0

    for duong in duong_dan:
        with open(duong, encoding="utf-8") as f:
            noi_dung = f.read()
        ten = os.path.relpath(duong, goc)

        for khop in KHOI_SQL.finditer(noi_dung):
            truoc = noi_dung[max(0, khop.start() - CUA_SO_TRUOC):khop.start()]
            if any(dau in truoc for dau in DANH_DAU):
                so_bo_qua += 1
                continue
            so_chay += 1
            noi_khoi = khop.group(1).rstrip()
            print(f"-- >>> {ten}")
            print(noi_khoi)
            print()

            kv = list(KY_VONG.finditer(noi_khoi))
            if kv:
                cuoi = kv[-1]
                truy_van = noi_khoi[cuoi.end():].strip().rstrip(";").strip()
                mong_doi = int(cuoi.group(1))
                if not truy_van:
                    print(f"-- !! KỲ VỌNG ở {ten} không có câu lệnh nào theo sau", file=sys.stderr)
                    continue
                so_kv += 1
                nhan = f"{ten} (kỳ vọng {mong_doi} dòng)"
                print(f"-- kiểm tra số dòng cho {ten}")
                print("DO $kiemtra$")
                print("DECLARE n bigint;")
                print("BEGIN")
                print(f"  SELECT count(*) INTO n FROM ({truy_van}) AS t_kiem_tra;")
                print(f"  IF n <> {mong_doi} THEN")
                print(f"    RAISE EXCEPTION 'SAI SO DONG: {nhan} nhung thuc te tra ve % dong', n;")
                print("  END IF;")
                print("END $kiemtra$;")
                print()

    print(f"-- Trích {so_chay} khối SQL để chạy, bỏ qua {so_bo_qua} khối đã đánh dấu, "
          f"{so_kv} khẳng định số dòng.", file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
