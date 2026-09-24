# Khóa học "Database từ A-Z" — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Xuất bản một khóa học Database tiếng Việt gồm 51 bài, từ cơ bản tới siêu nâng cao, dưới dạng website MkDocs Material trên GitHub Pages.

**Architecture:** Nội dung là Markdown thuần trong `docs/`, chia 6 thư mục theo cấp độ. MkDocs Material biến chúng thành website; nav khai báo tường minh trong `mkdocs.yml` để giữ đúng thứ tự lộ trình. Một GitHub Actions workflow build và deploy lên nhánh `gh-pages` mỗi khi push `main`. Mọi câu SQL trong bài đều chạy được trên database mẫu `truong_hoc` nằm ở `dataset/`.

**Tech Stack:** Markdown, MkDocs + mkdocs-material, pymdownx (superfences/details/tabbed), Mermaid (render phía client), PostgreSQL 16, GitHub Actions, GitHub Pages.

**Kế hoạch này đặt tại `plans/`** (không đặt trong `docs/`) để MkDocs không publish tài liệu nội bộ lên website khóa học. Spec nguồn: `specs/2026-09-24-khoa-hoc-database-design.md`.

## Global Constraints

- **Ngôn ngữ**: toàn bộ nội dung bài học bằng tiếng Việt. Thuật ngữ chuyên ngành giữ nguyên tiếng Anh trong ngoặc ở lần xuất hiện đầu, ví dụ: **khoá ngoại** (*foreign key*).
- **Ràng buộc sư phạm bắt buộc**: mỗi khái niệm phải được giải thích bằng trực giác/ví dụ đời thường TRƯỚC khi đưa định nghĩa chuyên ngành. Không dùng một thuật ngữ nào trước khi đã giải thích nó.
- **Khuôn mẫu 8 khối**: mọi bài học phải có đủ 8 khối theo đúng thứ tự (xem mục "Khuôn mẫu bài học" bên dưới). Không bài nào được thiếu khối.
- **DBMS**: PostgreSQL 16. Cú pháp của DBMS khác chỉ được đề cập trong hộp ghi chú, không phải nội dung chính.
- **Dataset**: mọi ví dụ SQL từ Bài 21 trở đi chỉ dùng lược đồ trong `dataset/02-chuan-hoa.sql`. Không được tự phát minh tên bảng/cột mới.
- **Sơ đồ**: dùng Mermaid trong code fence ```mermaid```. Không dùng file ảnh.
- **Đáp án bài tập**: đặt trong `??? success "Đáp án"` (admonition gập được của Material), không để lộ ngay.
- **Tên file**: `NN-slug-khong-dau.md`, `NN` là số bài 2 chữ số (01–51).
- **Build phải sạch**: `mkdocs build --strict` không được có warning. Điều này bắt lỗi link chết và file không có trong nav.
- **Commit message**: tiếng Việt, kết thúc bằng dòng `Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>`.

---

## Khuôn mẫu bài học (dùng cho MỌI bài)

````markdown
# Bài NN — [Tên bài]

!!! abstract "🎯 Học xong bài này, bạn sẽ"
    - [năng lực 1]
    - [năng lực 2]
    - [năng lực 3]

## 🧠 Câu chuyện mở đầu

[Một tình huống ở trường/nhà mà học sinh cấp 2 đã trải qua. 100–200 từ.
Kết thúc bằng một câu hỏi dẫn dắt sang phần khái niệm.]

## 📖 Khái niệm & thuật ngữ

[Định nghĩa chính xác, nối lại với câu chuyện phía trên.]

| Tiếng Việt | English | Nghĩa dễ hiểu |
|---|---|---|
| ... | ... | ... |

## 🖼️ Sơ đồ

```mermaid
[sơ đồ Mermaid]
```

## 💻 Thực hành

```sql
-- SQL chạy được trên database truong_hoc
```

Kết quả mong đợi:

| cot1 | cot2 |
|---|---|
| ... | ... |

## ⚠️ Lỗi thường gặp

!!! warning "Lỗi 1: [tên lỗi]"
    [Vì sao sai, cách sửa.]

## ✍️ Bài tập

1. [câu hỏi]
2. [câu hỏi]
3. [câu hỏi]

??? success "Đáp án"
    1. [đáp án]
    2. [đáp án]
    3. [đáp án]

## 🔑 Tóm tắt

1. [dòng 1]
2. [dòng 2]
3. [dòng 3]
4. [dòng 4]
5. [dòng 5]

---
⬅️ [Bài NN-1 — ...](../...) | ➡️ [Bài NN+1 — ...](../...)
````

---

## File Structure

| Đường dẫn | Trách nhiệm |
|---|---|
| `mkdocs.yml` | Cấu hình theme, markdown extensions, nav tường minh 51 bài. |
| `.github/workflows/deploy.yml` | Build + deploy lên `gh-pages` khi push `main`. |
| `requirements.txt` | Ghim phiên bản mkdocs-material để build local và CI giống nhau. |
| `docs/index.md` | Trang chủ: khóa học này dành cho ai, lộ trình 6 cấp độ, cách cài môi trường. |
| `docs/glossary.md` | Bảng thuật ngữ Việt–Anh toàn khóa, sắp xếp A→Z, mỗi dòng link tới bài giải thích nó. |
| `docs/cap-0-nhap-mon/01..05-*.md` | 5 bài nhập môn. |
| `docs/cap-1-mo-hinh-er/06..15-*.md` | 10 bài mô hình quan hệ & ER. |
| `docs/cap-2-chuan-hoa/16..20-*.md` | 5 bài chuẩn hoá. |
| `docs/cap-3-sql/21..32-*.md` | 12 bài SQL. |
| `docs/cap-4-ben-trong-dong-co/33..41-*.md` | 9 bài nội thất của DBMS. |
| `docs/cap-5-sieu-nang-cao/42..51-*.md` | 10 bài phân tán & chuyên sâu. |
| `dataset/01-chua-chuan-hoa.sql` | Bảng bẹt trùng lặp — nguyên liệu dạy chuẩn hoá (Cấp 2). |
| `dataset/02-chuan-hoa.sql` | Lược đồ 10 bảng đã chuẩn hoá + dữ liệu mẫu. Nguồn chân lý cho mọi SQL từ Bài 21. |
| `dataset/03-du-lieu-lon.sql` | Sinh ~500.000 dòng để thực hành index/EXPLAIN (Cấp 4). |
| `dataset/README.md` | Cách nạp 3 file trên bằng Docker hoặc psql. |

---

## Danh sách 51 bài (chốt cứng — tên file và tiêu đề)

### Cấp 0 — Nhập môn (`docs/cap-0-nhap-mon/`)
| File | Tiêu đề |
|---|---|
| `01-du-lieu-va-thong-tin.md` | Dữ liệu, thông tin và tại sao phải lưu trữ |
| `02-tu-so-giay-den-excel.md` | Từ sổ giấy đến Excel — và tại sao Excel vẫn chưa đủ |
| `03-dbms-la-gi.md` | Hệ quản trị cơ sở dữ liệu (DBMS) là gì |
| `04-cac-mo-hinh-du-lieu.md` | Các mô hình dữ liệu: phân cấp, mạng, quan hệ, NoSQL |
| `05-cai-dat-postgresql.md` | Cài PostgreSQL và làm quen với psql |

### Cấp 1 — Mô hình quan hệ & Biểu đồ ER (`docs/cap-1-mo-hinh-er/`)
| File | Tiêu đề |
|---|---|
| `06-mo-hinh-quan-he.md` | Mô hình quan hệ: bảng, dòng, cột, miền giá trị, lược đồ |
| `07-thuc-the-va-thuoc-tinh.md` | Thực thể và các loại thuộc tính |
| `08-moi-quan-he-va-cardinality.md` | Mối quan hệ, bậc và bản số (Cardinality) |
| `09-participation-va-thuc-the-yeu.md` | Ràng buộc tham gia và Thực thể yếu |
| `10-bieu-do-er-ky-hieu-chen.md` | Biểu đồ ER — ký hiệu Chen |
| `11-bieu-do-er-crows-foot.md` | Biểu đồ ER — ký hiệu Crow's Foot và vẽ bằng Mermaid |
| `12-bay-loai-khoa.md` | Bảy loại khoá trong cơ sở dữ liệu |
| `13-mo-hinh-eer.md` | Mô hình EER: Generalization, Specialization, Aggregation |
| `14-chuyen-er-sang-bang.md` | Chuyển biểu đồ ER thành lược đồ quan hệ |
| `15-rang-buoc-toan-ven.md` | Ràng buộc toàn vẹn (Integrity Constraints) |

### Cấp 2 — Chuẩn hoá (`docs/cap-2-chuan-hoa/`)
| File | Tiêu đề |
|---|---|
| `16-phu-thuoc-ham.md` | Phụ thuộc hàm và bao đóng |
| `17-dang-chuan-1nf-2nf.md` | Dạng chuẩn 1 (1NF) và Dạng chuẩn 2 (2NF) |
| `18-dang-chuan-3nf-bcnf.md` | Dạng chuẩn 3 (3NF) và BCNF |
| `19-dang-chuan-4nf-5nf-6nf.md` | 4NF, 5NF và 6NF |
| `20-denormalization.md` | Phi chuẩn hoá — khi nào nên phá luật |

### Cấp 3 — SQL từ 0 tới cao thủ (`docs/cap-3-sql/`)
| File | Tiêu đề |
|---|---|
| `21-dai-so-quan-he.md` | Đại số quan hệ — nền toán học phía sau SQL |
| `22-ddl-va-kieu-du-lieu.md` | DDL: CREATE, ALTER, DROP và các kiểu dữ liệu |
| `23-dml-insert-update-delete.md` | DML: INSERT, UPDATE, DELETE |
| `24-select-where-order-by.md` | SELECT, WHERE, ORDER BY, LIMIT |
| `25-join.md` | JOIN — sáu cách ghép bảng |
| `26-group-by-having.md` | GROUP BY, HAVING và các hàm tổng hợp |
| `27-subquery-va-exists.md` | Truy vấn con (Subquery) và EXISTS |
| `28-cte-va-recursive-cte.md` | CTE và CTE đệ quy |
| `29-window-function.md` | Window Function — tính toán theo cửa sổ |
| `30-view-va-materialized-view.md` | View và Materialized View |
| `31-trigger-procedure-function.md` | Trigger, Stored Procedure và Function |
| `32-jsonb-va-full-text-search.md` | JSONB và Full-Text Search |

