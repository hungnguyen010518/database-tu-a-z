#!/usr/bin/env python3
"""Trích mọi khối ```sql``` trong docs/ ra một file .sql để chạy kiểm thử trên PostgreSQL thật.

Một khối bị BỎ QUA khi ngay phía trên nó có một trong các đánh dấu sau
(đánh dấu viết bằng HTML comment nên người đọc website không nhìn thấy):

    <!-- sql:khong-chay -->   mã minh hoạ, bảng chưa tồn tại, hoặc mã giả
    <!-- sql:co-y-loi -->     câu lệnh CỐ Ý sai để dạy thông báo lỗi

Cách dùng:  python3 scripts/trich_sql.py > /tmp/sql_bai_hoc.sql
"""
import glob
import os
import re
import sys

DANH_DAU = ("<!-- sql:khong-chay -->", "<!-- sql:co-y-loi -->")
KHOI_SQL = re.compile(r"```sql\n(.*?)```", re.S)
# Khoảng văn bản ngay trước khối, đủ dài để chứa đánh dấu và vài dòng trống.
CUA_SO_TRUOC = 120


def main() -> int:
    goc = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
    duong_dan = sorted(glob.glob(os.path.join(goc, "docs", "**", "*.md"), recursive=True))
    so_chay, so_bo_qua = 0, 0

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
            print(f"-- >>> {ten}")
            print(khop.group(1).rstrip())
            print()

    print(f"-- Trích {so_chay} khối SQL để chạy, bỏ qua {so_bo_qua} khối đã đánh dấu.",
          file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
