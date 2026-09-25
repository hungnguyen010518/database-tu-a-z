# Hướng dẫn cho implementer viết bài học

> **Bản sao được commit vào repo.** Bản gốc nằm ở
> `.superpowers/sdd/2026-09-24-khoa-hoc-database/huong-dan-chung.md` (git-ignored).
> Nếu sửa một bên, đồng bộ bên kia.
>
> Đọc `plans/TIEN-TRINH.md` trước file này để nắm tình hình tổng thể.

---

# Hướng dẫn chung — bắt buộc đọc trước khi viết bất kỳ bài học nào

Bạn đang viết nội dung cho khóa học **"Database từ A-Z"** — một khóa học cơ sở dữ liệu
tiếng Việt, website MkDocs Material, đã live tại
https://hungnguyen010518.github.io/database-tu-a-z/

Thư mục làm việc: `/home/hungnm/database-tu-a-z`

---

## 1. NGUYÊN TẮC SƯ PHẠM CỐT LÕI (quan trọng nhất)

> **Hiểu trước, gọi tên sau.**

Khóa học có MỘT ràng buộc chi phối mọi thứ:

**Mọi khái niệm phải được giải thích sao cho học sinh cấp 2 hiểu được,
nhưng KHÔNG được lược bỏ thuật ngữ chuyên ngành.**

Cách giải quyết mâu thuẫn này: hai việc đó nằm ở hai khối khác nhau.
- Khối 🧠 **Câu chuyện mở đầu** chịu trách nhiệm *dễ hiểu* — một tình huống
  ở trường/nhà mà học sinh cấp 2 đã trải qua, dẫn tới một câu hỏi.
- Khối 📖 **Khái niệm & thuật ngữ** chịu trách nhiệm *chính xác* — định nghĩa
  đúng chuẩn học thuật, đầy đủ thuật ngữ.

Nhờ tách đôi như vậy, bạn KHÔNG phải đánh đổi giữa dễ hiểu và chính xác.

**Quy tắc viết bắt buộc:**
- Câu ngắn. Tránh câu ghép nhiều tầng.
- KHÔNG dùng một thuật ngữ trước khi đã giải thích nó.
- Mỗi thuật ngữ lần đầu xuất hiện: **in đậm tiếng Việt** kèm (*tiếng Anh nghiêng*).
  Ví dụ: **khoá ngoại** (*foreign key*).
  Định dạng này được script quét để dựng bảng thuật ngữ — phải viết đúng dạng.
- Khi một bài dùng lại khái niệm của bài trước, link tới bài đó.
- Khi một khái niệm sẽ được đào sâu ở bài sau, nói rõ "Bài N sẽ..." — người học
  yên tâm là mình không bỏ sót.
- Ví dụ phải dùng bối cảnh trường học Việt Nam (học sinh, lớp, điểm, thư viện),
  KHÔNG dùng ví dụ `employees`/`orders`/`customers` kiểu sách tiếng Anh.

**Quy tắc rút ra từ Cấp 1 — bảng thuật ngữ cuối bài rất dễ lệch:**
Bảng thuật ngữ ở khối 📖 nằm cách đoạn văn xuôi định nghĩa thuật ngữ đó hàng chục dòng.
Ở Cấp 1 đã có 5 dòng bảng mâu thuẫn với thân bài, trong đó 2 dòng SAI NỘI DUNG THẬT
(một dòng bỏ mất vế `NULL` của toàn vẹn tham chiếu; một dòng nói ràng buộc hoãn
"chỉ kiểm tra lúc COMMIT" trong khi điều đó chỉ đúng với `INITIALLY DEFERRED`).

=> **Mỗi lần bạn viết hoặc sửa một định nghĩa trong thân bài, hãy grep ngay thuật ngữ đó
trong bảng thuật ngữ cuối bài và đối chiếu.** Hai chỗ phải nói cùng một điều.

---

## 2. KHUÔN MẪU 8 KHỐI — mọi bài phải có ĐỦ, ĐÚNG THỨ TỰ

