# Tiến trình xây dựng khóa học "Database từ A-Z"

> **Tài liệu bàn giao.** Đọc file này trước khi làm tiếp bất cứ việc gì.
> Cập nhật lần cuối: 2026-09-25, sau khi hoàn tất Bài 47 (47/51 bài). **Phiên này DỪNG
> theo yêu cầu người dùng** (hết token) — chưa làm gì cho Bài 48-51 và Task 9. Phiên sau
> đọc mục 0 và mục 8 rồi tiếp tục ngay từ Bài 48.

## 0. Một phút nắm tình hình

| | |
|---|---|
| **Website** | https://hungnguyen010518.github.io/database-tu-a-z/ |
| **Repo** | https://github.com/hungnguyen010518/database-tu-a-z |
| **Đã viết** | **47 / 51 bài** — Cấp 0, 1, 2, 3, 4 xong + đã qua review; Cấp 5 mới có Bài 42-47 |
| **Còn lại** | Bài 48-51 (4 bài, xem mục 8), rà soát tổng cuối khoá (Task 9) |
| **Khẳng định kết quả** | ~1432 (đếm `KỲ VỌNG` trong `docs/`), tất cả PostgreSQL 16 thật xác minh mỗi lần push |
| **Bảng thuật ngữ** | ~498 dòng thuật ngữ trong `docs/glossary.md`, phạm vi "Bài 1–47" |
| **Sơ đồ Mermaid** | 101 khối, tất cả CI Mermaid render được |
| **CI** | 4 workflow, tất cả xanh trên `main`, commit mới nhất đã xác minh: `0e81430` |
| **Bài 47 CHƯA qua task reviewer** | Implement xong, CI xanh, nhưng phiên này bỏ qua bước dispatch reviewer subagent để tiết kiệm token theo yêu cầu người dùng. Phiên sau nên dispatch 1 task reviewer cho riêng Bài 47 (dùng `review-package` với BASE = commit trước Bài 47, xem mục 2) trước khi coi Bài 47 là "đã qua review" như các bài khác. |

Yêu cầu gốc của người dùng: khóa học database tiếng Việt từ A-Z, cơ bản đến siêu nâng cao,
**mọi khái niệm giải thích sao cho học sinh cấp 2 hiểu được**, **đầy đủ thuật ngữ chuyên ngành**
(biểu đồ ER...), push lên GitHub để có link.

## 1. Tài liệu nền

| File | Nội dung |
|---|---|
| `specs/2026-09-24-khoa-hoc-database-design.md` | Spec thiết kế đã được người dùng duyệt |
| `plans/2026-09-24-khoa-hoc-database.md` | Kế hoạch 9 task, danh sách 51 bài chốt cứng |
| `.superpowers/sdd/progress.md` | Ledger từng task (git-ignored) |
| `.superpowers/sdd/huong-dan-chung.md` | **Hướng dẫn chung cho implementer — file quan trọng nhất** (git-ignored) |
| `.superpowers/sdd/task-*a-brief.md`, `task-*b-brief.md` | Brief từng lô 5 bài, dùng lại được làm mẫu cho lô sau (git-ignored) |
| `.superpowers/sdd/task-*-report.md` | Báo cáo từng task (git-ignored) |
| `.superpowers/sdd/review-*.diff` | Gói diff đã sinh cho từng vòng review (git-ignored, có thể xoá an toàn) |

⚠️ Thư mục `.superpowers/` bị git-ignore, KHÔNG theo cấu trúc con `2026-09-24-khoa-hoc-database/`
như bản gốc — phiên 2026-09-25 dựng lại phẳng thẳng trong `.superpowers/sdd/`. Nếu thư mục này bị
xoá, dựng lại `huong-dan-chung.md` từ mục 4–7 của tài liệu này (bản đã dùng ở phiên 2026-09-25 còn
có thêm 1 dòng ở mục "Sơ đồ Mermaid không thụt lề": bổ sung `stateDiagram-v2` vào danh sách an
toàn — nhớ thêm lại nếu dựng file từ đầu).

## 2. Quy trình đang dùng

Skill `superpowers:subagent-driven-development`. Mỗi task:

1. Controller sinh task brief: `<skill>/scripts/task-brief plans/2026-09-24-khoa-hoc-database.md N`
2. Dispatch **implementer** (model opus) với: hướng dẫn chung + brief + ngữ cảnh từ task trước
3. Poll CI. Nếu đỏ → gửi sửa ngay trước khi review
4. Sinh gói review: `<skill>/scripts/review-package <plan> BASE HEAD`
5. Dispatch **task reviewer** (opus) — phải trả về HAI phán quyết: tuân thủ đặc tả + chất lượng
6. Gửi findings cho implementer sửa (resume qua `SendMessage`, không dispatch mới)
7. Dispatch **re-reviewer** (sonnet) phạm vi hẹp: phán quyết từng finding ADDRESSED/NOT
8. Ghi ledger, sang task tiếp

Đường dẫn skill:
`/home/hungnm/.claude/plugins/cache/superpowers-dev/superpowers/6.2.0/skills/subagent-driven-development`

**Task lớn phải chia đôi** (5–6 bài mỗi lượt). Một agent viết 10–12 bài sẽ hết context.
Đã chia: Task 4 → 4a/4b, Task 6 → 6a/6b. **Task 7 nên chia 33–37 / 38–41, Task 8 chia 42–46 / 47–51.**

## 3. Môi trường — ba cái bẫy đã mất thời gian

| Vấn đề | Cách xử lý |
|---|---|
| `git push` báo `git: 'remote-https' is not a git command` | Luôn dùng `PATH="/usr/lib/git-core:$PATH" git push` |
| `gh api` (REST) thất bại im lặng trong sandbox | Chạy với `dangerouslyDisableSandbox: true`, hoặc dùng `curl` với `$(gh auth token)` |
| Docker có cài nhưng **không có quyền socket**, `sudo` đòi mật khẩu | Không chạy được PostgreSQL cục bộ. **Mọi kiểm thử SQL do CI làm.** |
| `python3-venv` chưa cài | MkDocs cài bằng `pip3 install --user`; chạy với `PATH="$HOME/.local/bin:$PATH"` |

**Subagent dùng chung cây làm việc với controller.** Khi một implementer đang chạy, đừng để file
chưa commit của controller nằm trong cây — nó sẽ bị `git add -A` của implementer quét vào.

## 4. Năm lớp kiểm tra tự động — và vì sao mỗi lớp tồn tại

Mỗi lớp sinh ra từ một lỗi thật đã xảy ra. Đừng bỏ lớp nào.

| Workflow / script | Canh gì | Sinh ra vì |
|---|---|---|
| `mkdocs build --strict` | link chết, file ngoài nav | nền tảng |
| `.github/workflows/kiem-tra-sql.yml` | chạy **mọi** khối ```sql``` trong `docs/` trên PostgreSQL 16 thật | bài học không được chứa SQL chưa từng chạy |
| ↳ khẳng định `-- KỲ VỌNG` | kết quả truy vấn **khớp con số bài nói** | Bài 17 ghi "hai dòng" trong khi truy vấn trả 5 dòng; CI xanh vì chỉ kiểm cú pháp |
| `.github/workflows/kiem-tra-so-do.yml` | render thật từng sơ đồ Mermaid bằng `mermaid-cli` | sơ đồ ER của trang dataset dùng `PK_FK` không hợp lệ, hiện lỗi trên web mà không ai biết |
| `.github/workflows/kiem-tra-cau-truc.yml` (`scripts/kiem_cau_truc.py`) | thụt lề khối code, khuôn 8 khối, số khối đáp án, độ dài khối Tóm tắt | thụt lề lệch làm `</details>` đóng sớm → **đáp án Bài 16 lộ ra ngoài vùng gập**, `--strict` vẫn xanh |
| `scripts/trich_thuat_ngu.py` | thuật ngữ đã giới thiệu có trong `docs/glossary.md` chưa | sau 20 bài, glossary mới có 13/147 thuật ngữ |

### Cơ chế khẳng định kết quả — cú pháp

```sql
-- KỲ VỌNG: 5 dòng
-- KỲ VỌNG: so_dong = 40
-- KỲ VỌNG: ten_mon = Toán
-- KỲ VỌNG: ly_do = NULL
SELECT ...;
```

- Đánh dấu phải nằm ngay trên **một** câu `SELECT`/`WITH` duy nhất kết thúc khối.
- Khẳng định giá trị đọc **dòng đầu tiên**. Nếu truy vấn **không có `ORDER BY` ở tầng ngoài cùng**,
  công cụ sinh `INTO STRICT` → PostgreSQL báo lỗi nếu kết quả không phải đúng một dòng.
  (Đóng lớp rủi ro "xanh hôm nay, đỏ sau một lần `VACUUM`".)
