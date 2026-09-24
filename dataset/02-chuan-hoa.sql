-- =====================================================================
--  DATABASE MẪU: truong_hoc  (PHIÊN BẢN ĐÃ CHUẨN HOÁ)
--  Dùng cho toàn bộ khóa học "Database từ A-Z", từ Bài 21 trở đi.
--
--  Đây là NGUỒN CHÂN LÝ DUY NHẤT về tên bảng và tên cột.
--  Mọi câu SQL trong bài học đều chạy được trên lược đồ này.
--
--  Cách nạp:  psql -U postgres -d truong_hoc -f 02-chuan-hoa.sql
-- =====================================================================

-- Xoá theo thứ tự NGƯỢC với thứ tự phụ thuộc khoá ngoại.
DROP TABLE IF EXISTS diem_danh CASCADE;
DROP TABLE IF EXISTS muon_sach CASCADE;
DROP TABLE IF EXISTS sach CASCADE;
DROP TABLE IF EXISTS diem CASCADE;
DROP TABLE IF EXISTS phan_cong_day CASCADE;
DROP TABLE IF EXISTS mon_hoc CASCADE;
DROP TABLE IF EXISTS phu_huynh CASCADE;
DROP TABLE IF EXISTS hoc_sinh CASCADE;
DROP TABLE IF EXISTS lop CASCADE;
DROP TABLE IF EXISTS giao_vien CASCADE;

-- ---------------------------------------------------------------------
-- 1. GIÁO VIÊN
-- ---------------------------------------------------------------------
CREATE TABLE giao_vien (
    ma_gv           CHAR(4)      PRIMARY KEY,
    ho_ten          VARCHAR(60)  NOT NULL,
    ngay_sinh       DATE         NOT NULL,
    gioi_tinh       VARCHAR(3)   NOT NULL CHECK (gioi_tinh IN ('Nam', 'Nữ')),
    mon_chuyen_mon  VARCHAR(30)  NOT NULL,
    email           VARCHAR(80)  NOT NULL UNIQUE,
    luong           NUMERIC(12,2) NOT NULL CHECK (luong > 0)
);

COMMENT ON TABLE  giao_vien IS 'Danh sách giáo viên của trường';
COMMENT ON COLUMN giao_vien.email IS 'Khoá dự tuyển (candidate key) — xem Bài 12';

-- ---------------------------------------------------------------------
-- 2. LỚP  — mỗi lớp có tối đa một giáo viên chủ nhiệm
-- ---------------------------------------------------------------------
CREATE TABLE lop (
    ma_lop    CHAR(3)     PRIMARY KEY,
    ten_lop   VARCHAR(10) NOT NULL UNIQUE,
    khoi      SMALLINT    NOT NULL CHECK (khoi BETWEEN 6 AND 9),
    nam_hoc   VARCHAR(9)  NOT NULL,
    ma_gvcn   CHAR(4)     REFERENCES giao_vien(ma_gv) ON DELETE SET NULL
);

COMMENT ON COLUMN lop.ma_gvcn IS 'Cho phép NULL: lớp chưa phân công chủ nhiệm — dùng dạy LEFT JOIN ở Bài 25';

-- ---------------------------------------------------------------------
-- 3. HỌC SINH  — mỗi học sinh BẮT BUỘC thuộc một lớp (tham gia toàn phần)
-- ---------------------------------------------------------------------
CREATE TABLE hoc_sinh (
    ma_hs      CHAR(5)      PRIMARY KEY,
    ho_ten     VARCHAR(60)  NOT NULL,
    ngay_sinh  DATE         NOT NULL,
    gioi_tinh  VARCHAR(3)   NOT NULL CHECK (gioi_tinh IN ('Nam', 'Nữ')),
    dia_chi    VARCHAR(120),
    ma_lop     CHAR(3)      NOT NULL REFERENCES lop(ma_lop) ON DELETE RESTRICT
);

-- ---------------------------------------------------------------------
-- 4. PHỤ HUYNH  — thực thể yếu: chỉ tồn tại khi có học sinh (Bài 9)
-- ---------------------------------------------------------------------
CREATE TABLE phu_huynh (
    ma_ph         CHAR(5)     PRIMARY KEY,
    ho_ten        VARCHAR(60) NOT NULL,
    so_dien_thoai VARCHAR(15),
    quan_he       VARCHAR(10) NOT NULL CHECK (quan_he IN ('Bố', 'Mẹ', 'Ông', 'Bà', 'Khác')),
    ma_hs         CHAR(5)     NOT NULL REFERENCES hoc_sinh(ma_hs) ON DELETE CASCADE
);

