-- =====================================================================
--  DATABASE MẪU: truong_hoc  (PHIÊN BẢN CHƯA CHUẨN HOÁ)
--
--  ⚠️  ĐÂY LÀ MỘT VÍ DỤ XẤU — CỐ Ý THIẾT KẾ TỒI.
--
--  File này tồn tại để bạn nhìn thấy tận mắt một thiết kế tệ trông thế nào,
--  rồi tự tay sửa nó trong Cấp 2 (Bài 16–20: Chuẩn hoá).
--  ĐỪNG bao giờ thiết kế database thật theo kiểu này.
--
--  Những cái sai cố ý đã cài sẵn:
--    1. Cột `cac_mon_va_diem` nhồi nhiều giá trị vào một ô  → vi phạm 1NF
--    2. Cột `ho_ten_ph1/sdt_ph1`, `ho_ten_ph2/sdt_ph2` lặp nhóm → vi phạm 1NF
--    3. `gvcn` phụ thuộc vào `ten_lop` chứ không vào khoá   → vi phạm 3NF
--    4. Tên lớp và tên GVCN bị chép lại ở hàng chục dòng    → dư thừa dữ liệu
--
--  Cách nạp:  psql -U postgres -d truong_hoc -f 01-chua-chuan-hoa.sql
-- =====================================================================

DROP TABLE IF EXISTS bang_bet CASCADE;

CREATE TABLE bang_bet (
    stt              SERIAL PRIMARY KEY,
    ho_ten_hs        VARCHAR(60),
    ngay_sinh_hs     DATE,
    dia_chi          VARCHAR(120),
    ten_lop          VARCHAR(10),
    gvcn             VARCHAR(60),
    email_gvcn       VARCHAR(80),
    ho_ten_ph1       VARCHAR(60),
    sdt_ph1          VARCHAR(15),
    ho_ten_ph2       VARCHAR(60),
    sdt_ph2          VARCHAR(15),
    cac_mon_va_diem  TEXT          -- ← đây là chỗ tệ nhất: 'Toán:8.5, Văn:7.0, Anh:6.5'
);

INSERT INTO bang_bet
 (ho_ten_hs, ngay_sinh_hs, dia_chi, ten_lop, gvcn, email_gvcn,
  ho_ten_ph1, sdt_ph1, ho_ten_ph2, sdt_ph2, cac_mon_va_diem) VALUES
