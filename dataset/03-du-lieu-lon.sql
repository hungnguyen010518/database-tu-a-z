-- =====================================================================
--  DỮ LIỆU LỚN — dùng cho Cấp 4 (Bài 33–41) và Cấp 5 (Bài 43)
--
--  Vì sao cần file này: với 480 dòng điểm, PostgreSQL quét toàn bảng
--  nhanh hơn dùng index, nên bạn sẽ KHÔNG thấy được tác dụng của index.
--  Phải có dữ liệu đủ lớn thì EXPLAIN mới cho ra kế hoạch khác nhau.
--
--  ⏱️  Thời gian chạy: khoảng 30–60 giây. Dung lượng thêm: ~60 MB.
--
--  Cách nạp:  psql -U postgres -d truong_hoc -f 03-du-lieu-lon.sql
--  Yêu cầu: đã nạp 02-chuan-hoa.sql trước đó.
-- =====================================================================

DROP TABLE IF EXISTS diem_lon CASCADE;
DROP TABLE IF EXISTS hoc_sinh_lon CASCADE;

-- 50.000 học sinh (tưởng tượng đây là dữ liệu của cả một sở giáo dục)
CREATE TABLE hoc_sinh_lon (
    ma_hs     INTEGER      PRIMARY KEY,
    ho_ten    VARCHAR(60)  NOT NULL,
    ngay_sinh DATE         NOT NULL,
    gioi_tinh VARCHAR(3)   NOT NULL,
    ma_lop    SMALLINT     NOT NULL
);

INSERT INTO hoc_sinh_lon (ma_hs, ho_ten, ngay_sinh, gioi_tinh, ma_lop)
SELECT
    n,
    'Học sinh số ' || n,
    DATE '2010-01-01' + (n % 1095),
    CASE WHEN n % 2 = 0 THEN 'Nam' ELSE 'Nữ' END,
    (n % 500) + 1
FROM generate_series(1, 50000) AS n;

-- 500.000 dòng điểm
CREATE TABLE diem_lon (
    ma_diem   BIGSERIAL    PRIMARY KEY,
    ma_hs     INTEGER      NOT NULL,
    ma_mon    SMALLINT     NOT NULL,
    hoc_ky    SMALLINT     NOT NULL,
    loai_diem VARCHAR(10)  NOT NULL,
    diem_so   NUMERIC(4,2) NOT NULL,
    ngay_nhap DATE         NOT NULL
);

INSERT INTO diem_lon (ma_hs, ma_mon, hoc_ky, loai_diem, diem_so, ngay_nhap)
SELECT
    (n % 50000) + 1,
    (n % 9) + 1,
    (n % 2) + 1,
    CASE n % 3 WHEN 0 THEN '15 phút' WHEN 1 THEN '1 tiết' ELSE 'Học kỳ' END,
    ROUND((((n * 7919) % 601) / 100.0 + 4.0)::NUMERIC, 2),
    DATE '2024-09-01' + (n % 700)
FROM generate_series(1, 500000) AS n;

-- QUAN TRỌNG: chạy ANALYZE để PostgreSQL cập nhật thống kê.
-- Không có bước này, query planner ước lượng sai và bạn sẽ thấy
-- kế hoạch thực thi kỳ lạ ở Bài 36.
ANALYZE hoc_sinh_lon;
ANALYZE diem_lon;

-- CỐ Ý KHÔNG tạo index nào ở đây.
-- Bài 34 sẽ bảo bạn tự đo tốc độ TRƯỚC, rồi mới tạo index và đo LẠI.

\echo '--- Đã nạp xong dữ liệu lớn ---'
SELECT 'hoc_sinh_lon' AS bang, count(*) FROM hoc_sinh_lon
UNION ALL
SELECT 'diem_lon', count(*) FROM diem_lon;

SELECT pg_size_pretty(pg_total_relation_size('diem_lon')) AS dung_luong_diem_lon;