- Tránh khẳng định giá trị trên truy vấn `ORDER BY` theo cột **tiếng Việt có dấu** — phụ thuộc collation.
- Công cụ tự cảnh báo khi khai `N dòng` (N>1) cho truy vấn tổng hợp không `GROUP BY`.

### Đánh dấu bỏ qua — HTML comment, vô hình trên web

```
<!-- sql:khong-chay -->   mã minh hoạ / cần quyền đặc biệt / sẽ làm lệch lược đồ
<!-- sql:co-y-loi -->     câu lệnh CỐ Ý sai để dạy thông báo lỗi
```

Phải đặt ở **dòng ngay trên** dấu ```` ```sql ````, **không** đặt bên trong fence (đặt bên trong thì
khối vẫn chạy — Cấp 3 từng mắc).

### Kỹ thuật cho Cấp 4 — làm khẳng định về `EXPLAIN` kiểm được

`EXPLAIN` không dùng trực tiếp trong truy vấn con. Bọc trong hàm rồi khẳng định trên chuỗi kế hoạch:

```sql
DROP FUNCTION IF EXISTS b36_ke_hoach(text);
CREATE FUNCTION b36_ke_hoach(cau_truy_van text) RETURNS text LANGUAGE plpgsql AS $$
DECLARE dong text; ket_qua text := '';
BEGIN
    FOR dong IN EXECUTE 'EXPLAIN ' || cau_truy_van LOOP
        ket_qua := ket_qua || dong || E'\n';
    END LOOP;
    RETURN ket_qua;
END $$;
```

```sql
-- KỲ VỌNG: dung_seq_scan = true
-- KỲ VỌNG: dung_index_scan = false
SELECT b36_ke_hoach('SELECT * FROM diem_lon WHERE ma_hs = 12345') LIKE '%Seq Scan%'   AS dung_seq_scan,
       b36_ke_hoach('SELECT * FROM diem_lon WHERE ma_hs = 12345') LIKE '%Index Scan%' AS dung_index_scan;
```

**TUYỆT ĐỐI KHÔNG khẳng định thời gian chạy** (`actual time`, `ms`, `Buffers`) — biến động theo máy.
Nói định tính, hoặc dán output mẫu trong khối ```text``` kèm một dòng nói con số sẽ khác trên máy người học.

## 5. Ràng buộc nội dung — bất biến của khóa học

- **Nguyên tắc chi phối: hiểu trước, gọi tên sau.** Khối 🧠 lo phần dễ hiểu (câu chuyện đời thường
  ở trường), khối 📖 lo phần chính xác (định nghĩa chuẩn + thuật ngữ). Tách đôi nên **không phải
  đánh đổi** giữa dễ hiểu và chính xác.
- **Không dùng thuật ngữ trước khi đã giải thích nó.**
- Thuật ngữ lần đầu: `**tiếng Việt** (*english*)`. Các lần sau **không** lặp phần tiếng Anh.
  (Cấp 3 từng có 7 chỗ đảo chiều `**English** (*tiếng Việt*)` — đó là 7 chỗ duy nhất của cả khoá.)
- **Khuôn 8 khối, đúng thứ tự:** một dòng `🎯 Học xong bài này`, rồi 7 heading `## ` mang emoji
  🧠 📖 🖼️ 💻 ⚠️ ✍️ 🔑. Mỗi bài **đúng một** `??? success "Đáp án"`. Khối 🔑 **đúng 5 dòng đánh số**.
- **PostgreSQL 16**; cú pháp DBMS khác chỉ trong hộp ghi chú.
- **Bối cảnh trường học Việt Nam** — không dùng employees/orders/customers.
- **Bảng thuật ngữ cuối bài phải nói cùng một điều với thân bài.** Nó nằm cách đoạn văn xuôi hàng
  chục dòng nên rất dễ lệch; Cấp 1 từng có 5 dòng lệch, 2 trong đó sai nội dung thật.
- **Đừng dựa vào số thứ tự của danh sách Markdown.** Bài 26 từng cố ý nhảy `5.`→`7.` và Markdown
  đánh số lại, khiến `ORDER BY` hiện ra là bước 6 trong khi bước 6 là `DISTINCT`. Cần số chính xác
  thì dùng **bảng**.