Đọc file `docs/cap-0-nhap-mon/01-du-lieu-va-thong-tin.md` — đó là **bài mẫu tham chiếu**.
Bắt chước đúng cấu trúc và giọng văn của nó.

````markdown
# Bài NN — [Tên bài]

!!! abstract "🎯 Học xong bài này, bạn sẽ"
    - [năng lực 1]
    - [năng lực 2]
    - [năng lực 3]

## 🧠 Câu chuyện mở đầu

[100–200 từ. Tình huống đời thường. Kết bằng một câu hỏi dẫn dắt.]

## 📖 Khái niệm & thuật ngữ

[Định nghĩa chính xác, nối lại với câu chuyện.]

| Tiếng Việt | English | Nghĩa dễ hiểu |
|---|---|---|
| ... | ... | ... |

## 🖼️ Sơ đồ

```mermaid
[sơ đồ]
```

## 💻 Thực hành

```sql
[SQL chạy được trên database truong_hoc]
```

## ⚠️ Lỗi thường gặp

!!! warning "Lỗi 1: [tên lỗi]"
    [Vì sao sai, cách sửa.]

## ✍️ Bài tập

1. ...

??? success "Đáp án"
    1. ...

## 🔑 Tóm tắt

1. ...  (đúng 5 dòng đánh số)

---
⬅️ [Bài NN-1 — tên](../thu-muc/file.md) · ➡️ [Bài NN+1 — tên](../thu-muc/file.md)
````

**Script kiểm tra tự động đếm chính xác 7 heading `## ` có emoji
(🧠 📖 🖼️ 💻 ⚠️ ✍️ 🔑) cộng một dòng chứa `🎯 Học xong bài này`.**
Thiếu một khối là task FAIL. Không được đổi emoji, không được đổi thứ tự.

Mỗi bài cũng PHẢI có đúng chuỗi `??? success "Đáp án"` (dùng cho bài tập).

---

## 3. DATABASE MẪU — nguồn chân lý duy nhất

Mọi câu SQL phải dùng đúng tên bảng/cột dưới đây. **KHÔNG được bịa tên mới.**
Đọc `dataset/02-chuan-hoa.sql` để xem đầy đủ kiểu dữ liệu và ràng buộc.
Đọc `docs/dataset.md` để xem sơ đồ ER và bảng tra cứu.

```
giao_vien(ma_gv PK CHAR(4), ho_ten, ngay_sinh, gioi_tinh, mon_chuyen_mon, email UNIQUE, luong NUMERIC)
lop(ma_lop PK CHAR(3), ten_lop UNIQUE, khoi, nam_hoc, ma_gvcn FK->giao_vien NULL được)
hoc_sinh(ma_hs PK CHAR(5), ho_ten, ngay_sinh, gioi_tinh, dia_chi, ma_lop FK->lop NOT NULL)
phu_huynh(ma_ph PK CHAR(5), ho_ten, so_dien_thoai, quan_he, ma_hs FK->hoc_sinh ON DELETE CASCADE)
mon_hoc(ma_mon PK CHAR(4), ten_mon UNIQUE, so_tiet_tuan)
phan_cong_day(ma_gv, ma_mon, ma_lop, hoc_ky — PK phức hợp 4 cột)
diem(ma_diem SERIAL PK, ma_hs FK, ma_mon FK, hoc_ky, loai_diem, diem_so NUMERIC(4,2), ngay_nhap)
sach(ma_sach PK CHAR(4), ten_sach, tac_gia, nam_xuat_ban, so_luong)
muon_sach(ma_muon SERIAL PK, ma_hs FK, ma_sach FK, ngay_muon, ngay_tra_du_kien, ngay_tra_thuc_te NULL=chưa trả)
diem_danh(ma_dd SERIAL PK, ma_hs FK, ngay, trang_thai, ly_do — UNIQUE(ma_hs, ngay))
```