COMMENT ON TABLE phu_huynh IS 'ON DELETE CASCADE: xoá học sinh thì xoá luôn phụ huynh — xem Bài 15';

-- ---------------------------------------------------------------------
-- 5. MÔN HỌC
-- ---------------------------------------------------------------------
CREATE TABLE mon_hoc (
    ma_mon       CHAR(4)     PRIMARY KEY,
    ten_mon      VARCHAR(30) NOT NULL UNIQUE,
    so_tiet_tuan SMALLINT    NOT NULL CHECK (so_tiet_tuan BETWEEN 1 AND 10)
);

-- ---------------------------------------------------------------------
-- 6. PHÂN CÔNG DẠY  — quan hệ BẬC BA: giáo viên × môn × lớp (Bài 8)
--    Khoá chính phức hợp gồm 4 cột (Bài 12).
-- ---------------------------------------------------------------------
CREATE TABLE phan_cong_day (
    ma_gv   CHAR(4)  NOT NULL REFERENCES giao_vien(ma_gv) ON DELETE CASCADE,
    ma_mon  CHAR(4)  NOT NULL REFERENCES mon_hoc(ma_mon)  ON DELETE CASCADE,
    ma_lop  CHAR(3)  NOT NULL REFERENCES lop(ma_lop)      ON DELETE CASCADE,
    hoc_ky  SMALLINT NOT NULL CHECK (hoc_ky IN (1, 2)),
    PRIMARY KEY (ma_gv, ma_mon, ma_lop, hoc_ky)
);

-- ---------------------------------------------------------------------
-- 7. ĐIỂM  — hiện thực quan hệ M:N giữa học sinh và môn học
-- ---------------------------------------------------------------------
CREATE TABLE diem (
    ma_diem   SERIAL       PRIMARY KEY,
    ma_hs     CHAR(5)      NOT NULL REFERENCES hoc_sinh(ma_hs) ON DELETE CASCADE,
    ma_mon    CHAR(4)      NOT NULL REFERENCES mon_hoc(ma_mon) ON DELETE RESTRICT,
    hoc_ky    SMALLINT     NOT NULL CHECK (hoc_ky IN (1, 2)),
    loai_diem VARCHAR(10)  NOT NULL CHECK (loai_diem IN ('15 phút', '1 tiết', 'Học kỳ')),
    diem_so   NUMERIC(4,2) NOT NULL CHECK (diem_so BETWEEN 0 AND 10),
    ngay_nhap DATE         NOT NULL DEFAULT CURRENT_DATE
);

COMMENT ON COLUMN diem.diem_so IS 'Dùng NUMERIC chứ không dùng FLOAT — xem Bài 22';

-- ---------------------------------------------------------------------
-- 8. SÁCH THƯ VIỆN
-- ---------------------------------------------------------------------
CREATE TABLE sach (
    ma_sach       CHAR(4)      PRIMARY KEY,
    ten_sach      VARCHAR(100) NOT NULL,
    tac_gia       VARCHAR(60),
    nam_xuat_ban  SMALLINT     CHECK (nam_xuat_ban BETWEEN 1800 AND 2100),
    so_luong      SMALLINT     NOT NULL DEFAULT 1 CHECK (so_luong >= 0)
);

-- ---------------------------------------------------------------------
-- 9. MƯỢN SÁCH
-- ---------------------------------------------------------------------
CREATE TABLE muon_sach (
    ma_muon          SERIAL   PRIMARY KEY,
    ma_hs            CHAR(5)  NOT NULL REFERENCES hoc_sinh(ma_hs) ON DELETE CASCADE,
    ma_sach          CHAR(4)  NOT NULL REFERENCES sach(ma_sach)   ON DELETE RESTRICT,
    ngay_muon        DATE     NOT NULL,
    ngay_tra_du_kien DATE     NOT NULL,
    ngay_tra_thuc_te DATE,
    CHECK (ngay_tra_du_kien >= ngay_muon),
    CHECK (ngay_tra_thuc_te IS NULL OR ngay_tra_thuc_te >= ngay_muon)
);