### Cấp 4 — Bên trong động cơ (`docs/cap-4-ben-trong-dong-co/`)
| File | Tiêu đề |
|---|---|
| `33-page-heap-tuple.md` | Dữ liệu nằm ở đâu: Page, Heap, Tuple và TOAST |
| `34-index-va-b-tree.md` | Index và cấu trúc B+Tree |
| `35-cac-loai-index-khac.md` | Hash, GiST, GIN và BRIN |
| `36-explain-va-query-planner.md` | EXPLAIN, Query Planner và Cost-Based Optimizer |
| `37-transaction-va-acid.md` | Giao dịch (Transaction) và ACID |
| `38-isolation-level-va-anomaly.md` | Mức cô lập và các hiện tượng bất thường |
| `39-mvcc.md` | MVCC — điều khiển đồng thời đa phiên bản |
| `40-wal-va-recovery.md` | WAL, Checkpoint và phục hồi sau sự cố |
| `41-lock-va-deadlock.md` | Khoá (Lock) và Deadlock |

### Cấp 5 — Siêu nâng cao (`docs/cap-5-sieu-nang-cao/`)
| File | Tiêu đề |
|---|---|
| `42-replication.md` | Replication — nhân bản dữ liệu |
| `43-partitioning-va-sharding.md` | Partitioning và Sharding |
| `44-cap-va-base.md` | Định lý CAP và triết lý BASE |
| `45-distributed-transaction.md` | Giao dịch phân tán: 2PC và Saga |
| `46-consensus-va-raft.md` | Đồng thuận (Consensus) và thuật toán Raft |
| `47-nosql-bon-ho.md` | NoSQL — bốn họ và khi nào dùng |
| `48-data-warehouse-va-olap.md` | Data Warehouse, OLAP và Star Schema |
| `49-etl-elt-va-pipeline.md` | ETL, ELT và pipeline dữ liệu |
| `50-vector-database.md` | Vector Database và Embedding |
| `51-bao-mat-backup-monitoring.md` | Bảo mật, Backup và Monitoring |

---

## Task 1: Khung dự án, MkDocs và GitHub Pages chạy được

**Mục tiêu giao được:** một website live trên GitHub Pages có trang chủ, một bài học mẫu hoàn chỉnh (Bài 1) và một sơ đồ Mermaid render đúng. Task này chứng minh toàn bộ đường ống hoạt động trước khi bơm nội dung.

**Files:**
- Create: `requirements.txt`
- Create: `mkdocs.yml`
- Create: `.github/workflows/deploy.yml`
- Create: `docs/index.md`
- Create: `docs/cap-0-nhap-mon/01-du-lieu-va-thong-tin.md`
- Create: `.gitignore`

**Interfaces:**
- Produces: `mkdocs.yml` với khoá `nav` mà mọi task sau sẽ thêm dòng vào; quy ước `custom_fences` cho Mermaid; bài 01 là **bài mẫu tham chiếu** — mọi bài sau copy cấu trúc của nó.

- [ ] **Step 1: Viết `requirements.txt`**

```
mkdocs-material==9.5.39
```

- [ ] **Step 2: Viết `.gitignore`**

```
.venv/
site/
__pycache__/
```

- [ ] **Step 3: Viết `mkdocs.yml`**

```yaml
site_name: Database từ A-Z
site_description: Khóa học cơ sở dữ liệu tiếng Việt, từ con số 0 tới mức siêu nâng cao — giải thích để học sinh cấp 2 cũng hiểu được.
site_url: https://hungnguyen010518.github.io/database-tu-a-z/
repo_url: https://github.com/hungnguyen010518/database-tu-a-z
repo_name: database-tu-a-z
edit_uri: edit/main/docs/

theme:
  name: material
  language: vi
  icon:
    logo: material/database
  features:
    - navigation.sections
    - navigation.top
    - navigation.footer
    - navigation.indexes
    - toc.follow
    - content.code.copy
    - content.code.annotate
    - search.highlight
    - search.suggest
  palette:
    - media: "(prefers-color-scheme: light)"
      scheme: default
      primary: indigo
      accent: indigo
      toggle:
        icon: material/weather-night
        name: Chuyển sang chế độ tối
    - media: "(prefers-color-scheme: dark)"
      scheme: slate
      primary: indigo
      accent: indigo
      toggle:
        icon: material/weather-sunny
        name: Chuyển sang chế độ sáng

markdown_extensions:
  - abbr
  - admonition
  - attr_list
  - def_list
  - footnotes
  - md_in_html
  - tables
  - toc:
      permalink: true
      toc_depth: 3
  - pymdownx.details
  - pymdownx.highlight:
      anchor_linenums: true
      line_spans: __span
  - pymdownx.inlinehilite
  - pymdownx.snippets
  - pymdownx.tabbed:
      alternate_style: true
  - pymdownx.caret
  - pymdownx.mark
  - pymdownx.tilde
  - pymdownx.superfences:
      custom_fences:
        - name: mermaid
          class: mermaid
          format: !!python/name:pymdownx.superfences.fence_code_format

plugins:
  - search:
      lang:
        - vi
        - en

extra:
  social:
    - icon: fontawesome/brands/github
      link: https://github.com/hungnguyen010518/database-tu-a-z

nav:
  - Trang chủ: index.md
  - "Cấp 0 — Nhập môn":
      - "Bài 1 — Dữ liệu, thông tin và tại sao phải lưu trữ": cap-0-nhap-mon/01-du-lieu-va-thong-tin.md
  - "Bảng thuật ngữ": glossary.md
```

**Lưu ý quan trọng:** `!!python/name:` yêu cầu MkDocs đọc YAML ở chế độ không an toàn — đây là cách chính thức Material tài liệu hoá, `mkdocs build` xử lý được, không cần cấu hình thêm.

- [ ] **Step 4: Viết `docs/index.md`**

Trang chủ phải trả lời: khóa học này cho ai, học được gì, lộ trình 6 cấp độ (bảng), cách cài môi trường (link Bài 5), cách nạp dataset. Bao gồm một sơ đồ Mermaid `flowchart` thể hiện lộ trình 6 cấp độ để kiểm chứng Mermaid render được.

- [ ] **Step 5: Viết Bài 1 theo đúng khuôn mẫu 8 khối**

`docs/cap-0-nhap-mon/01-du-lieu-va-thong-tin.md`. Câu chuyện mở đầu: bạn lớp trưởng ghi điểm kiểm tra của 40 bạn vào sổ tay; cuối kỳ cô giáo hỏi "ai điểm Toán cao nhất" và "điểm trung bình lớp". Khối Thực hành ở bài này chưa có database nên dùng một bảng minh hoạ và một câu SELECT đọc-hiểu (ghi rõ "bài sau ta mới chạy thật"). Thuật ngữ cần có: dữ liệu (*data*), thông tin (*information*), bản ghi (*record*), trường (*field*), cơ sở dữ liệu (*database*).

- [ ] **Step 6: Viết `.github/workflows/deploy.yml`**

```yaml
name: Deploy khóa học lên GitHub Pages

on:
  push:
    branches: [main]
  workflow_dispatch:

permissions:
  contents: write

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - uses: actions/setup-python@v5
        with:
          python-version: "3.12"
          cache: pip
      - run: pip install -r requirements.txt
      - run: mkdocs gh-deploy --force
```

- [ ] **Step 7: Build local để xác minh — phải PASS trước khi push**

```bash
cd /home/hungnm/database-tu-a-z
python3 -m venv .venv
.venv/bin/pip install -q -r requirements.txt
.venv/bin/mkdocs build --strict
```
Kỳ vọng: kết thúc bằng `INFO - Documentation built in ...`, KHÔNG có dòng `WARNING`. Nếu có warning về file không nằm trong nav → thêm vào `nav`. Nếu có warning link chết → sửa link.

Lưu ý: ở bước này `glossary.md` chưa tồn tại nhưng đã có trong `nav` → sẽ gây warning. Tạo `docs/glossary.md` dạng khung (tiêu đề + một câu mô tả + bảng rỗng có header) ngay trong step này.

- [ ] **Step 8: Tạo repo GitHub và push**

```bash
cd /home/hungnm/database-tu-a-z
git add -A
git commit -m "Dựng khung MkDocs, trang chủ và Bài 1

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>"
gh repo create database-tu-a-z --public --source=. --remote=origin \
  --description "Khóa học Database từ A-Z bằng tiếng Việt: ER, chuẩn hoá, SQL, index, MVCC, hệ phân tán — giải thích để học sinh cấp 2 cũng hiểu." \
  --push
```

- [ ] **Step 9: Xác minh Pages đã live**

```bash
gh run watch --exit-status
gh api repos/hungnguyen010518/database-tu-a-z/pages --jq .html_url
curl -sI https://hungnguyen010518.github.io/database-tu-a-z/ | head -1
```
Kỳ vọng: workflow `success`; câu `curl` trả về `HTTP/2 200`.

Nếu `gh api ... /pages` báo 404 (Pages chưa bật) thì bật bằng:
```bash
gh api -X POST repos/hungnguyen010518/database-tu-a-z/pages \
  -f 'source[branch]=gh-pages' -f 'source[path]=/'
```
rồi chờ ~1 phút và `curl` lại. (`mkdocs gh-deploy` đã tạo nhánh `gh-pages`, nên nhánh này chắc chắn tồn tại ở thời điểm gọi API.)

- [ ] **Step 10: Mở website và kiểm tra bằng mắt 3 điểm**

1. Menu trái hiện "Cấp 0 — Nhập môn".
2. Sơ đồ Mermaid ở trang chủ hiện ra hình, KHÔNG phải khối code.
3. Khối `??? success "Đáp án"` ở Bài 1 gập lại được và bấm mở ra được.

Nếu Mermaid ra khối code → `custom_fences` sai; đối chiếu lại Step 3.

---

## Task 2: Dataset `truong_hoc`

**Mục tiêu giao được:** 3 file SQL nạp được vào PostgreSQL thật, không lỗi.