- **Sơ đồ Mermaid không được thụt lề.** Đã dùng an toàn: `flowchart`, `erDiagram`, `sequenceDiagram`,
  `classDiagram`. Trong `erDiagram`, nhiều ràng buộc khoá viết `PK, FK` (dấu phẩy, **không** `PK_FK`);
  vế trái quan hệ chỉ dùng `|o`, `||`, `}o`, `}|`.
- **Không bịa số liệu.**

### Hai nguyên tắc đắt giá nhất, học được bằng cách sai

**A. Khẳng định không chứng minh được tính minh hoạ.**
Một khẳng định `KỲ VỌNG` chỉ chứng minh *câu lệnh trả về đúng con số bài nói*. Nó **không** chứng
minh *con số đó minh hoạ được điều bài đang dạy*. Với mọi ví dụ dạng **"cách A cho X, cách B cho Y,
Y sai"**, phải kiểm thêm: **X ≠ Y trên chính dữ liệu mẫu.**
Bài 32 từng dựng ví dụ chỉ ra bẫy "so chuỗi thay vì so số" với bốn chiều cao 152/148/155/145 —
nhưng vì mọi số cùng ba chữ số, thứ tự chuỗi trùng thứ tự số nên **cả hai cách cho cùng kết quả**.
Ví dụ minh hoạ một cái bẫy mà không kích hoạt được cái bẫy đó thì tệ hơn là không có ví dụ.

**B. Đừng tin công cụ ở chỗ nó không nhìn được.**
- `trich_thuat_ngu.py --thieu` chỉ hiện thuật ngữ **thiếu trong glossary**. Thuật ngữ đã có trong
  glossary nhưng **viết đảo chiều trong thân bài** thì nó im lặng.
- Thuật ngữ **chưa bao giờ được gloss** nằm ngoài tầm mọi công cụ đo — thước đo chỉ đếm được thứ
  người ta đã khai. Cấp 3 để `LATERAL` dùng 8 lần mà không một lần định nghĩa.
- Regex đầu tiên của `trich_thuat_ngu.py` bỏ sót 45 thuật ngữ gồm **toàn bộ 1NF–6NF và BCNF**, nên
  con số "CÒN THIẾU: 0" lúc đó là **giả**.
Trước khi viết rằng một lớp vấn đề đã sạch, tự hỏi: *công cụ tôi vừa chạy có thật sự nhìn được lớp
này không?* Nếu không chắc, `grep` trực tiếp. Và đừng mô tả báo cáo theo **ý định** — chỉ theo thứ
đang có trong file.

## 6. An toàn SQL

CI chạy mọi khối ```sql``` **tuần tự theo alphabet đường dẫn file**, trên **một** database.

- **10 bảng nghiệp vụ** (`giao_vien`, `lop`, `hoc_sinh`, `phu_huynh`, `mon_hoc`, `phan_cong_day`,
  `diem`, `sach`, `muon_sach`, `diem_danh`) và `bang_bet`: **chỉ được `SELECT`**. Mọi câu ghi phải
  có `<!-- sql:khong-chay -->`.
- Bảng nháp: tiền tố **`bNN_`** theo số bài, `DROP ... IF EXISTS ... CASCADE` trước khi tạo, mục dọn
  dẹp ở cuối bài. Nếu phần ⚠️/✍️ còn dùng bảng nháp thì đặt mục dọn dẹp **sau** khối đáp án
  (vẫn trong `## ✍️`, trước `## 🔑`) — cách này đã được review chấp thuận.
- `diem_lon` (500.000 dòng) và `hoc_sinh_lon` (50.000 dòng) là **bảng thực hành**, được tạo index.
  Nhưng index để lại sẽ đổi kế hoạch thực thi của bài sau → đặt tên `bNN_` và `DROP INDEX` cuối bài,
  hoặc ghi rõ nếu cố ý để lại.
- `SET enable_seqscan = off` là cấp **phiên** → phải `RESET` ngay sau.
- CI có khẳng định số dòng 10 bảng thật + sự tồn tại các ràng buộc, nên làm lệch lược đồ sẽ đỏ ngay.

## 7. Dataset và các quyết định đã chốt

`dataset/02-chuan-hoa.sql` là **nguồn chân lý duy nhất** về tên bảng/cột.

