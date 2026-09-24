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

Với truy vấn tổng hợp chỉ trả về một dòng, "1 dòng" không kiểm được gì. Khi đó hãy
khẳng định GIÁ TRỊ của cột, một dòng cho mỗi cột cần kiểm:

    ```sql
    -- KỲ VỌNG: so_dong = 90
    SELECT count(*) AS so_dong FROM b17_bet_1nf;
    ```

Giá trị được so sánh dưới dạng text với dòng ĐẦU TIÊN của kết quả. Dùng `NULL` để
khẳng định ô rỗng. Hai kiểu đánh dấu kết hợp được: khai số dòng rồi khai giá trị cột.

Script sẽ sinh thêm khối kiểm tra khiến CI đỏ nếu thực tế khác điều khai báo.
Comment này hiện trên website, và đó là điều tốt: người học biết mình phải thấy gì.

Ràng buộc: các đánh dấu phải nằm ngay trên MỘT câu SELECT duy nhất kết thúc khối.

Cách dùng:  python3 scripts/trich_sql.py > /tmp/sql_bai_hoc.sql
"""
import glob
import os
import re
import sys

DANH_DAU = ("<!-- sql:khong-chay -->", "<!-- sql:co-y-loi -->")
KHOI_SQL = re.compile(r"```sql\n(.*?)```", re.S)
KY_VONG_DONG = re.compile(r"^[ \t]*--[ \t]*KỲ VỌNG:[ \t]*(\d+)[ \t]*dòng[ \t]*$", re.M)
KY_VONG_COT = re.compile(
    r"^[ \t]*--[ \t]*KỲ VỌNG:[ \t]*([A-Za-z_][A-Za-z0-9_]*)[ \t]*=[ \t]*(.+?)[ \t]*$", re.M)
KY_VONG_BAT_KY = re.compile(r"^[ \t]*--[ \t]*KỲ VỌNG:.*$", re.M)
# Khoảng văn bản ngay trước khối, đủ dài để chứa đánh dấu và vài dòng trống.
CUA_SO_TRUOC = 120


def _co_order_by_tang_ngoai(truy_van: str) -> bool:
    """Có ORDER BY ở tầng ngoài cùng không (ngoài mọi ngoặc, ngoài mọi chuỗi nháy)."""
    sau = 0
    trong_nhay = False
    i = 0
    thap = truy_van.lower()
    while i < len(truy_van):
        c = truy_van[i]
        if trong_nhay:
            if c == "'":
                trong_nhay = False
            i += 1
            continue
        if c == "'":
            trong_nhay = True
        elif c == "(":
            sau += 1
        elif c == ")":
            sau -= 1
        elif sau == 0 and thap.startswith("order", i):
            con = thap[i:i + 20]
            if re.match(r"order\s+by\b", con):
                return True
        i += 1
    return False


def main() -> int:
    goc = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
    duong_dan = sorted(glob.glob(os.path.join(goc, "docs", "**", "*.md"), recursive=True))
    so_chay, so_bo_qua, so_kv, so_loi = 0, 0, 0, 0

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

            moc = list(KY_VONG_BAT_KY.finditer(noi_khoi))
            if moc:
                phan_sau = noi_khoi[moc[-1].end():].strip()
                # Bỏ comment dòng ở cuối (kể cả comment đứng sau dấu ';'),
                # rồi bỏ dấu ';' kết thúc. Trước khi có bước này, một comment sau ';'
                # khiến truy vấn sinh ra bị lỗi cú pháp mà không ai biết vì sao.
                cac_dong = []
                for d in phan_sau.split("\n"):
                    if d.strip().startswith("--"):
                        continue
                    cac_dong.append(re.sub(r"\s--[^'\"]*$", "", d))
                truy_van = "\n".join(cac_dong).strip().rstrip(";").strip()

                if not truy_van:
                    print(f"!! LỖI {ten}: KỲ VỌNG không có câu lệnh nào theo sau", file=sys.stderr)
                    so_loi += 1
                    continue
                if ";" in truy_van:
                    print(f"!! LỖI {ten}: KỲ VỌNG phải nằm ngay trên MỘT câu lệnh duy nhất, "
                          f"nhưng phần sau đánh dấu còn chứa dấu ';'", file=sys.stderr)
                    so_loi += 1
                    continue
                if not re.match(r"(?is)^\s*(select|with|table|values)\b", truy_van):
                    print(f"!! LỖI {ten}: KỲ VỌNG chỉ dùng được cho câu SELECT/WITH, "
                          f"nhưng câu lệnh bắt đầu bằng: {truy_van.split()[0]}", file=sys.stderr)
                    so_loi += 1
                    continue

                khoi_moc = noi_khoi[moc[0].start():moc[-1].end()]
                so_dong = [int(m.group(1)) for m in KY_VONG_DONG.finditer(khoi_moc)]
                gia_tri = [(m.group(1), m.group(2)) for m in KY_VONG_COT.finditer(khoi_moc)]

                if not so_dong and not gia_tri:
                    print(f"-- !! KỲ VỌNG ở {ten} sai cú pháp, không nhận dạng được", file=sys.stderr)
                    continue

                # Cảnh báo lớp lỗi đã gặp thật: khai "N dòng" (N>1) cho một truy vấn
                # tổng hợp không GROUP BY — loại truy vấn luôn trả về đúng một dòng.
                # Con số N thường là GIÁ TRỊ của cột, không phải số dòng.
                # UNION/INTERSECT/EXCEPT gộp nhiều câu đếm lại thành nhiều dòng,
                # nên heuristic dưới đây không áp dụng được cho chúng.
                co_hop = re.search(r"(?is)\b(union|intersect|except)\b", truy_van)
                if any(n > 1 for n in so_dong) and not co_hop:
                    ngoai = re.split(r"(?is)\bfrom\b", truy_van, maxsplit=1)[0]
                    co_tong_hop = re.search(
                        r"(?is)\b(count|sum|avg|min|max|string_agg|array_agg|bool_and|bool_or)\s*\(",
                        ngoai)
                    co_group_by = re.search(r"(?is)\bgroup\s+by\b", truy_van)
                    if co_tong_hop and not co_group_by:
                        dau = " ".join(truy_van.split())[:90]
                        print(f"!! CẢNH BÁO {ten}: khai 'KỲ VỌNG: {so_dong} dòng' nhưng truy vấn "
                              f"là hàm tổng hợp không GROUP BY — loại này chỉ trả về 1 dòng. "
                              f"Có phải bạn muốn 'KỲ VỌNG: <cột> = N'?\n"
                              f"     truy vấn: {dau}...", file=sys.stderr)

                so_kv += len(so_dong) + len(gia_tri)
                print(f"-- kiểm tra kết quả cho {ten}")
                print("DO $kiemtra$")
                print("DECLARE n bigint; v text;")
                print("BEGIN")
                for mong_doi in so_dong:
                    print(f"  SELECT count(*) INTO n FROM ({truy_van}) AS t_kiem_tra;")
                    print(f"  IF n <> {mong_doi} THEN")
                    print(f"    RAISE EXCEPTION 'SAI SO DONG: {ten} ky vong {mong_doi} dong, "
                          f"thuc te %', n;")
                    print("  END IF;")
                # Khẳng định giá trị đọc MỘT dòng. Nếu truy vấn không có ORDER BY ở tầng
                # ngoài cùng thì "dòng đầu tiên" là khái niệm không xác định — hôm nay xanh,
                # sau một lần VACUUM có thể đỏ. Khi đó dùng INTO STRICT: PostgreSQL báo lỗi
                # ngay nếu kết quả không phải đúng một dòng, nên không còn chỗ cho nhập nhằng.
                # Có ORDER BY tầng ngoài thì tác giả đã chủ động chọn dòng đầu -> giữ LIMIT 1.
                co_order_by_tang_ngoai = _co_order_by_tang_ngoai(truy_van)
                doc = "INTO v" if co_order_by_tang_ngoai else "INTO STRICT v"
                hau = " LIMIT 1" if co_order_by_tang_ngoai else ""
                for cot, gt in gia_tri:
                    if gt.upper() == "NULL":
                        print(f"  SELECT ({cot})::text {doc} FROM ({truy_van}) AS t_kiem_tra{hau};")
                        print("  IF v IS NOT NULL THEN")
                        print(f"    RAISE EXCEPTION 'SAI GIA TRI: {ten} cot {cot} ky vong NULL, "
                              f"thuc te %', v;")
                        print("  END IF;")
                    else:
                        gt_sql = gt.replace("'", "''")
                        print(f"  SELECT ({cot})::text {doc} FROM ({truy_van}) AS t_kiem_tra{hau};")
                        print(f"  IF v IS DISTINCT FROM '{gt_sql}' THEN")
                        print(f"    RAISE EXCEPTION 'SAI GIA TRI: {ten} cot {cot} ky vong {gt_sql}, "
                              f"thuc te %', coalesce(v, 'NULL');")
                        print("  END IF;")
                print("END $kiemtra$;")
                print()

    print(f"-- Trích {so_chay} khối SQL để chạy, bỏ qua {so_bo_qua} khối đã đánh dấu, "
          f"{so_kv} khẳng định kết quả.", file=sys.stderr)
    if so_loi:
        print(f"!! CÓ {so_loi} ĐÁNH DẤU KỲ VỌNG SAI CÚ PHÁP — sửa trước khi push.",
              file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