COMMENT ON COLUMN muon_sach.ngay_tra_thuc_te IS 'NULL nghĩa là CHƯA TRẢ — dùng dạy NULL và logic ba giá trị ở Bài 24';

-- ---------------------------------------------------------------------
-- 10. ĐIỂM DANH
-- ---------------------------------------------------------------------
CREATE TABLE diem_danh (
    ma_dd      SERIAL      PRIMARY KEY,
    ma_hs      CHAR(5)     NOT NULL REFERENCES hoc_sinh(ma_hs) ON DELETE CASCADE,
    ngay       DATE        NOT NULL,
    trang_thai VARCHAR(12) NOT NULL CHECK (trang_thai IN ('Có mặt', 'Vắng có phép', 'Vắng không phép', 'Đi muộn')),
    ly_do      VARCHAR(100),
    UNIQUE (ma_hs, ngay)
);

-- =====================================================================
--  DỮ LIỆU MẪU
-- =====================================================================

INSERT INTO giao_vien (ma_gv, ho_ten, ngay_sinh, gioi_tinh, mon_chuyen_mon, email, luong) VALUES
('GV01', 'Nguyễn Thị Lan',    '1985-03-12', 'Nữ',  'Toán',       'lan.nt@thcs.edu.vn',    14500000),
('GV02', 'Trần Văn Hùng',     '1979-07-25', 'Nam', 'Ngữ văn',    'hung.tv@thcs.edu.vn',   16200000),
('GV03', 'Lê Thị Mai',        '1990-11-02', 'Nữ',  'Tiếng Anh',  'mai.lt@thcs.edu.vn',    12800000),
('GV04', 'Phạm Quốc Dũng',    '1982-01-30', 'Nam', 'Vật lý',     'dung.pq@thcs.edu.vn',   15100000),
('GV05', 'Hoàng Thị Nhung',   '1988-09-18', 'Nữ',  'Hoá học',    'nhung.ht@thcs.edu.vn',  13700000),
('GV06', 'Vũ Minh Tuấn',      '1975-05-06', 'Nam', 'Lịch sử',    'tuan.vm@thcs.edu.vn',   17400000),
('GV07', 'Đỗ Thị Thu Hà',     '1992-12-21', 'Nữ',  'Sinh học',   'ha.dtt@thcs.edu.vn',    11900000),
('GV08', 'Bùi Anh Khoa',      '1986-04-14', 'Nam', 'Tin học',    'khoa.ba@thcs.edu.vn',   14000000);

-- Lớp L06 CỐ Ý để ma_gvcn = NULL (chưa có chủ nhiệm) — phục vụ dạy LEFT JOIN.
INSERT INTO lop (ma_lop, ten_lop, khoi, nam_hoc, ma_gvcn) VALUES
('L01', '8A1', 8, '2025-2026', 'GV01'),
('L02', '8A2', 8, '2025-2026', 'GV02'),
('L03', '8A3', 8, '2025-2026', 'GV03'),
('L04', '9A1', 9, '2025-2026', 'GV04'),
('L05', '9A2', 9, '2025-2026', 'GV05'),
('L06', '9A3', 9, '2025-2026', NULL);

INSERT INTO mon_hoc (ma_mon, ten_mon, so_tiet_tuan) VALUES
('MH01', 'Toán',       5),
('MH02', 'Ngữ văn',    4),
('MH03', 'Tiếng Anh',  3),
('MH04', 'Vật lý',     2),
('MH05', 'Hoá học',    2),
('MH06', 'Sinh học',   2),
('MH07', 'Lịch sử',    2),
('MH08', 'Địa lý',     2),
('MH09', 'Tin học',    2);