**Số dòng thật:** giao_vien 8 · lop 6 · hoc_sinh 40 · phu_huynh 45 · mon_hoc 9 · phan_cong_day 64 ·
diem 480 · sach 20 · muon_sach 50 · diem_danh 200 · bang_bet 30 · hoc_sinh_lon 50.000 · diem_lon 500.000.

**Ba tình huống cài sẵn có chủ đích:**
- Lớp `L06` (`9A3`) có `ma_gvcn IS NULL` → dạy `LEFT JOIN` vs `INNER JOIN`
- Học sinh `HS040` (Đinh Thị Vân) không có phụ huynh → dạy `NOT EXISTS`, bẫy `NOT IN` + `NULL`
- ~1/4 dòng `muon_sach` có `ngay_tra_thuc_te IS NULL` → dạy logic ba giá trị

**Đặc điểm dữ liệu dễ làm bài sai:**
- 40 học sinh có **40 ngày sinh khác nhau hoàn toàn** → `SELF JOIN` "cùng ngày sinh" cho **0 dòng**
  (Bài 25 giữ nguyên và dạy luôn "truy vấn đúng, dữ liệu không có trường hợp nào", rồi nới thành
  cùng tháng sinh — 48 cặp)
- **Không có lượt mượn nào trả muộn** (`n % 13` tối đa 12 < hạn 14 ngày)
- Điểm trong `diem` sinh bằng `random()` seed cố định → **đừng ghi giá trị điểm cụ thể** trừ khi
  khẳng định được

### Ba quyết định thiết kế sai lệch so với plan gốc

1. **Thêm `UNIQUE` vào `lop.ma_gvcn`** (commit `c715cad`). Biểu đồ ER tuyên bố GVCN là 1:1 nhưng
   lược đồ thiếu `UNIQUE` nên chỉ ép được một chiều — hai sơ đồ của cùng một quan hệ mâu thuẫn nhau.
   Thêm `UNIQUE` cũng tạo ra **ví dụ 1:1 thật** mà Bài 14 cần để dạy "1:1 = khoá ngoại + UNIQUE".
   Lưu ý: `UNIQUE` coi các `NULL` là **khác nhau**, nên vẫn cho nhiều lớp chưa có GVCN.
2. **51 bài thay vì 50** — mục bảo mật/backup/monitoring cần một bài riêng (Bài 51).
3. **Bảng `diem` KHÔNG có lỗi thiết kế.** `(ma_hs, ma_mon, hoc_ky, loai_diem)` **không phải** khoá
   tự nhiên hợp lệ, vì một học sinh có nhiều điểm '15 phút' cùng môn cùng kỳ. Câu hỏi đúng là
   *"có tồn tại khoá tự nhiên hợp lệ không?"* — câu hỏi **nghiệp vụ**, không phải câu hỏi dữ liệu:
   `diem_danh` Có (`ma_hs, ngay`) · `phu_huynh` Không · `muon_sach` Không · `diem` Không.

### Quyết định mô hình hoá phải giữ nhất quán

- `diem_danh` = thực thể yếu **BUỔI ĐIỂM DANH** của HỌC SINH, khoá bộ phận `ngay`, cưỡng chế bằng
  `UNIQUE (ma_hs, ngay)`. Quan hệ HỌC SINH — BUỔI ĐIỂM DANH là **1:N**.
- `phu_huynh` là thực thể yếu nhưng `quan_he` **không phải** khoá bộ phận hợp lệ (HS029 có hai dòng
  cùng ghi 'Bố') → buộc dùng khoá nhân tạo `ma_ph`.
- `ma_ph` và `ma_dd` là **khoá nhân tạo mức bảng**, KHÔNG phải thuộc tính trong biểu đồ ER.
- Bảng `phu_huynh` **không** phải kết quả quy tắc tách thuộc tính đa trị; quy tắc đó sinh ra
  `hoc_sinh_sdt(ma_hs, so_dien_thoai)`.
- **Quy tắc vàng (Bài 12):** "cột này có phải khoá không / có phụ thuộc hàm này không" là câu hỏi
  **nghiệp vụ**. `count(DISTINCT ...)` chỉ **phát hiện vi phạm**, KHÔNG BAO GIỜ **chứng minh**.

## 8. Việc còn lại

### Đã xong (Task 7, Task 8a, và Bài 47 của Task 8b) — KHÔNG cần làm lại