**Files:**
- Create: `dataset/01-chua-chuan-hoa.sql`
- Create: `dataset/02-chuan-hoa.sql`
- Create: `dataset/03-du-lieu-lon.sql`
- Create: `dataset/README.md`
- Modify: `mkdocs.yml` (thêm `Dataset: dataset.md` vào nav)
- Create: `docs/dataset.md` (trang giải thích lược đồ + sơ đồ ER Mermaid của toàn dataset)

**Interfaces:**
- Produces: **lược đồ chính thức** mà mọi bài từ 21 trở đi phải dùng. Tên bảng và cột dưới đây là nguồn chân lý duy nhất:

```
lop(ma_lop PK, ten_lop, khoi, nam_hoc, ma_gvcn FK->giao_vien)
giao_vien(ma_gv PK, ho_ten, ngay_sinh, gioi_tinh, mon_chuyen_mon, email UNIQUE, luong)
hoc_sinh(ma_hs PK, ho_ten, ngay_sinh, gioi_tinh, dia_chi, ma_lop FK->lop)
phu_huynh(ma_ph PK, ho_ten, so_dien_thoai, quan_he, ma_hs FK->hoc_sinh)
mon_hoc(ma_mon PK, ten_mon, so_tiet_tuan)
phan_cong_day(ma_gv FK, ma_mon FK, ma_lop FK, hoc_ky, PK(ma_gv,ma_mon,ma_lop,hoc_ky))
diem(ma_diem PK, ma_hs FK, ma_mon FK, hoc_ky, loai_diem, diem_so, ngay_nhap)
sach(ma_sach PK, ten_sach, tac_gia, nam_xuat_ban, so_luong)
muon_sach(ma_muon PK, ma_hs FK, ma_sach FK, ngay_muon, ngay_tra_du_kien, ngay_tra_thuc_te)
diem_danh(ma_dd PK, ma_hs FK, ngay, trang_thai, ly_do)
```

- [ ] **Step 1: Viết `dataset/02-chuan-hoa.sql`**

Gồm: `DROP TABLE IF EXISTS ... CASCADE;` cho cả 10 bảng (thứ tự ngược phụ thuộc), `CREATE TABLE` đúng lược đồ trên với `PRIMARY KEY`, `FOREIGN KEY`, `CHECK` (ví dụ `diem_so BETWEEN 0 AND 10`, `gioi_tinh IN ('Nam','Nữ')`), `NOT NULL`, `UNIQUE`; rồi `INSERT` dữ liệu mẫu: 8 giáo viên, 6 lớp, 40 học sinh, 45 phụ huynh, 9 môn, ~30 phân công, ~400 điểm, 20 sách, ~50 lượt mượn, ~200 dòng điểm danh. Dùng tên người Việt thật, có dấu.

Ràng buộc: phải có ít nhất một học sinh **chưa có** phụ huynh trong bảng `phu_huynh` và một lớp **chưa có** GVCN (`ma_gvcn IS NULL`) — để Bài 25 dạy `LEFT JOIN` có dữ liệu minh hoạ thật.

- [ ] **Step 2: Viết `dataset/01-chua-chuan-hoa.sql`**

Một bảng duy nhất `bang_bet` chứa mọi thứ trộn lẫn: `ho_ten_hs, ngay_sinh_hs, ten_lop, gvcn, ho_ten_ph1, sdt_ph1, ho_ten_ph2, sdt_ph2, cac_mon_va_diem (kiểu TEXT, ví dụ 'Toán:8.5, Văn:7')`, `dia_chi`. ~30 dòng, cố tình trùng lặp tên lớp và GVCN ở nhiều dòng. Đầu file có comment giải thích đây là ví dụ **xấu** dùng để dạy chuẩn hoá.

- [ ] **Step 3: Viết `dataset/03-du-lieu-lon.sql`**

Dùng `generate_series` để sinh vào bảng `diem_lon` (cùng cấu trúc `diem` nhưng ~500.000 dòng) và `hoc_sinh_lon` (~50.000 dòng). Có comment cảnh báo thời gian chạy ~30–60 giây.

- [ ] **Step 4: Xác minh bằng PostgreSQL thật trong Docker**

```bash
cd /home/hungnm/database-tu-a-z
docker run -d --name pg-khoahoc -e POSTGRES_PASSWORD=hoc -e POSTGRES_DB=truong_hoc -p 55432:5432 postgres:16
sleep 10
for f in dataset/02-chuan-hoa.sql dataset/01-chua-chuan-hoa.sql dataset/03-du-lieu-lon.sql; do
  echo "=== $f ==="
  docker exec -i pg-khoahoc psql -U postgres -d truong_hoc -v ON_ERROR_STOP=1 < "$f" || echo "THẤT BẠI: $f"
done
docker exec -i pg-khoahoc psql -U postgres -d truong_hoc -c "\dt"
docker exec -i pg-khoahoc psql -U postgres -d truong_hoc -c "SELECT count(*) FROM diem; SELECT count(*) FROM diem_lon;"
```
Kỳ vọng: không có dòng `ERROR`, không có `THẤT BẠI`; `\dt` liệt kê đủ 12 bảng; `count(*)` khớp kỳ vọng.

Giữ container `pg-khoahoc` chạy — các task sau dùng lại nó để kiểm tra SQL trong bài.

- [ ] **Step 5: Viết `dataset/README.md` và `docs/dataset.md`**

`dataset/README.md`: hướng dẫn nạp bằng Docker (copy nguyên lệnh ở Step 4) và bằng `psql` nếu đã cài Postgres sẵn.

`docs/dataset.md`: giải thích từng bảng làm gì bằng ngôn ngữ đời thường, kèm sơ đồ ER toàn bộ dataset bằng `mermaid erDiagram`, và bảng liệt kê cột của cả 10 bảng.

- [ ] **Step 6: Build, commit, push**

```bash
.venv/bin/mkdocs build --strict
git add -A
git commit -m "Thêm dataset truong_hoc và trang giải thích lược đồ

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>"
git push
gh run watch --exit-status
```

---

## Task 3: Cấp 0 — hoàn thiện Bài 2 đến Bài 5

**Files:**
- Create: `docs/cap-0-nhap-mon/02-tu-so-giay-den-excel.md`
- Create: `docs/cap-0-nhap-mon/03-dbms-la-gi.md`
- Create: `docs/cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md`
- Create: `docs/cap-0-nhap-mon/05-cai-dat-postgresql.md`
- Modify: `mkdocs.yml` (thêm 4 dòng vào nav, dưới "Cấp 0 — Nhập môn")

**Interfaces:**
- Consumes: khuôn mẫu 8 khối từ Bài 1 (Task 1); dataset từ Task 2.
- Produces: Bài 5 để lại một môi trường PostgreSQL đã nạp `02-chuan-hoa.sql` — mọi bài sau giả định người học đã làm xong Bài 5.

- [ ] **Step 1: Bài 2 — Từ sổ giấy đến Excel**

Câu chuyện: lớp dùng Excel quản lý điểm; hai bạn sửa cùng lúc, file thành `diem_v2_final_sua_lan_3.xlsx`. Khái niệm cần có: dư thừa dữ liệu (*data redundancy*), bất thường khi cập nhật (*update anomaly*), bất thường khi thêm (*insertion anomaly*), bất thường khi xoá (*deletion anomaly*), toàn vẹn dữ liệu (*data integrity*), đồng thời (*concurrency*). Sơ đồ: Mermaid `flowchart` so sánh "một file Excel dùng chung" vs "một DBMS nhiều người kết nối".

- [ ] **Step 2: Bài 3 — DBMS là gì**

Khái niệm: hệ quản trị cơ sở dữ liệu (*DBMS*), lược đồ (*schema*), thực thể lưu trữ (*instance*), kiến trúc ba mức ANSI/SPARC — mức ngoài/khái niệm/trong (*external / conceptual / internal level*), độc lập dữ liệu (*data independence*) logic và vật lý, ngôn ngữ con DDL/DML/DCL/TCL, từ điển dữ liệu (*data dictionary / catalog*). Sơ đồ: Mermaid kiến trúc 3 mức.

- [ ] **Step 3: Bài 4 — Các mô hình dữ liệu**

Khái niệm: mô hình phân cấp (*hierarchical*), mô hình mạng (*network*), mô hình quan hệ (*relational*), mô hình đối tượng (*object-oriented*), NoSQL (key-value, document, column-family, graph). Nói rõ bài 47 sẽ đào sâu NoSQL. Sơ đồ: Mermaid so sánh cách 4 mô hình biểu diễn cùng dữ liệu "học sinh thuộc lớp".

- [ ] **Step 4: Bài 5 — Cài PostgreSQL**

Ba tab bằng `pymdownx.tabbed`: Docker (khuyến nghị), Ubuntu/Debian (`apt`), Windows (installer). Sau đó: kết nối bằng `psql`, các lệnh meta `\l \dt \d ten_bang \q`, nạp `dataset/02-chuan-hoa.sql`, chạy `SELECT count(*) FROM hoc_sinh;` để tự kiểm tra. Khối Lỗi thường gặp: cổng 5432 đã bị chiếm, sai mật khẩu, quên `-d truong_hoc`.

- [ ] **Step 5: Kiểm tra mọi câu SQL trong 4 bài này chạy thật**

Trích từng câu SQL trong 4 file `.md` vừa viết và chạy qua container `pg-khoahoc`:
```bash
docker exec -i pg-khoahoc psql -U postgres -d truong_hoc -v ON_ERROR_STOP=1 -c "<câu SQL>"
```
Kỳ vọng: mọi câu trả về kết quả, không có `ERROR`. Sửa bài nếu lệch.

- [ ] **Step 6: Build, commit, push**

```bash
.venv/bin/mkdocs build --strict
git add -A && git commit -m "Hoàn thiện Cấp 0 — Nhập môn (Bài 2–5)

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>"
git push && gh run watch --exit-status
```

---

## Task 4: Cấp 1 — Mô hình quan hệ & Biểu đồ ER (Bài 6–15)

**Files:**
- Create: 10 file trong `docs/cap-1-mo-hinh-er/` theo đúng tên ở bảng "Danh sách 51 bài".
- Modify: `mkdocs.yml` (thêm section `"Cấp 1 — Mô hình quan hệ & Biểu đồ ER"` với 10 dòng).