Bảng dữ liệu lớn (chỉ có sau khi nạp `03-du-lieu-lon.sql`):
```
hoc_sinh_lon(ma_hs INTEGER PK, ho_ten, ngay_sinh, gioi_tinh, ma_lop)   -- 50.000 dòng
diem_lon(ma_diem BIGSERIAL PK, ma_hs, ma_mon, hoc_ky, loai_diem, diem_so, ngay_nhap)  -- 500.000 dòng
```

**Số dòng thực tế (đã xác minh trên PostgreSQL 16, dùng con số này khi viết kết quả mong đợi):**
giao_vien 8 · lop 6 · hoc_sinh 40 · phu_huynh 45 · mon_hoc 9 · phan_cong_day 64 ·
diem 480 · sach 20 · muon_sach 50 · diem_danh 200 · hoc_sinh_lon 50.000 · diem_lon 500.000

**Ba chi tiết cài sẵn có chủ đích — hãy tận dụng khi dạy:**
1. Lớp `L06` (`9A3`) có `ma_gvcn IS NULL` → dạy LEFT JOIN vs INNER JOIN.
2. Học sinh `HS040` (Đinh Thị Vân) không có phụ huynh nào → dạy NOT EXISTS, NOT IN + NULL.
3. Khoảng 1/4 dòng `muon_sach` có `ngay_tra_thuc_te IS NULL` → dạy logic ba giá trị.

---

## 4. KIỂM THỬ SQL — cách nó hoạt động (ĐỌC KỸ)

Máy này **không dùng được Docker** và **không cài psql**. Bạn KHÔNG chạy SQL cục bộ được.

Thay vào đó, GitHub Actions làm việc đó: `.github/workflows/kiem-tra-sql.yml`
dựng PostgreSQL 16, nạp dataset, rồi chạy `scripts/trich_sql.py` để trích
**mọi khối ```sql``` trong `docs/`** và chạy tuần tự. Một câu sai → CI đỏ.

**Hệ quả bạn phải tuân thủ:**

- Mọi khối ```sql``` bạn viết SẼ ĐƯỢC CHẠY THẬT. Viết cẩn thận.
- Các khối chạy **tuần tự theo thứ tự alphabet của đường dẫn file**, trên cùng
  một database. Nếu bài của bạn `CREATE TABLE` gì đó, hãy `DROP TABLE IF EXISTS`
  trước, và nên dọn sau nếu bảng đó có thể gây nhiễu bài khác.