Bài 33–46 xong qua đủ vòng implement + task reviewer, **Approved**, không Critical/Important
còn mở (chi tiết từng vòng xem `.superpowers/sdd/progress.md`, git-ignored, hoặc lịch sử commit
`main` từ `af787b7` tới `21382d2`). Bài 47 xong implement + CI xanh nhưng **CHƯA qua task
reviewer** (xem cảnh báo ở mục 0) — làm bước đó trước khi coi Cấp 5 phần 47 là xong hẳn.

Vài điểm đáng nhớ đã học được qua Task 7-8a, để không lặp lại lỗi thiết kế task:
- Bài lý thuyết thuần (không PostgreSQL cục bộ mô phỏng được, ví dụ CAP, 2 phiên song song) vẫn
  chấp nhận được nếu 5 lớp CI khác đều xanh — không bắt buộc mọi bài đều có SQL chạy thật.
- `stateDiagram-v2` đã được thêm vào danh sách Mermaid an toàn trong `huong-dan-chung.md` (mục 5
  bản gốc chỉ có 4 loại) — CI Mermaid đã xác nhận render được, không cần lo lại.
- Brief nên nhấn mạnh RÕ 1-2 bài nào trong mỗi lô 5 bài bắt buộc phải có SQL/EXPLAIN chạy thật
  làm trọng tâm — các bài còn lại thường tự nhiên có ít phần chạy được hơn ở Cấp 5.

### Việc còn lại thật sự: Task 8b phần 2 (Bài 48–51) + Task 9

**Task 8b còn 4 bài** trong `docs/cap-5-sieu-nang-cao/`: `48-data-warehouse-va-olap.md`,
`49-etl-elt-va-pipeline.md`, `50-vector-database.md`, `51-bao-mat-backup-monitoring.md`.
Brief đầy đủ cho cả 5 bài (42-51 gốc) nằm ở `plans/2026-09-24-khoa-hoc-database.md` mục
"Task 8", brief đã cắt riêng cho lô 47-51 nằm ở `.superpowers/sdd/task-8b-brief.md` (git-ignored,
còn nguyên trên máy đã chạy phiên 2026-09-25 — nếu máy khác thì dựng lại từ plan gốc + phần dưới
đây).

- **Việc cần làm ngay khi bắt đầu lại:** sửa dòng cuối Bài 47
  (`docs/cap-5-sieu-nang-cao/47-nosql-bon-ho.md`) từ `➡️ **Bài 48** *(sắp có)*` thành link thật
  trỏ `48-data-warehouse-va-olap.md` — implementer Bài 47 cố ý để vậy vì lúc đó Bài 48 chưa tồn
  tại.
- Bài 48 (star schema) và Bài 49 (idempotent pipeline) BẮT BUỘC có SQL chạy thật trên CI — đây là
  2 điểm thực hành rõ ràng nhất của lô.
- Bài 50 cần `pgvector` — **không** có trong `postgres:16` (đã xác nhận qua Bài 47: máy làm việc
  không có pgvector). Đánh dấu không chạy và ghi rõ cần image `pgvector/pgvector:pg16`, KHÔNG tự
  sửa `.github/workflows/` để đổi image CI — nếu thấy cần, ghi vào báo cáo để người dùng quyết.
- Bài 51 (RLS, `CREATE POLICY`, `pg_stat_statements`) — `pg_stat_statements` cần
  `shared_preload_libraries`, gần như chắc chắn phải đánh dấu không chạy. **Lưu ý mới phát hiện ở
  Bài 47:** CI chạy bằng superuser, mà superuser **bỏ qua RLS** theo mặc định — muốn chứng minh
  RLS chạy thật (không chỉ khai báo suông) phải `CREATE ROLE` một role thường rồi `SET ROLE` sang
  role đó trước khi `SELECT`, nếu không policy sẽ không bao giờ được áp dụng trong CI mà vẫn xanh
  giả.
- Bài 51 là bài CUỐI khóa — viết đoạn "học tiếp gì" nối vào `docs/index.md` (file này **chưa có**
  mục đó, implementer Bài 51 phải tạo mới, không phải sửa mục sẵn có) và cập nhật `docs/index.md`
  lên trạng thái 51/51 bài.