INSERT INTO hoc_sinh (ma_hs, ho_ten, ngay_sinh, gioi_tinh, dia_chi, ma_lop) VALUES
('HS001', 'Nguyễn Văn An',      '2012-01-15', 'Nam', '12 Lê Lợi, Hà Nội',         'L01'),
('HS002', 'Trần Thị Bình',      '2012-03-22', 'Nữ',  '45 Trần Hưng Đạo, Hà Nội',  'L01'),
('HS003', 'Lê Hoàng Cường',     '2012-05-09', 'Nam', '7 Nguyễn Du, Hà Nội',       'L01'),
('HS004', 'Phạm Thị Dung',      '2012-02-28', 'Nữ',  '90 Bà Triệu, Hà Nội',       'L01'),
('HS005', 'Hoàng Minh Đức',     '2012-07-11', 'Nam', '23 Hai Bà Trưng, Hà Nội',   'L01'),
('HS006', 'Vũ Thị Giang',       '2012-09-03', 'Nữ',  '56 Lý Thường Kiệt, Hà Nội', 'L01'),
('HS007', 'Đỗ Văn Hải',         '2012-11-17', 'Nam', '8 Phan Chu Trinh, Hà Nội',  'L02'),
('HS008', 'Bùi Thị Hương',      '2012-04-05', 'Nữ',  '34 Hàng Bài, Hà Nội',       'L02'),
('HS009', 'Ngô Quang Huy',      '2012-06-30', 'Nam', '67 Tràng Thi, Hà Nội',      'L02'),
('HS010', 'Dương Thị Khanh',    '2012-08-19', 'Nữ',  '11 Quán Sứ, Hà Nội',        'L02'),
('HS011', 'Đặng Văn Long',      '2012-10-08', 'Nam', '78 Thợ Nhuộm, Hà Nội',      'L02'),
('HS012', 'Lý Thị Mai',         '2012-12-25', 'Nữ',  '29 Hàng Trống, Hà Nội',     'L02'),
('HS013', 'Trương Minh Nam',    '2012-01-07', 'Nam', '52 Nhà Chung, Hà Nội',      'L03'),
('HS014', 'Phan Thị Ngọc',      '2012-03-14', 'Nữ',  '3 Lý Quốc Sư, Hà Nội',      'L03'),
('HS015', 'Võ Văn Phúc',        '2012-05-26', 'Nam', '81 Hàng Gai, Hà Nội',       'L03'),
('HS016', 'Hồ Thị Quyên',       '2012-07-02', 'Nữ',  '19 Cầu Gỗ, Hà Nội',         'L03'),
('HS017', 'Tạ Quang Sơn',       '2012-09-21', 'Nam', '64 Đinh Tiên Hoàng, Hà Nội','L03'),
('HS018', 'Chu Thị Thanh',      '2012-11-13', 'Nữ',  '27 Hàng Dầu, Hà Nội',       'L03'),
('HS019', 'Mai Văn Tùng',       '2012-02-09', 'Nam', '95 Hàng Bông, Hà Nội',      'L03'),
('HS020', 'Đinh Thị Uyên',      '2012-04-18', 'Nữ',  '41 Hàng Điếu, Hà Nội',      'L03'),
('HS021', 'Nguyễn Hữu Vinh',    '2011-01-20', 'Nam', '15 Ngô Quyền, Hà Nội',      'L04'),
('HS022', 'Trần Thị Xuân',      '2011-03-06', 'Nữ',  '73 Lê Thánh Tông, Hà Nội',  'L04'),
('HS023', 'Lê Văn Yên',         '2011-05-29', 'Nam', '38 Tông Đản, Hà Nội',       'L04'),
('HS024', 'Phạm Thị Ánh',       '2011-07-15', 'Nữ',  '60 Lý Đạo Thành, Hà Nội',   'L04'),
('HS025', 'Hoàng Văn Bảo',      '2011-09-27', 'Nam', '4 Trần Nguyên Hãn, Hà Nội', 'L04'),
('HS026', 'Vũ Thị Chi',         '2011-11-04', 'Nữ',  '86 Hàng Vôi, Hà Nội',       'L04'),
('HS027', 'Đỗ Minh Duy',        '2011-01-31', 'Nam', '22 Hàng Tre, Hà Nội',       'L05'),
('HS028', 'Bùi Thị Én',         '2011-03-12', 'Nữ',  '49 Hàng Muối, Hà Nội',      'L05'),
('HS029', 'Ngô Văn Phong',      '2011-06-08', 'Nam', '13 Hàng Chiếu, Hà Nội',     'L05'),
('HS030', 'Dương Thị Gấm',      '2011-08-23', 'Nữ',  '70 Đào Duy Từ, Hà Nội',     'L05'),
('HS031', 'Đặng Quang Hiếu',    '2011-10-16', 'Nam', '5 Mã Mây, Hà Nội',          'L05'),
('HS032', 'Lý Thị Hoa',         '2011-12-01', 'Nữ',  '58 Hàng Buồm, Hà Nội',      'L05'),
('HS033', 'Trương Văn Khôi',    '2011-02-14', 'Nam', '31 Lương Ngọc Quyến',       'L05'),
('HS034', 'Phan Thị Linh',      '2011-04-25', 'Nữ',  '77 Tạ Hiện, Hà Nội',        'L06'),
('HS035', 'Võ Minh Nhật',       '2011-06-19', 'Nam', '16 Hàng Giầy, Hà Nội',      'L06'),
('HS036', 'Hồ Thị Oanh',        '2011-08-07', 'Nữ',  '92 Nguyễn Siêu, Hà Nội',    'L06'),
('HS037', 'Tạ Văn Quân',        '2011-10-30', 'Nam', '25 Ngõ Gạch, Hà Nội',       'L06'),
('HS038', 'Chu Thị Sen',        '2011-12-11', 'Nữ',  '63 Hàng Cá, Hà Nội',        'L06'),
('HS039', 'Mai Quang Trung',    '2011-05-03', 'Nam', '9 Chả Cá, Hà Nội',          'L06'),
('HS040', 'Đinh Thị Vân',       '2011-07-22', 'Nữ',  '47 Lãn Ông, Hà Nội',        'L06');

