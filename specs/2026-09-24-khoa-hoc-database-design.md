# Thiết kế khóa học "Database từ A-Z"

- **Ngày**: 2026-09-24
- **Trạng thái**: đã được người dùng phê duyệt
- **Ghi chú vị trí**: spec đặt ở `specs/` (không đặt trong `docs/`) để MkDocs không publish tài liệu nội bộ này lên website khóa học.

## 1. Mục tiêu

Một khóa học Database hoàn chỉnh bằng tiếng Việt, đi từ con số 0 tới mức siêu nâng cao, với ràng buộc cốt lõi:

> **Mọi khái niệm phải được giải thích sao cho học sinh cấp 2 hiểu được, nhưng không được lược bỏ thuật ngữ chuyên ngành.**

Hai yêu cầu này không mâu thuẫn: cách giải quyết là **luôn dạy trực giác trước, gắn nhãn thuật ngữ sau**. Học sinh hiểu ý tưởng bằng ví dụ đời thường, rồi được cho biết "cái vừa rồi, trong sách gọi là *foreign key*".

## 2. Phạm vi

### Có trong phạm vi
- 50 bài học Markdown, chia 6 cấp độ.
- Một database mẫu `truong_hoc` dùng xuyên suốt, 3 file SQL.
- Bảng thuật ngữ Việt–Anh tổng hợp toàn khóa.
- Website tĩnh trên GitHub Pages, build tự động bằng GitHub Actions.

### Ngoài phạm vi
- Video, bài kiểm tra tương tác, hệ thống chấm điểm tự động.
- Hướng dẫn quản trị (DBA) chuyên sâu cho production thật.
- Các DBMS khác ngoài PostgreSQL (chỉ ghi chú khác biệt khi cần).

## 3. Quyết định thiết kế đã chốt

| Hạng mục | Quyết định | Lý do |
|---|---|---|
| DBMS chính | **PostgreSQL** | Miễn phí, đầy đủ tính năng nâng cao thật (MVCC, WAL, nhiều loại index, EXPLAIN chi tiết) nên phần Level 4–5 có nội dung thật để mổ xẻ. |
| Cách tổ chức | **6 cấp độ tuyến tính + 1 dataset xuyên suốt** | Bối cảnh cố định là điều kiện tiên quyết để người mới không bị ngợp. Tới Level 4–5, chính DB đó được index / EXPLAIN / shard. |
| Đầu ra | **MkDocs Material trên GitHub Pages** | Có menu, mục lục, tìm kiếm, dark mode, render Mermaid. |
| Quy mô | **50 bài** | Đủ phủ từ cơ bản tới phân tán/vector DB mà mỗi bài vẫn đọc được trong 15–20 phút. |
| Chiến lược giao hàng | **Push theo đợt** | Dựng khung + Pages chạy trước để có link ngay, rồi bơm nội dung từng Level, mỗi Level một commit. |

### Hướng đã cân nhắc và loại bỏ
- **Project-driven** (mỗi chương xây thêm một phần app): hấp dẫn hơn, nhưng lý thuyết chuẩn hoá và đại số quan hệ bị nhét vào khe hở → dễ hổng kiến thức.
- **Hai nhánh lý thuyết / thực hành song song**: rõ cho người ôn thi, nhưng người mới phải nhảy qua lại → phân tâm.

## 4. Kiến trúc nội dung

