#!/usr/bin/env python3
"""Trích mọi thuật ngữ dạng **tiếng Việt** (*english*) trong docs/ và đối chiếu với glossary.md.

Khóa học quy ước: mỗi thuật ngữ lần đầu xuất hiện phải viết `**tiếng Việt** (*english*)`.
Script này gom tất cả lại, cho biết thuật ngữ nào đã có trong docs/glossary.md, thuật ngữ nào
còn thiếu, và bài nào giới thiệu nó lần đầu.

Cách dùng:
    python3 scripts/trich_thuat_ngu.py            # báo cáo tóm tắt
    python3 scripts/trich_thuat_ngu.py --thieu    # chỉ liệt kê thuật ngữ còn thiếu
    python3 scripts/trich_thuat_ngu.py --bang     # in sẵn các dòng bảng Markdown để dán vào glossary
"""
import glob
import os
import re
import sys

# **tiếng Việt** (*english*)  — cho phép khoảng trắng linh hoạt giữa hai phần
THUAT_NGU = re.compile(r"\*\*([^*\n]{1,60}?)\*\*\s*\(\s*\*([^*\n]{1,60}?)\*\s*\)")


def sap_xep_bai(duong: str) -> tuple:
    """Sắp theo cấp rồi theo số bài, để 'lần đầu xuất hiện' đúng thứ tự học."""
    ten = os.path.basename(duong)
    khop = re.match(r"(\d+)-", ten)
    so_bai = int(khop.group(1)) if khop else 999
    return (so_bai, duong)


def main() -> int:
    goc = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
    duong_glossary = os.path.join(goc, "docs", "glossary.md")

    cac_bai = [d for d in glob.glob(os.path.join(goc, "docs", "**", "*.md"), recursive=True)
               if os.path.basename(d) not in ("glossary.md", "index.md", "dataset.md")]
    cac_bai.sort(key=sap_xep_bai)

    lan_dau = {}  # english (chữ thường) -> (tiếng Việt, tên bài)
    for duong in cac_bai:
        with open(duong, encoding="utf-8") as f:
            noi_dung = f.read()
        ten_bai = os.path.relpath(duong, os.path.join(goc, "docs"))
        for viet, eng in THUAT_NGU.findall(noi_dung):
            khoa = eng.strip().lower()
            if khoa not in lan_dau:
                lan_dau[khoa] = (viet.strip(), eng.strip(), ten_bai)

    trong_glossary = ""
    if os.path.exists(duong_glossary):
        with open(duong_glossary, encoding="utf-8") as f:
            trong_glossary = f.read().lower()

    co = [k for k in lan_dau if k in trong_glossary]
    thieu = [k for k in lan_dau if k not in trong_glossary]

    if "--bang" in sys.argv:
        for khoa in sorted(thieu, key=lambda k: lan_dau[k][1].lower()):
            viet, eng, bai = lan_dau[khoa]
            lien_ket = bai.replace(".md", ".md")
            print(f"| {viet} | *{eng}* |  | [{bai}]({lien_ket}) |")
        return 0

    if "--thieu" in sys.argv:
        for khoa in sorted(thieu, key=lambda k: lan_dau[k][1].lower()):
            viet, eng, bai = lan_dau[khoa]
            print(f"{eng:45} | {viet:40} | {bai}")
        return 0

    print(f"Tổng số thuật ngữ đã giới thiệu trong bài học : {len(lan_dau)}")
    print(f"  Đã có trong docs/glossary.md                : {len(co)}")
    print(f"  CÒN THIẾU trong docs/glossary.md            : {len(thieu)}")
    print()
    print("Chạy với --thieu để xem danh sách, --bang để in sẵn dòng bảng Markdown.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