-- HS040 (Đinh Thị Vân) CỐ Ý không có phụ huynh nào — phục vụ dạy LEFT JOIN / NOT EXISTS.
INSERT INTO phu_huynh (ma_ph, ho_ten, so_dien_thoai, quan_he, ma_hs) VALUES
('PH001', 'Nguyễn Văn Thành',  '0912345001', 'Bố', 'HS001'),
('PH002', 'Lê Thị Hạnh',       '0912345002', 'Mẹ', 'HS001'),
('PH003', 'Trần Văn Bảy',      '0912345003', 'Bố', 'HS002'),
('PH004', 'Lê Hoàng Sáu',      '0912345004', 'Bố', 'HS003'),
('PH005', 'Nguyễn Thị Tám',    '0912345005', 'Mẹ', 'HS003'),
('PH006', 'Phạm Văn Chín',     '0912345006', 'Bố', 'HS004'),
('PH007', 'Hoàng Minh Tâm',    '0912345007', 'Bố', 'HS005'),
('PH008', 'Vũ Thị Tuyết',      '0912345008', 'Mẹ', 'HS006'),
('PH009', 'Đỗ Văn Kiên',       '0912345009', 'Bố', 'HS007'),
('PH010', 'Bùi Thị Loan',      '0912345010', 'Mẹ', 'HS008'),
('PH011', 'Ngô Quang Vinh',    '0912345011', 'Bố', 'HS009'),
('PH012', 'Dương Thị Hồng',    '0912345012', 'Mẹ', 'HS010'),
('PH013', 'Đặng Văn Thắng',    '0912345013', 'Bố', 'HS011'),
('PH014', 'Lý Thị Nga',        '0912345014', 'Mẹ', 'HS012'),
('PH015', 'Trương Minh Trí',   '0912345015', 'Bố', 'HS013'),
('PH016', 'Phan Thị Yến',      '0912345016', 'Mẹ', 'HS014'),
('PH017', 'Võ Văn Định',       '0912345017', 'Bố', 'HS015'),
('PH018', 'Hồ Thị Bích',       '0912345018', 'Mẹ', 'HS016'),
('PH019', 'Tạ Quang Vũ',       '0912345019', 'Bố', 'HS017'),
('PH020', 'Chu Thị Hiền',      '0912345020', 'Mẹ', 'HS018'),
('PH021', 'Mai Văn Lực',       '0912345021', 'Bố', 'HS019'),
('PH022', 'Đinh Thị Thảo',     '0912345022', 'Mẹ', 'HS020'),
('PH023', 'Nguyễn Hữu Phước',  '0912345023', 'Bố', 'HS021'),
('PH024', 'Trần Thị Hoà',      '0912345024', 'Mẹ', 'HS022'),
('PH025', 'Lê Văn Đạt',        '0912345025', 'Bố', 'HS023'),
('PH026', 'Phạm Thị Nhàn',     '0912345026', 'Mẹ', 'HS024'),
('PH027', 'Hoàng Văn Cầu',     '0912345027', 'Bố', 'HS025'),
('PH028', 'Vũ Thị Tâm',        '0912345028', 'Mẹ', 'HS026'),
('PH029', 'Đỗ Minh Hoàng',     '0912345029', 'Bố', 'HS027'),
('PH030', 'Bùi Thị Xuyến',     '0912345030', 'Mẹ', 'HS028'),
('PH031', 'Ngô Văn Tráng',     '0912345031', 'Bố', 'HS029'),
('PH032', 'Dương Thị Lụa',     '0912345032', 'Mẹ', 'HS030'),
('PH033', 'Đặng Quang Vượng',  '0912345033', 'Bố', 'HS031'),
('PH034', 'Lý Thị Cúc',        '0912345034', 'Mẹ', 'HS032'),
('PH035', 'Trương Văn Kỳ',     '0912345035', 'Bố', 'HS033'),
('PH036', 'Phan Thị Đào',      '0912345036', 'Mẹ', 'HS034'),
('PH037', 'Võ Minh Quyết',     '0912345037', 'Bố', 'HS035'),
('PH038', 'Hồ Thị Nhài',       '0912345038', 'Mẹ', 'HS036'),
('PH039', 'Tạ Văn Chiến',      '0912345039', 'Bố', 'HS037'),
('PH040', 'Chu Thị Sim',       '0912345040', 'Mẹ', 'HS038'),
('PH041', 'Mai Quang Đại',     '0912345041', 'Bố', 'HS039'),
('PH042', 'Nguyễn Thị Bé',     '0912345042', 'Bà', 'HS007'),
('PH043', 'Trần Văn Cả',       '0912345043', 'Ông','HS013'),
('PH044', 'Lê Thị Tí',         '0912345044', 'Mẹ', 'HS021'),
('PH045', 'Phạm Văn Mão',      '0912345045', 'Bố', 'HS029');

