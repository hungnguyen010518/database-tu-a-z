# Dataset `truong_hoc`

Database mẫu dùng xuyên suốt khóa học [Database từ A-Z](https://hungnguyen010518.github.io/database-tu-a-z/).

Giải thích chi tiết từng bảng và sơ đồ ER: xem trang [Database mẫu](https://hungnguyen010518.github.io/database-tu-a-z/dataset/).

## Ba file

| File | Nạp khi nào | Nội dung |
|---|---|---|
| `02-chuan-hoa.sql` | **Nạp file này trước tiên** | Lược đồ 10 bảng đã chuẩn hoá + dữ liệu mẫu (~900 dòng) |
| `01-chua-chuan-hoa.sql` | Khi học Cấp 2 | Một bảng bẹt cố ý thiết kế tồi, để thực hành chuẩn hoá |
| `03-du-lieu-lon.sql` | Khi học Cấp 4 | Sinh 500.000 dòng điểm để thực hành index và EXPLAIN (~60 MB, chạy 30–60 giây) |

## Cách nạp — dùng Docker (khuyến nghị)

Không cần cài PostgreSQL vào máy, và xoá đi cũng sạch sẽ.

```bash
# 1. Dựng một PostgreSQL 16
docker run -d --name pg-khoahoc \
  -e POSTGRES_PASSWORD=hoc \
  -e POSTGRES_DB=truong_hoc \
  -p 5432:5432 \
  postgres:16

# 2. Chờ vài giây cho nó khởi động
sleep 10

# 3. Nạp dữ liệu
docker exec -i pg-khoahoc psql -U postgres -d truong_hoc -v ON_ERROR_STOP=1 < 02-chuan-hoa.sql
docker exec -i pg-khoahoc psql -U postgres -d truong_hoc -v ON_ERROR_STOP=1 < 01-chua-chuan-hoa.sql

# 4. Vào nghịch thử
docker exec -it pg-khoahoc psql -U postgres -d truong_hoc
```

Xoá sạch khi học xong: `docker rm -f pg-khoahoc`

## Cách nạp — đã cài PostgreSQL sẵn

```bash
createdb truong_hoc
psql -d truong_hoc -v ON_ERROR_STOP=1 -f 02-chuan-hoa.sql
psql -d truong_hoc -v ON_ERROR_STOP=1 -f 01-chua-chuan-hoa.sql
```

## Kiểm tra đã nạp đúng chưa

```sql
SELECT count(*) FROM hoc_sinh;   -- kỳ vọng: 40
SELECT count(*) FROM diem;       -- kỳ vọng: 480
SELECT count(*) FROM lop WHERE ma_gvcn IS NULL;  -- kỳ vọng: 1
```