('Nguyễn Văn An',   '2012-01-15', '12 Lê Lợi, Hà Nội',        '8A1', 'Nguyễn Thị Lan', 'lan.nt@thcs.edu.vn', 'Nguyễn Văn Thành', '0912345001', 'Lê Thị Hạnh',   '0912345002', 'Toán:8.5, Văn:6.5, Anh:7.0'),
('Trần Thị Bình',   '2012-03-22', '45 Trần Hưng Đạo, Hà Nội', '8A1', 'Nguyễn Thị Lan', 'lan.nt@thcs.edu.vn', 'Trần Văn Bảy',     '0912345003', NULL,            NULL,         'Toán:8.0, Văn:7.0, Anh:8.5'),
('Lê Hoàng Cường',  '2012-05-09', '7 Nguyễn Du, Hà Nội',      '8A1', 'Nguyễn Thị Lan', 'lan.nt@thcs.edu.vn', 'Lê Hoàng Sáu',     '0912345004', 'Nguyễn Thị Tám','0912345005', 'Toán:9.0, Văn:5.5, Anh:6.0'),
('Phạm Thị Dung',   '2012-02-28', '90 Bà Triệu, Hà Nội',      '8A1', 'Nguyễn Thị Lan', 'lan.nt@thcs.edu.vn', 'Phạm Văn Chín',    '0912345006', NULL,            NULL,         'Toán:7.5, Văn:8.0, Anh:7.5'),
('Hoàng Minh Đức',  '2012-07-11', '23 Hai Bà Trưng, Hà Nội',  '8A1', 'Nguyễn Thị Lan', 'lan.nt@thcs.edu.vn', 'Hoàng Minh Tâm',   '0912345007', NULL,            NULL,         'Toán:6.0, Văn:6.5, Anh:5.0'),
('Vũ Thị Giang',    '2012-09-03', '56 Lý Thường Kiệt, Hà Nội','8A1', 'Nguyễn Thị Lan', 'lan.nt@thcs.edu.vn', 'Vũ Thị Tuyết',     '0912345008', NULL,            NULL,         'Toán:8.8, Văn:9.0, Anh:9.2'),
('Đỗ Văn Hải',      '2012-11-17', '8 Phan Chu Trinh, Hà Nội', '8A2', 'Trần Văn Hùng',  'hung.tv@thcs.edu.vn','Đỗ Văn Kiên',      '0912345009', 'Nguyễn Thị Bé', '0912345042', 'Toán:5.5, Văn:7.5, Anh:6.0'),
('Bùi Thị Hương',   '2012-04-05', '34 Hàng Bài, Hà Nội',      '8A2', 'Trần Văn Hùng',  'hung.tv@thcs.edu.vn','Bùi Thị Loan',     '0912345010', NULL,            NULL,         'Toán:7.0, Văn:8.5, Anh:8.0'),
('Ngô Quang Huy',   '2012-06-30', '67 Tràng Thi, Hà Nội',     '8A2', 'Trần Văn Hùng',  'hung.tv@thcs.edu.vn','Ngô Quang Vinh',   '0912345011', NULL,            NULL,         'Toán:9.5, Văn:6.0, Anh:7.5'),
('Dương Thị Khanh', '2012-08-19', '11 Quán Sứ, Hà Nội',       '8A2', 'Trần Văn Hùng',  'hung.tv@thcs.edu.vn','Dương Thị Hồng',   '0912345012', NULL,            NULL,         'Toán:6.5, Văn:7.0, Anh:6.5'),
('Đặng Văn Long',   '2012-10-08', '78 Thợ Nhuộm, Hà Nội',     '8A2', 'Trần Văn Hùng',  'hung.tv@thcs.edu.vn','Đặng Văn Thắng',   '0912345013', NULL,            NULL,         'Toán:8.0, Văn:8.0, Anh:8.0'),
('Lý Thị Mai',      '2012-12-25', '29 Hàng Trống, Hà Nội',    '8A2', 'Trần Văn Hùng',  'hung.tv@thcs.edu.vn','Lý Thị Nga',       '0912345014', NULL,            NULL,         'Toán:7.2, Văn:9.5, Anh:8.8'),
('Trương Minh Nam', '2012-01-07', '52 Nhà Chung, Hà Nội',     '8A3', 'Lê Thị Mai',     'mai.lt@thcs.edu.vn', 'Trương Minh Trí',  '0912345015', 'Trần Văn Cả',   '0912345043', 'Toán:6.8, Văn:6.2, Anh:9.0'),
('Phan Thị Ngọc',   '2012-03-14', '3 Lý Quốc Sư, Hà Nội',     '8A3', 'Lê Thị Mai',     'mai.lt@thcs.edu.vn', 'Phan Thị Yến',     '0912345016', NULL,            NULL,         'Toán:8.2, Văn:7.8, Anh:9.5'),
('Võ Văn Phúc',     '2012-05-26', '81 Hàng Gai, Hà Nội',      '8A3', 'Lê Thị Mai',     'mai.lt@thcs.edu.vn', 'Võ Văn Định',      '0912345017', NULL,            NULL,         'Toán:5.0, Văn:5.5, Anh:6.5'),
('Hồ Thị Quyên',    '2012-07-02', '19 Cầu Gỗ, Hà Nội',        '8A3', 'Lê Thị Mai',     'mai.lt@thcs.edu.vn', 'Hồ Thị Bích',      '0912345018', NULL,            NULL,         'Toán:9.2, Văn:8.5, Anh:9.8'),
('Tạ Quang Sơn',    '2012-09-21', '64 Đinh Tiên Hoàng',       '8A3', 'Lê Thị Mai',     'mai.lt@thcs.edu.vn', 'Tạ Quang Vũ',      '0912345019', NULL,            NULL,         'Toán:7.0, Văn:6.0, Anh:7.2'),
('Chu Thị Thanh',   '2012-11-13', '27 Hàng Dầu, Hà Nội',      '8A3', 'Lê Thị Mai',     'mai.lt@thcs.edu.vn', 'Chu Thị Hiền',     '0912345020', NULL,            NULL,         'Toán:8.5, Văn:8.8, Anh:8.2'),
('Mai Văn Tùng',    '2012-02-09', '95 Hàng Bông, Hà Nội',     '8A3', 'Lê Thị Mai',     'mai.lt@thcs.edu.vn', 'Mai Văn Lực',      '0912345021', NULL,            NULL,         'Toán:6.2, Văn:7.2, Anh:6.8'),
('Đinh Thị Uyên',   '2012-04-18', '41 Hàng Điếu, Hà Nội',     '8A3', 'Lê Thị Mai',     'mai.lt@thcs.edu.vn', 'Đinh Thị Thảo',    '0912345022', NULL,            NULL,         'Toán:7.8, Văn:8.2, Anh:7.0'),
('Nguyễn Hữu Vinh', '2011-01-20', '15 Ngô Quyền, Hà Nội',     '9A1', 'Phạm Quốc Dũng', 'dung.pq@thcs.edu.vn','Nguyễn Hữu Phước', '0912345023', 'Lê Thị Tí',     '0912345044', 'Toán:9.0, Văn:7.5, Anh:8.0'),
('Trần Thị Xuân',   '2011-03-06', '73 Lê Thánh Tông',         '9A1', 'Phạm Quốc Dũng', 'dung.pq@thcs.edu.vn','Trần Thị Hoà',     '0912345024', NULL,            NULL,         'Toán:8.5, Văn:9.0, Anh:8.5'),
('Lê Văn Yên',      '2011-05-29', '38 Tông Đản, Hà Nội',      '9A1', 'Phạm Quốc Dũng', 'dung.pq@thcs.edu.vn','Lê Văn Đạt',       '0912345025', NULL,            NULL,         'Toán:6.0, Văn:5.0, Anh:5.5'),
('Phạm Thị Ánh',    '2011-07-15', '60 Lý Đạo Thành',          '9A1', 'Phạm Quốc Dũng', 'dung.pq@thcs.edu.vn','Phạm Thị Nhàn',    '0912345026', NULL,            NULL,         'Toán:7.5, Văn:8.0, Anh:7.8'),
('Hoàng Văn Bảo',   '2011-09-27', '4 Trần Nguyên Hãn',        '9A1', 'Phạm Quốc Dũng', 'dung.pq@thcs.edu.vn','Hoàng Văn Cầu',    '0912345027', NULL,            NULL,         'Toán:8.8, Văn:6.5, Anh:7.0'),
('Vũ Thị Chi',      '2011-11-04', '86 Hàng Vôi, Hà Nội',      '9A1', 'Phạm Quốc Dũng', 'dung.pq@thcs.edu.vn','Vũ Thị Tâm',       '0912345028', NULL,            NULL,         'Toán:9.5, Văn:9.2, Anh:9.0'),
('Đỗ Minh Duy',     '2011-01-31', '22 Hàng Tre, Hà Nội',      '9A2', 'Hoàng Thị Nhung','nhung.ht@thcs.edu.vn','Đỗ Minh Hoàng',   '0912345029', NULL,            NULL,         'Toán:5.5, Văn:6.0, Anh:6.2'),
('Bùi Thị Én',      '2011-03-12', '49 Hàng Muối, Hà Nội',     '9A2', 'Hoàng Thị Nhung','nhung.ht@thcs.edu.vn','Bùi Thị Xuyến',   '0912345030', NULL,            NULL,         'Toán:7.0, Văn:7.5, Anh:8.0'),
('Ngô Văn Phong',   '2011-06-08', '13 Hàng Chiếu, Hà Nội',    '9A2', 'Hoàng Thị Nhung','nhung.ht@thcs.edu.vn','Ngô Văn Tráng',   '0912345031', 'Phạm Văn Mão',  '0912345045', 'Toán:8.2, Văn:6.8, Anh:7.5'),
('Dương Thị Gấm',   '2011-08-23', '70 Đào Duy Từ, Hà Nội',    '9A2', 'Hoàng Thị Nhung','nhung.ht@thcs.edu.vn','Dương Thị Lụa',   '0912345032', NULL,            NULL,         'Toán:6.5, Văn:8.5, Anh:7.2');

\echo '--- Bảng bẹt đã nạp. Hãy nhìn kỹ cột cac_mon_va_diem và cột gvcn. ---'
SELECT count(*) AS so_dong FROM bang_bet;
SELECT DISTINCT ten_lop, gvcn FROM bang_bet ORDER BY ten_lop;