-- Phân công dạy: mỗi giáo viên dạy môn chuyên môn của mình cho một số lớp, cả 2 học kỳ.
INSERT INTO phan_cong_day (ma_gv, ma_mon, ma_lop, hoc_ky)
SELECT g.ma_gv, m.ma_mon, l.ma_lop, hk
FROM giao_vien g
JOIN mon_hoc  m ON m.ten_mon = g.mon_chuyen_mon
CROSS JOIN lop l
CROSS JOIN (VALUES (1), (2)) AS t(hk)
WHERE l.ma_lop IN ('L01', 'L02', 'L03', 'L04');

INSERT INTO sach (ma_sach, ten_sach, tac_gia, nam_xuat_ban, so_luong) VALUES
('S001', 'Dế Mèn phiêu lưu ký',        'Tô Hoài',          1941, 12),
('S002', 'Đất rừng phương Nam',        'Đoàn Giỏi',        1957,  8),
('S003', 'Tuổi thơ dữ dội',            'Phùng Quán',       1988,  6),
('S004', 'Cho tôi xin một vé đi tuổi thơ', 'Nguyễn Nhật Ánh', 2008, 15),
('S005', 'Kính vạn hoa (tập 1)',       'Nguyễn Nhật Ánh',  1995, 10),
('S006', 'Số đỏ',                      'Vũ Trọng Phụng',   1936,  5),
('S007', 'Chí Phèo',                   'Nam Cao',          1941,  7),
('S008', 'Lão Hạc',                    'Nam Cao',          1943,  9),
('S009', 'Tắt đèn',                    'Ngô Tất Tố',       1939,  4),
('S010', 'Vang bóng một thời',         'Nguyễn Tuân',      1940,  3),
('S011', 'Toán nâng cao lớp 8',        'Vũ Hữu Bình',      2019, 20),
('S012', 'Bài tập Vật lý 9',           'Bùi Gia Thịnh',    2020, 18),
('S013', 'Tiếng Anh giao tiếp cơ bản', 'Mai Lan Hương',    2021, 14),
('S014', 'Lịch sử Việt Nam bằng tranh','Trần Bạch Đằng',   2012, 11),
('S015', 'Hạt giống tâm hồn',          'Nhiều tác giả',    2003, 16),
('S016', 'Không gia đình',             'Hector Malot',     1878,  6),
('S017', 'Hoàng tử bé',                'Saint-Exupéry',    1943, 13),
('S018', 'Totto-chan bên cửa sổ',      'Kuroyanagi Tetsuko',1981, 7),
('S019', 'Nhà giả kim',                'Paulo Coelho',     1988,  9),
('S020', 'Harry Potter và Hòn đá Phù thuỷ', 'J. K. Rowling', 1997, 5);