| Cấp | Tên | Bài | Nội dung chính |
|---|---|---|---|
| 0 | Nhập môn | 1–5 | Dữ liệu vs thông tin, tại sao Excel không đủ, DBMS, các mô hình dữ liệu, cài PostgreSQL + psql |
| 1 | Mô hình quan hệ & ER | 6–15 | Entity/Attribute/Relationship, ER diagram (Chen & Crow's Foot), cardinality, participation, weak entity, 7 loại khoá, EER (generalization/specialization/aggregation), ER → lược đồ quan hệ, ràng buộc toàn vẹn, đại số quan hệ |
| 2 | Chuẩn hoá | 16–21 | Phụ thuộc hàm, bao đóng, 1NF→2NF→3NF→BCNF→4NF/5NF/6NF, denormalization |
| 3 | SQL từ 0 → cao thủ | 22–34 | DDL/DML, WHERE, JOIN, GROUP BY/HAVING, subquery, CTE & recursive, window function, view & materialized view, constraint, trigger & stored procedure, JSONB, full-text search |
| 4 | Bên trong động cơ | 35–43 | Page & heap, B+Tree, Hash/GiST/GIN/BRIN, EXPLAIN & planner, cost-based optimizer, ACID, isolation level & anomaly, MVCC, WAL & recovery, lock & deadlock |
| 5 | Siêu nâng cao | 44–50 | Replication, partitioning, sharding, CAP/BASE, 2PC & Saga, Raft, 4 họ NoSQL, Data Warehouse/OLAP/star schema, ETL/ELT, Vector DB & embedding, security/backup/monitoring |

## 5. Khuôn mẫu bài học

Mỗi bài có đúng 8 khối, theo thứ tự cố định:

1. 🎯 **Mục tiêu** — học xong bài này bạn sẽ làm được gì (3–4 gạch đầu dòng).
2. 🧠 **Câu chuyện đời thường** — một tình huống ở trường/nhà mà học sinh cấp 2 đã trải qua.
3. 📖 **Khái niệm & thuật ngữ** — định nghĩa chính xác, kèm bảng thuật ngữ Việt – English.
4. 🖼️ **Sơ đồ** — Mermaid (ER diagram, kiến trúc, cấu trúc B+Tree...).
5. 💻 **Thực hành SQL** — code chạy được trên dataset `truong_hoc`.
6. ⚠️ **Lỗi thường gặp** — 2–3 lỗi kinh điển và cách tránh.
7. ✍️ **Bài tập** — 3–5 câu, đáp án nằm trong khối `<details>` gập lại.
8. 🔑 **Tóm tắt** — đúng 5 dòng.

**Quy tắc viết**: câu ngắn; không dùng thuật ngữ trước khi đã giải thích nó; mỗi thuật ngữ lần đầu xuất hiện phải in đậm kèm tiếng Anh trong ngoặc.

## 6. Dataset

Database `truong_hoc`, 10 bảng: `hoc_sinh`, `lop`, `giao_vien`, `mon_hoc`, `diem`, `phan_cong_day`, `phu_huynh`, `sach`, `muon_sach`, `diem_danh`.

| File | Mục đích |
|---|---|
| `dataset/01-chua-chuan-hoa.sql` | Một bảng bẹt đầy dữ liệu trùng lặp — nguyên liệu để dạy Level 2 (chuẩn hoá). |
| `dataset/02-chuan-hoa.sql` | Lược đồ 10 bảng đã chuẩn hoá + dữ liệu mẫu nhỏ. Dùng cho Level 3–5. |
| `dataset/03-du-lieu-lon.sql` | Sinh ~500.000 dòng để thực hành index, EXPLAIN, partitioning. |

## 7. Kiến trúc kỹ thuật

```
database-tu-a-z/
├── docs/
│   ├── index.md              # trang chủ + lộ trình học
│   ├── glossary.md           # bảng thuật ngữ toàn khóa
│   ├── cap-0-nhap-mon/
│   ├── cap-1-mo-hinh-er/
│   ├── cap-2-chuan-hoa/
│   ├── cap-3-sql/
│   ├── cap-4-ben-trong-dong-co/
│   └── cap-5-sieu-nang-cao/
├── dataset/
├── specs/
├── mkdocs.yml
└── .github/workflows/deploy.yml
```

- **mkdocs.yml**: theme Material, `navigation.sections` + `navigation.top`, `search` với `lang: vi`, dark/light toggle, `pymdownx.superfences` cấu hình custom fence cho Mermaid, `pymdownx.details` cho khối đáp án gập, `admonition` cho hộp cảnh báo.
- **deploy.yml**: chạy trên push nhánh `main`; cài `mkdocs-material`; `mkdocs gh-deploy --force`. Cần bật GitHub Pages với source là nhánh `gh-pages`.
- **Nav khai báo tường minh** trong `mkdocs.yml` để thứ tự bài đúng như lộ trình, không phụ thuộc thứ tự chữ cái.

## 8. Rủi ro & cách xử lý

| Rủi ro | Xử lý |
|---|---|
| Nội dung 50 bài quá lớn cho một lần ghi | Push theo đợt, mỗi Level một commit; khung + Pages lên trước để có link ngay. |
| Giải thích "dễ hiểu" làm mất độ chính xác | Khối 2 (câu chuyện) chịu trách nhiệm dễ hiểu; khối 3 (khái niệm) chịu trách nhiệm chính xác. Hai khối tách biệt nên không phải đánh đổi. |
| Mermaid không render | Cấu hình `custom_fences` đúng ngay từ đợt đầu và kiểm tra bằng một sơ đồ ER thật ở bài đầu tiên. |
| SQL trong bài bị sai cú pháp | Mọi câu SQL chỉ dùng `dataset/02-chuan-hoa.sql`; chạy thử trên PostgreSQL trước khi commit nếu môi trường có sẵn. |

## 9. Tiêu chí hoàn thành

- [ ] Website GitHub Pages truy cập được, có menu 6 cấp độ.
- [ ] 50 bài đều có đủ 8 khối.
- [ ] Sơ đồ Mermaid render đúng trên website.
- [ ] 3 file SQL chạy không lỗi trên PostgreSQL.
- [ ] `glossary.md` chứa mọi thuật ngữ đã in đậm trong các bài.