- Khối SQL KHÔNG nên chạy phải được đánh dấu bằng HTML comment đặt **ngay dòng
  trên** dấu ```` ```sql ````, cách tối đa 2 dòng trống:

  ```
  <!-- sql:khong-chay -->
  ```sql
  ...mã minh hoạ hoặc mã giả...
  ```
  ```

  Dùng `<!-- sql:khong-chay -->` cho: mã giả, lệnh cần quyền superuser,
  lệnh cần extension chưa cài, lệnh của DBMS khác, đoạn code ứng dụng.
  Dùng `<!-- sql:co-y-loi -->` cho: câu lệnh CỐ Ý sai để dạy thông báo lỗi.

  HTML comment này KHÔNG hiện trên website — người học không thấy.
- **KHẲNG ĐỊNH SỐ DÒNG — bắt buộc dùng mỗi khi bài tuyên bố một con số.**
  CI xác nhận câu SQL *chạy được*, nhưng trước đây không xác nhận nó trả về đúng cái bài nói.
  Ở Cấp 2 đã có một bài ghi "hai dòng" trong khi thực tế là 5 dòng — không có gì bắt được.
  Nay có cơ chế: đặt một dòng comment SQL ngay trên câu `SELECT` **cuối cùng** của khối:

  ```sql
  -- KỲ VỌNG: 5 dòng
  SELECT ho_ten_hs FROM bang_bet WHERE ... ORDER BY ho_ten_hs;
  ```

  CI sẽ đỏ nếu số dòng thật khác con số khai báo. Comment này hiển thị trên website và
  đó là điều tốt — người học biết mình phải thấy gì.

  **Với truy vấn tổng hợp chỉ trả về một dòng, "1 dòng" không kiểm được gì.** Khi đó hãy
  khẳng định GIÁ TRỊ của cột, mỗi cột một dòng:

  ```sql
  -- KỲ VỌNG: so_dong = 90
  SELECT count(*) AS so_dong FROM b17_bet_1nf;
  ```

  Giá trị so sánh dạng text với dòng ĐẦU TIÊN của kết quả; dùng `NULL` để khẳng định ô rỗng.
  Hai kiểu kết hợp được (khai số dòng rồi khai giá trị từng cột).
  Ràng buộc: các đánh dấu phải nằm ngay trên MỘT câu `SELECT` duy nhất kết thúc khối.
  **Quy tắc quan trọng nhất về khẳng định — rút ra từ Bài 32:**
  Một khẳng định `KỲ VỌNG` chỉ chứng minh *câu lệnh trả về đúng con số bài nói*.
  Nó **KHÔNG** chứng minh *con số đó minh hoạ được điều bài đang dạy*.

  Với mọi ví dụ dạng **"cách A cho X, cách B cho Y, Y sai"**, phải kiểm thêm một điều kiện:
  **X ≠ Y trên chính dữ liệu mẫu.** Bài 32 từng dựng ví dụ chỉ ra bẫy "so chuỗi thay vì so số"
  với bốn chiều cao 152/148/155/145 — nhưng vì mọi số cùng ba chữ số, thứ tự chuỗi trùng thứ tự
  số nên **cả hai cách cho cùng kết quả**. Ví dụ minh hoạ một cái bẫy mà không kích hoạt được
  cái bẫy đó thì tệ hơn là không có ví dụ, vì người học kết luận rằng bẫy đó không có thật.

  Phép rà cơ học đề nghị chạy trước khi push: liệt kê mọi khối có **≥2 khẳng định giá trị mà có
  ít nhất hai giá trị trùng nhau**, rồi soát tay từng khối — trùng giá trị thì hoặc là có chủ đích
  (và thân bài phải nói rõ), hoặc là ví dụ đã mất tác dụng.

  **Quy tắc rút ra từ Cấp 3 — đừng lẫn "số dòng" với "giá trị":**
  nếu câu `SELECT` cuối khối bắt đầu bằng `count(` / `sum(` / `avg(` / `min(` / `max(` và
  **không** có `GROUP BY`, thì nó trả về đúng MỘT dòng — khẳng định số dòng chỉ được là
  `1 dòng`, mọi con số khác phải viết dạng `cot = giá_trị`. Đã có hai bài mắc lỗi này vì
  con số trong văn bài và con số kết quả trùng nhau về ý nghĩa nhưng khác vai trò.
  Công cụ nay tự cảnh báo khi thấy hình dạng đó.

  Khẳng định giá trị đọc **dòng đầu tiên** của kết quả, nên chỉ dùng nó khi truy vấn trả về
  đúng một dòng, hoặc khi thứ tự do `ORDER BY` trên cột **không dấu** quyết định. Tránh khẳng
  định giá trị trên truy vấn `ORDER BY` theo cột tiếng Việt có dấu — thứ tự phụ thuộc collation.
  **Hãy dùng chúng cho mọi truy vấn mà bài có tuyên bố số dòng HOẶC tuyên bố một con số cụ thể.**

- Khi bài dạy một thông báo lỗi cụ thể của PostgreSQL, hãy ghi thông báo đó
  đúng nguyên văn PostgreSQL 16 trả về. Nếu không chắc chắn nguyên văn,
  hãy diễn đạt là "PostgreSQL sẽ báo lỗi vi phạm ràng buộc ..." thay vì
  bịa ra một chuỗi lỗi sai.

---

## 5. SƠ ĐỒ MERMAID

- Dùng code fence ```mermaid```. KHÔNG dùng file ảnh.
- Mermaid 11 được nạp tự động. `erDiagram`, `flowchart`, `sequenceDiagram`,
  `stateDiagram-v2`, `classDiagram`, `gantt` đều dùng được.
- Nhãn có dấu tiếng Việt: đặt trong ngoặc kép, ví dụ `A["Học sinh"]`.
- Trong `flowchart`, thẻ HTML `<b>` và `<br/>` dùng được trong nhãn.
- **Tránh** ký tự `(` `)` `,` `:` trần trong nhãn không có ngoặc kép — gây lỗi cú pháp.
- Trong `erDiagram`, nhãn quan hệ phải nằm trong ngoặc kép: `a ||--o{ b : "mô tả"`.
- Mỗi bài phải có ít nhất 1 sơ đồ.

---

## 6. QUY TRÌNH LÀM VIỆC

1. Đọc `docs/cap-0-nhap-mon/01-du-lieu-va-thong-tin.md` để nắm giọng văn.
2. Viết các file `.md` theo đúng tên file mà brief chỉ định. KHÔNG tự đổi tên.
3. Thêm từng bài vào `nav:` trong `mkdocs.yml`, đúng thứ tự số bài,
   dưới đúng section của cấp độ. Nhãn nav dạng:
   `- "Bài 7 — Thực thể và các loại thuộc tính": cap-1-mo-hinh-er/07-thuc-the-va-thuoc-tinh.md`
4. Sửa dòng điều hướng cuối bài của bài LIỀN TRƯỚC nếu nó đang ghi "(sắp có)".
5. Build kiểm tra — bắt buộc phải sạch, KHÔNG được có dòng WARNING:
   ```bash
   cd /home/hungnm/database-tu-a-z
   PATH="$HOME/.local/bin:$PATH" mkdocs build --strict
   ```
6. **Kiểm tra cấu trúc — thay cho vòng lặp thủ công cũ:**
   ```bash
   python3 scripts/kiem_cau_truc.py
   ```
   Phải in `Số lỗi: 0`. Script này kiểm bốn thứ mà `mkdocs build --strict` KHÔNG bắt được:
   thụt lề khối code (lỗi này làm hộp `!!! note` / `??? success` đóng sớm và **đáp án lộ ra
   ngoài vùng gập** — đã xảy ra thật ở Cấp 2 mà build vẫn xanh), đủ 7 heading emoji + mục tiêu,
   đúng một khối `??? success "Đáp án"`, và khối 🔑 đúng 5 dòng đánh số.

   **Quy tắc thụt lề:** khi khối ```` ``` ```` nằm trong một hộp hoặc một mục danh sách,
   cả dòng mở, mọi dòng nội dung, lẫn dòng đóng đều phải thụt lề GIỐNG NHAU.
   Rất dễ sai khi chèn thêm dòng comment vào đầu khối.

6b. (Tham khảo) Vòng lặp thủ công cũ, nay đã được `kiem_cau_truc.py` bao trùm:
   ```bash
   for f in docs/cap-X-.../*.md; do
     n=$(grep -cE '^## (🧠|📖|🖼️|💻|⚠️|✍️|🔑)' "$f")
     h=$(grep -c '🎯 Học xong bài này' "$f")
     d=$(grep -c '??? success "Đáp án"' "$f")
     [ "$n" -eq 7 ] && [ "$h" -ge 1 ] && [ "$d" -ge 1 ] || echo "THIẾU: $f (khối=$n/7 mục tiêu=$h đáp án=$d)"
   done
   ```
   Không được in ra dòng THIẾU nào.
7. **Bổ sung thuật ngữ của bạn vào `docs/glossary.md`** (bắt buộc từ Cấp 3 trở đi).
   Đo xem bạn còn nợ bao nhiêu và lấy sẵn dòng bảng để dán:
   ```bash
   python3 scripts/trich_thuat_ngu.py           # tóm tắt: tổng / đã có / còn thiếu
   python3 scripts/trich_thuat_ngu.py --thieu   # danh sách thuật ngữ còn thiếu
   python3 scripts/trich_thuat_ngu.py --bang    # in sẵn dòng bảng Markdown
   ```
   `docs/glossary.md` chia theo chữ cái đầu của **thuật ngữ tiếng Anh** (`## A`, `## B`, …),
   mỗi dòng 4 cột: `Tiếng Việt | English | Nghĩa trong một câu | Học ở bài`.
   Cột "Nghĩa trong một câu" phải tự viết, KHÔNG để trống — và phải khớp định nghĩa trong thân bài.
   Cột "Học ở bài" là link tới bài giới thiệu thuật ngữ đó lần đầu.
   Sau khi thêm, chạy lại script: số "CÒN THIẾU" phải giảm đúng bằng số thuật ngữ bài bạn giới thiệu.

8. Kiểm tra script trích SQL không lỗi:
   ```bash
   python3 scripts/trich_sql.py > /dev/null
   ```
9. Commit và push. **Push phải thêm PATH này, nếu không sẽ lỗi
   `git: 'remote-https' is not a git command`:**
   ```bash
   git add -A
   git commit -m "<thông điệp tiếng Việt>

   Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>"
   PATH="/usr/lib/git-core:$PATH" git push
   ```
10. Báo cáo. KHÔNG cần chờ CI — controller sẽ kiểm tra CI và gửi lỗi về cho bạn sửa.

---

## 6c. ĐỪNG TIN CÔNG CỤ Ở CHỖ NÓ KHÔNG NHÌN ĐƯỢC

Hai lần ở Cấp 3, báo cáo khai sai vì cùng một lý do: tin một công cụ ở chỗ công cụ đó
không có khả năng nhìn.

- `trich_thuat_ngu.py --thieu` chỉ hiện thuật ngữ **thiếu trong glossary**. Một thuật ngữ
  đã có trong glossary nhưng **viết đảo chiều trong thân bài** (`**English** (*tiếng Việt*)`)
  thì nó im lặng hoàn toàn. Kết quả: 7 chỗ đảo chiều, báo cáo chỉ khai 2.
- Cũng vậy, một thuật ngữ **chưa bao giờ được gloss** (ví dụ `LATERAL` dùng 8 lần mà không
  một lần có `(*lateral join*)`) thì nằm ngoài tầm mọi công cụ đo — thước đo chỉ đếm được
  thứ người ta đã khai.
- Và một khối SQL **dự định viết mà chưa viết** thì chỉ `grep` mới biết. Báo cáo từng khai
  "có một khối `khong-chay` chứng minh `COMMIT` trong procedure" trong khi khối đó chưa bao
  giờ tồn tại — một lệnh `grep COMMIT` là đủ phát hiện.

**Quy tắc:** trước khi viết vào báo cáo rằng một lớp vấn đề đã sạch, hãy tự hỏi *"công cụ tôi
vừa chạy có thật sự nhìn được lớp này không?"* Nếu không chắc, `grep` trực tiếp. Và đừng bao giờ
mô tả báo cáo theo **ý định** — chỉ mô tả theo thứ đang có trong file.

## 7. NHỮNG ĐIỀU TUYỆT ĐỐI KHÔNG LÀM

- KHÔNG sửa `docs/cap-0-nhap-mon/01-du-lieu-va-thong-tin.md` (bài mẫu), trừ dòng
  điều hướng cuối bài.
- KHÔNG sửa `dataset/*.sql` — lược đồ đã chốt và đã được CI xác minh.
- KHÔNG sửa `.github/workflows/`, `scripts/trich_sql.py`, `specs/`, `plans/`.
- KHÔNG đổi cấu hình theme trong `mkdocs.yml` — chỉ được thêm dòng vào `nav:`.
- KHÔNG bịa số liệu. Nếu viết "kết quả mong đợi" cho một truy vấn, con số phải
  suy ra được từ dữ liệu mẫu. Nếu không chắc, hãy mô tả định tính
  ("khoảng 40 dòng, mỗi học sinh một dòng") thay vì bịa bảng kết quả chính xác.
- KHÔNG viết bài chỉ có phần vỏ. Mỗi bài phải là nội dung dạy học thật,
  ước lượng 200–400 dòng Markdown.