-- Mượn sách: 50 lượt. Một số lượt CỐ Ý chưa trả (ngay_tra_thuc_te IS NULL).
INSERT INTO muon_sach (ma_hs, ma_sach, ngay_muon, ngay_tra_du_kien, ngay_tra_thuc_te)
SELECT
    'HS' || LPAD(((n - 1) % 25 + 1)::TEXT, 3, '0'),
    'S'  || LPAD(((n * 7 - 1) % 20 + 1)::TEXT, 3, '0'),
    DATE '2026-09-01' + (n % 20),
    DATE '2026-09-01' + (n % 20) + 14,
    CASE WHEN n % 4 = 0 THEN NULL
         ELSE DATE '2026-09-01' + (n % 20) + (n % 13)
    END
FROM generate_series(1, 50) AS n;

-- Điểm: mỗi học sinh có điểm Học kỳ cho cả 9 môn, cộng thêm điểm 1 tiết
-- cho 3 môn chính (Toán, Ngữ văn, Tiếng Anh). Tổng: 40*9 + 40*3 = 480 dòng.
SELECT setseed(0.42);

INSERT INTO diem (ma_hs, ma_mon, hoc_ky, loai_diem, diem_so, ngay_nhap)
SELECT h.ma_hs, m.ma_mon, 1, 'Học kỳ',
       ROUND((4.0 + random() * 6.0)::NUMERIC, 1),
       DATE '2026-01-10'
FROM hoc_sinh h CROSS JOIN mon_hoc m;

INSERT INTO diem (ma_hs, ma_mon, hoc_ky, loai_diem, diem_so, ngay_nhap)
SELECT h.ma_hs, m.ma_mon, 1, '1 tiết',
       ROUND((3.0 + random() * 7.0)::NUMERIC, 1),
       DATE '2025-11-15'
FROM hoc_sinh h CROSS JOIN mon_hoc m
WHERE m.ma_mon IN ('MH01', 'MH02', 'MH03');

-- Điểm danh: 40 học sinh × 5 ngày = 200 dòng.
INSERT INTO diem_danh (ma_hs, ngay, trang_thai, ly_do)
SELECT h.ma_hs,
       DATE '2026-09-14' + d,
       CASE WHEN (ASCII(SUBSTRING(h.ma_hs, 5, 1)) + d) % 17 = 0 THEN 'Vắng có phép'
            WHEN (ASCII(SUBSTRING(h.ma_hs, 5, 1)) + d) % 23 = 0 THEN 'Vắng không phép'
            WHEN (ASCII(SUBSTRING(h.ma_hs, 5, 1)) + d) % 11 = 0 THEN 'Đi muộn'
            ELSE 'Có mặt'
       END,
       CASE WHEN (ASCII(SUBSTRING(h.ma_hs, 5, 1)) + d) % 17 = 0 THEN 'Ốm, có đơn xin phép'
            ELSE NULL
       END
FROM hoc_sinh h CROSS JOIN generate_series(0, 4) AS d;

-- =====================================================================
--  KIỂM TRA NHANH SAU KHI NẠP
-- =====================================================================
\echo '--- Số dòng từng bảng ---'
SELECT 'giao_vien'     AS bang, count(*) FROM giao_vien
UNION ALL SELECT 'lop',           count(*) FROM lop
UNION ALL SELECT 'hoc_sinh',      count(*) FROM hoc_sinh
UNION ALL SELECT 'phu_huynh',     count(*) FROM phu_huynh
UNION ALL SELECT 'mon_hoc',       count(*) FROM mon_hoc
UNION ALL SELECT 'phan_cong_day', count(*) FROM phan_cong_day
UNION ALL SELECT 'diem',          count(*) FROM diem
UNION ALL SELECT 'sach',          count(*) FROM sach
UNION ALL SELECT 'muon_sach',     count(*) FROM muon_sach
UNION ALL SELECT 'diem_danh',     count(*) FROM diem_danh;