**Interfaces:**
- Consumes: dataset `truong_hoc` (Task 2) làm ví dụ cho mọi biểu đồ ER.
- Produces: biểu đồ ER chuẩn của `truong_hoc` ở Bài 11 (Crow's Foot/Mermaid) — Bài 14 và Cấp 2 sẽ tham chiếu lại.

**Thuật ngữ bắt buộc phải xuất hiện và được định nghĩa trong cấp này:** quan hệ (*relation*), bộ (*tuple*), thuộc tính (*attribute*), miền giá trị (*domain*), bậc (*degree*), lực lượng (*cardinality of a relation*), lược đồ quan hệ (*relation schema*), thực thể (*entity*), tập thực thể (*entity set*), thuộc tính đơn/phức hợp (*simple / composite*), đơn trị/đa trị (*single-valued / multi-valued*), dẫn xuất (*derived*), thuộc tính khoá (*key attribute*), mối quan hệ (*relationship*), bậc của mối quan hệ (*degree: unary / binary / ternary*), bản số (*cardinality*: 1:1, 1:N, M:N), tỉ lệ bản số (*cardinality ratio*), ràng buộc tham gia (*participation constraint*: toàn phần *total* / bộ phận *partial*), thực thể yếu (*weak entity*), thực thể chủ (*owner entity*), khoá bộ phận (*partial key / discriminator*), ký hiệu Chen (*Chen notation*), ký hiệu Crow's Foot, siêu khoá (*super key*), khoá dự tuyển (*candidate key*), khoá chính (*primary key*), khoá thay thế (*alternate key*), khoá phức hợp (*composite key*), khoá nhân tạo (*surrogate key*), khoá ngoại (*foreign key*), EER, tổng quát hoá (*generalization*), chuyên biệt hoá (*specialization*), ràng buộc disjoint/overlapping, ràng buộc total/partial specialization, kết tập (*aggregation*), toàn vẹn thực thể (*entity integrity*), toàn vẹn tham chiếu (*referential integrity*), toàn vẹn miền (*domain integrity*), hành vi `ON DELETE CASCADE / RESTRICT / SET NULL`.

- [ ] **Step 1: Viết Bài 6 — Mô hình quan hệ**

Câu chuyện: bảng phân công trực nhật dán ở cửa lớp — hàng là ngày, cột là việc. Khái niệm: relation/tuple/attribute/domain/degree/cardinality/schema vs instance. Sơ đồ: Mermaid minh hoạ một bảng với nhãn chỉ ra đâu là tuple, đâu là attribute, đâu là domain. Thực hành: `\d hoc_sinh` và `SELECT * FROM hoc_sinh LIMIT 5;`.

- [ ] **Step 2: Viết Bài 7 — Thực thể và các loại thuộc tính**

Câu chuyện: khai lý lịch học sinh đầu năm — ô "Họ và tên" tách được thành họ/tên đệm/tên (phức hợp), ô "Số điện thoại" ghi được nhiều số (đa trị), ô "Tuổi" không cần ghi vì suy ra từ ngày sinh (dẫn xuất). Sơ đồ: Mermaid `flowchart` cây phân loại thuộc tính.

- [ ] **Step 3: Viết Bài 8 — Mối quan hệ, bậc và bản số**

Câu chuyện: "Học sinh **học** Lớp", "Giáo viên **dạy** Môn cho Lớp" (quan hệ bậc ba). Bảng đối chiếu 1:1 / 1:N / M:N với ví dụ trong `truong_hoc`: `lop`–`giao_vien` (GVCN, 1:1), `lop`–`hoc_sinh` (1:N), `hoc_sinh`–`mon_hoc` qua `diem` (M:N). Sơ đồ: Mermaid `erDiagram` với 3 loại ký hiệu bản số.

- [ ] **Step 4: Viết Bài 9 — Ràng buộc tham gia và thực thể yếu**

Câu chuyện: mọi học sinh **bắt buộc** thuộc một lớp (total participation), nhưng không phải giáo viên nào cũng làm GVCN (partial). Phụ huynh chỉ tồn tại khi có học sinh → thực thể yếu, khoá bộ phận là "quan hệ". Sơ đồ: Mermaid với đường đôi/đường đơn được mô phỏng và giải thích bằng chú thích.

- [ ] **Step 5: Viết Bài 10 — Biểu đồ ER ký hiệu Chen**

Bảng tra ký hiệu: hình chữ nhật = thực thể, hình chữ nhật đôi = thực thể yếu, hình elip = thuộc tính, elip đôi = đa trị, elip nét đứt = dẫn xuất, hình thoi = mối quan hệ, hình thoi đôi = quan hệ nhận diện, đường đôi = tham gia toàn phần, gạch chân = khoá chính. Vẽ toàn bộ ER của `truong_hoc` theo Chen bằng Mermaid `flowchart` (dùng `(( ))`, `{ }`, `[ ]` để mô phỏng hình dạng) + một bảng chú giải.

- [ ] **Step 6: Viết Bài 11 — Crow's Foot và Mermaid**

Bảng đối chiếu Chen ↔ Crow's Foot. Giải thích cú pháp `mermaid erDiagram`: `||--o{`, `}o--o{`, `||--||`, `|o--o|` và ý nghĩa từng nửa ký hiệu. Sơ đồ: ER **hoàn chỉnh** của `truong_hoc` bằng `erDiagram` — đây là sơ đồ tham chiếu cho các bài sau.

- [ ] **Step 7: Viết Bài 12 — Bảy loại khoá**

Mỗi loại khoá: định nghĩa + ví dụ cụ thể trong `truong_hoc` + câu SQL chứng minh. Ví dụ: `email` của `giao_vien` là khoá dự tuyển; `ma_gv` là khoá chính; `email` thành khoá thay thế; `PK(ma_gv,ma_mon,ma_lop,hoc_ky)` của `phan_cong_day` là khoá phức hợp; `ma_hs` kiểu `SERIAL` là khoá nhân tạo. Thực hành: thử `INSERT` trùng `email` để thấy lỗi `duplicate key value violates unique constraint`.

- [ ] **Step 8: Viết Bài 13 — Mô hình EER**

Câu chuyện: trường có "Người trong trường" chia thành Học sinh / Giáo viên / Nhân viên — thuộc tính chung tách lên cha. Khái niệm: generalization (dưới lên), specialization (trên xuống), disjoint vs overlapping, total vs partial specialization, aggregation. Ba cách hiện thực kế thừa trong bảng quan hệ: single table, table per subclass, table per concrete class — kèm bảng đánh đổi. Sơ đồ: Mermaid `classDiagram` cho cây kế thừa.

- [ ] **Step 9: Viết Bài 14 — Chuyển ER sang lược đồ quan hệ**

Thuật toán 7 bước có số thứ tự: (1) thực thể mạnh → bảng; (2) thực thể yếu → bảng, PK = PK chủ + khoá bộ phận; (3) quan hệ 1:1 → nhúng FK vào phía tham gia toàn phần; (4) 1:N → FK ở phía N; (5) M:N → bảng trung gian; (6) thuộc tính đa trị → bảng riêng; (7) quan hệ bậc ≥3 → bảng riêng. Áp dụng từng bước lên ER của `truong_hoc` và cho thấy kết quả khớp đúng `dataset/02-chuan-hoa.sql`.

- [ ] **Step 10: Viết Bài 15 — Ràng buộc toàn vẹn**

Khái niệm: domain / entity / referential integrity, ràng buộc ngữ nghĩa (*semantic constraint*), `NOT NULL`, `UNIQUE`, `CHECK`, `PRIMARY KEY`, `FOREIGN KEY`, và 5 hành vi `ON DELETE`/`ON UPDATE`: `CASCADE`, `RESTRICT`, `NO ACTION`, `SET NULL`, `SET DEFAULT`. Thực hành: xoá một `lop` đang có học sinh để thấy lỗi vi phạm khoá ngoại, rồi minh hoạ `ON DELETE SET NULL` trên bảng nháp.

- [ ] **Step 11: Chạy thật mọi câu SQL trong 10 bài**

Với mỗi câu SQL trong 10 file: `docker exec -i pg-khoahoc psql -U postgres -d truong_hoc -v ON_ERROR_STOP=1 -c "<SQL>"`. Với các câu **cố ý gây lỗi** (Bài 12 Step 7, Bài 15 Step 10): xác minh lỗi trả về ĐÚNG như thông báo đã ghi trong bài; nếu khác, sửa bài cho khớp thông báo thật của PostgreSQL 16.

- [ ] **Step 12: Xác minh mọi sơ đồ Mermaid hợp lệ**

```bash
.venv/bin/mkdocs build --strict
grep -c '```mermaid' docs/cap-1-mo-hinh-er/*.md
```
Kỳ vọng: build sạch; mỗi file có ít nhất 1 sơ đồ. Mở website kiểm tra bằng mắt Bài 11 — `erDiagram` phải ra hình.

- [ ] **Step 13: Commit, push**

```bash
git add -A && git commit -m "Thêm Cấp 1 — Mô hình quan hệ và Biểu đồ ER (Bài 6–15)

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>"
git push && gh run watch --exit-status
```

---

## Task 5: Cấp 2 — Chuẩn hoá (Bài 16–20)

**Files:**
- Create: 5 file trong `docs/cap-2-chuan-hoa/`.
- Modify: `mkdocs.yml`.

**Interfaces:**
- Consumes: `dataset/01-chua-chuan-hoa.sql` (bảng `bang_bet`) làm nguyên liệu; lược đồ chuẩn hoá ở `02-chuan-hoa.sql` làm đích đến.
- Produces: chuỗi biến đổi `bang_bet` → 1NF → 2NF → 3NF → BCNF, kết quả cuối phải trùng lược đồ `02-chuan-hoa.sql`.

**Thuật ngữ bắt buộc:** phụ thuộc hàm (*functional dependency*), phụ thuộc đầy đủ / bộ phận (*full / partial dependency*), phụ thuộc bắc cầu (*transitive dependency*), phụ thuộc đa trị (*multi-valued dependency*), phụ thuộc kết nối (*join dependency*), bao đóng thuộc tính (*attribute closure* X⁺), tiên đề Armstrong (*Armstrong's axioms*: reflexivity, augmentation, transitivity), phủ tối thiểu (*minimal / canonical cover*), khoá dự tuyển, thuộc tính khoá / không khoá (*prime / non-prime attribute*), dạng chuẩn (*normal form*), 1NF–6NF, bảo toàn phụ thuộc (*dependency preservation*), phân rã không mất mát (*lossless-join decomposition*), phi chuẩn hoá (*denormalization*).

- [ ] **Step 1: Bài 16 — Phụ thuộc hàm và bao đóng**

Câu chuyện: biết mã học sinh thì biết chắc tên — nhưng biết tên chưa chắc biết mã (có hai bạn cùng tên). Đó chính là `ma_hs → ho_ten`. Trình bày 3 tiên đề Armstrong và **thuật toán tính bao đóng X⁺** dạng giả mã có số bước, rồi làm một ví dụ tính tay đầy đủ trên tập FD của `bang_bet`, rồi dùng bao đóng để **tìm khoá dự tuyển**.

- [ ] **Step 2: Bài 17 — 1NF và 2NF**

Bắt đầu từ `bang_bet`. 1NF: ô `cac_mon_va_diem` chứa `'Toán:8.5, Văn:7'` là đa trị → tách dòng. 2NF: chỉ ra phụ thuộc bộ phận và tách. Mỗi bước có bảng "trước" và "sau" hiển thị dữ liệu thật.

- [ ] **Step 3: Bài 18 — 3NF và BCNF**

3NF: `ten_lop → gvcn` là phụ thuộc bắc cầu qua khoá → tách `lop`. BCNF: định nghĩa "mọi định thức đều là siêu khoá", ví dụ kinh điển 3NF-nhưng-không-BCNF (phân công `(hoc_sinh, mon_hoc) → giao_vien` và `giao_vien → mon_hoc`), và giải thích đánh đổi: BCNF có thể **không bảo toàn phụ thuộc**. Bảng so sánh 1NF→BCNF: điều kiện, loại bất thường được loại bỏ.

- [ ] **Step 4: Bài 19 — 4NF, 5NF, 6NF**

4NF qua phụ thuộc đa trị: một giáo viên dạy nhiều môn và phụ trách nhiều câu lạc bộ, hai việc độc lập → nhồi một bảng sinh tổ hợp thừa. 5NF qua phụ thuộc kết nối và ví dụ ba chiều (giáo viên–môn–lớp) chỉ tách được thành 3 bảng. 6NF và liên hệ với bảng anchor/temporal. Nói rõ: thực tế dừng ở 3NF/BCNF, 4NF+ chỉ dùng khi gặp đúng tình huống.

- [ ] **Step 5: Bài 20 — Phi chuẩn hoá**

Khi nào phá luật: báo cáo đọc nhiều ghi ít, cột tính sẵn (`diem_trung_binh`), bảng tổng hợp, materialized view (nối tới Bài 30). Bảng đánh đổi: tiết kiệm JOIN vs nguy cơ lệch dữ liệu. Nguyên tắc: chuẩn hoá trước, phi chuẩn hoá sau **và chỉ khi đo được là chậm** (nối tới Bài 36 EXPLAIN).

- [ ] **Step 6: Xác minh chuỗi chuẩn hoá chạy thật**

Nạp `01-chua-chuan-hoa.sql`, rồi chạy đúng các câu `CREATE TABLE ... AS SELECT` / `INSERT ... SELECT` mà Bài 17–18 đưa ra, và kiểm tra kết quả cuối cùng có cùng tập cột với `02-chuan-hoa.sql`:
```bash
docker exec -i pg-khoahoc psql -U postgres -d truong_hoc -v ON_ERROR_STOP=1 < /tmp/kiem-tra-chuan-hoa.sql
```
Kỳ vọng: không có `ERROR`; số dòng sau tách khớp số liệu ghi trong bài.

- [ ] **Step 7: Build, commit, push** (cùng khuôn lệnh Task 4 Step 13, message `"Thêm Cấp 2 — Chuẩn hoá (Bài 16–20)"`).

---

## Task 6: Cấp 3 — SQL (Bài 21–32)

**Files:**
- Create: 12 file trong `docs/cap-3-sql/`.
- Modify: `mkdocs.yml`.

**Interfaces:**
- Consumes: lược đồ `02-chuan-hoa.sql`. Mọi câu SQL phải dùng đúng tên bảng/cột đã chốt ở Task 2.
- Produces: các truy vấn ở Bài 25–29 được Cấp 4 đem ra `EXPLAIN` và tối ưu.

**Thuật ngữ bắt buộc:** DDL/DML/DCL/TCL, kiểu dữ liệu (`INTEGER`, `NUMERIC`, `VARCHAR`, `TEXT`, `DATE`, `TIMESTAMPTZ`, `BOOLEAN`, `SERIAL`, `UUID`, `ARRAY`, `JSONB`, `ENUM`), `NULL` và logic ba giá trị (*three-valued logic*), vị từ (*predicate*), phép chiếu / chọn (*projection / selection*), tích Descartes (*Cartesian product*), INNER / LEFT / RIGHT / FULL OUTER / CROSS / SELF JOIN, `USING` vs `ON`, hàm tổng hợp (*aggregate function*), `GROUP BY`, `HAVING`, truy vấn con tương quan (*correlated subquery*), `EXISTS` / `IN` / `ANY` / `ALL`, CTE (*Common Table Expression*), CTE đệ quy, window function, `OVER`, `PARTITION BY`, khung cửa sổ (*window frame*), `ROWS` vs `RANGE`, `ROW_NUMBER` / `RANK` / `DENSE_RANK` / `NTILE` / `LAG` / `LEAD`, view, materialized view, trigger, hàm trigger, stored procedure, `PL/pgSQL`, JSONB và toán tử `->`, `->>`, `@>`, `tsvector`, `tsquery`, `GIN`.

- [ ] **Step 1: Bài 21 — Đại số quan hệ**

6 phép toán cơ bản với ký hiệu toán: chọn σ, chiếu π, hợp ∪, hiệu −, tích × , đổi tên ρ; phép dẫn xuất: giao ∩, kết nối ⋈ (theta / equi / natural), chia ÷. Mỗi phép: một câu tiếng Việt, ký hiệu toán, và câu SQL tương đương trên `truong_hoc`. Bảng đối chiếu "phép đại số ↔ từ khoá SQL". Đây là cây cầu để người học hiểu SQL không phải cú pháp ngẫu nhiên.

- [ ] **Step 2: Bài 22 — DDL và kiểu dữ liệu**

`CREATE TABLE`, `ALTER TABLE ADD/DROP/ALTER COLUMN`, `DROP TABLE`, `TRUNCATE`. Bảng kiểu dữ liệu: dùng khi nào, bẫy thường gặp (`CHAR` đệm khoảng trắng; `FLOAT` không dùng cho tiền/điểm → dùng `NUMERIC`; `TIMESTAMP` vs `TIMESTAMPTZ`). Thực hành trên bảng nháp `hoc_sinh_nhap` rồi `DROP`.

- [ ] **Step 3: Bài 23 — DML**

`INSERT` (một dòng, nhiều dòng, `INSERT ... SELECT`, `RETURNING`), `UPDATE` (kèm cảnh báo quên `WHERE`), `DELETE`, `UPSERT` bằng `ON CONFLICT DO UPDATE`. Lỗi thường gặp: `UPDATE` không `WHERE`; vi phạm khoá ngoại khi `DELETE`.

- [ ] **Step 4: Bài 24 — SELECT, WHERE, ORDER BY, LIMIT**

`SELECT`, bí danh `AS`, `DISTINCT`, toán tử so sánh, `BETWEEN`, `IN`, `LIKE` / `ILIKE`, `IS NULL`, `AND/OR/NOT`, `ORDER BY ... ASC/DESC NULLS LAST`, `LIMIT/OFFSET`. Phần **logic ba giá trị**: vì sao `WHERE diem_so <> 10` bỏ mất dòng có `diem_so IS NULL` — đây là bẫy số một của người mới.

- [ ] **Step 5: Bài 25 — JOIN**

Câu chuyện: ghép hai danh sách "tên học sinh" và "tên lớp" bằng mã lớp. Sơ đồ Mermaid: 6 loại JOIN mô tả bằng tập hợp. Mỗi loại: câu SQL thật + bảng kết quả thật. Dùng học sinh không có phụ huynh và lớp không có GVCN (đã cài sẵn ở Task 2) để `LEFT JOIN` cho ra `NULL` thấy được. `SELF JOIN`: tìm các học sinh cùng ngày sinh. Lỗi thường gặp: thiếu điều kiện `ON` → tích Descartes bùng nổ.

- [ ] **Step 6: Bài 26 — GROUP BY, HAVING và hàm tổng hợp**

`COUNT/SUM/AVG/MIN/MAX`, `COUNT(*)` vs `COUNT(cot)` với `NULL`, `GROUP BY` nhiều cột, `HAVING` vs `WHERE` (giải thích qua **thứ tự thực thi logic**: FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT — vẽ bằng Mermaid flowchart), `ROLLUP`, `GROUPING SETS`, `FILTER (WHERE ...)`. Ví dụ: điểm trung bình từng môn từng lớp.

- [ ] **Step 7: Bài 27 — Subquery và EXISTS**

Subquery ở `SELECT` / `FROM` / `WHERE`; vô hướng (*scalar*) vs bảng; **tương quan** (*correlated*) và vì sao nó chạy lặp; `IN` vs `EXISTS` vs `JOIN` (bảng đánh đổi); bẫy `NOT IN` với `NULL` — trả về rỗng một cách "bí ẩn"; `ANY` / `ALL`. Ví dụ: học sinh có điểm cao hơn trung bình lớp của mình.

- [ ] **Step 8: Bài 28 — CTE và CTE đệ quy**

`WITH` để đặt tên bước trung gian, nhiều CTE nối tiếp, so sánh với subquery lồng nhau về mức dễ đọc. CTE đệ quy: cấu trúc `WITH RECURSIVE ... anchor UNION ALL recursive`. Ví dụ: đếm từ 1 đến 10; rồi duyệt cây tổ chức (tạo bảng `don_vi(ma, ten, ma_cha)` làm ví dụ) để in cây phòng ban có thụt lề. Cảnh báo đệ quy vô hạn → dùng cột độ sâu và `WHERE do_sau < N`.

- [ ] **Step 9: Bài 29 — Window function**

Câu chuyện: xếp hạng học sinh trong lớp nhưng vẫn muốn thấy từng dòng học sinh — `GROUP BY` làm mất dòng, window function thì không. Sơ đồ Mermaid: so sánh `GROUP BY` (gom dòng) vs `OVER` (giữ dòng). Đầy đủ: `OVER (PARTITION BY ... ORDER BY ...)`, `ROW_NUMBER` vs `RANK` vs `DENSE_RANK`, `NTILE`, `LAG`/`LEAD`, tổng luỹ tiến (*running total*), khung cửa sổ `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW` vs `RANGE`, và vì sao mặc định của `RANGE` gây bất ngờ khi có giá trị trùng.

- [ ] **Step 10: Bài 30 — View và Materialized View**

View là truy vấn được đặt tên (không lưu dữ liệu); materialized view lưu kết quả và cần `REFRESH`. Bảng so sánh: độ mới, tốc độ, dung lượng, khi nào dùng cái nào. `REFRESH MATERIALIZED VIEW CONCURRENTLY` và điều kiện cần index unique. Ví dụ: view `v_bang_diem_day_du`, materialized view `mv_thong_ke_lop`. Nối lại Bài 20 (phi chuẩn hoá).

- [ ] **Step 11: Bài 31 — Trigger, Procedure, Function**

Phân biệt function (trả về giá trị, gọi trong `SELECT`) vs procedure (`CALL`, quản lý transaction được) vs trigger (tự chạy khi có `INSERT/UPDATE/DELETE`). `PL/pgSQL`: khai báo biến, `IF`, `LOOP`, `RAISE NOTICE`/`RAISE EXCEPTION`. `BEFORE` vs `AFTER`, `FOR EACH ROW` vs `FOR EACH STATEMENT`, biến `NEW`/`OLD`. Ví dụ: trigger tự ghi lịch sử sửa điểm vào `lich_su_diem`; function `xep_loai(diem NUMERIC) RETURNS TEXT`. Cảnh báo: trigger là "phép thuật ngầm", khó gỡ lỗi — dùng tiết chế.

- [ ] **Step 12: Bài 32 — JSONB và Full-Text Search**

`JSON` vs `JSONB`; toán tử `->`, `->>`, `#>`, `@>`, `?`; `jsonb_set`; index `GIN` cho JSONB; khi nào nên dùng JSONB và khi nào đó là dấu hiệu thiết kế sai. Full-text search: `to_tsvector`, `to_tsquery`, `plainto_tsquery`, `@@`, `ts_rank`, cột `tsvector` sinh sẵn + index `GIN`; hạn chế với tiếng Việt (không có từ điển sẵn, dùng `simple` + `unaccent`).

- [ ] **Step 13: Chạy thật TOÀN BỘ SQL của 12 bài**

Trích mọi code fence ```sql``` trong `docs/cap-3-sql/*.md` ra một file và chạy tuần tự:
```bash
python3 - <<'PY' > /tmp/claude-1000/-home-hungnm/*/scratchpad/cap3.sql
import re, glob
for f in sorted(glob.glob('docs/cap-3-sql/*.md')):
    for blk in re.findall(r'```sql\n(.*?)```', open(f).read(), re.S):
        print(f'-- {f}'); print(blk)
PY
docker exec -i pg-khoahoc psql -U postgres -d truong_hoc < /tmp/.../cap3.sql 2>&1 | grep -n 'ERROR' || echo "SẠCH: không có lỗi SQL"
```
Kỳ vọng: in ra `SẠCH`. Với các câu cố ý gây lỗi (Bài 23, 24, 25, 27), đánh dấu bằng comment `-- CỐ Ý LỖI` và loại khỏi phép kiểm; nhưng phải xác minh riêng rằng thông báo lỗi thật khớp với thông báo ghi trong bài.

- [ ] **Step 14: Build, commit, push** (message `"Thêm Cấp 3 — SQL từ 0 tới cao thủ (Bài 21–32)"`).

---

## Task 7: Cấp 4 — Bên trong động cơ (Bài 33–41)

**Files:**
- Create: 9 file trong `docs/cap-4-ben-trong-dong-co/`.
- Modify: `mkdocs.yml`.

**Interfaces:**
- Consumes: `dataset/03-du-lieu-lon.sql` (bảng `diem_lon`, `hoc_sinh_lon`) — cần dữ liệu lớn để EXPLAIN cho ra kế hoạch khác nhau; các truy vấn từ Cấp 3.
- Produces: kỹ năng đọc `EXPLAIN (ANALYZE, BUFFERS)` mà Cấp 5 dùng lại khi bàn về sharding.

**Thuật ngữ bắt buộc:** page / block (8KB), heap, tuple, `ctid`, TOAST, fill factor, bloat, `VACUUM` / `AUTOVACUUM`, index, B-Tree / B+Tree, node gốc/trong/lá (*root / internal / leaf*), fan-out, độ sâu cây, index quét (*index scan*) vs quét toàn bảng (*sequential scan*) vs *index-only scan* vs *bitmap heap scan*, index phủ (*covering index*), index bộ phận (*partial index*), index biểu thức, index phức hợp và **quy tắc cột trái nhất** (*leftmost prefix rule*), tính chọn lọc (*selectivity*), tính tương quan (*correlation*), Hash / GiST / GIN / BRIN / SP-GiST, `EXPLAIN`, `ANALYZE`, `BUFFERS`, cây kế hoạch (*plan tree*), chi phí ước lượng (*estimated cost*) vs thực tế, `seq_page_cost` / `random_page_cost`, thống kê (*statistics*), histogram, `n_distinct`, nested loop / hash join / merge join, transaction, ACID, `BEGIN` / `COMMIT` / `ROLLBACK` / `SAVEPOINT`, mức cô lập (*isolation level*): Read Uncommitted / Read Committed / Repeatable Read / Serializable, dirty read, non-repeatable read, phantom read, write skew, MVCC, `xmin` / `xmax`, snapshot, tuple chết (*dead tuple*), WAL, LSN, checkpoint, `fsync`, recovery, PITR, khoá chia sẻ / độc quyền (*shared / exclusive lock*), khoá mức bảng / mức dòng, `FOR UPDATE`, deadlock, đồ thị chờ (*wait-for graph*), hai pha khoá (*two-phase locking, 2PL*).

- [ ] **Step 1: Bài 33 — Page, Heap, Tuple, TOAST**

Câu chuyện: thư viện xếp sách vào các khay cố định 8KB; một cuốn quá dày phải xé ra gửi kho riêng (TOAST). Khái niệm heap, tuple header, `ctid`, `VACUUM` và bloat. Thực hành: `SELECT ctid, * FROM hoc_sinh LIMIT 5;`, `SELECT pg_size_pretty(pg_relation_size('diem_lon'));`, và cài `pageinspect` nếu được (nếu extension không có, ghi rõ và bỏ qua phần đó).

- [ ] **Step 2: Bài 34 — Index và B+Tree**

Câu chuyện: tìm từ trong từ điển 1000 trang — không đọc từ đầu mà mở giữa, đó là ý tưởng cây tìm kiếm. Sơ đồ Mermaid: cây B+Tree 3 tầng có node lá nối nhau thành danh sách liên kết, chú thích rõ vì sao node lá nối nhau giúp quét khoảng. Giải thích fan-out và vì sao cây chỉ sâu 3–4 tầng cho hàng triệu dòng. Thực hành đo thật: `EXPLAIN ANALYZE` một truy vấn trên `diem_lon` trước và sau `CREATE INDEX`, ghi lại thời gian thật. Index phức hợp + quy tắc cột trái nhất, index bộ phận, index phủ, và **khi nào index làm chậm** (ghi nhiều, bảng nhỏ, cột chọn lọc kém).

- [ ] **Step 3: Bài 35 — Hash, GiST, GIN, BRIN**

Bảng quyết định: loại index nào cho loại truy vấn nào. Hash cho `=`; GiST cho hình học/khoảng/tìm gần; GIN cho mảng, JSONB, full-text (nối Bài 32); BRIN cho bảng rất lớn đã sắp xếp tự nhiên theo thời gian. Mỗi loại: một câu `CREATE INDEX` thật + một `EXPLAIN` chứng minh nó được dùng.

- [ ] **Step 4: Bài 36 — EXPLAIN, Planner và Cost-Based Optimizer**

Cách đọc cây kế hoạch từ trong ra ngoài. Ý nghĩa `cost=a..b rows=N width=W`, `actual time`, `loops`, `Buffers: shared hit/read`. Vì sao ước lượng lệch thực tế → chạy `ANALYZE` cập nhật thống kê. Ba chiến lược JOIN (nested loop / hash / merge) và planner chọn thế nào — bảng: khi nào mỗi loại thắng. `SET enable_seqscan = off` để thấy planner đổi ý. Quy trình 5 bước tối ưu một truy vấn chậm.

- [ ] **Step 5: Bài 37 — Transaction và ACID**

Câu chuyện: chuyển 10 điểm thi đua từ lớp A sang lớp B — trừ xong mà chưa cộng thì mất điểm. Bốn chữ A-C-I-D, mỗi chữ một ví dụ ở `truong_hoc` và cơ chế PostgreSQL dùng để bảo đảm nó (A→WAL+rollback, C→constraint, I→MVCC, D→WAL+fsync) — nêu trước, đào sâu ở Bài 39–40. Thực hành: `BEGIN; UPDATE...; ROLLBACK;` rồi `SELECT` để thấy dữ liệu không đổi; `SAVEPOINT`.

- [ ] **Step 6: Bài 38 — Isolation level và anomaly**

Bảng ma trận 4 mức × 4 anomaly (dirty read, non-repeatable read, phantom, write skew) — ô nào có thể xảy ra. Ghi chú quan trọng: PostgreSQL không có Read Uncommitted thật (nó hành xử như Read Committed). Thực hành **hai session song song**: mở hai terminal `docker exec -it`, làm lại từng anomaly, chỉ rõ session nào chạy lệnh gì theo thứ tự (dùng bảng 2 cột "Session A | Session B"). Write skew ở Repeatable Read và `ERROR: could not serialize access` ở Serializable.

- [ ] **Step 7: Bài 39 — MVCC**

Câu chuyện: mỗi lần sửa điểm không xoá dòng cũ mà ghi dòng mới và đánh dấu dòng cũ "hết hiệu lực từ lúc T" — nhờ vậy ai đang đọc bản cũ vẫn đọc được. `xmin`/`xmax`, snapshot, quy tắc một tuple là "thấy được" khi nào. Vì sao `UPDATE` trong PostgreSQL thực chất là `DELETE + INSERT` → sinh dead tuple → cần `VACUUM`. Thực hành: `SELECT xmin, xmax, * FROM ...` trước/sau `UPDATE`; xem `n_dead_tup` trong `pg_stat_user_tables`. Sơ đồ Mermaid: dòng thời gian hai transaction cùng đọc/ghi một dòng.

- [ ] **Step 8: Bài 40 — WAL, checkpoint, recovery**

Câu chuyện: viết vào sổ nháp trước rồi mới chép vào sổ chính — mất điện thì đọc sổ nháp làm lại. Khái niệm write-ahead logging, LSN, `fsync`, checkpoint, redo sau crash, `synchronous_commit`, PITR và `pg_basebackup`. Sơ đồ Mermaid `sequenceDiagram`: COMMIT → ghi WAL → fsync → trả về client → sau đó mới ghi trang dữ liệu. Thực hành: `SELECT pg_current_wal_lsn();`, `CHECKPOINT;`, xem `pg_stat_bgwriter`.

- [ ] **Step 9: Bài 41 — Lock và Deadlock**

Bảng ma trận tương thích các mức khoá bảng của PostgreSQL. Khoá mức dòng qua `SELECT ... FOR UPDATE` / `FOR SHARE` / `SKIP LOCKED`. 2PL. Deadlock: dựng lại bằng hai session cố ý khoá chéo, xem thông báo `deadlock detected` thật, đọc `pg_locks`. Sơ đồ Mermaid: đồ thị chờ có chu trình. Bốn nguyên tắc phòng deadlock (khoá theo thứ tự cố định, transaction ngắn, `NOWAIT`/`SKIP LOCKED`, giảm mức cô lập khi đủ).

- [ ] **Step 10: Xác minh — mọi EXPLAIN và số đo trong bài là số thật**

Nạp `03-du-lieu-lon.sql`, chạy lại từng `EXPLAIN ANALYZE` xuất hiện trong 9 bài và **dán kết quả thật** vào bài (không được bịa số). Với Bài 38 và 41, chạy thật hai session và xác minh thông báo lỗi khớp từng chữ.
```bash
docker exec -i pg-khoahoc psql -U postgres -d truong_hoc -c "EXPLAIN (ANALYZE, BUFFERS) <truy vấn>"
```
Kỳ vọng: loại node trong kết quả thật (Seq Scan / Index Scan / Bitmap Heap Scan) khớp điều bài học đang khẳng định. Nếu không khớp, sửa bài theo thực tế — không sửa thực tế theo bài.

- [ ] **Step 11: Build, commit, push** (message `"Thêm Cấp 4 — Bên trong động cơ (Bài 33–41)"`).

---

## Task 8: Cấp 5 — Siêu nâng cao (Bài 42–51)

**Files:**
- Create: 10 file trong `docs/cap-5-sieu-nang-cao/`.
- Modify: `mkdocs.yml`.

**Interfaces:**
- Consumes: kỹ năng đọc EXPLAIN (Bài 36), MVCC (Bài 39), transaction (Bài 37).
- Produces: bài cuối (51) khép lại khóa học, link tới `docs/index.md` phần "học tiếp gì".

**Thuật ngữ bắt buộc:** replication (vật lý / logic, đồng bộ / bất đồng bộ), primary–replica, streaming replication, replication lag, failover, read replica, split-brain, partitioning (range / list / hash), partition pruning, sharding, khoá phân mảnh (*shard key*), hot shard, rebalancing, consistent hashing, định lý CAP, PACELC, BASE, nhất quán cuối (*eventual consistency*), nhất quán mạnh (*strong consistency*), đọc-ghi-của-mình (*read-your-writes*), giao dịch phân tán, 2PC (*two-phase commit*), coordinator, blocking problem của 2PC, 3PC, Saga, bù trừ (*compensating transaction*), outbox pattern, idempotency, đồng thuận (*consensus*), Raft (leader election, log replication, term, quorum), Paxos, split vote, NoSQL: key-value / document / column-family / graph, BSON, denormalization trong NoSQL, OLTP vs OLAP, data warehouse, data lake, lakehouse, star schema, snowflake schema, bảng sự kiện (*fact table*), bảng chiều (*dimension table*), độ mịn (*grain*), slowly changing dimension, cube, roll-up / drill-down, ETL, ELT, staging, CDC (*change data capture*), orchestration, idempotent pipeline, vector, embedding, không gian nhiều chiều, khoảng cách cosine / L2 / inner product, ANN (*approximate nearest neighbor*), HNSW, IVFFlat, `pgvector`, RAG, SQL injection, truy vấn tham số hoá (*parameterized query*), nguyên tắc đặc quyền tối thiểu (*least privilege*), `GRANT` / `REVOKE` / `ROLE`, RLS (*row-level security*), mã hoá khi nghỉ / khi truyền (*at rest / in transit*), backup đầy đủ / vi phân / WAL, RPO / RTO, monitoring, `pg_stat_statements`.

- [ ] **Step 1: Bài 42 — Replication**

Câu chuyện: cô giáo photo sổ điểm ra 3 bản cho 3 giáo viên dùng — sửa bản chính rồi phải cập nhật các bản photo, và luôn có độ trễ. Vật lý vs logic, đồng bộ vs bất đồng bộ (bảng đánh đổi: mất dữ liệu vs độ trễ commit), read replica để chia tải đọc, replication lag gây "đọc không thấy cái mình vừa ghi", failover và split-brain. Sơ đồ Mermaid: 1 primary + 2 replica với luồng WAL.

- [ ] **Step 2: Bài 43 — Partitioning và Sharding**

Phân biệt rõ: partitioning = chia trong **một** máy; sharding = chia ra **nhiều** máy. Ba kiểu partition (range theo `ngay_nhap`, list theo `hoc_ky`, hash theo `ma_hs`) với `CREATE TABLE ... PARTITION BY` chạy thật trên `diem_lon`, và `EXPLAIN` chứng minh **partition pruning** loại bỏ partition không cần. Sharding: chọn shard key thế nào, hot shard, vì sao JOIN xuyên shard rất đắt, rebalancing, consistent hashing (sơ đồ Mermaid vòng tròn hash).

- [ ] **Step 3: Bài 44 — CAP và BASE**

Câu chuyện: hai phòng ghi sổ riêng, mất liên lạc giữa hai phòng — chọn "từ chối ghi để không lệch" (CP) hay "vẫn ghi rồi khớp lại sau" (AP). Nhấn mạnh: P không phải lựa chọn, mạng **sẽ** đứt; nên thực chất chọn giữa C và A **khi đã đứt**. PACELC bổ sung: khi bình thường thì chọn giữa latency và consistency. BASE và các mức nhất quán. Bảng: hệ thống thật nào nghiêng về đâu. Sơ đồ Mermaid: tam giác CAP + kịch bản network partition.

- [ ] **Step 4: Bài 45 — Giao dịch phân tán: 2PC và Saga**

2PC: pha prepare, pha commit, vai trò coordinator; vẽ `sequenceDiagram` Mermaid; chỉ rõ **điểm chết**: coordinator sập sau khi mọi người đã prepare → tất cả bị treo giữ khoá. 3PC và vì sao vẫn không cứu được. Saga: chuỗi transaction cục bộ + transaction bù trừ, orchestration vs choreography, ví dụ "đăng ký môn học" gồm 3 bước có bù trừ. Outbox pattern và idempotency. Bảng đánh đổi 2PC vs Saga.

- [ ] **Step 5: Bài 46 — Consensus và Raft**

Bài toán: nhiều máy phải đồng ý một thứ tự sự kiện dù có máy sập. Raft ba phần: leader election (term, timeout, split vote, quorum = n/2+1), log replication (append entries, commit index), safety. Giải thích quorum bằng lớp học bầu lớp trưởng: quá bán thì kết quả không thể có hai người khác nhau. Sơ đồ Mermaid: `stateDiagram` Follower → Candidate → Leader. Nhắc Paxos và nói rõ Raft ra đời để dễ hiểu hơn. Ai dùng: etcd, Consul, CockroachDB, TiDB.

- [ ] **Step 6: Bài 47 — NoSQL bốn họ**

Mỗi họ: mô hình dữ liệu, truy vấn tiêu biểu, sản phẩm đại diện, dùng khi nào, **không** dùng khi nào. Key-value (Redis), document (MongoDB), column-family (Cassandra, HBase), graph (Neo4j). Với mỗi họ, mô hình lại dữ liệu `truong_hoc` theo họ đó và so sánh với bản quan hệ. Bảng quyết định cuối bài: 6 câu hỏi để chọn loại DB. Nhấn mạnh: NoSQL không phải "thay thế SQL" mà là đánh đổi khác.

- [ ] **Step 7: Bài 48 — Data Warehouse, OLAP, Star Schema**

OLTP vs OLAP: bảng so sánh 8 tiêu chí (mẫu truy cập, số dòng mỗi truy vấn, chuẩn hoá, index, người dùng, độ mới...). Data warehouse vs data lake vs lakehouse. Star schema: bảng sự kiện `fact_diem` + bảng chiều `dim_hoc_sinh`, `dim_mon_hoc`, `dim_thoi_gian`, `dim_lop` — viết `CREATE TABLE` thật và `INSERT ... SELECT` từ `truong_hoc` sang. Grain, snowflake schema, slowly changing dimension (type 1/2/3), roll-up/drill-down/slice/dice. Sơ đồ Mermaid `erDiagram` hình ngôi sao.

- [ ] **Step 8: Bài 49 — ETL, ELT và pipeline**

ETL vs ELT (bảng: biến đổi ở đâu, cần gì, khi nào chọn). Các tầng staging → raw → cleaned → mart. CDC và ba cách triển khai (trigger, timestamp, đọc WAL/logical replication). Yêu cầu bắt buộc của pipeline tốt: idempotent, có thể chạy lại (*replayable*), quan sát được, xử lý dữ liệu đến muộn. Sơ đồ Mermaid `flowchart` một pipeline hoàn chỉnh từ `truong_hoc` sang warehouse. Ví dụ: một script SQL idempotent nạp lại ngày hôm qua bằng `DELETE ... WHERE ngay = $1` rồi `INSERT`.

- [ ] **Step 9: Bài 50 — Vector Database và Embedding**

Câu chuyện: tìm "bài văn giống bài này" — không tìm bằng từ khoá trùng mà bằng **ý nghĩa**. Embedding là biến văn bản thành một dãy số (vector) sao cho nội dung gần nghĩa thì vector gần nhau; giải thích "gần nhau" bằng toạ độ điểm trên mặt phẳng trước khi nói tới 768 chiều. Ba phép đo khoảng cách. Vì sao tìm chính xác là O(n) → cần ANN; HNSW (giải thích bằng "bản đồ nhiều tầng: tầng cao đi đường dài, tầng thấp đi đường ngắn") và IVFFlat. Thực hành `pgvector`: `CREATE EXTENSION vector`, cột `vector(3)` với ví dụ 3 chiều để nhìn thấy được, `<->` `<=>` `<#>`, `CREATE INDEX USING hnsw`. Nếu image `postgres:16` không có `pgvector`, ghi rõ trong bài là cần image `pgvector/pgvector:pg16` và dùng image đó để kiểm tra. Kết bài: RAG là gì trong một đoạn.

- [ ] **Step 10: Bài 51 — Bảo mật, Backup, Monitoring**

SQL injection: một ví dụ tấn công cụ thể trên `truong_hoc` và cách chặn bằng truy vấn tham số hoá (cho thấy cả code sai và code đúng). `ROLE`, `GRANT`/`REVOKE`, least privilege, RLS với ví dụ "giáo viên chỉ xem được điểm lớp mình" viết bằng `CREATE POLICY`. Mã hoá at rest / in transit. Backup: `pg_dump` vs `pg_basebackup`, full/vi phân/WAL, RPO & RTO, và nguyên tắc "bản backup chưa phục hồi thử thì chưa phải backup". Monitoring: `pg_stat_statements`, `pg_stat_activity`, các chỉ số cần theo dõi (cache hit ratio, dead tuple, replication lag, truy vấn chậm nhất). Kết bài: lộ trình học tiếp.

- [ ] **Step 11: Xác minh SQL và extension**

Chạy mọi SQL của 10 bài. Với Bài 43 (partitioning), 48 (star schema), 51 (RLS, policy) — chạy thật trên container. Với Bài 50, chạy trên container `pgvector/pgvector:pg16`:
```bash
docker run -d --name pg-vector -e POSTGRES_PASSWORD=hoc -e POSTGRES_DB=truong_hoc -p 55433:5432 pgvector/pgvector:pg16
docker exec -i pg-vector psql -U postgres -d truong_hoc -c "CREATE EXTENSION vector;"
```
Kỳ vọng: không lỗi. Nếu không tải được image (mạng), ghi rõ trong bài rằng phần này chưa chạy kiểm thử và nêu image cần dùng — không được im lặng.

- [ ] **Step 12: Build, commit, push** (message `"Thêm Cấp 5 — Siêu nâng cao (Bài 42–51)"`).

---

## Task 9: Bảng thuật ngữ, hoàn thiện điều hướng và kiểm tra cuối

**Files:**
- Modify: `docs/glossary.md` (từ khung thành bảng đầy đủ)
- Modify: `docs/index.md` (lộ trình đầy đủ 51 bài + trạng thái hoàn thành)
- Modify: 51 file bài học (thêm dòng điều hướng ⬅️/➡️ ở cuối nếu chưa có)
- Create: `README.md` (trang giới thiệu repo trên GitHub, có link tới website)
- Modify: `specs/2026-09-24-khoa-hoc-database-design.md` (sửa "50 bài" → "51 bài", đánh dấu tiêu chí hoàn thành)

- [ ] **Step 1: Thu thập mọi thuật ngữ đã in đậm**

```bash
cd /home/hungnm/database-tu-a-z
grep -rhoP '\*\*[^*]+\*\* \(\*[^*]+\*\)' docs/ | sort -u > /tmp/thuat-ngu.txt
wc -l /tmp/thuat-ngu.txt
```
Kỳ vọng: ít nhất 150 thuật ngữ.

- [ ] **Step 2: Viết `docs/glossary.md`**

Bảng 4 cột: `Tiếng Việt | English | Nghĩa trong một câu | Học ở bài`, sắp xếp theo tiếng Anh A→Z, cột cuối là link tới file bài học. Chia theo chữ cái đầu bằng heading `## A`, `## B`, ... để mục lục bên phải dùng được.

- [ ] **Step 3: Kiểm tra không thuật ngữ nào bị bỏ sót**

So `/tmp/thuat-ngu.txt` với `docs/glossary.md`; mọi thuật ngữ trong file trích phải có dòng trong glossary. Bổ sung phần thiếu.

- [ ] **Step 4: Viết `README.md` cho repo**

Gồm: badge link website, khóa học này là gì và cho ai, bảng 6 cấp độ với số bài, cách chạy local (`pip install -r requirements.txt && mkdocs serve`), cách nạp dataset, giấy phép CC BY 4.0 cho nội dung.

- [ ] **Step 5: Kiểm tra mọi bài có đủ 8 khối**

```bash
for f in $(find docs -name '*.md' -not -name 'index.md' -not -name 'glossary.md' -not -name 'dataset.md' | sort); do
  n=$(grep -cE '^## (🧠|📖|🖼️|💻|⚠️|✍️|🔑)' "$f")
  h=$(grep -c '🎯 Học xong bài này' "$f")
  [ "$n" -eq 7 ] && [ "$h" -ge 1 ] || echo "THIẾU KHỐI: $f (có $n/7 heading, mục tiêu=$h)"
done
echo "--- xong ---"
```
Kỳ vọng: không in ra dòng `THIẾU KHỐI` nào. Sửa bài nào bị báo.

- [ ] **Step 6: Kiểm tra mọi bài có bài tập kèm đáp án**

```bash
for f in $(find docs/cap-* -name '*.md' | sort); do
  grep -q '??? success "Đáp án"' "$f" || echo "THIẾU ĐÁP ÁN: $f"
done
echo "--- xong ---"
```
Kỳ vọng: không có dòng `THIẾU ĐÁP ÁN`.

- [ ] **Step 7: Kiểm tra số bài đúng 51 và nav khớp**

```bash
find docs/cap-* -name '*.md' | wc -l          # kỳ vọng: 51
grep -cE '^ {6,}- ' mkdocs.yml                 # số dòng bài trong nav, kỳ vọng: 51
```
Nếu lệch: tìm file thiếu trong nav (build `--strict` cũng sẽ báo).

- [ ] **Step 8: Build strict lần cuối và kiểm tra link chết**

```bash
.venv/bin/mkdocs build --strict 2>&1 | tee /tmp/build.log
grep -i warning /tmp/build.log && echo "CÒN WARNING — phải sửa" || echo "BUILD SẠCH"
```
Kỳ vọng: in `BUILD SẠCH`.

- [ ] **Step 9: Cập nhật spec cho khớp thực tế**

Sửa mọi chỗ ghi "50 bài" thành "51 bài" trong `specs/2026-09-24-khoa-hoc-database-design.md`, tick các ô trong mục "Tiêu chí hoàn thành" đã đạt, và ghi lý do thêm bài 51 (Bảo mật/Backup/Monitoring).

- [ ] **Step 10: Commit, push, xác minh website cuối cùng**

```bash
git add -A
git commit -m "Thêm bảng thuật ngữ, README và hoàn thiện điều hướng toàn khóa

Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>"
git push
gh run watch --exit-status
curl -s https://hungnguyen010518.github.io/database-tu-a-z/glossary/ | grep -o '<title>[^<]*' 
curl -sI https://hungnguyen010518.github.io/database-tu-a-z/cap-5-sieu-nang-cao/50-vector-database/ | head -1
```
Kỳ vọng: workflow `success`; trang glossary có title; trang bài 50 trả `HTTP/2 200`.

- [ ] **Step 11: Dọn container Docker**

```bash
docker rm -f pg-khoahoc pg-vector 2>/dev/null; echo "đã dọn"
```

---

## Self-Review

**1. Spec coverage** — đối chiếu từng mục của spec:

| Yêu cầu trong spec | Task thực hiện |
|---|---|
| 6 cấp độ, toàn bộ nội dung đã liệt kê | Task 1, 3, 4, 5, 6, 7, 8 |
| Khuôn mẫu 8 khối mỗi bài | Định nghĩa ở đầu plan; kiểm tra tự động ở Task 9 Step 5 |
| Ví dụ đời thường trước định nghĩa | Global Constraints; mỗi step nêu rõ câu chuyện cụ thể |
| Sơ đồ Mermaid (ER, kiến trúc, B+Tree) | Task 1 Step 4 (kiểm chứng render), và các step có nêu sơ đồ cụ thể |
| Code SQL chạy được + dataset mẫu | Task 2; xác minh ở Task 3/4/5/6/7/8 Step "chạy thật" |
| Bài tập + đáp án | Khuôn mẫu; kiểm tra tự động Task 9 Step 6 |
| Bảng thuật ngữ Việt–Anh | Task 9 Step 1–3 |
| 3 file dataset | Task 2 Step 1–3 |
| MkDocs Material + Pages + Actions | Task 1 |
| Push theo đợt, có link sớm | Task 1 giao link live; mỗi task sau một commit |
| Tiêu chí hoàn thành trong spec | Task 9 Step 5–9 kiểm từng tiêu chí |

Không còn khoảng trống. Một sai lệch có chủ đích: spec ghi 50 bài, plan chốt **51** vì mục "security/backup/monitoring" trong spec cần một bài riêng — Task 9 Step 9 sửa spec cho khớp.

**2. Placeholder scan** — không có "TBD"/"TODO"/"tương tự Task N". Mọi step nêu rõ khái niệm nào, ví dụ nào, lệnh nào. Các khối nội dung dài (bài học) được đặc tả bằng danh sách thuật ngữ bắt buộc + câu chuyện cụ thể + yêu cầu sơ đồ, thay vì viết trước toàn văn — đây là đặc tả đủ để một người viết ra bài mà không cần đoán.

**3. Type consistency** — tên bảng/cột chỉ được định nghĩa một lần ở Task 2 Interfaces và mọi task sau tham chiếu về đó. Tên file bài học chốt cứng ở bảng "Danh sách 51 bài"; mọi task dùng đúng tên trong bảng đó. Container Docker tên `pg-khoahoc` xuyên suốt Task 2→9, `pg-vector` chỉ ở Task 8, dọn ở Task 9 Step 11.
