#!/usr/bin/env python3
"""Trích mọi khối ```mermaid``` trong docs/ ra các file .mmd rời để kiểm tra cú pháp.

Dùng cùng mermaid-cli trên CI: mỗi file .mmd được render thử: render lỗi = cú pháp sai.

Cách dùng:  python3 scripts/trich_mermaid.py <thu_muc_dich>
"""
import glob
import os
import re
import sys

KHOI = re.compile(r"```mermaid\n(.*?)```", re.S)


def main() -> int:
    if len(sys.argv) < 2:
        print("Thiếu tham số: thư mục đích", file=sys.stderr)
        return 2
    dich = sys.argv[1]
    os.makedirs(dich, exist_ok=True)

    goc = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
    so = 0
    for duong in sorted(glob.glob(os.path.join(goc, "docs", "**", "*.md"), recursive=True)):
        with open(duong, encoding="utf-8") as f:
            noi_dung = f.read()
        ten_goc = os.path.relpath(duong, goc).replace("/", "__").removesuffix(".md")
        for i, khoi in enumerate(KHOI.findall(noi_dung), 1):
            so += 1
            ten = os.path.join(dich, f"{ten_goc}__so-do-{i}.mmd")
            with open(ten, "w", encoding="utf-8") as f:
                f.write(khoi)

    print(f"Đã trích {so} sơ đồ Mermaid vào {dich}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
