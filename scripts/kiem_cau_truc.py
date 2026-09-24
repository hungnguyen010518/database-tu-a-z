#!/usr/bin/env python3
"""Kiểm tra cấu trúc Markdown của bài học — những lỗi mà `mkdocs build --strict` KHÔNG bắt được.

Vì sao cần: `mkdocs build --strict` chỉ báo link chết và file ngoài nav. Nó dựng ra HTML sai
ngữ nghĩa mà không hề cảnh báo. Ở Cấp 2 đã xảy ra: một khối ```sql``` bên trong `??? success`
bị lệch thụt lề, làm hộp gập đóng sớm và ĐÁP ÁN LỘ RA NGOÀI vùng gập — build vẫn xanh.

Bốn nhóm kiểm tra:
  1. Thụt lề khối code: mọi dòng trong một khối ``` phải thụt lề ít nhất bằng dòng mở,
     và dòng đóng phải thụt lề ĐÚNG BẰNG dòng mở. Đây là lỗi làm hỏng hộp admonition/details.
  2. Khuôn mẫu 8 khối: đủ 7 heading emoji + dòng mục tiêu.
  3. Mỗi bài đúng một khối `??? success "Đáp án"`.
  4. Khối 🔑 Tóm tắt có đúng 5 dòng đánh số.

Cách dùng:  python3 scripts/kiem_cau_truc.py
Trả về mã thoát khác 0 nếu có lỗi.
"""
import glob
import os
import re
import sys

HEADING_EMOJI = re.compile(r"^## (🧠|📖|🖼️|💻|⚠️|✍️|🔑)")
MUC_TIEU = "🎯 Học xong bài này"
DAP_AN = '??? success "Đáp án"'
FENCE = re.compile(r"^([ \t]*)(```+|~~~+)(.*)$")
DONG_DANH_SO = re.compile(r"^[ \t]*(\d+)\.[ \t]+\S")


def kiem_thut_le(duong: str, dong: list) -> list:
    """Bắt khối code có dòng bị mất thụt lề — nguyên nhân làm hỏng hộp bao quanh."""
    loi = []
    i = 0
    while i < len(dong):
        khop = FENCE.match(dong[i])
        if not khop:
            i += 1
            continue
        thut_mo, dau, _ = khop.group(1), khop.group(2), khop.group(3)
        dong_mo = i + 1
        i += 1
        da_dong = False
        while i < len(dong):
            k2 = FENCE.match(dong[i])
            if k2 and k2.group(2).startswith(dau[0] * 3) and not k2.group(3).strip():
                if k2.group(1) != thut_mo:
                    loi.append(
                        f"{duong}:{i+1}: dòng ĐÓNG khối code thụt lề {len(k2.group(1))} "
                        f"nhưng dòng mở (dòng {dong_mo}) thụt lề {len(thut_mo)} "
                        f"— hộp bao quanh sẽ bị đóng sai")
                da_dong = True
                i += 1
                break
            if dong[i].strip() and not dong[i].startswith(thut_mo):
                loi.append(
                    f"{duong}:{i+1}: dòng trong khối code thụt lề ít hơn dòng mở "
                    f"(dòng {dong_mo}, thụt lề {len(thut_mo)}) — khối sẽ thoát khỏi hộp bao quanh")
            i += 1
        if not da_dong:
            loi.append(f"{duong}:{dong_mo}: khối code mở mà không có dòng đóng")
    return loi


def kiem_bai_hoc(duong: str, noi_dung: str) -> list:
    loi = []
    dong = noi_dung.split("\n")

    loi += kiem_thut_le(duong, dong)

    so_heading = sum(1 for d in dong if HEADING_EMOJI.match(d))
    if so_heading != 7:
        loi.append(f"{duong}: có {so_heading}/7 heading khối bắt buộc (🧠 📖 🖼️ 💻 ⚠️ ✍️ 🔑)")

    if MUC_TIEU not in noi_dung:
        loi.append(f"{duong}: thiếu khối 🎯 Mục tiêu")

    so_dap_an = noi_dung.count(DAP_AN)
    if so_dap_an != 1:
        loi.append(f'{duong}: có {so_dap_an} khối \'{DAP_AN}\', phải có đúng 1')

    # Khối 🔑 Tóm tắt: đúng 5 dòng đánh số ở mức thụt lề 0
    vi_tri = next((i for i, d in enumerate(dong) if d.startswith("## 🔑")), None)
    if vi_tri is not None:
        sau = dong[vi_tri + 1:]
        ket = next((i for i, d in enumerate(sau) if d.startswith("## ") or d.startswith("---")),
                   len(sau))
        so_muc = sum(1 for d in sau[:ket] if DONG_DANH_SO.match(d) and not d.startswith(" "))
        if so_muc != 5:
            loi.append(f"{duong}: khối 🔑 Tóm tắt có {so_muc} dòng đánh số, phải có đúng 5")
    return loi


def main() -> int:
    goc = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
    bo_qua = {"index.md", "glossary.md", "dataset.md"}
    tat_ca = sorted(glob.glob(os.path.join(goc, "docs", "**", "*.md"), recursive=True))

    moi_loi = []
    so_bai = 0
    for duong in tat_ca:
        ten = os.path.relpath(duong, goc)
        with open(duong, encoding="utf-8") as f:
            noi_dung = f.read()
        if os.path.basename(duong) in bo_qua:
            moi_loi += kiem_thut_le(ten, noi_dung.split("\n"))
            continue
        so_bai += 1
        moi_loi += kiem_bai_hoc(ten, noi_dung)

    for l in moi_loi:
        print(f"LỖI  {l}")
    print(f"\nĐã kiểm {so_bai} bài học. Số lỗi: {len(moi_loi)}.")
    return 1 if moi_loi else 0


if __name__ == "__main__":
    raise SystemExit(main())