- `docs/cap-1-mo-hinh-er/... Bài 4` (đầu khoá) hứa "Bài 47 dạy định lý CAP, nhất quán cuối cùng"
  nhưng hai chủ đề đó thật ra nằm ở Bài 44 — Bài 47 chỉ trỏ về đó. Đây là lỗi ở bài cũ, ngoài phạm
  vi Task 8b, ghi vào danh sách hoãn (mục 9) hoặc để Task 9 xử lý, ĐỪNG tự sửa giữa chừng Task 8b.

### Task 9 — Rà soát tổng cuối khoá

- Hoàn thiện `docs/glossary.md` cho Cấp 4–5 (mỗi implementer đã tự bổ sung phần mình, nhưng cần rà lại)
- Cập nhật `docs/index.md`: lộ trình đầy đủ 51 bài
- Viết `README.md` cho repo (hiện **chưa có**)
- Cập nhật `specs/...design.md`: sửa "50 bài" → 51 bài, ghi lý do, tick tiêu chí hoàn thành
- Cập nhật `plans/...khoa-hoc-database.md`: ghi sai lệch `UNIQUE` trên `lop.ma_gvcn`
- Xử lý danh sách hoãn ở mục 9

## 9. Danh sách hoãn — Task 9 xử lý

| Chỗ | Vấn đề |
|---|---|
| `docs/cap-0-nhap-mon/02-tu-so-giay-den-excel.md:310, :378` | Lặp thừa `(*foreign key*)` |
| `docs/cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md` ~95-101 | Còn dùng "lập trình hướng đối tượng"/"class"/"kế thừa"/"phương thức" chưa giải thích |
| Bài 11 vs Bài 14 | Diễn đạt "mức logic" khác nhau ("chưa chọn DBMS" vs "chưa nói tới lưu trữ vật lý") — cả hai đúng, góc nhìn khác |
| `docs/glossary.md` mục N | `not distinct` chèn trước `NoSQL` — lệch thứ tự alphabet một bậc |
| 20 thuật ngữ | Chỉ tồn tại ở bảng cuối bài, không viết đúng quy ước trong thân bài (cả Bài 11 không đóng góp cụm nào) → ngoài tầm script |
| `scripts/trich_sql.py` | Bọc ngoài không có `ORDER BY` tường minh → 3 khẳng định dựa vào `ORDER BY` trong truy vấn con là rủi ro lý thuyết (PostgreSQL thực tế giữ thứ tự, cả 3 cột đều ASCII, CI đã xác nhận đúng) |
| `docs/cap-0-nhap-mon/.../04-...md` (Bài 4) | Hứa "Bài 47 dạy định lý CAP, nhất quán cuối cùng" nhưng hai chủ đề đó thật ra ở Bài 44; Bài 47 chỉ trỏ về đó — phát hiện khi viết Bài 47 (2026-09-25) |
| `docs/glossary.md` | Thuật ngữ *eventual consistency*/*read-your-writes* của Bài 42-46 dịch là "nhất quán cuối cùng"/"đọc được điều mình vừa ghi", lệch chữ trong plan gốc ("nhất quán cuối"/"đọc-ghi-của-mình") — dùng NHẤT QUÁN trong cả 5 bài + glossary, task reviewer đã chấp nhận là judgment call hợp lý, không bắt buộc sửa nhưng Task 9 có thể chuẩn hoá lại nếu muốn khớp chữ plan |

## 10. Nhật ký các lỗi lớn đã bắt được

Giữ lại vì chúng cho thấy **loại** lỗi cần soi, không chỉ lỗi cụ thể.

| Cấp | Lỗi | Vì sao đáng nhớ |
|---|---|---|
| 0 | Bài 3 dùng `relpages` để minh hoạ "dữ liệu chiếm bao nhiêu trang" | `relpages` là ước lượng cho bộ tối ưu, trả về `0` ngay sau khi nạp dữ liệu → luận điểm sụp trước mắt người học |
| 1 | Bài 7 đánh đồng **thuộc tính đa trị** với **thực thể yếu** | Nói bảng `phu_huynh` sinh ra vì số điện thoại là đa trị; áp thuật toán Bài 14 sẽ ra `hoc_sinh_sdt`, không phải `phu_huynh` |
| 1 | Bài 9 đưa ra **hai phép thử thực thể yếu trái ngược nhau** | Nguyên nhân: chưa tách mức ý niệm (ER) khỏi mức bảng |
| 1 | Sơ đồ ER trang dataset dùng `PK_FK` không hợp lệ | Đang hiện lỗi trên web; CI Mermaid bắt được ngay lần chạy đầu |
| 2 | Bài 12 dạy sai rằng `diem` thiếu `UNIQUE` là "lỗi thiết kế", và **khuyên người học chạy `ALTER TABLE ADD UNIQUE`** | Câu lệnh đó sẽ *chạy thành công* trên seed data rồi phá lược đồ vĩnh viễn |
| 2 | Vòng sửa làm lệch thụt lề → `</details>` đóng sớm → **đáp án Bài 16 lộ ra ngoài vùng gập** | `mkdocs build --strict` xanh hoàn toàn |
| 2 | Bài 17 ghi "hai dòng" trong khi truy vấn trả **5 dòng** | Lộ ra rằng CI chỉ kiểm SQL chạy được, không kiểm kết quả → sinh ra cơ chế `KỲ VỌNG` |
| 3 | Bảng tra ghi `TIMESTAMPTZ` "có múi giờ" | Ngộ nhận kinh điển; thân bài nói đúng nên hai chỗ mâu thuẫn, và 3/4 lần nhắc nghiêng về phía sai |
| 3 | Danh sách Markdown cố ý nhảy `5.`→`7.` bị đánh số lại → `ORDER BY` hiện ra là bước 6 | Không công cụ nào bắt được; reviewer phải mở HTML đã build |
| 3 | `LATERAL` dùng 8 lần, **chưa bao giờ được định nghĩa** ở bất kỳ đâu | Công cụ đo thuật ngữ không thấy vì nó chỉ đếm thứ đã được khai |
| 3 | `COPY` được nói là bỏ qua trigger | Sai — đó là `BULK INSERT` của SQL Server; sai này đỡ cho 2 lập luận |
| 3 | `unaccent` được nói cần superuser | Sai từ PG13 (trusted extension), và chính lời sai đó là căn cứ bỏ chạy phần quan trọng nhất cho người học VN |
| 3 | Ví dụ "bẫy so chuỗi" dùng 4 số cùng 3 chữ số | **Ví dụ không kích hoạt được bẫy nó định chỉ ra** |
| 3 | Báo cáo khai có một khối `COMMIT` mà khối đó **chưa bao giờ tồn tại** | Báo cáo mô tả theo ý định, không theo file |
| 4 | Bài 35 sơ đồ Mermaid dùng sai thực thể HTML (`#lt;`/`#gt;`/`#amp;` thay vì `&lt;`/`&gt;`/`&amp;`) | Không phá cú pháp Mermaid nên CI vẫn xanh, nhưng ký hiệu `<`/`>`/`&` hiện literal trên trang web — chỉ bắt được bằng đọc mắt |
| 4 | Bài 37 "Lỗi 2": mạch văn nói "chuyển 35 điểm" nhưng câu `UPDATE` trừ 30 | CI vẫn xanh vì `WHERE` chặn cả hai trường hợp giống nhau (0 dòng), nên `KỲ VỌNG` không phát hiện được số liệu nội bộ vô lý — bài học: KỲ VỌNG kiểm được kết quả câu lệnh, không kiểm được tính nhất quán của lập luận xung quanh nó |
| — | Bài 20 (Cấp 2, viết trước Cấp 4) tham chiếu "Bài 38 sẽ nói về khoá" | Khoá thật ra ở Bài 41 — lỗi tham chiếu chéo giữa các cấp chỉ lộ ra khi cấp sau đã viết xong, khó tránh hoàn toàn khi viết tuần tự |

## 11. Thống kê hiện tại (sau khi xong Bài 47, chưa làm Bài 48-51)

```
47 bài học · ~498 dòng thuật ngữ (docs/glossary.md) · ~1432 khẳng định KỲ VỌNG · 101 sơ đồ Mermaid
4 workflow CI, tất cả xanh trên main — commit mới nhất đã xác minh: 0e81430
```

Số liệu đếm bằng `grep -c` trực tiếp trên `docs/` lúc cập nhật tài liệu này (2026-09-25) — có thể
chênh vài đơn vị so với đếm bằng công cụ đo chính thức của Task 9 (mục 8), không dùng số này làm
căn cứ pháp lý cho "CÒN THIẾU: 0" của glossary, phải tự chạy `scripts/trich_thuat_ngu.py --thieu`.
