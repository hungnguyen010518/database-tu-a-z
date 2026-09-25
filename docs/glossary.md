# Bảng thuật ngữ

Toàn bộ thuật ngữ chuyên ngành xuất hiện trong khóa học, đối chiếu Việt – Anh, kèm giải thích ngắn gọn và link tới bài học giải thích kỹ thuật ngữ đó.

Bảng được sắp xếp theo thứ tự chữ cái của **thuật ngữ tiếng Anh**, vì đó là dạng bạn sẽ gặp khi đọc tài liệu và khi đi phỏng vấn.

!!! info "Bảng này lớn dần theo khóa học"
    Mỗi khi một cấp độ mới được xuất bản, thuật ngữ của cấp đó được bổ sung vào đây. Hiện bảng phủ trọn **Bài 1–47**: Cấp 0 (Nhập môn), Cấp 1 (Mô hình quan hệ & ER), Cấp 2 (Chuẩn hoá), Cấp 3 (SQL), Cấp 4 (Bên trong động cơ) và Cấp 5 (Siêu nâng cao) tới Bài 47.

!!! tip "Vì sao có nhiều từ trùng nghĩa?"
    *record* / *row* / *tuple* cùng chỉ **một hàng**, còn *field* / *column* / *attribute* cùng chỉ **một cột**. Bảng giữ đủ cả ba vì bạn sẽ gặp cả ba khi đọc tài liệu; cột nghĩa có trỏ chéo sang các biến thể còn lại.

## 0–9

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Thuật toán tổng hợp 3NF | *3NF synthesis* | Cách dựng lược đồ 3NF từ phủ tối thiểu, bảo đảm vừa không mất mát vừa bảo toàn phụ thuộc | [Bài 18](cap-2-chuan-hoa/18-dang-chuan-3nf-bcnf.md) |

## A

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Giao dịch bị hỏng | *aborted transaction* | Giao dịch có một câu lỗi; mọi lệnh sau bị từ chối (*current transaction is aborted*) cho tới `ROLLBACK` hoặc `ROLLBACK TO SAVEPOINT` | [Bài 37](cap-4-ben-trong-dong-co/37-transaction-va-acid.md) |
| Bốn tính chất ACID | *ACID* | Nguyên tử, nhất quán, cô lập, bền vững — bốn lời hứa của một giao dịch đáng tin | [Bài 37](cap-4-ben-trong-dong-co/37-transaction-va-acid.md) |
| Danh sách kề | *adjacency list* | Cách lưu cây bằng một cột "mã cha" trên mỗi dòng — mỗi nút chỉ biết cha trực tiếp của mình | [Bài 28](cap-3-sql/28-cte-va-recursive-cte.md) |
| Ràng buộc giới hạn tổng | *aggregate constraint* | Luật nghiệp vụ phải cộng hoặc đếm qua nhiều dòng mới kiểm được, nên khoá ngoại và `UNIQUE` không cưỡng chế nổi | [Bài 14](cap-1-mo-hinh-er/14-chuyen-er-sang-bang.md) |
| Hàm tổng hợp | *aggregate function* | Hàm nhận nhiều dòng và trả về một giá trị duy nhất, ví dụ `COUNT`, `SUM`, `AVG`, `MIN`, `MAX` | [Bài 26](cap-3-sql/26-group-by-having.md) |
| Kết tập | *aggregation* | Coi cả một mối quan hệ như một thực thể duy nhất, để nó tham gia được vào một mối quan hệ khác | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Bí danh | *alias* | Tên tạm đặt cho cột hoặc bảng bằng `AS` — chính là phép đổi tên ρ của đại số quan hệ | [Bài 24](cap-3-sql/24-select-where-order-by.md) |
| Khoá thay thế | *alternate key* | Khoá dự tuyển không được chọn làm khoá chính, thường giữ bằng `UNIQUE` | [Bài 12](cap-1-mo-hinh-er/12-bay-loai-khoa.md) |
| Lệnh thu thống kê | *ANALYZE* | Lấy mẫu khoảng 30.000 dòng để cập nhật thống kê cho planner; khác với `EXPLAIN ANALYZE` là chạy thật và đo | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Phần neo | *anchor member* | Câu `SELECT` đầu tiên của CTE đệ quy, không tự tham chiếu — nó cho điểm khởi đầu của vòng lặp | [Bài 28](cap-3-sql/28-cte-va-recursive-cte.md) |
| Mô hình neo | *anchor modeling* | Kiểu thiết kế kho dữ liệu theo 6NF: mỗi thuộc tính một bảng riêng, nên thêm thuộc tính mới không phải đụng bảng cũ | [Bài 19](cap-2-chuan-hoa/19-dang-chuan-4nf-5nf-6nf.md) |
| Bất thường | *anomaly* | Tình huống mà một thao tác hoàn toàn bình thường lại làm hỏng dữ liệu | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Kết nối chống | *anti join* | Khuôn `LEFT JOIN ... WHERE <khoá bảng phải> IS NULL` để tìm những dòng không có bạn khớp bên kia | [Bài 25](cap-3-sql/25-join.md) |
| Lệnh nối thêm | *AppendEntries* | Tin nhắn lãnh đạo Raft gửi mục nhật ký mới, kèm mục ngay trước để kiểm khớp; rỗng thì là nhịp tim | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |
| Tiên đề Armstrong | *Armstrong's axioms* | Ba luật — phản xạ, tăng trưởng, bắc cầu — đủ để suy ra mọi phụ thuộc hàm suy ra được | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Nhân bản bất đồng bộ | *asynchronous replication* | `COMMIT` không chờ máy bản sao; nhanh, nhưng máy chính sập có thể mất giao dịch cuối — mặc định của PostgreSQL | [Bài 42](cap-5-sieu-nang-cao/42-replication.md) |
| Giao ít nhất một lần | *at-least-once delivery* | Thông điệp không bao giờ mất nhưng có thể tới nhiều lần; bên nhận phải luỹ đẳng | [Bài 45](cap-5-sieu-nang-cao/45-distributed-transaction.md) |
| Nguyên tử | *atomic* | Không chia nhỏ hơn được nữa, theo nhu cầu nghiệp vụ | [Bài 17](cap-2-chuan-hoa/17-dang-chuan-1nf-2nf.md) |
| Tính nguyên tử | *atomicity* | Tính chất mỗi ô chỉ chứa đúng một giá trị đơn, không chứa danh sách | [Bài 6](cap-1-mo-hinh-er/06-mo-hinh-quan-he.md) |
| Tính nguyên tử (giao dịch) | *atomicity* (ACID) | Chữ **A** của ACID: hoặc mọi thao tác của giao dịch có hiệu lực, hoặc không thao tác nào — khác nghĩa "ô chứa một giá trị đơn" của Bài 6 | [Bài 37](cap-4-ben-trong-dong-co/37-transaction-va-acid.md) |
| Thuộc tính | *attribute* | Một cột trong bảng, mô tả một đặc điểm của bản ghi — tên học thuật của *column* và *field* | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Bao đóng thuộc tính | *attribute closure* | Tập mọi thuộc tính suy ra được khi đã biết tập thuộc tính `X`, ký hiệu `X⁺` | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Kế thừa thuộc tính | *attribute inheritance* | Lớp con tự động có mọi thuộc tính của lớp cha, không cần khai lại | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Chuyên biệt hoá theo thuộc tính | *attribute-defined specialization* | Chuyên biệt hoá mà lớp con được xác định bằng giá trị của một thuộc tính, nên thường không cần tạo bảng riêng | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Tăng trưởng | *augmentation* | Tiên đề Armstrong: thêm cùng một nhóm thuộc tính vào cả hai vế thì luật vẫn đúng | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Tự động xác nhận | *autocommit* | Chế độ mặc định: mỗi câu lệnh đứng một mình là một giao dịch riêng | [Bài 37](cap-4-ben-trong-dong-co/37-transaction-va-acid.md) |
| Dọn rác tự động | *autovacuum* | Tiến trình nền tự `VACUUM` và `ANALYZE` các bảng khi số tuple chết hoặc số dòng thay đổi vượt ngưỡng; không nên tắt | [Bài 33](cap-4-ben-trong-dong-co/33-page-heap-tuple.md) |
| Tính sẵn sàng | *availability* | Mọi yêu cầu tới một máy còn sống đều được trả lời — chữ **A** của CAP | [Bài 44](cap-5-sieu-nang-cao/44-cap-va-base.md) |

## B

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Cây B+ | *B+Tree* | Biến thể B-Tree chỉ lưu `ctid` ở tầng lá và nối các lá thành chuỗi để quét khoảng; là index mặc định `btree` của PostgreSQL | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Cây B | *B-Tree* | Cây cân bằng, mỗi nút là một trang chứa nhiều khoá; mọi đường từ gốc xuống đáy dài bằng nhau | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Bản sao lưu nền | *base backup* | Bản chụp thư mục dữ liệu lấy khi máy chủ đang chạy, bằng `pg_basebackup`; điểm xuất phát của PITR | [Bài 40](cap-4-ben-trong-dong-co/40-wal-va-recovery.md) |
| BASE | *Basically Available, Soft state, Eventually consistent* | Kiểu thiết kế ưu tiên luôn trả lời, chấp nhận các bản sao lệch rồi dần khớp — đối lại ACID | [Bài 44](cap-5-sieu-nang-cao/44-cap-va-base.md) |
| Mở giao dịch | *BEGIN* | Bắt đầu một giao dịch; mọi lệnh sau đó thuộc về nó cho tới `COMMIT` hoặc `ROLLBACK` | [Bài 37](cap-4-ben-trong-dong-co/37-transaction-va-acid.md) |
| Hai ngôi | *binary* | Mối quan hệ có đúng hai tập thực thể tham gia — loại phổ biến nhất | [Bài 8](cap-1-mo-hinh-er/08-moi-quan-he-va-cardinality.md) |
| BSON | *Binary JSON* | JSON mã hoá sang nhị phân, kèm thêm kiểu ngày giờ, số nguyên 64 bit; dạng lưu trữ của MongoDB, cùng ý tưởng với `JSONB` | [Bài 47](cap-5-sieu-nang-cao/47-nosql-bon-ho.md) |
| Quét heap theo bitmap | *bitmap heap scan* | Gom mọi `ctid` từ index theo số trang trước, rồi đọc mỗi trang heap đúng một lần — `Bitmap Heap Scan` | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Phình | *bloat* | Bảng chiếm nhiều trang hơn hẳn lượng dữ liệu sống bên trong vì tích tụ tuple chết | [Bài 33](cap-4-ben-trong-dong-co/33-page-heap-tuple.md) |
| Khối | *block* | Tên gọi khác của trang — miếng 8KB mà PostgreSQL đọc ghi | [Bài 33](cap-4-ben-trong-dong-co/33-page-heap-tuple.md) |
| Index khoảng khối | *Block Range Index* (BRIN) | Lưu giá trị nhỏ nhất và lớn nhất cho mỗi dải 128 trang liền nhau; cực nhỏ, chỉ có ích khi tương quan gần 1 | [Bài 35](cap-4-ben-trong-dong-co/35-cac-loai-index-khac.md) |
| Vấn đề bị chặn | *blocking problem* | Điều phối viên 2PC sập sau khi mọi bên đã chuẩn bị: tất cả chờ, giữ khoá, không ai được tự quyết | [Bài 45](cap-5-sieu-nang-cao/45-distributed-transaction.md) |
| BCNF | *Boyce–Codd Normal Form* | Dạng chuẩn bỏ hẳn lối thoát của 3NF: mọi định thức đều phải là siêu khoá | [Bài 18](cap-2-chuan-hoa/18-dang-chuan-3nf-bcnf.md) |
| Ngăn | *bucket* | Ô chứa của index băm; hàm băm của giá trị quyết định giá trị rơi vào ngăn nào | [Bài 35](cap-4-ben-trong-dong-co/35-cac-loai-index-khac.md) |
| Tuỳ chọn đếm trang | *BUFFERS* | Tuỳ chọn của `EXPLAIN` in số trang mỗi nút đã chạm tới: `shared hit` từ bộ đệm, `read` phải xin hệ điều hành | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Lỗi Byzantine | *Byzantine fault* | Máy gửi thông tin sai hoặc cố ý lừa; Raft và Paxos không chống được | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |

## C

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Ứng viên | *candidate* | Máy Raft đang xin phiếu để làm lãnh đạo — khác *candidate key* (khoá dự tuyển) | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |
| Khoá dự tuyển | *candidate key* | Siêu khoá tối giản — bỏ bất kỳ cột nào là mất khả năng phân biệt | [Bài 12](cap-1-mo-hinh-er/12-bay-loai-khoa.md) |
| Định lý CAP | *CAP theorem* | Khi mạng bị chia cắt, hệ nhân bản không thể vừa nhất quán mạnh vừa sẵn sàng | [Bài 44](cap-5-sieu-nang-cao/44-cap-va-base.md) |
| Bản số | *cardinality* | Một thực thể phía này ghép được với tối đa bao nhiêu thực thể phía kia | [Bài 8](cap-1-mo-hinh-er/08-moi-quan-he-va-cardinality.md) |
| Lực lượng | *cardinality of a relation* | Số dòng của một bảng — đừng nhầm với *cardinality* (bản số) ở Bài 8 | [Bài 6](cap-1-mo-hinh-er/06-mo-hinh-quan-he.md) |
| Tỉ lệ bản số | *cardinality ratio* | Cách viết gọn bản số: 1:1, 1:N hoặc M:N | [Bài 8](cap-1-mo-hinh-er/08-moi-quan-he-va-cardinality.md) |
| Tích Descartes bùng nổ | *Cartesian explosion* | Quên điều kiện ghép nên số dòng nhân lên theo tích hai bảng — không báo lỗi, chỉ treo máy | [Bài 25](cap-3-sql/25-join.md) |
| Tích Descartes | *Cartesian product* | Phép × ghép mọi dòng bảng này với mọi dòng bảng kia, cho ra `m × n` dòng | [Bài 21](cap-3-sql/21-dai-so-quan-he.md) |
| Xoá lan | *CASCADE* | Xoá luôn mọi đối tượng phụ thuộc; mặc định của `DROP VIEW` là `RESTRICT`, tức từ chối khi còn phụ thuộc | [Bài 30](cap-3-sql/30-view-va-materialized-view.md) |
| Biểu thức điều kiện | *CASE expression* | Cách viết "nếu… thì…" ngay trong biểu thức SQL; bỏ `ELSE` thì trả `NULL` khi không nhánh nào khớp | [Bài 26](cap-3-sql/26-group-by-having.md) |
| Danh mục hệ thống | *catalog* | Tên gọi khác của từ điển dữ liệu | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Nhất quán nhân quả | *causal consistency* | Thao tác xảy ra vì đã thấy thao tác khác thì luôn được mọi người thấy sau nó | [Bài 44](cap-5-sieu-nang-cao/44-cap-va-base.md) |
| Điểm kiểm tra | *checkpoint* | Lúc ghi mọi trang đã sửa xuống tệp dữ liệu và dời điểm làm lại; WAL trước đó không còn cần để phục hồi | [Bài 40](cap-4-ben-trong-dong-co/40-wal-va-recovery.md) |
| Ký hiệu Chen | *Chen notation* | Bộ ký hiệu ER gốc năm 1976: mỗi loại phần tử một hình riêng, mỗi thuộc tính một elip treo ra ngoài | [Bài 10](cap-1-mo-hinh-er/10-bieu-do-er-ky-hieu-chen.md) |
| Phối hợp theo sự kiện | *choreography* | Mỗi dịch vụ phát sự kiện khi xong, dịch vụ khác nghe và làm tiếp; không ai chỉ huy | [Bài 45](cap-5-sieu-nang-cao/45-distributed-transaction.md) |
| Máy khách | *client* | Chương trình gõ cửa máy chủ để gửi câu lệnh, ví dụ `psql` | [Bài 5](cap-0-nhap-mon/05-cai-dat-postgresql.md) |
| Máy khách – máy chủ | *client–server* | Mô hình nhiều máy khách cùng kết nối tới một máy chủ giữ kho dữ liệu duy nhất | [Bài 5](cap-0-nhap-mon/05-cai-dat-postgresql.md) |
| Bao đóng của tập phụ thuộc hàm | *closure of F* | Tập mọi phụ thuộc hàm suy ra được từ `F`, ký hiệu `F⁺` | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Tính khả đóng | *closure property* | Mọi phép của đại số quan hệ đều trả về một quan hệ, nên lồng phép này vào phép kia được không giới hạn | [Bài 21](cap-3-sql/21-dai-so-quan-he.md) |
| Cụm cơ sở dữ liệu | *cluster* | Tập hợp các database do một máy chủ PostgreSQL quản lý | [Bài 5](cap-0-nhap-mon/05-cai-dat-postgresql.md) |
| Khoá sắp xếp cụm | *clustering key* | Trong Cassandra: thứ tự các dòng được sắp sẵn trên đĩa bên trong một phân vùng | [Bài 47](cap-5-sieu-nang-cao/47-nosql-bon-ho.md) |
| Bộ sưu tập | *collection* | Nhóm tài liệu cùng loại trong MongoDB, tương tự một bảng nhưng không ép mọi tài liệu có cùng các trường | [Bài 47](cap-5-sieu-nang-cao/47-nosql-bon-ho.md) |
| Cột | *column* | Cách gọi khác của *field* (trường) và *attribute* (thuộc tính) | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Cột rộng | *column-family* | Họ NoSQL lưu bảng khổng lồ mà mỗi dòng có bộ cột riêng | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Xác nhận | *COMMIT* | Chốt giao dịch: thay đổi thành vĩnh viễn và người khác nhìn thấy | [Bài 37](cap-4-ben-trong-dong-co/37-transaction-va-acid.md) |
| Chỉ số đã xác nhận | *commit index* | Vị trí của mục nhật ký cuối cùng đã được lưu trên túc số máy | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |
| Pha xác nhận | *commit phase* | Pha sau của 2PC: điều phối viên gửi quyết định chung, các bên làm theo và trả khoá | [Bài 45](cap-5-sieu-nang-cao/45-distributed-transaction.md) |
| Biểu thức bảng dùng chung | *Common Table Expression* (CTE) | Bảng tạm có tên, khai bằng `WITH` ở đầu câu lệnh và chỉ sống trong đúng câu lệnh đó | [Bài 28](cap-3-sql/28-cte-va-recursive-cte.md) |
| Giao dịch bù trừ | *compensating transaction* | Giao dịch mới làm ngược lại về nghiệp vụ một bước đã `COMMIT` — không phải `ROLLBACK`; phải thử lại được | [Bài 45](cap-5-sieu-nang-cao/45-distributed-transaction.md) |
| Đầy đủ (của hệ tiên đề) | *complete* | Mọi phụ thuộc hàm thật sự đúng đều suy ra được từ ba tiên đề Armstrong | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Thuộc tính phức hợp | *composite attribute* | Thuộc tính tách được thành nhiều thuộc tính con có ý nghĩa riêng | [Bài 7](cap-1-mo-hinh-er/07-thuc-the-va-thuoc-tinh.md) |
| Index phức hợp | *composite index* | Index trên nhiều cột, sắp theo cột đầu trước rồi mới tới cột sau | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Khoá phức hợp | *composite key* | Khoá gồm từ hai cột trở lên | [Bài 12](cap-1-mo-hinh-er/12-bay-loai-khoa.md) |
| Mức khái niệm (mức ý niệm) | *conceptual level* | Mức mô tả toàn bộ database — có bảng nào, cột nào, ràng buộc gì — dùng chung cho mọi người | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Đồng thời | *concurrency* | Nhiều người cùng đọc và ghi trên một tập dữ liệu tại cùng một thời điểm | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Đồng thuận | *consensus* | Nhiều máy cùng đồng ý một giá trị hoặc một thứ tự lệnh, dù có máy sập hay chậm | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |
| Tính nhất quán | *consistency* | Chữ **C** của ACID: giao dịch chỉ đưa database từ trạng thái hợp lệ sang trạng thái hợp lệ, theo các ràng buộc đã khai báo | [Bài 37](cap-4-ben-trong-dong-co/37-transaction-va-acid.md) |
| Băm nhất quán | *consistent hashing* | Xếp máy và khoá lên một vòng băm; thêm máy chỉ chuyển các khoá ngay trước nó, và chỉ sang máy mới | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |
| Vùng chứa | *container* | Cái hộp chạy sẵn một phần mềm, tách biệt hẳn với máy thật | [Bài 5](cap-0-nhap-mon/05-cai-dat-postgresql.md) |
| Điều phối viên | *coordinator* | Bên điều khiển 2PC, thu câu trả lời của các bên và ra quyết định chung | [Bài 45](cap-5-sieu-nang-cao/45-distributed-transaction.md) |
| Truy vấn con tương quan | *correlated subquery* | Truy vấn con có tham chiếu cột của truy vấn ngoài, nên về ngữ nghĩa phải chạy lại một lần cho mỗi dòng ngoài | [Bài 27](cap-3-sql/27-subquery-va-exists.md) |
| Tính tương quan | *correlation* | Thứ tự giá trị trong cột khớp tới đâu với thứ tự vật lý trên heap, từ −1 tới 1; lưu trong `pg_stats` | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Bộ tối ưu dựa trên chi phí | *cost-based optimizer* | Planner liệt kê nhiều cách chạy, ước lượng chi phí từng cách và chọn cách rẻ nhất theo ước lượng | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Index phủ | *covering index* | Index chứa đủ mọi cột truy vấn cần, thường nhờ `INCLUDE`, để chạy được `Index Only Scan` | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Phục hồi sau sự cố | *crash recovery* | Khởi động sau khi tắt đột ngột: làm lại WAL từ điểm làm lại của checkpoint cuối | [Bài 40](cap-4-ben-trong-dong-co/40-wal-va-recovery.md) |
| Kết nối chéo | *CROSS JOIN* | Cú pháp SQL của tích Descartes: ghép mọi dòng với mọi dòng, không có điều kiện | [Bài 25](cap-3-sql/25-join.md) |
| Chân quạ | *crow's foot* | Ba nhánh toẽ ra sát hình chữ nhật, nghĩa là phía nhiều | [Bài 11](cap-1-mo-hinh-er/11-bieu-do-er-crows-foot.md) |
| Ký hiệu Crow's Foot | *Crow's Foot notation* | Bộ ký hiệu ER gọn: cột liệt kê bên trong hình chữ nhật, bản số ghi bằng ký hiệu ở đầu đường | [Bài 11](cap-1-mo-hinh-er/11-bieu-do-er-crows-foot.md) |
| Địa chỉ tuple | *ctid* | Cặp (số trang, số con trỏ dòng); đổi sau mỗi `UPDATE` nên không bao giờ dùng làm khoá | [Bài 33](cap-4-ben-trong-dong-co/33-page-heap-tuple.md) |
| Gom theo mọi tổ hợp | *CUBE* | Mệnh đề sinh thêm dòng tổng cho mọi tổ hợp của các cột gom | [Bài 26](cap-3-sql/26-group-by-having.md) |
| Dòng hiện tại | *CURRENT ROW* | Dòng đang được tính trong một hàm cửa sổ; trong `ROWS` nó là **một** dòng, trong `RANGE` nó gồm **mọi** dòng đồng hạng | [Bài 29](cap-3-sql/29-window-function.md) |
| Chu trình trong dữ liệu | *cycle* | Vòng tròn cha–con trong một cây, thứ mà khoá ngoại tự tham chiếu không chặn được và gây đệ quy vô hạn | [Bài 28](cap-3-sql/28-cte-va-recursive-cte.md) |
| Cypher | *Cypher* | Ngôn ngữ truy vấn đồ thị của Neo4j, vẽ đường đi cần tìm bằng ký tự `(nút)-[:CẠNH]->(nút)` | [Bài 47](cap-5-sieu-nang-cao/47-nosql-bon-ho.md) |

## D

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Dữ liệu | *data* | Sự kiện thô đã được ghi lại, chưa qua xử lý | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Làm sạch dữ liệu | *data cleansing* | Việc dọn dữ liệu đã gõ sai, gõ thiếu hoặc gõ không thống nhất — khác hẳn chuẩn hoá | [Bài 18](cap-2-chuan-hoa/18-dang-chuan-3nf-bcnf.md) |
| Ngôn ngữ điều khiển dữ liệu | *Data Control Language* (DCL) | Nhóm lệnh SQL cấp và thu hồi quyền: `GRANT`, `REVOKE` | [Bài 22](cap-3-sql/22-ddl-va-kieu-du-lieu.md) |
| Ngôn ngữ định nghĩa dữ liệu | *Data Definition Language* (DDL) | Nhóm lệnh SQL dựng và sửa cấu trúc: `CREATE`, `ALTER`, `DROP`, `TRUNCATE` | [Bài 22](cap-3-sql/22-ddl-va-kieu-du-lieu.md) |
| Từ điển dữ liệu | *data dictionary* | Các bảng nằm trong chính database, dùng để lưu lược đồ của nó | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Độc lập dữ liệu | *data independence* | Khả năng sửa một mức mà không phải sửa mức phía trên | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Toàn vẹn dữ liệu | *data integrity* | Tính đúng đắn và nhất quán của dữ liệu trong suốt vòng đời của nó | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Ngôn ngữ thao tác dữ liệu | *Data Manipulation Language* (DML) | Nhóm lệnh SQL làm việc với nội dung bảng: `INSERT`, `UPDATE`, `DELETE`, `SELECT` | [Bài 22](cap-3-sql/22-ddl-va-kieu-du-lieu.md) |
| Mô hình dữ liệu | *data model* | Tập quy ước về cách tổ chức dữ liệu, ràng buộc đặt được và phép thao tác dùng được | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Ngôn ngữ truy vấn dữ liệu (DQL) | *Data Query Language* | Tên mà một số tài liệu tách riêng cho `SELECT`, vì nó chỉ đọc chứ không sửa; chuẩn SQL xếp `SELECT` vào DML | [Bài 22](cap-3-sql/22-ddl-va-kieu-du-lieu.md) |
| Dư thừa dữ liệu | *data redundancy* | Cùng một sự thật được lưu ở nhiều chỗ | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Kiểu dữ liệu | *data type* | Khai báo loại giá trị một cột được phép chứa — quyết định cả miền giá trị, cách so sánh, phép toán dùng được và dung lượng | [Bài 22](cap-3-sql/22-ddl-va-kieu-du-lieu.md) |
| Cơ sở dữ liệu | *database* | Tập hợp các bảng có liên quan, được tổ chức để dễ dùng lại | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Lược đồ cơ sở dữ liệu | *database schema* | Toàn bộ lược đồ quan hệ của một database ghép lại | [Bài 6](cap-1-mo-hinh-er/06-mo-hinh-quan-he.md) |
| Hệ cơ sở dữ liệu | *database system* | DBMS cộng các database nó quản lý, cộng người dùng và ứng dụng dùng chúng | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Hệ quản trị cơ sở dữ liệu | *DBMS — database management system* | Phần mềm quản lý cơ sở dữ liệu, ví dụ PostgreSQL, MySQL, Oracle | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Tuple chết | *dead tuple* | Phiên bản cũ của một dòng sau `UPDATE`/`DELETE`, không ai còn thấy nhưng vẫn chiếm chỗ tới khi `VACUUM` dọn | [Bài 33](cap-4-ben-trong-dong-co/33-page-heap-tuple.md) |
| Bế tắc | *deadlock* | Hai giao dịch chờ khoá của nhau nên không ai đi tiếp được; hay xảy ra khi chúng lấy khoá theo hai thứ tự khác nhau | [Bài 41](cap-4-ben-trong-dong-co/41-lock-va-deadlock.md) |
| Khai báo | *declarative* | Kiểu ngôn ngữ chỉ mô tả thứ mình muốn, để phần mềm tự tìm cách lấy | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Luật tách | *decomposition* | Luật suy diễn: `X → YZ` thì `X → Y` và `X → Z` | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Khử trùng lặp | *deduplication* | Index B-Tree ghi một khoá lặp nhiều lần đúng một lần kèm danh sách `ctid`, nên index trên cột nhiều giá trị trùng gọn hơn tỉ lệ | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Phân vùng mặc định | *default partition* | Phân vùng hứng mọi dòng không thuộc phân vùng nào khác — `DEFAULT` | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |
| Giá trị mặc định | *default value* | Giá trị DBMS tự điền khi câu `INSERT` không nhắc tới cột; nó **không** thay được cho `NOT NULL` | [Bài 22](cap-3-sql/22-ddl-va-kieu-du-lieu.md) |
| Ràng buộc hoãn | *deferrable constraint* | Ràng buộc hoãn được việc kiểm tra tới lúc `COMMIT` thay vì kiểm ngay | [Bài 15](cap-1-mo-hinh-er/15-rang-buoc-toan-ven.md) |
| Bậc của quan hệ | *degree / arity* | Số cột của một bảng | [Bài 6](cap-1-mo-hinh-er/06-mo-hinh-quan-he.md) |
| Bậc của mối quan hệ | *degree of a relationship* | Số tập thực thể tham gia vào một mối quan hệ | [Bài 8](cap-1-mo-hinh-er/08-moi-quan-he-va-cardinality.md) |
| Xoá dòng | *delete* | Lệnh DML bỏ các dòng thoả điều kiện; đi qua từng dòng nên kiểm khoá ngoại và kích hoạt trigger | [Bài 23](cap-3-sql/23-dml-insert-update-delete.md) |
| Bất thường khi xoá | *deletion anomaly* | Xoá một sự thật thì vô tình mất luôn một sự thật khác | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Phi chuẩn hoá | *denormalization* | Cố ý đưa dư thừa trở lại một lược đồ **đã được chuẩn hoá**, để đổi lấy tốc độ đọc | [Bài 20](cap-2-chuan-hoa/20-denormalization.md) |
| Bảo toàn phụ thuộc | *dependency preservation* | Phép tách mà gom các phụ thuộc hàm kiểm được trên từng bảng con lại vẫn suy ra được toàn bộ `F⁺` | [Bài 18](cap-2-chuan-hoa/18-dang-chuan-3nf-bcnf.md) |
| Cột tính sẵn | *derived / computed column* | Cột lưu sẵn kết quả một phép tính từ dữ liệu khác | [Bài 20](cap-2-chuan-hoa/20-denormalization.md) |
| Thuộc tính dẫn xuất | *derived attribute* | Thuộc tính tính ra được từ thuộc tính khác hoặc từ bảng khác | [Bài 7](cap-1-mo-hinh-er/07-thuc-the-va-thuoc-tinh.md) |
| Phép dẫn xuất | *derived operation* | Phép của đại số quan hệ viết lại được bằng các phép cơ bản — gồm ∩, ⋈ và ÷ | [Bài 21](cap-3-sql/21-dai-so-quan-he.md) |
| Bảng dẫn xuất | *derived table* | Truy vấn con đặt trong `FROM` và dùng như một bảng; PostgreSQL bắt buộc phải đặt bí danh cho nó | [Bài 27](cap-3-sql/27-subquery-va-exists.md) |
| Định thức | *determinant* | Vế trái của một phụ thuộc hàm — thứ mà khi biết nó thì biết được vế phải | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Phép hiệu | *difference* | Phép − lấy những dòng có ở quan hệ trái mà không có ở quan hệ phải; trong SQL là `EXCEPT` | [Bài 21](cap-3-sql/21-dai-so-quan-he.md) |
| Đọc bẩn | *dirty read* | Đọc được dữ liệu một giao dịch khác đã ghi mà chưa xác nhận; PostgreSQL không bao giờ để xảy ra | [Bài 38](cap-4-ben-trong-dong-co/38-isolation-level-va-anomaly.md) |
| Ràng buộc disjoint | *disjoint* | Mỗi thực thể lớp cha thuộc tối đa một lớp con | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Giao dịch phân tán | *distributed transaction* | Giao dịch có thao tác trên nhiều database độc lập mà vẫn cần tất cả hoặc không gì cả | [Bài 45](cap-5-sieu-nang-cao/45-distributed-transaction.md) |
| Phép chia | *division* | Phép ÷ trả lời câu hỏi "giá trị nào đi kèm với **toàn bộ** một tập cho trước"; SQL không có từ khoá riêng cho nó | [Bài 21](cap-3-sql/21-dai-so-quan-he.md) |
| Tài liệu | *document* | Họ NoSQL lưu mỗi bản ghi thành một tệp JSON tự chứa mọi thứ | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Dấu nháy đô la | *dollar quoting* | Cách bọc thân hàm bằng `$$ ... $$` để khỏi phải nhân đôi mọi dấu nháy đơn bên trong | [Bài 31](cap-3-sql/31-trigger-procedure-function.md) |
| Miền giá trị | *domain* | Tập hợp tất cả các giá trị hợp lệ mà một thuộc tính được phép nhận | [Bài 6](cap-1-mo-hinh-er/06-mo-hinh-quan-he.md) |
| Toàn vẹn miền | *domain integrity* | Mọi ô phải nằm trong miền giá trị hợp lệ của cột | [Bài 15](cap-1-mo-hinh-er/15-rang-buoc-toan-ven.md) |
| Ghi kép | *dual write* | Ghi database và gửi thông điệp thành hai việc riêng — sập giữa chừng thì hai bên lệch nhau | [Bài 45](cap-5-sieu-nang-cao/45-distributed-transaction.md) |
| Tính bền vững | *durability* | Chữ **D** của ACID: đã `COMMIT` thì không mất, kể cả mất điện ngay sau đó | [Bài 37](cap-4-ben-trong-dong-co/37-transaction-va-acid.md) |

## E

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Cạnh | *edge* | Mối nối có tên và có hướng giữa hai nút trong database đồ thị, cũng mang thuộc tính | [Bài 47](cap-5-sieu-nang-cao/47-nosql-bon-ho.md) |
| Mô hình ER mở rộng | *EER — Enhanced ER / Extended ER* | Mô hình ER cơ bản cộng thêm lớp cha – lớp con, các ràng buộc chuyên biệt hoá, và kết tập | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Thời gian chờ bầu cử | *election timeout* | Không nghe lãnh đạo quá thời gian này thì ứng cử; chọn ngẫu nhiên để tránh phiếu chia đều | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |
| Tài liệu lồng | *embedded document* | Đối tượng con nằm ngay trong tài liệu cha, đọc cùng một lần; hợp với dữ liệu có giới hạn và thuộc riêng tài liệu cha | [Bài 47](cap-5-sieu-nang-cao/47-nosql-bon-ho.md) |
| Thực thể | *entity* | Một đối tượng cụ thể ngoài đời mà ta muốn lưu dữ liệu, và phân biệt được với đối tượng khác | [Bài 7](cap-1-mo-hinh-er/07-thuc-the-va-thuoc-tinh.md) |
| Toàn vẹn thực thể | *entity integrity* | Khoá chính không bao giờ được `NULL`, và không bao giờ được trùng | [Bài 15](cap-1-mo-hinh-er/15-rang-buoc-toan-ven.md) |
| Tập thực thể | *entity set* | Tập hợp mọi thực thể cùng loại — chính nó mới là thứ trở thành một bảng | [Bài 7](cap-1-mo-hinh-er/07-thuc-the-va-thuoc-tinh.md) |
| Biểu đồ ER | *Entity–Relationship Diagram / ERD* | Bản vẽ mô tả các tập thực thể, thuộc tính của chúng, và các mối quan hệ giữa chúng | [Bài 10](cap-1-mo-hinh-er/10-bieu-do-er-ky-hieu-chen.md) |
| Kết nối bằng | *equi join* | Kết nối mà điều kiện chỉ gồm các phép so sánh bằng — loại chiếm phần lớn công việc thực tế | [Bài 21](cap-3-sql/21-dai-so-quan-he.md) |
| Ánh xạ ER sang quan hệ | *ER-to-relational mapping* | Thuật toán bảy bước chuyển một biểu đồ ER thành các bảng | [Bài 14](cap-1-mo-hinh-er/14-chuyen-er-sang-bang.md) |
| Chi phí ước lượng | *estimated cost* | Con số planner dùng để so các kế hoạch, đo bằng đơn vị tuỳ ý với mốc đọc một trang tuần tự = 1 — không phải mili giây | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Nhất quán cuối cùng | *eventual consistency* | Ngừng ghi đủ lâu thì mọi bản sao sẽ giống nhau — không hứa khi nào, không hứa giống nhau ở giá trị đúng | [Bài 44](cap-5-sieu-nang-cao/44-cap-va-base.md) |
| Bảng ảo dòng bị từ chối | *EXCLUDED* | Bảng ảo trong `ON CONFLICT DO UPDATE`, chứa đúng dòng **mới** vừa định thêm nhưng bị đụng độ | [Bài 23](cap-3-sql/23-dml-insert-update-delete.md) |
| Ràng buộc loại trừ | *exclusion constraint* | Cấm hai dòng cùng thoả một bộ toán tử, ví dụ cùng phòng và giờ chồng nhau; cưỡng chế bằng index GiST | [Bài 35](cap-4-ben-trong-dong-co/35-cac-loai-index-khac.md) |
| Khoá độc quyền | *exclusive lock* | Khoá chỉ một giao dịch giữ; xung đột với mọi khoá khác trên cùng đối tượng | [Bài 41](cap-4-ben-trong-dong-co/41-lock-va-deadlock.md) |
| Kế hoạch thực thi | *execution plan* | Cách chạy cụ thể mà planner đã chọn cho một câu truy vấn | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Ràng buộc tồn tại | *existence dependency* | Tên gọi khác của tham gia toàn phần: thực thể không được phép tồn tại nếu thiếu liên kết đó | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |
| Lệnh xem kế hoạch | *EXPLAIN* | In kế hoạch thực thi mà không chạy; thêm `ANALYZE` để chạy thật và đo, thêm `BUFFERS` để đếm trang | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Index biểu thức | *expression index* | Index trên kết quả của một biểu thức `IMMUTABLE`, như `lower(ho_ten)`; chỉ dùng khi truy vấn viết đúng biểu thức đó | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Mức ngoài | *external level* | Mức mô tả góc nhìn của từng người dùng, mỗi người chỉ thấy phần dữ liệu liên quan tới mình | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |

## F

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Định lý Fagin | *Fagin's theorem* | `R` tách đôi không mất mát khi và chỉ khi có phụ thuộc đa trị tương ứng | [Bài 19](cap-2-chuan-hoa/19-dang-chuan-4nf-5nf-6nf.md) |
| Chuyển đổi dự phòng | *failover* | Đưa một máy bản sao lên thay máy chính đã sập: phát hiện, chọn, nâng lên, chuyển hướng | [Bài 42](cap-5-sieu-nang-cao/42-replication.md) |
| Hệ số phân nhánh | *fan-out* | Số nhánh con của một nút trong cây index — vài trăm với khoá số nguyên, nên cây rất nông | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Rào chắn | *fencing* | Biện pháp bảo đảm máy chính cũ không thể ghi nữa trước khi nâng máy mới lên | [Bài 42](cap-5-sieu-nang-cao/42-replication.md) |
| Trường | *field* | Một cột trong bảng — cách gọi khác của *column* và *attribute* | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Dạng chuẩn 5 | *Fifth Normal Form — 5NF / PJ-NF* | Mọi phụ thuộc kết nối không tầm thường của bảng đều suy ra được từ các khoá dự tuyển | [Bài 19](cap-2-chuan-hoa/19-dang-chuan-4nf-5nf-6nf.md) |
| Hệ số lấp đầy | *fill factor* | Tỉ lệ phần trăm một trang được lấp khi thêm dòng, chừa phần còn lại cho `UPDATE` cùng trang | [Bài 33](cap-4-ben-trong-dong-co/33-page-heap-tuple.md) |
| Lọc riêng cho một hàm | *FILTER* | Mệnh đề `FILTER (WHERE ...)` cho một hàm tổng hợp chỉ nhìn phần dòng nó cần | [Bài 26](cap-3-sql/26-group-by-having.md) |
| Dạng chuẩn 1 | *First Normal Form — 1NF* | Mọi ô nguyên tử, không nhóm lặp, cột có tên riêng và cùng kiểu, thứ tự dòng và cột vô nghĩa, bảng có khoá chính | [Bài 17](cap-2-chuan-hoa/17-dang-chuan-1nf-2nf.md) |
| Bảng bẹt | *flat table* | Một bảng duy nhất nhồi mọi thứ vào — gốc rễ của dư thừa và ba loại bất thường | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Nút theo sau | *follower* | Máy thụ động trong cụm Raft, trả lời lãnh đạo và ứng viên | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |
| Khoá ngoại | *foreign key* | Cột mang giá trị khoá chính của bảng khác, và chỉ được chứa giá trị có thật ở bảng đó | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Dạng chuẩn 4 | *Fourth Normal Form — 4NF* | Bảng đã ở BCNF và mọi định thức đa trị đều là siêu khoá | [Bài 19](cap-2-chuan-hoa/19-dang-chuan-4nf-5nf-6nf.md) |
| Bản đồ chỗ trống | *free space map* | Tệp phụ ghi mỗi trang còn trống bao nhiêu, để lần ghi sau biết chỗ mà nhét | [Bài 33](cap-4-ben-trong-dong-co/33-page-heap-tuple.md) |
| Đóng băng | *freeze* | `VACUUM` đánh dấu tuple đủ cũ là thấy được với mọi người, để khỏi bị cuộn vòng mã giao dịch | [Bài 39](cap-4-ben-trong-dong-co/39-mvcc.md) |
| Đẩy xuống đĩa | *fsync* | Lời gọi hệ thống bắt hệ điều hành ghi dữ liệu từ bộ nhớ đệm ra thiết bị lưu trữ thật; tắt nó có thể làm hỏng dữ liệu | [Bài 40](cap-4-ben-trong-dong-co/40-wal-va-recovery.md) |
| Phụ thuộc đầy đủ | *full functional dependency* | `X → Y` mà bỏ bất kỳ thuộc tính nào khỏi `X` là luật không còn đúng | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Kết nối ngoài đầy đủ | *FULL OUTER JOIN* | Giữ mọi dòng của cả hai bảng — dùng để đối chiếu hai danh sách và thấy phần lệch ở hai phía | [Bài 25](cap-3-sql/25-join.md) |
| Ghi trọn trang | *full-page writes* | Lần sửa đầu tiên của mỗi trang sau checkpoint chép nguyên trang vào WAL, chống trang rách khi mất điện | [Bài 40](cap-4-ben-trong-dong-co/40-wal-va-recovery.md) |
| Tìm kiếm toàn văn | *full-text search* | Tìm theo **từ** trong văn bản thay vì theo chuỗi con, có xếp mức liên quan và dùng được index `GIN` | [Bài 32](cap-3-sql/32-jsonb-va-full-text-search.md) |
| Phụ thuộc hàm | *functional dependency* | Luật *biết `X` thì biết chắc `Y`*, đúng với mọi trạng thái dữ liệu — Cấp 2 viết tắt là **PTH** | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |

## G

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Tổng quát hoá | *generalization* | Đi từ nhiều tập thực thể riêng lên, gom phần chung lại thành lớp cha | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Chỉ mục đảo tổng quát | *Generalized Inverted Index* (GIN) | Loại index cho cột mà một giá trị chứa nhiều phần tử — JSONB, `tsvector`, mảng; nó lưu "phần tử này nằm ở những dòng nào" | [Bài 32](cap-3-sql/32-jsonb-va-full-text-search.md) |
| Cây tìm kiếm tổng quát | *Generalized Search Tree* (GiST) | Khung cây lưu vùng bao ở mỗi nút; phục vụ hình học, khoảng, tìm gần nhất, ràng buộc loại trừ | [Bài 35](cap-4-ben-trong-dong-co/35-cac-loai-index-khac.md) |
| Cột sinh sẵn | *generated column* | Cột có giá trị tính từ các cột khác bằng một biểu thức `IMMUTABLE`, tự cập nhật mà không cần trigger | [Bài 32](cap-3-sql/32-jsonb-va-full-text-search.md) |
| Đồ thị | *graph* | Họ NoSQL lưu các điểm nối nhau bằng cạnh có nhãn | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Gom nhóm | *GROUP BY* | Gom các dòng cùng giá trị thành nhóm rồi áp hàm tổng hợp lên từng nhóm; không sinh nhóm rỗng | [Bài 26](cap-3-sql/26-group-by-having.md) |
| Tập gom tự chọn | *GROUPING SETS* | Mệnh đề cho phép tự liệt kê chính xác các tổ hợp gom — dạng tổng quát của `ROLLUP` và `CUBE` | [Bài 26](cap-3-sql/26-group-by-having.md) |

## H

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Index băm | *hash index* | Index chỉ trả lời phép so sánh bằng, lưu mã băm thay cho giá trị — chỉ nhỏ hơn B-Tree khi khoá rất dài | [Bài 35](cap-4-ben-trong-dong-co/35-cac-loai-index-khac.md) |
| Nối băm | *hash join* | Dựng bảng băm từ bảng nhỏ rồi quét bảng lớn một lượt; thắng khi cả hai bên nhiều dòng | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Phân vùng theo băm | *hash partitioning* | Chia theo số dư của hàm băm khoá cho `MODULUS`; rải đều nhưng chỉ cắt tỉa được phép bằng | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |
| Vòng băm | *hash ring* | Vòng tròn mọi giá trị băm trong băm nhất quán; khoá thuộc máy đầu tiên gặp theo chiều kim đồng hồ | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |
| Lọc nhóm | *HAVING* | Lọc trên **nhóm** sau khi đã gom, nên dùng được hàm tổng hợp; khác `WHERE` vốn lọc từng dòng | [Bài 26](cap-3-sql/26-group-by-having.md) |
| Tệp đống | *heap* | Tệp chứa các dòng của một bảng, xếp không theo thứ tự nào | [Bài 33](cap-4-ben-trong-dong-co/33-page-heap-tuple.md) |
| Cập nhật chỉ trên heap | *Heap-Only Tuple* (HOT) | `UPDATE` mà tuple mới nằm cùng trang và không cột nào có index bị sửa — khỏi phải sửa index | [Bài 33](cap-4-ben-trong-dong-co/33-page-heap-tuple.md) |
| Nhịp tim | *heartbeat* | Tin nhắn đều đặn của lãnh đạo báo "tôi còn sống" | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |
| Mô hình phân cấp | *hierarchical model* | Mô hình tổ chức dữ liệu thành cây: mỗi bản ghi có đúng một bản ghi cha | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Biểu đồ tần suất | *histogram* | Các mốc chia giá trị của cột thành khoảng 100 khoảng có số dòng xấp xỉ bằng nhau, dùng để ước lượng điều kiện khoảng | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Mở rộng ngang | *horizontal scaling* | Tăng sức chứa bằng cách thêm máy, thay vì mua một máy to hơn | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Mảnh nóng | *hot shard* | Mảnh phải gánh phần việc nặng hơn hẳn các mảnh khác, thường do khoá tăng dần theo thời gian | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |

## I

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Khoá luỹ đẳng | *idempotency key* | Mã duy nhất của một thông điệp hay yêu cầu, để bên nhận nhận ra và bỏ qua lần trùng | [Bài 45](cap-5-sieu-nang-cao/45-distributed-transaction.md) |
| Luỹ đẳng | *idempotent* | Thao tác chạy lại lần thứ hai cho cùng kết quả và không báo lỗi, ví dụ `CREATE EXTENSION IF NOT EXISTS` | [Bài 32](cap-3-sql/32-jsonb-va-full-text-search.md) |
| Định danh | *identifier* | Giá trị dùng để phân biệt bản ghi này với bản ghi khác | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Quan hệ nhận diện | *identifying relationship* | Mối quan hệ nối thực thể yếu với thực thể chủ cho nó mượn khoá | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |
| Ảnh | *image* | Khuôn mẫu dùng để tạo ra một vùng chứa | [Bài 5](cap-0-nhap-mon/05-cai-dat-postgresql.md) |
| Bất biến | *IMMUTABLE* | Cam kết một hàm cùng tham số thì luôn cho cùng kết quả mãi mãi; khai sai cho hàm đọc bảng sinh kết quả sai không tái hiện được | [Bài 31](cap-3-sql/31-trigger-procedure-function.md) |
| Chỉ mục | *index* | Cấu trúc ở mức trong giúp tìm dữ liệu nhanh hơn | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Phương thức truy cập index | *index access method* | Cách tổ chức một index — `btree`, `hash`, `gist`, `spgist`, `gin`, `brin` — chọn bằng `USING` | [Bài 35](cap-4-ben-trong-dong-co/35-cac-loai-index-khac.md) |
| Quét theo index | *index scan* | Đi cây index rồi nhảy sang heap cho từng khoá — `Index Scan` | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Quét chỉ index | *index-only scan* | Lấy dữ liệu thẳng từ index, không đụng heap — cần trang đã được đánh dấu trong bản đồ hiển thị | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Đệ quy vô hạn | *infinite recursion* | Phần đệ quy của CTE không bao giờ trả về rỗng, nên câu lệnh chạy tới khi hết dung lượng đĩa tạm | [Bài 28](cap-3-sql/28-cte-va-recursive-cte.md) |
| Thông tin | *information* | Kết quả sau khi xử lý dữ liệu để trả lời một câu hỏi | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Ký hiệu IE | *Information Engineering notation* | Tên gọi học thuật khác của Crow's Foot | [Bài 11](cap-1-mo-hinh-er/11-bieu-do-er-crows-foot.md) |
| Nội tuyến | *inline* | Trộn định nghĩa một CTE thẳng vào truy vấn ngoài, để bộ tối ưu xử lý cả hai như một khối | [Bài 28](cap-3-sql/28-cte-va-recursive-cte.md) |
| Kết nối trong | *INNER JOIN* | Chỉ giữ những cặp dòng khớp nhau ở cả hai bảng — nên âm thầm đánh rơi dòng khi khoá ngoại là `NULL` | [Bài 25](cap-3-sql/25-join.md) |
| Thêm dòng | *insert* | Lệnh DML đưa một hoặc nhiều dòng mới vào bảng | [Bài 23](cap-3-sql/23-dml-insert-update-delete.md) |
| Bất thường khi thêm | *insertion anomaly* | Không ghi được một sự thật vì thiếu một sự thật khác chẳng liên quan | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Thực thể lưu trữ (thể hiện) | *instance* | Dữ liệu đang nằm trong lược đồ tại một thời điểm cụ thể | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Ràng buộc toàn vẹn | *integrity constraint* | Luật khai trong lược đồ, mà database bắt buộc kiểm tra trước mọi thay đổi dữ liệu | [Bài 15](cap-1-mo-hinh-er/15-rang-buoc-toan-ven.md) |
| Mức trong | *internal level* | Mức mô tả dữ liệu thật sự được ghi xuống đĩa như thế nào | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Nút trong | *internal node* | Trang ở tầng giữa của cây index, chỉ chứa khoá và con trỏ xuống tầng dưới | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Phép giao | *intersection* | Phép ∩ lấy những dòng có mặt ở cả hai quan hệ; trong SQL là `INTERSECT` | [Bài 21](cap-3-sql/21-dai-so-quan-he.md) |
| Quan hệ IS-A | *IS-A relationship* | Quan hệ *một A là một B* giữa lớp con và lớp cha | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Tính cô lập | *isolation* | Chữ **I** của ACID: các giao dịch chạy đồng thời không thấy trạng thái dở dang của nhau | [Bài 37](cap-4-ben-trong-dong-co/37-transaction-va-acid.md) |
| Mức cô lập | *isolation level* | Mức độ database cam kết các giao dịch đồng thời cư xử như chạy lần lượt; mức càng cao càng ít hiện tượng lạ | [Bài 38](cap-4-ben-trong-dong-co/38-isolation-level-va-anomaly.md) |

## J

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Phụ thuộc kết nối | *join dependency* | Bảng luôn bằng đúng phép nối tự nhiên của các hình chiếu của chính nó | [Bài 19](cap-2-chuan-hoa/19-dang-chuan-4nf-5nf-6nf.md) |
| Bảng trung gian | *junction table / associative table* | Bảng thứ ba sinh ra để hiện thực một mối quan hệ M:N | [Bài 8](cap-1-mo-hinh-er/08-moi-quan-he-va-cardinality.md) |

## K

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Thuộc tính khoá (mức ER) | *key attribute* | Thuộc tính, hoặc nhóm thuộc tính, phân biệt được mọi thực thể trong tập thực thể | [Bài 7](cap-1-mo-hinh-er/07-thuc-the-va-thuoc-tinh.md) |
| Khoá–giá trị | *key-value* | Họ NoSQL tra khoá ra giá trị, như một cuốn từ điển | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |

## L

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Lần ghi sau thắng | *last-write-wins* (LWW) | Khớp xung đột bằng cách giữ lần ghi có dấu thời gian lớn hơn, lặng lẽ bỏ lần kia; đồng hồ lệch thì giữ nhầm | [Bài 44](cap-5-sieu-nang-cao/44-cap-va-base.md) |
| Độ trễ | *latency* | Thời gian một yêu cầu phải chờ để có câu trả lời | [Bài 44](cap-5-sieu-nang-cao/44-cap-va-base.md) |
| Kết nối ngang | *lateral join* | Phép ghép cho bảng bên phải **đọc được cột của dòng bên trái** đang xét; cơ chế duy nhất để một hàm trả bảng nhận tham số từ bảng đang quét | [Bài 32](cap-3-sql/32-jsonb-va-full-text-search.md) |
| Nút lãnh đạo | *leader* | Máy duy nhất trong cụm Raft nhận yêu cầu ghi và gửi nhật ký cho các máy khác | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |
| Bầu lãnh đạo | *leader election* | Nút theo sau hết thời gian chờ thì ứng cử, gom túc số phiếu thì làm lãnh đạo | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |
| Nút lá | *leaf node* | Trang ở tầng dưới cùng của cây index, chứa mọi khoá kèm `ctid`, nối với lá bên cạnh | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Kết nối ngoài bên trái | *LEFT OUTER JOIN* | Giữ mọi dòng bảng trái; các cột bên phải được điền `NULL` khi không tìm được dòng khớp | [Bài 25](cap-3-sql/25-join.md) |
| Quy tắc cột trái nhất | *leftmost prefix rule* | Index phức hợp chỉ dùng được khi điều kiện chứa một đoạn đầu liên tục của danh sách cột | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Từ tố | *lexeme* | Một từ đã được chuẩn hoá trong `tsvector` — đơn vị mà full-text search thật sự so khớp | [Bài 32](cap-3-sql/32-jsonb-va-full-text-search.md) |
| Con trỏ dòng | *line pointer* | Ô 4 byte ở đầu trang ghi vị trí của một tuple; cho phép dời tuple trong trang mà không đổi địa chỉ | [Bài 33](cap-4-ben-trong-dong-co/33-page-heap-tuple.md) |
| Tuyến tính hoá được | *linearizability* | Tên chính xác của nhất quán mạnh: mọi thao tác như xảy ra tức thì, theo một thứ tự khớp đồng hồ thật | [Bài 44](cap-5-sieu-nang-cao/44-cap-va-base.md) |
| Phân vùng theo danh sách | *list partitioning* | Mỗi phân vùng giữ một danh sách giá trị rời rạc | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |
| Khoá (đồng thời) | *lock* | Quyền tạm thời một giao dịch giữ trên bảng hoặc dòng để chặn việc xung đột, giữ tới hết giao dịch; khác với khoá chính/khoá ngoại (*key*) | [Bài 41](cap-4-ben-trong-dong-co/41-lock-va-deadlock.md) |
| Tranh chấp khoá | *lock contention* | Nhiều giao dịch phải xếp hàng chờ khoá cùng một dòng, làm thông lượng ghi sụt hẳn | [Bài 41](cap-4-ben-trong-dong-co/41-lock-va-deadlock.md) |
| Hàng đợi khoá | *lock queue* | Người chờ khoá xếp theo thứ tự đến; xin khoá tương thích vẫn phải chờ sau người đang chờ mà xung đột | [Bài 41](cap-4-ben-trong-dong-co/41-lock-va-deadlock.md) |
| Nhân bản nhật ký | *log replication* | Lãnh đạo gửi các mục nhật ký mới cho nút theo sau và xác nhận khi túc số máy đã lưu | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |
| Số thứ tự nhật ký | *Log Sequence Number* (LSN) | Vị trí byte của một bản ghi trong WAL, dạng `0/1AB50910`; chỉ tăng | [Bài 40](cap-4-ben-trong-dong-co/40-wal-va-recovery.md) |
| Độc lập dữ liệu logic | *logical data independence* | Đổi mức khái niệm mà mức ngoài không phải đổi theo | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Mức logic | *logical level* | Mức đã biết sẽ có bảng nào, cột nào, nhưng chưa chọn hệ quản trị và chưa nói tới lưu trữ vật lý | [Bài 11](cap-1-mo-hinh-er/11-bieu-do-er-crows-foot.md) |
| Thứ tự thực thi logic | *logical query processing order* | Trình tự ngữ nghĩa `FROM` → `WHERE` → `GROUP BY` → `HAVING` → `SELECT` → `DISTINCT` → `ORDER BY` → `LIMIT`, khác thứ tự viết | [Bài 26](cap-3-sql/26-group-by-having.md) |
| Nhân bản logic | *logical replication* | Gửi thay đổi ở mức dòng; chọn từng bảng, bên nhận ghi được, cần `wal_level = logical` | [Bài 42](cap-5-sieu-nang-cao/42-replication.md) |
| Phân rã không mất mát | *lossless-join decomposition* | Tách bảng rồi nối lại ra đúng bảng gốc: không thiếu dòng nào và không sinh thêm dòng nào | [Bài 18](cap-2-chuan-hoa/18-dang-chuan-3nf-bcnf.md) |
| Index xấp xỉ | *lossy index* | Index có thể trả thừa dòng; PostgreSQL kiểm tra lại trên heap (`Recheck Cond`) nên kết quả vẫn đúng | [Bài 35](cap-4-ben-trong-dong-co/35-cac-loai-index-khac.md) |
| Mất cập nhật | *lost update* | Người này lưu đè mất phần người kia vừa ghi, vì mỗi người giữ một bản chụp riêng | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |

## M

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Vật chất hoá | *materialization* | Tính xong một bước rồi lưu kết quả thành bảng tạm, thay vì trộn vào truy vấn ngoài để tối ưu chung | [Bài 28](cap-3-sql/28-cte-va-recursive-cte.md) |
| Khung nhìn vật chất hoá | *materialized view* | Khung nhìn **có lưu** dữ liệu thật, phải `REFRESH` mới cập nhật | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Nối trộn | *merge join* | Đi song song hai danh sách đã sắp theo cột nối; thắng khi dữ liệu đã có thứ tự | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Bộ chuyển thông điệp | *message broker* | Chương trình nhận thông điệp và chuyển tới các dịch vụ đang nghe, như Kafka, RabbitMQ | [Bài 45](cap-5-sieu-nang-cao/45-distributed-transaction.md) |
| Lệnh meta | *meta-command* | Lệnh của riêng `psql`, bắt đầu bằng `\` và không có dấu chấm phẩy | [Bài 5](cap-0-nhap-mon/05-cai-dat-postgresql.md) |
| Siêu dữ liệu | *metadata* | Dữ liệu nói về dữ liệu | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Phủ tối thiểu | *minimal cover / canonical cover* | Bản rút gọn hết cỡ của một tập phụ thuộc hàm, vẫn suy ra được y hệt tập gốc | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Đọc đơn điệu | *monotonic reads* | Đã thấy giá trị mới thì không bao giờ đọc lại được giá trị cũ hơn | [Bài 44](cap-5-sieu-nang-cao/44-cap-va-base.md) |
| Giá trị phổ biến nhất | *most common values* (MCV) | Danh sách giá trị hay gặp nhất của một cột kèm tần suất, trong thống kê của planner | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Thuộc tính đa trị | *multi-valued attribute* | Thuộc tính mà một thực thể có thể có nhiều giá trị cùng lúc | [Bài 7](cap-1-mo-hinh-er/07-thuc-the-va-thuoc-tinh.md) |
| Ô đa trị | *multi-valued cell* | Một ô bị nhồi nhiều giá trị — vi phạm 1NF | [Bài 17](cap-2-chuan-hoa/17-dang-chuan-1nf-2nf.md) |
| Phụ thuộc đa trị | *multi-valued dependency — MVD* | Với mỗi giá trị của `X`, tập giá trị `Y` đi kèm là cố định và độc lập hẳn với phần còn lại của bảng | [Bài 19](cap-2-chuan-hoa/19-dang-chuan-4nf-5nf-6nf.md) |
| Kiểm soát đồng thời đa phiên bản | *Multi-Version Concurrency Control* (MVCC) | Giữ nhiều phiên bản của một dòng để mỗi giao dịch thấy đúng một phiên bản; người đọc không chặn người ghi và ngược lại | [Bài 39](cap-4-ben-trong-dong-co/39-mvcc.md) |
| Đa tập | *multiset* | Tập hợp có cho phép phần tử trùng nhau — đây là thứ SQL thật sự làm việc trên, khác tập hợp của toán học | [Bài 21](cap-3-sql/21-dai-so-quan-he.md) |

## N

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Số giá trị phân biệt | *n_distinct* | Số giá trị khác nhau của một cột trong thống kê; số âm là tỉ lệ so với số dòng, `-1` là mọi giá trị đều khác nhau | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Kết nối tự nhiên | *natural join* | Equi join tự động trên mọi cột trùng tên và bỏ bớt cột lặp — tiện nhưng dễ đổi kết quả trong im lặng, nên tránh | [Bài 21](cap-3-sql/21-dai-so-quan-he.md) |
| Khoá tự nhiên | *natural key* | Khoá làm từ dữ liệu có thật ngoài đời, mang ý nghĩa nghiệp vụ | [Bài 12](cap-1-mo-hinh-er/12-bay-loai-khoa.md) |
| Điều hướng thủ công | *navigational programming* | Kiểu lập trình phải tự viết lộ trình đi theo con trỏ mới lấy được dữ liệu | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Tìm lân cận gần nhất | *nearest neighbor search* | `ORDER BY cot <-> điểm LIMIT n` — trả lời thẳng từ cây GiST mà không tính khoảng cách tới mọi dòng | [Bài 35](cap-4-ben-trong-dong-co/35-cac-loai-index-khac.md) |
| Nối vòng lặp lồng | *nested loop join* | Với mỗi dòng bảng ngoài, tìm dòng khớp ở bảng trong; thắng khi bảng ngoài rất ít dòng | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Mô hình mạng | *network model* | Mô hình cho phép một bản ghi có nhiều cha, nối nhau bằng con trỏ | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Chia cắt mạng | *network partition* | Mạng đứt, các máy tách thành những nhóm không liên lạc được với nhau | [Bài 44](cap-5-sieu-nang-cao/44-cap-va-base.md) |
| Nút | *node* | Một đối tượng trong database đồ thị — học sinh, lớp, giáo viên — mang nhãn và thuộc tính | [Bài 47](cap-5-sieu-nang-cao/47-nosql-bon-ho.md) |
| Thuộc tính không khoá | *non-prime attribute* | Thuộc tính không nằm trong bất kỳ khoá dự tuyển nào | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Đọc không lặp lại | *non-repeatable read* | Đọc lại cùng một dòng trong một giao dịch mà được giá trị khác, vì giao dịch khác vừa sửa và xác nhận | [Bài 38](cap-4-ben-trong-dong-co/38-isolation-level-va-anomaly.md) |
| Dạng chuẩn | *normal form* | Một điều kiện đặt lên lược đồ bảng; các dạng chuẩn lồng nhau | [Bài 17](cap-2-chuan-hoa/17-dang-chuan-1nf-2nf.md) |
| Chuẩn hoá | *normalization* | Tách một bảng thành nhiều bảng nhỏ hơn cho tới khi mọi bảng đều đạt dạng chuẩn mong muốn | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Không phân biệt được | *not distinct* | Quan hệ mà `DISTINCT`, `GROUP BY` và các phép tập hợp dùng thay cho `=` — hai `NULL` là không phân biệt được nên bị gộp thành một | [Bài 24](cap-3-sql/24-select-where-order-by.md) |
| NoSQL | *Not Only SQL* | Nhóm mô hình dữ liệu chấp nhận hy sinh một phần tính nhất quán để đổi lấy khả năng mở rộng ngang | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Không chờ | *NOWAIT* | Gặp khoá xung đột thì báo lỗi ngay thay vì đứng chờ | [Bài 41](cap-4-ben-trong-dong-co/41-lock-va-deadlock.md) |

## O

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Mô hình đối tượng | *object-oriented model* | Mô hình bỏ bảng, lưu thẳng đối tượng kèm kế thừa và phương thức xuống đĩa | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Quan hệ–đối tượng | *object-relational* | RDBMS có thêm kiểu dữ liệu tự định nghĩa, mảng, `JSONB` và kế thừa bảng | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Trở ngại trở kháng đối tượng–quan hệ | *object-relational impedance mismatch* | Sự lệch pha giữa lớp đối tượng trong code và bảng trong database | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Lớp toán tử | *operator class* | Danh sách toán tử mà một phương thức index hỗ trợ cho một kiểu dữ liệu, ví dụ `gin_trgm_ops` | [Bài 35](cap-4-ben-trong-dong-co/35-cac-loai-index-khac.md) |
| Rào vật chất hoá | *optimization fence* | Khi việc vật chất hoá bị bắt buộc, nên bộ tối ưu không được đẩy điều kiện lọc từ ngoài vào trong nữa | [Bài 28](cap-3-sql/28-cte-va-recursive-cte.md) |
| Điều phối tập trung | *orchestration* | Một bộ điều phối gọi từng bước của Saga và quyết định khi nào bù trừ | [Bài 45](cap-5-sieu-nang-cao/45-distributed-transaction.md) |
| Dòng mồ côi | *orphan row* | Dòng con trỏ tới một dòng cha đã biến mất | [Bài 15](cap-1-mo-hinh-er/15-rang-buoc-toan-ven.md) |
| Mẫu hộp thư đi | *outbox pattern* | Ghi thông điệp vào một bảng trong cùng giao dịch với dữ liệu; tiến trình riêng gửi đi sau | [Bài 45](cap-5-sieu-nang-cao/45-distributed-transaction.md) |
| Truy vấn ngoài | *outer query* | Câu lệnh bao quanh một truy vấn con | [Bài 27](cap-3-sql/27-subquery-va-exists.md) |
| Ràng buộc overlapping | *overlapping* | Một thực thể lớp cha được thuộc nhiều lớp con cùng lúc | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Thực thể chủ | *owner entity* | Thực thể cho thực thể yếu mượn khoá | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |

## P

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Định lý PACELC | *PACELC theorem* | Có chia cắt mạng: chọn sẵn sàng hay nhất quán; không có: chọn độ trễ thấp hay nhất quán | [Bài 44](cap-5-sieu-nang-cao/44-cap-va-base.md) |
| Trang | *page* | Miếng 8KB — đơn vị nhỏ nhất PostgreSQL đọc ghi; chi phí thật của truy vấn tính bằng số trang | [Bài 33](cap-4-ben-trong-dong-co/33-page-heap-tuple.md) |
| Phân trang | *pagination* | Cắt kết quả thành từng trang bằng `LIMIT` và `OFFSET` | [Bài 24](cap-3-sql/24-select-where-order-by.md) |
| Phụ thuộc bộ phận | *partial functional dependency* | `X → Y` mà chỉ một phần của `X` đã đủ xác định `Y` — vế trái thừa cột | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Index bộ phận | *partial index* | Index chỉ chứa những dòng thoả một điều kiện `WHERE` | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Khoá bộ phận | *partial key / discriminator* | Phần riêng của thực thể yếu, ghép với khoá của thực thể chủ mới đủ định danh | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |
| Tham gia bộ phận | *partial participation* | Được phép có thực thể không tham gia mối quan hệ — tối thiểu 0 | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |
| Chuyên biệt hoá bộ phận | *partial specialization* | Được phép có thực thể chỉ thuộc lớp cha, không thuộc lớp con nào | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Bên tham gia | *participant* | Một database làm phần việc của mình trong 2PC | [Bài 45](cap-5-sieu-nang-cao/45-distributed-transaction.md) |
| Ràng buộc tham gia | *participation constraint* | Quy định một thực thể phía này có bắt buộc tham gia mối quan hệ hay không | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |
| Phân vùng | *partition* | Nhóm dòng do `PARTITION BY` chia ra; cửa sổ của một dòng không bao giờ vượt ra khỏi phân vùng của nó | [Bài 29](cap-3-sql/29-window-function.md) |
| Phân vùng (bảng) | *partition* (table partitioning) | Một bảng con thật của bảng được phân vùng — khác "phân vùng" của `OVER (PARTITION BY ...)` ở Bài 29 | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |
| Khoá phân vùng | *partition key* | Cột quyết định dòng vào phân vùng nào; khoá chính của bảng phân vùng phải chứa nó | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |
| Cắt tỉa phân vùng | *partition pruning* | Planner bỏ qua những phân vùng chắc chắn không chứa dòng khớp `WHERE`; mất tác dụng khi khoá phân vùng bị bọc trong hàm | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |
| Chịu chia cắt mạng | *partition tolerance* | Tiếp tục hoạt động khi mạng giữa các máy bị đứt — chữ **P** của CAP; với hệ nhiều máy không phải thứ để chọn | [Bài 44](cap-5-sieu-nang-cao/44-cap-va-base.md) |
| Bảng được phân vùng | *partitioned table* | Bảng "vỏ" người dùng thấy; không chứa dòng nào, chỉ chứa luật chia | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |
| Thuật toán Paxos | *Paxos* | Thuật toán đồng thuận kinh điển của Leslie Lamport; đúng nhưng nổi tiếng khó hiểu | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |
| Dòng đồng hạng | *peer rows* | Các dòng có cùng giá trị ở mọi cột của `ORDER BY` trong `OVER` — `RANGE` gộp cả chúng vào `CURRENT ROW` | [Bài 29](cap-3-sql/29-window-function.md) |
| Đọc bóng ma | *phantom read* | Chạy lại cùng một điều kiện trong một giao dịch mà được tập dòng khác | [Bài 38](cap-4-ben-trong-dong-co/38-isolation-level-va-anomaly.md) |
| Độc lập dữ liệu vật lý | *physical data independence* | Đổi mức trong mà mức khái niệm không phải đổi theo | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Nhân bản vật lý | *physical replication* | Gửi nguyên văn bản ghi WAL; bản sao giống máy chính từng byte, cả máy chủ, chỉ đọc, cùng phiên bản | [Bài 42](cap-5-sieu-nang-cao/42-replication.md) |
| Nút kế hoạch | *plan node* | Một bước trong cây kế hoạch — `Seq Scan`, `Hash Join`, `Sort`… | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Cây kế hoạch | *plan tree* | Hình cây của kế hoạch thực thi; đọc từ trong ra ngoài vì dữ liệu chảy từ nút sâu nhất lên nút trên cùng | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Bộ lập kế hoạch | *planner* | Bộ phận của PostgreSQL chọn cách chạy một câu truy vấn — bộ tối ưu truy vấn của PostgreSQL | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Khôi phục về một thời điểm | *Point-In-Time Recovery* (PITR) | Khôi phục bản sao lưu nền rồi làm lại WAL từ kho tới đúng thời điểm mong muốn — cách cứu một câu `DELETE` nhầm đã xác nhận | [Bài 40](cap-4-ben-trong-dong-co/40-wal-va-recovery.md) |
| Dùng nhiều loại database | *polyglot persistence* | Một hệ thống dùng nhiều database khác họ, mỗi loại cho đúng việc của nó | [Bài 47](cap-5-sieu-nang-cao/47-nosql-bon-ho.md) |
| Cổng | *port* | Con số phân biệt các máy chủ chạy trên cùng một máy; PostgreSQL mặc định là 5432 | [Bài 5](cap-0-nhap-mon/05-cai-dat-postgresql.md) |
| Vị từ | *predicate* | Biểu thức trong `WHERE` trả về `TRUE`, `FALSE` hoặc `UNKNOWN` | [Bài 24](cap-3-sql/24-select-where-order-by.md) |
| Pha chuẩn bị | *prepare phase* | Pha đầu của 2PC: mỗi bên làm xong, ghi xuống đĩa, giữ khoá, trả lời có hoặc không | [Bài 45](cap-5-sieu-nang-cao/45-distributed-transaction.md) |
| Giao dịch đã chuẩn bị | *prepared transaction* | Giao dịch PostgreSQL sau `PREPARE TRANSACTION`: đã ghi đĩa, giữ khoá kể cả qua khởi động lại, chờ `COMMIT PREPARED` hoặc `ROLLBACK PREPARED` | [Bài 45](cap-5-sieu-nang-cao/45-distributed-transaction.md) |
| Máy chính | *primary* | Máy duy nhất nhận lệnh ghi trong một cụm nhân bản; nguồn của mọi thay đổi | [Bài 42](cap-5-sieu-nang-cao/42-replication.md) |
| Khoá chính | *primary key* | Khoá dự tuyển được người thiết kế chọn làm định danh chính thức của bảng | [Bài 12](cap-1-mo-hinh-er/12-bay-loai-khoa.md) |
| Thuộc tính khoá (mức chuẩn hoá) | *prime attribute* | Thuộc tính nằm trong ít nhất một khoá dự tuyển của lược đồ | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Phép toán cơ bản | *primitive operation* | Phép của đại số quan hệ không định nghĩa được từ các phép khác — có đúng sáu phép như vậy | [Bài 21](cap-3-sql/21-dai-so-quan-he.md) |
| Thủ tục | *procedural* | Kiểu ngôn ngữ bắt bạn nói rõ từng bước phải làm thế nào | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Ngôn ngữ thủ tục của PostgreSQL | *Procedural Language / PostgreSQL Structured Query Language* (PL/pgSQL) | Ngôn ngữ thêm biến, `IF`, `LOOP` vào SQL; `BEGIN ... END` trong nó là khối mã chứ không phải giao dịch | [Bài 31](cap-3-sql/31-trigger-procedure-function.md) |
| Thủ tục | *procedure* | Đoạn mã có tên, không trả giá trị, gọi bằng `CALL`; `COMMIT` / `ROLLBACK` được bên trong | [Bài 31](cap-3-sql/31-trigger-procedure-function.md) |
| Phép chiếu | *projection* | Phép π giữ lại những cột được nêu tên và bỏ dòng trùng — cắt dọc; trong SQL là danh sách cột sau `SELECT` kèm `DISTINCT` | [Bài 21](cap-3-sql/21-dai-so-quan-he.md) |
| Nâng lên làm máy chính | *promote* | Máy bản sao ngừng làm lại WAL và bắt đầu nhận ghi — `pg_promote()` | [Bài 42](cap-5-sieu-nang-cao/42-replication.md) |
| Đồ thị thuộc tính | *property graph* | Mô hình đồ thị mà cả nút lẫn cạnh đều có nhãn và thuộc tính | [Bài 47](cap-5-sieu-nang-cao/47-nosql-bon-ho.md) |
| Luật giả bắc cầu | *pseudotransitivity* | Luật suy diễn: `X → Y` và `WY → Z` thì `WX → Z` | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Bản phát hành | *publication* | Danh sách bảng bên gửi chia sẻ trong nhân bản logic — `CREATE PUBLICATION` | [Bài 42](cap-5-sieu-nang-cao/42-replication.md) |

## Q

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Truy vấn | *query* | Một câu hỏi đặt ra cho cơ sở dữ liệu | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Bộ tối ưu truy vấn | *query optimizer* | Bộ phận của DBMS tự chọn cách chạy nhanh nhất cho một câu truy vấn | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Bộ định tuyến truy vấn | *query router* | Tầng biết luật chia, gửi mỗi truy vấn tới đúng mảnh | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |
| Thiết kế theo truy vấn | *query-first design* | Sắp dữ liệu theo câu hỏi sẽ được hỏi để mỗi câu đọc đúng một chỗ; hệ quả là phi chuẩn hoá có chủ đích, cách thiết kế mặc định của NoSQL | [Bài 47](cap-5-sieu-nang-cao/47-nosql-bon-ho.md) |
| Túc số | *quorum* | Số máy tối thiểu phải đồng ý; quá bán là `n / 2 + 1`, và hai túc số quá bán luôn giao nhau | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |

## R

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Thuật toán Raft | *Raft* | Thuật toán đồng thuận của Ongaro và Ousterhout (2014), thiết kế để dễ hiểu; chạy trong etcd, Consul, CockroachDB, TiDB | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |
| Chi phí trang ngẫu nhiên | *random_page_cost* | Chi phí đọc một trang nhảy cóc, mặc định 4; ổ SSD thường chỉnh xuống khoảng 1.1 | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Phân vùng theo khoảng | *range partitioning* | Mỗi phân vùng giữ một khoảng giá trị liên tục, `FROM` tính, `TO` không tính | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |
| Hệ quản trị cơ sở dữ liệu quan hệ | *RDBMS — relational database management system* | DBMS xây trên mô hình quan hệ | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Đọc đã xác nhận | *Read Committed* | Mức mặc định của PostgreSQL: mỗi câu lệnh thấy dữ liệu đã xác nhận tính tới lúc câu lệnh bắt đầu | [Bài 38](cap-4-ben-trong-dong-co/38-isolation-level-va-anomaly.md) |
| Bản sao chỉ đọc | *read replica* | Máy bản sao nhận truy vấn đọc để chia tải với máy chính | [Bài 42](cap-5-sieu-nang-cao/42-replication.md) |
| Đọc chưa xác nhận | *Read Uncommitted* | Mức thấp nhất của chuẩn SQL, cho phép đọc bẩn; trong PostgreSQL hành xử y hệt Read Committed | [Bài 38](cap-4-ben-trong-dong-co/38-isolation-level-va-anomaly.md) |
| Đọc được điều mình vừa ghi | *read-your-writes* | Bảo đảm người dùng luôn đọc thấy những gì chính mình vừa ghi; nhân bản bất đồng bộ không tự cho điều này | [Bài 42](cap-5-sieu-nang-cao/42-replication.md) |
| Cân bằng lại | *rebalancing* | Chuyển dữ liệu giữa các mảnh để chúng đều trở lại, khi thêm máy hoặc có mảnh nóng | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |
| Bản ghi | *record* | Một hàng trong bảng — cách gọi khác của *row* và *tuple* | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| CTE đệ quy | *recursive CTE* | CTE tham chiếu chính nó, khai bằng `WITH RECURSIVE` — công cụ duy nhất của SQL chuẩn để đi hết một cấu trúc sâu tuỳ ý | [Bài 28](cap-3-sql/28-cte-va-recursive-cte.md) |
| Phần đệ quy | *recursive member* | Câu `SELECT` sau `UNION ALL` trong CTE đệ quy, tự tham chiếu để sinh bước tiếp theo từ các dòng của vòng trước | [Bài 28](cap-3-sql/28-cte-va-recursive-cte.md) |
| Làm lại | *redo* | Áp lại một bản ghi WAL lên trang dữ liệu khi phục hồi; giao dịch không có bản ghi `COMMIT` được coi là đã huỷ | [Bài 40](cap-4-ben-trong-dong-co/40-wal-va-recovery.md) |
| Điểm làm lại | *redo point* | Vị trí trong WAL mà phục hồi sau sự cố bắt đầu đọc, lưu trong tệp `pg_control` | [Bài 40](cap-4-ben-trong-dong-co/40-wal-va-recovery.md) |
| Cột nhân bản | *redundant column* | Cột chép từ bảng khác sang để khỏi phải `JOIN` | [Bài 20](cap-2-chuan-hoa/20-denormalization.md) |
| Tham chiếu | *reference* | Lưu mã của tài liệu khác thay vì chép nội dung của nó vào; hợp với dữ liệu dùng chung hoặc lớn dần mãi | [Bài 47](cap-5-sieu-nang-cao/47-nosql-bon-ho.md) |
| Toàn vẹn tham chiếu | *referential integrity* | Mọi giá trị trong cột khoá ngoại phải tồn tại thật ở bảng cha, hoặc phải là `NULL` | [Bài 15](cap-1-mo-hinh-er/15-rang-buoc-toan-ven.md) |
| Phản xạ | *reflexivity* | Tiên đề Armstrong: `Y ⊆ X` thì `X → Y` | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Làm mới đồng thời | *REFRESH CONCURRENTLY* | Làm mới materialized view mà không chặn người đọc; **đòi** một index `UNIQUE` để ghép được dòng cũ với dòng mới | [Bài 30](cap-3-sql/30-view-va-materialized-view.md) |
| Quan hệ | *relation* | Tên chính thức của một cái **bảng** — khác hẳn *relationship* (mối quan hệ) | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Lược đồ quan hệ | *relation schema* | Cái khung của một bảng: tên bảng, danh sách thuộc tính, và miền giá trị của từng thuộc tính | [Bài 6](cap-1-mo-hinh-er/06-mo-hinh-quan-he.md) |
| Đại số quan hệ | *relational algebra* | Hệ phép toán nhận quan hệ làm đầu vào và trả về quan hệ làm đầu ra — nền toán học của SQL | [Bài 21](cap-3-sql/21-dai-so-quan-he.md) |
| Cơ sở dữ liệu quan hệ | *relational database* | Database xây trên mô hình quan hệ | [Bài 8](cap-1-mo-hinh-er/08-moi-quan-he-va-cardinality.md) |
| Mô hình quan hệ | *relational model* | Mô hình của Codd: dữ liệu chỉ gồm các bảng, nối nhau bằng giá trị trùng nhau chứ không bằng con trỏ | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Lược đồ quan hệ (mức bảng) | *relational schema* | Danh sách các bảng kèm cột và ràng buộc của chúng | [Bài 14](cap-1-mo-hinh-er/14-chuyen-er-sang-bang.md) |
| Mối quan hệ | *relationship* | Một sự liên kết cụ thể giữa các thực thể — khác hẳn *relation* (một cái bảng) | [Bài 6](cap-1-mo-hinh-er/06-mo-hinh-quan-he.md) |
| Tập mối quan hệ | *relationship set* | Tập hợp mọi mối quan hệ cùng loại giữa cùng các tập thực thể | [Bài 8](cap-1-mo-hinh-er/08-moi-quan-he-va-cardinality.md) |
| Phép đổi tên | *rename* | Phép ρ đặt tên mới cho quan hệ hoặc cột; trong SQL là `AS`, và là điều kiện để ghép một bảng với chính nó | [Bài 21](cap-3-sql/21-dai-so-quan-he.md) |
| Đọc lặp lại được | *Repeatable Read* | Cả giao dịch nhìn một ảnh chụp lúc câu lệnh đầu tiên chạy; trong PostgreSQL chặn cả đọc bóng ma | [Bài 38](cap-4-ben-trong-dong-co/38-isolation-level-va-anomaly.md) |
| Nhóm lặp | *repeating group* | Cùng một nhóm thuộc tính bị lặp lại thành nhiều cột đánh số — vi phạm 1NF | [Bài 17](cap-2-chuan-hoa/17-dang-chuan-1nf-2nf.md) |
| Máy bản sao | *replica* | Máy nhận thay đổi từ máy chính và làm lại theo; PostgreSQL gọi là *standby* | [Bài 42](cap-5-sieu-nang-cao/42-replication.md) |
| Máy trạng thái nhân bản | *replicated state machine* | Mỗi máy thực hiện cùng một dãy lệnh theo cùng thứ tự nên có cùng trạng thái | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |
| Nhân bản | *replication* | Giữ cùng một dữ liệu trên nhiều máy, liên tục chuyển thay đổi từ máy chính sang các máy bản sao | [Bài 42](cap-5-sieu-nang-cao/42-replication.md) |
| Độ trễ nhân bản | *replication lag* | Khoảng máy bản sao chậm hơn máy chính, tính bằng byte WAL hoặc thời gian | [Bài 42](cap-5-sieu-nang-cao/42-replication.md) |
| Khe nhân bản | *replication slot* | Ghi nhớ ở máy chính vị trí WAL một máy bản sao đã nhận, để giữ lại WAL nó chưa nhận; khe mồ côi làm đầy đĩa | [Bài 42](cap-5-sieu-nang-cao/42-replication.md) |
| Yêu cầu bỏ phiếu | *RequestVote* | Tin nhắn ứng viên Raft gửi để xin phiếu, kèm vị trí và nhiệm kỳ mục cuối nhật ký | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |
| Trả về sau khi ghi | *RETURNING* | Mệnh đề của PostgreSQL cho `INSERT`/`UPDATE`/`DELETE` trả về chính các dòng vừa bị tác động | [Bài 23](cap-3-sql/23-dml-insert-update-delete.md) |
| Kết nối ngoài bên phải | *RIGHT OUTER JOIN* | Đối xứng với `LEFT JOIN`; ít dùng vì đổi chỗ hai bảng rồi viết `LEFT JOIN` thì dễ đọc hơn | [Bài 25](cap-3-sql/25-join.md) |
| Vai trò | *role* | Người dùng trong PostgreSQL, hoàn toàn riêng với tài khoản đăng nhập máy tính | [Bài 5](cap-0-nhap-mon/05-cai-dat-postgresql.md) |
| Huỷ bỏ | *ROLLBACK* | Huỷ giao dịch: mọi thay đổi biến mất như chưa từng có | [Bài 37](cap-4-ben-trong-dong-co/37-transaction-va-acid.md) |
| Gom theo thứ bậc | *ROLLUP* | Mệnh đề sinh thêm dòng tổng theo thứ bậc cha–con, ví dụ lớp → khối → toàn trường | [Bài 26](cap-3-sql/26-group-by-having.md) |
| Nút gốc | *root node* | Trang duy nhất trên cùng của cây index, nơi mọi lần tìm bắt đầu | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Dòng | *row* | Một hàng trong bảng — cách gọi khác của *record* và *tuple* | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Khoá mức dòng | *row-level lock* | Khoá trên từng dòng, ghi ngay trong tuple; 4 mức từ `FOR KEY SHARE` tới `FOR UPDATE` | [Bài 41](cap-4-ben-trong-dong-co/41-lock-va-deadlock.md) |
| Tổng luỹ tiến | *running total* | Tổng cộng dồn từ đầu phân vùng tới dòng hiện tại — phải viết `ROWS` mới cộng từng dòng một | [Bài 29](cap-3-sql/29-window-function.md) |

## S

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Tính an toàn | *safety* | Mục đã xác nhận không bao giờ mất; Raft giữ bằng luật chỉ bầu ứng viên có nhật ký không cũ hơn | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |
| Saga | *Saga* | Chuỗi giao dịch cục bộ `COMMIT` ngay, mỗi bước có một giao dịch bù trừ chạy ngược khi bước sau thất bại; không có tính cô lập | [Bài 45](cap-5-sieu-nang-cao/45-distributed-transaction.md) |
| Điểm lưu | *SAVEPOINT* | Mốc giữa giao dịch; `ROLLBACK TO SAVEPOINT` huỷ phần sau mốc mà giữ phần trước | [Bài 37](cap-4-ben-trong-dong-co/37-transaction-va-acid.md) |
| Truy vấn con vô hướng | *scalar subquery* | Truy vấn con trả về đúng 1 dòng 1 cột, dùng được ở mọi chỗ chờ một giá trị; trả về 0 dòng thì cho `NULL` | [Bài 27](cap-3-sql/27-subquery-va-exists.md) |
| Rải rồi gom | *scatter-gather* | Gửi truy vấn không có khoá phân mảnh tới mọi mảnh, đợi tất cả rồi gộp kết quả | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |
| Lược đồ | *schema* | Cái khung của database — có bảng nào, cột nào, kiểu gì — thứ hầu như không đổi theo thời gian | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Lược đồ khi đọc | *schema-on-read* | Dữ liệu ghi vào không bị kiểm cấu trúc; chương trình đọc tự hiểu cấu trúc | [Bài 47](cap-5-sieu-nang-cao/47-nosql-bon-ho.md) |
| Lược đồ khi ghi | *schema-on-write* | Cấu trúc khai trước và bị kiểm ngay lúc ghi — cách của database quan hệ | [Bài 47](cap-5-sieu-nang-cao/47-nosql-bon-ho.md) |
| Dạng chuẩn 2 | *Second Normal Form — 2NF* | Bảng đã ở 1NF và mọi thuộc tính không khoá đều phụ thuộc đầy đủ vào mọi khoá dự tuyển | [Bài 17](cap-2-chuan-hoa/17-dang-chuan-1nf-2nf.md) |
| Khoá dòng khi đọc | *SELECT ... FOR UPDATE* | Đọc và khoá luôn các dòng, để không ai sửa chúng trước khi giao dịch mình kết thúc | [Bài 41](cap-4-ben-trong-dong-co/41-lock-va-deadlock.md) |
| Phép chọn | *selection* | Phép σ giữ lại những dòng thoả điều kiện — cắt ngang; trong SQL là `WHERE` | [Bài 21](cap-3-sql/21-dai-so-quan-he.md) |
| Tính chọn lọc | *selectivity* | Tỉ lệ dòng mà điều kiện giữ lại; tỉ lệ càng nhỏ, điều kiện càng chọn lọc mạnh | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Tự kết nối | *SELF JOIN* | Ghép một bảng với chính nó; bắt buộc dùng bí danh, và nên thêm `a.khoa < b.khoa` để mỗi cặp chỉ hiện một lần | [Bài 25](cap-3-sql/25-join.md) |
| Ràng buộc ngữ nghĩa | *semantic constraint* | Luật nghiệp vụ riêng của từng bài toán, ngoài ba loại toàn vẹn chung | [Bài 15](cap-1-mo-hinh-er/15-rang-buoc-toan-ven.md) |
| Bán kết nối | *semi join* | Phép ghép chỉ để kiểm tra tồn tại — mỗi dòng bảng trái ra tối đa một lần, không lấy cột nào của bảng phải | [Bài 27](cap-3-sql/27-subquery-va-exists.md) |
| Dữ liệu bán cấu trúc | *semi-structured data* | Dữ liệu có cấu trúc nhưng cấu trúc khác nhau giữa các bản ghi và không khai trước trong lược đồ | [Bài 32](cap-3-sql/32-jsonb-va-full-text-search.md) |
| Chi phí trang tuần tự | *seq_page_cost* | Chi phí đọc một trang theo thứ tự, mặc định 1 — mốc chuẩn của mọi chi phí ước lượng | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Bộ đếm | *sequence* | Đối tượng sinh số tăng dần — là thứ nằm sau từ viết tắt `SERIAL` | [Bài 22](cap-3-sql/22-ddl-va-kieu-du-lieu.md) |
| Quét toàn bảng | *sequential scan* | Đọc mọi trang heap theo thứ tự — `Seq Scan` | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Tuần tự hoá được | *Serializable* | Mức cô lập cao nhất: kết quả y như chạy lần lượt; giao dịch nào phá vỡ điều đó bị huỷ để làm lại | [Bài 38](cap-4-ben-trong-dong-co/38-isolation-level-va-anomaly.md) |
| Bất thường tuần tự hoá | *serialization anomaly* | Kết quả chạy song song mà không thứ tự chạy lần lượt nào cho ra được; lệch ghi là một ví dụ | [Bài 38](cap-4-ben-trong-dong-co/38-isolation-level-va-anomaly.md) |
| Lỗi tuần tự hoá | *serialization failure* | Lỗi `40001` — database huỷ giao dịch để giữ lời hứa của mức cô lập; ứng dụng phải làm lại cả giao dịch | [Bài 38](cap-4-ben-trong-dong-co/38-isolation-level-va-anomaly.md) |
| Máy chủ | *server* | Chương trình chạy âm thầm và liên tục ở nền, nằm chờ máy khách gõ cửa | [Bài 5](cap-0-nhap-mon/05-cai-dat-postgresql.md) |
| Mảnh | *shard* | Một phần dữ liệu cùng máy chứa nó trong hệ phân mảnh | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |
| Khoá phân mảnh | *shard key* | Cột quyết định dòng nằm ở mảnh nào; phải rải đều và đi cùng truy vấn phổ biến; rất khó đổi | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |
| Phân mảnh | *sharding* | Chia các dòng của một bảng ra nhiều máy database độc lập | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |
| Bộ đệm dùng chung | *shared buffers* | Vùng nhớ PostgreSQL giữ các trang vừa dùng; `shared hit` là trang lấy được từ đây | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Khoá chia sẻ | *shared lock* | Khoá nhiều giao dịch giữ cùng lúc được; chỉ xung đột với khoá độc quyền | [Bài 41](cap-4-ben-trong-dong-co/41-lock-va-deadlock.md) |
| Thuộc tính đơn | *simple attribute* | Thuộc tính không tách nhỏ thêm được mà vẫn giữ nghĩa | [Bài 7](cap-1-mo-hinh-er/07-thuc-the-va-thuoc-tinh.md) |
| Gộp một bảng | *single table / single table inheritance* | Cách hiện thực kế thừa: một bảng duy nhất chứa mọi cột của cha lẫn con, thêm một cột cho biết dòng đó là loại gì | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Thuộc tính đơn trị | *single-valued attribute* | Với mỗi thực thể, thuộc tính chỉ có đúng một giá trị | [Bài 7](cap-1-mo-hinh-er/07-thuc-the-va-thuoc-tinh.md) |
| Dạng chuẩn 6 | *Sixth Normal Form — 6NF* | Mọi phụ thuộc kết nối của bảng đều tầm thường — bảng chỉ còn khoá cộng tối đa một thuộc tính không khoá | [Bài 19](cap-2-chuan-hoa/19-dang-chuan-4nf-5nf-6nf.md) |
| Bỏ qua dòng đang khoá | *SKIP LOCKED* | Gặp dòng đang bị khoá thì bỏ qua, lấy các dòng khác — nền của hàng đợi công việc | [Bài 41](cap-4-ben-trong-dong-co/41-lock-va-deadlock.md) |
| Ảnh chụp dữ liệu | *snapshot* | Bản ghi những giao dịch đã kết thúc tại một thời điểm, dạng `xmin:xmax:danh_sách_đang_chạy` | [Bài 39](cap-4-ben-trong-dong-co/39-mvcc.md) |
| Xoá mềm | *soft delete* | Đánh dấu một dòng là đã bỏ bằng cột trạng thái, thay vì `DELETE` thật | [Bài 15](cap-1-mo-hinh-er/15-rang-buoc-toan-ven.md) |
| Đúng đắn (của hệ tiên đề) | *sound* | Mọi phụ thuộc hàm suy ra được từ ba tiên đề Armstrong đều thật sự đúng | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| GiST phân hoạch không gian | *Space-Partitioned GiST* (SP-GiST) | Cây không cân bằng chia không gian thành các phần không chồng nhau; hợp dữ liệu phân bố rất lệch | [Bài 35](cap-4-ben-trong-dong-co/35-cac-loai-index-khac.md) |
| Chuyên biệt hoá | *specialization* | Đi từ lớp cha xuống: nhận ra các nhóm khác nhau bên trong rồi tách thành lớp con | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Phiếu chia đều | *split vote* | Nhiều ứng viên cùng lúc, không ai đủ túc số; bầu lại ở nhiệm kỳ sau | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |
| Não chia đôi | *split-brain* | Hai máy cùng tưởng mình là máy chính, cùng nhận ghi, dữ liệu rẽ nhánh không tự khớp lại được | [Bài 42](cap-5-sieu-nang-cao/42-replication.md) |
| Dòng ma | *spurious tuple* | Dòng do phép nối sinh ra nhưng chưa từng có trong bảng gốc | [Bài 18](cap-2-chuan-hoa/18-dang-chuan-3nf-bcnf.md) |
| Ngôn ngữ truy vấn có cấu trúc | *SQL — Structured Query Language* | Ngôn ngữ chuẩn để đặt câu hỏi và ra lệnh cho cơ sở dữ liệu quan hệ | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Ổn định trong một câu lệnh | *STABLE* | Cam kết một hàm cùng tham số cho cùng kết quả trong một câu lệnh; được đọc bảng nhưng không được sửa | [Bài 31](cap-3-sql/31-trigger-procedure-function.md) |
| Dữ liệu cũ | *stale data* | Bản sao phi chuẩn hoá chưa được cập nhật theo nguồn | [Bài 20](cap-2-chuan-hoa/20-denormalization.md) |
| Lược đồ hình sao | *star schema* | Kiểu phi chuẩn hoá có hệ thống, dành cho kho dữ liệu phân tích chỉ đọc | [Bài 20](cap-2-chuan-hoa/20-denormalization.md) |
| Chi phí khởi động | *startup cost* | Chi phí trước khi trả được dòng đầu tiên — số thứ nhất trong `cost=a..b` | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Thống kê | *statistics* | Bản tóm tắt từng cột — `n_distinct`, MCV, histogram, tương quan — do `ANALYZE` thu từ một mẫu ngẫu nhiên | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Đưa về dạng gốc | *stemming* | Quy các biến thể của một từ về một dạng, ví dụ *running* → *run*; tiếng Việt gần như không cần | [Bài 32](cap-3-sql/32-jsonb-va-full-text-search.md) |
| Từ dừng | *stop word* | Từ quá phổ biến nên bị bỏ khỏi index tìm kiếm, ví dụ *the* trong tiếng Anh | [Bài 32](cap-3-sql/32-jsonb-va-full-text-search.md) |
| Thuộc tính lưu trữ | *stored attribute* | Thuộc tính phải ghi thật vào database vì không có cách nào tính ra nó | [Bài 7](cap-1-mo-hinh-er/07-thuc-the-va-thuoc-tinh.md) |
| Nhân bản theo luồng | *streaming replication* | Máy bản sao giữ một kết nối thường trực, nhận từng bản ghi WAL ngay khi nó được ghi | [Bài 42](cap-5-sieu-nang-cao/42-replication.md) |
| Nhất quán mạnh | *strong consistency* | Mọi lần đọc thấy lần ghi mới nhất, như thể chỉ có một bản dữ liệu — chữ **C** của CAP, khác chữ C của ACID | [Bài 44](cap-5-sieu-nang-cao/44-cap-va-base.md) |
| Thực thể mạnh | *strong entity* | Thực thể có thuộc tính khoá tự nhiên, tự đứng được | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |
| Lớp con | *subclass* | Tập thực thể chuyên biệt hơn, mà mọi thành viên của nó cũng là thành viên của lớp cha | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Ngôn ngữ con | *sublanguage* | Một trong bốn nhóm câu lệnh ghép nên SQL: DDL, DML, DCL, TCL | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Truy vấn con | *subquery* | Một câu `SELECT` lồng bên trong câu lệnh khác, đặt trong ngoặc đơn | [Bài 27](cap-3-sql/27-subquery-va-exists.md) |
| Đăng ký nhận | *subscription* | Khai báo ở bên nhận của nhân bản logic, trỏ tới một bản phát hành — `CREATE SUBSCRIPTION` | [Bài 42](cap-5-sieu-nang-cao/42-replication.md) |
| Bảng tổng hợp | *summary table* | Bảng thật chứa sẵn kết quả `GROUP BY`, được tính lại theo lịch | [Bài 20](cap-2-chuan-hoa/20-denormalization.md) |
| Siêu khoá | *super key* | Tập cột mà không có hai dòng nào trùng nhau trên toàn bộ tập đó — được phép thừa cột | [Bài 12](cap-1-mo-hinh-er/12-bay-loai-khoa.md) |
| Lớp cha | *superclass* | Tập thực thể tổng quát mà các lớp con đều thuộc về | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Khoá nhân tạo | *surrogate key* | Khoá không mang ý nghĩa nghiệp vụ nào, chỉ tồn tại để định danh dòng | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |
| Xác nhận đồng bộ | *synchronous commit* | `COMMIT` chờ WAL xuống đĩa mới báo xong; tắt đi thì có thể mất giao dịch cuối nhưng không hỏng dữ liệu | [Bài 40](cap-4-ben-trong-dong-co/40-wal-va-recovery.md) |
| Nhân bản đồng bộ | *synchronous replication* | `COMMIT` chờ ít nhất một máy bản sao xác nhận; không mất giao dịch, nhưng chậm hơn và treo khi bản sao đồng bộ chết | [Bài 42](cap-5-sieu-nang-cao/42-replication.md) |

## T

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Bảng | *table* | Khung lưới gồm hàng và cột chứa dữ liệu cùng loại | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Gộp bảng 1:1 | *table merging* | Nhập hai bảng quan hệ 1:1 luôn được đọc cùng nhau làm một | [Bài 20](cap-2-chuan-hoa/20-denormalization.md) |
| Phân vùng bảng | *table partitioning* | Chia một bảng thành nhiều bảng nhỏ trên cùng một máy theo luật dựa trên giá trị cột — `PARTITION BY` | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |
| Bảng cho mỗi lớp con cụ thể | *table per concrete class* | Cách hiện thực kế thừa: không có bảng cha, mỗi lớp con một bảng đầy đủ tự lặp lại các cột chung | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Bảng cho mỗi lớp con | *table per subclass / class table inheritance* | Cách hiện thực kế thừa: một bảng cho lớp cha, mỗi lớp con thêm một bảng chứa phần riêng và trỏ về cha bằng khoá ngoại | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Khoá mức bảng | *table-level lock* | Khoá trên cả bảng; PostgreSQL có 8 mức, từ `ACCESS SHARE` của `SELECT` tới `ACCESS EXCLUSIVE` của `DROP`/`ALTER` | [Bài 41](cap-4-ben-trong-dong-co/41-lock-va-deadlock.md) |
| Dữ liệu theo thời gian | *temporal data* | Dữ liệu ghi kèm khoảng thời gian mà giá trị đó có hiệu lực | [Bài 19](cap-2-chuan-hoa/19-dang-chuan-4nf-5nf-6nf.md) |
| Nhiệm kỳ | *term* | Số tăng dần đánh dấu mỗi lần bầu trong Raft; thấy nhiệm kỳ lớn hơn thì lùi về làm nút theo sau | [Bài 46](cap-5-sieu-nang-cao/46-consensus-va-raft.md) |
| Mối quan hệ bậc ba | *ternary relationship* | Mối quan hệ có ba tập thực thể tham gia cùng lúc; tách ra là mất thông tin | [Bài 8](cap-1-mo-hinh-er/08-moi-quan-he-va-cardinality.md) |
| Cấu hình tìm kiếm | *text search configuration* | Bộ quy tắc tách từ, bỏ từ dừng và đưa về dạng gốc; PostgreSQL **không có** cấu hình tiếng Việt | [Bài 32](cap-3-sql/32-jsonb-va-full-text-search.md) |
| Kỹ thuật lưu thuộc tính quá khổ | *The Oversized-Attribute Storage Technique* (TOAST) | Nén ô lớn, nếu vẫn quá khoảng 2KB thì cắt ra bảng phụ, trên dòng chính chỉ để lại con trỏ | [Bài 33](cap-4-ben-trong-dong-co/33-page-heap-tuple.md) |
| Kết nối theta | *theta join* | Kết nối với điều kiện so sánh bất kỳ, không chỉ dấu bằng | [Bài 21](cap-3-sql/21-dai-so-quan-he.md) |
| Dạng chuẩn 3 | *Third Normal Form — 3NF* | Bảng đã ở 2NF và không thuộc tính không khoá nào phụ thuộc bắc cầu vào một khoá dự tuyển | [Bài 18](cap-2-chuan-hoa/18-dang-chuan-3nf-bcnf.md) |
| Xác nhận ba pha | *three-phase commit* (3PC) | Thêm pha "sắp xác nhận" để khỏi bị chặn, nhưng có thể sai khi mạng bị chia cắt; hầu như không dùng | [Bài 45](cap-5-sieu-nang-cao/45-distributed-transaction.md) |
| Logic ba giá trị | *three-valued logic* | Hệ logic của SQL, có thêm giá trị thứ ba `UNKNOWN` bên cạnh `TRUE` và `FALSE` | [Bài 24](cap-3-sql/24-select-where-order-by.md) |
| Thời gian sống | *time to live* (TTL) | Thời hạn gắn cho một khoá; hết hạn thì khoá tự biến mất — dùng cho phiên đăng nhập, mã OTP, bộ nhớ đệm | [Bài 47](cap-5-sieu-nang-cao/47-nosql-bon-ho.md) |
| Tổng chi phí | *total cost* | Chi phí để trả hết mọi dòng, đã gồm chi phí các nút con — số thứ hai trong `cost=a..b` | [Bài 36](cap-4-ben-trong-dong-co/36-explain-va-query-planner.md) |
| Tham gia toàn phần | *total participation* | Mọi thực thể phía này đều bắt buộc phải tham gia mối quan hệ | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |
| Chuyên biệt hoá toàn phần | *total specialization* | Mọi thực thể lớp cha phải thuộc ít nhất một lớp con | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Giao dịch | *transaction* | Một nhóm thao tác được bọc lại thành một đơn vị: `COMMIT` để giữ, `ROLLBACK` để trả lại nguyên trạng | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Ngôn ngữ điều khiển giao tác | *Transaction Control Language* (TCL) | Nhóm lệnh SQL gom nhiều câu thành một khối: `BEGIN`, `COMMIT`, `ROLLBACK`, `SAVEPOINT` | [Bài 22](cap-3-sql/22-ddl-va-kieu-du-lieu.md) |
| Cuộn vòng mã giao dịch | *transaction ID wraparound* | Mã giao dịch 32 bit dùng xoay vòng; tuple cũ không được đóng băng sẽ có ngày biến mất | [Bài 39](cap-4-ben-trong-dong-co/39-mvcc.md) |
| DDL trong giao dịch | *transactional DDL* | `CREATE`, `ALTER`, `DROP` nằm được trong giao dịch và bị `ROLLBACK` huỷ được | [Bài 37](cap-4-ben-trong-dong-co/37-transaction-va-acid.md) |
| Phụ thuộc bắc cầu | *transitive functional dependency* | `X → Z` đi vòng qua một tập `Y` trung gian, trong khi `Y` không xác định ngược lại `X` | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Bắc cầu | *transitivity* | Tiên đề Armstrong: `X → Y` và `Y → Z` thì `X → Z` | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Độ sâu cây | *tree depth* | Số tầng từ gốc tới lá — 3 tầng cho vài chục triệu khoá, 4 tầng cho vài tỉ | [Bài 34](cap-4-ben-trong-dong-co/34-index-va-b-tree.md) |
| Duyệt cây | *tree traversal* | Đi qua mọi nút của một cấu trúc phân cấp theo một trật tự nhất định, bằng CTE đệ quy | [Bài 28](cap-3-sql/28-cte-va-recursive-cte.md) |
| Bẫy sự kiện | *trigger* | Đoạn lệnh mà database tự chạy mỗi khi một sự kiện dữ liệu xảy ra | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Hàm trigger | *trigger function* | Hàm khai `RETURNS TRIGGER`, không nhận tham số thường, dùng `NEW` / `OLD`; một hàm dùng được cho nhiều bảng | [Bài 31](cap-3-sql/31-trigger-procedure-function.md) |
| Phụ thuộc hàm tầm thường | *trivial functional dependency* | `X → Y` với `Y ⊆ X` — luôn đúng nên chẳng nói lên điều gì | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Extension đáng tin | *trusted extension* | Extension mà từ PostgreSQL 13 một vai trò thường cũng cài được, chỉ cần quyền `CREATE` trên database — `unaccent` là một trong số đó | [Bài 32](cap-3-sql/32-jsonb-va-full-text-search.md) |
| Câu hỏi tìm kiếm | *tsquery* | Câu hỏi tìm kiếm đã chuẩn hoá, ghép bằng `&` và, `|` hoặc, `!` không, `<->` liền kề | [Bài 32](cap-3-sql/32-jsonb-va-full-text-search.md) |
| Bộ | *tuple* | Tên học thuật của một hàng trong bảng — cùng nghĩa với *record* và *row* | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Đầu tuple | *tuple header* | Phần 23 byte trước dữ liệu của mỗi tuple, chứa `xmin`, `xmax`, `t_ctid`… | [Bài 33](cap-4-ben-trong-dong-co/33-page-heap-tuple.md) |
| Xác nhận hai pha | *two-phase commit* (2PC) | Điều phối viên hỏi mọi bên chuẩn bị, rồi mới ra lệnh xác nhận hoặc huỷ cho tất cả | [Bài 45](cap-5-sieu-nang-cao/45-distributed-transaction.md) |
| Khoá hai pha | *two-phase locking* (2PL) | Pha chỉ lấy khoá rồi pha chỉ trả khoá; bảo đảm kết quả như chạy lần lượt | [Bài 41](cap-4-ben-trong-dong-co/41-lock-va-deadlock.md) |

## U

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Bỏ dấu | *unaccent* | Extension biến `Đất rừng` thành `Dat rung`, ghép với cấu hình `simple` để người gõ không dấu vẫn tìm ra | [Bài 32](cap-3-sql/32-jsonb-va-full-text-search.md) |
| Một ngôi | *unary / recursive* | Mối quan hệ mà một tập thực thể tự liên kết với chính nó | [Bài 8](cap-1-mo-hinh-er/08-moi-quan-he-va-cardinality.md) |
| Truy vấn con không tương quan | *uncorrelated subquery* | Truy vấn con không tham chiếu truy vấn ngoài, nên chỉ cần chạy một lần duy nhất | [Bài 27](cap-3-sql/27-subquery-va-exists.md) |
| Luật hợp | *union* | Luật suy diễn: `X → Y` và `X → Z` thì `X → YZ` | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Phép hợp | *union* — phép toán | Phép ∪ gộp hai quan hệ khả hợp và bỏ dòng trùng; trong SQL là `UNION`, còn `UNION ALL` thì giữ trùng — đừng nhầm với *Luật hợp* ở Bài 16 | [Bài 21](cap-3-sql/21-dai-so-quan-he.md) |
| Khả hợp | *union-compatible* | Hai quan hệ cùng số cột và các cột tương ứng cùng miền giá trị — điều kiện để dùng ∪ và − | [Bài 21](cap-3-sql/21-dai-so-quan-he.md) |
| Chưa biết | *UNKNOWN* | Giá trị chân lý thứ ba, sinh ra mỗi khi so sánh với `NULL`; `WHERE` **loại bỏ** mọi dòng cho `UNKNOWN` | [Bài 24](cap-3-sql/24-select-where-order-by.md) |
| Bảng không ghi nhật ký | *unlogged table* | Bảng không ghi WAL: ghi nhanh, nhưng bị làm rỗng sau mất điện và không được nhân bản | [Bài 40](cap-4-ben-trong-dong-co/40-wal-va-recovery.md) |
| View cập nhật được | *updatable view* | View đủ đơn giản để `INSERT` / `UPDATE` / `DELETE` trực tiếp, thao tác tự chuyển xuống bảng gốc | [Bài 30](cap-3-sql/30-view-va-materialized-view.md) |
| Cập nhật | *update* | Lệnh DML sửa giá trị của các dòng đã có; không có `WHERE` thì sửa toàn bộ bảng | [Bài 23](cap-3-sql/23-dml-insert-update-delete.md) |
| Bất thường khi cập nhật | *update anomaly* | Muốn sửa một sự thật phải sửa nhiều dòng; sót một dòng là dữ liệu tự mâu thuẫn | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Thêm-hoặc-sửa | *upsert* | Thao tác "có thì sửa, chưa có thì thêm", gọn trong một câu lệnh nguyên tử `INSERT ... ON CONFLICT DO UPDATE` | [Bài 23](cap-3-sql/23-dml-insert-update-delete.md) |

## V

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Dọn rác | *VACUUM* | Đánh dấu chỗ của tuple chết là dùng lại được; không trả dung lượng cho hệ điều hành | [Bài 33](cap-4-ben-trong-dong-co/33-page-heap-tuple.md) |
| Dọn rác toàn phần | *VACUUM FULL* | Viết lại cả bảng cho gọn và trả dung lượng — nhưng khoá bảng hoàn toàn khi chạy | [Bài 33](cap-4-ben-trong-dong-co/33-page-heap-tuple.md) |
| Khoảng thời gian có hiệu lực | *valid-time period* | Cặp mốc đầu – cuối được tính là **một** giá trị duy nhất, cho biết một sự thật đúng trong khoảng nào | [Bài 19](cap-2-chuan-hoa/19-dang-chuan-4nf-5nf-6nf.md) |
| Giá trị | *value* | Nội dung của một ô trong bảng | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Khung nhìn | *view* | Một câu truy vấn được đặt tên; bản thân nó **không chứa** dữ liệu thật | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Nút ảo | *virtual node* | Một trong nhiều vị trí của cùng một máy thật trên vòng băm, giúp chia dữ liệu đều hơn | [Bài 43](cap-5-sieu-nang-cao/43-partitioning-va-sharding.md) |
| Bản đồ hiển thị | *visibility map* | Tệp phụ đánh dấu những trang mà mọi tuple đều sống và ai cũng thấy; điều kiện của `Index Only Scan` | [Bài 33](cap-4-ben-trong-dong-co/33-page-heap-tuple.md) |
| Quy tắc thấy được | *visibility rules* | Tuple thấy được khi `xmin` đã xác nhận trước lúc chụp ảnh, và `xmax` bằng 0, đã huỷ, hoặc chưa xác nhận lúc chụp | [Bài 39](cap-4-ben-trong-dong-co/39-mvcc.md) |
| Bất định | *VOLATILE* | Một hàm có thể cho kết quả khác nhau mỗi lần gọi hoặc có tác dụng phụ; là **mặc định** và không được tối ưu | [Bài 31](cap-3-sql/31-trigger-procedure-function.md) |

## W

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Đồ thị chờ | *wait-for graph* | Đồ thị có mũi tên A → B khi A chờ khoá B đang giữ; có chu trình là có bế tắc | [Bài 41](cap-4-ben-trong-dong-co/41-lock-va-deadlock.md) |
| Lưu trữ WAL | *WAL archiving* | Giữ lại mọi tệp WAL ở một kho riêng thay vì xoá sau checkpoint; cần cho PITR | [Bài 40](cap-4-ben-trong-dong-co/40-wal-va-recovery.md) |
| Thực thể yếu | *weak entity* | Thực thể không có thuộc tính khoá của riêng nó, nên phải mượn khoá của thực thể chủ | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |
| Cửa sổ | *window* | Tập dòng mà một hàm cửa sổ nhìn thấy khi đứng ở một dòng nhất định | [Bài 29](cap-3-sql/29-window-function.md) |
| Khung cửa sổ | *window frame* | Phần của phân vùng mà hàm cửa sổ thật sự nhìn, khai bằng `ROWS`, `RANGE` hoặc `GROUPS`; mặc định là `RANGE ... CURRENT ROW` | [Bài 29](cap-3-sql/29-window-function.md) |
| Hàm cửa sổ | *window function* | Hàm tính trên các dòng liên quan tới dòng hiện tại mà **không gom dòng** — vào N dòng, ra N dòng | [Bài 29](cap-3-sql/29-window-function.md) |
| Kiểm tra khi ghi qua view | *WITH CHECK OPTION* | Bắt mọi dòng ghi qua view phải thoả điều kiện `WHERE` của view, thay vì lặng lẽ lọt ra ngoài tầm nhìn của nó | [Bài 30](cap-3-sql/30-view-va-materialized-view.md) |
| Xung đột ghi | *write conflict* | Hai bên sửa cùng một dữ liệu theo hai cách khác nhau trong lúc không liên lạc được | [Bài 44](cap-5-sieu-nang-cao/44-cap-va-base.md) |
| Lệch ghi | *write skew* | Hai giao dịch cùng đọc, mỗi bên sửa một dòng khác nhau dựa trên cái đã đọc; từng bên đúng mà gộp lại sai | [Bài 38](cap-4-ben-trong-dong-co/38-isolation-level-va-anomaly.md) |
| Nhật ký ghi trước | *write-ahead logging* (WAL) | Nhật ký ghi nối tiếp mô tả mọi thay đổi; phải xuống đĩa trước trang dữ liệu, và `COMMIT` chỉ xong khi bản ghi `COMMIT` đã xuống đĩa | [Bài 40](cap-4-ben-trong-dong-co/40-wal-va-recovery.md) |

## X

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Mã giao dịch xoá | *xmax* | Cột hệ thống: mã giao dịch đã xoá, thay thế — hoặc đang khoá — phiên bản dòng này; `0` nếu chưa ai đụng tới | [Bài 39](cap-4-ben-trong-dong-co/39-mvcc.md) |
| Mã giao dịch tạo | *xmin* | Cột hệ thống: mã giao dịch đã tạo ra phiên bản dòng này | [Bài 39](cap-4-ben-trong-dong-co/39-mvcc.md) |
| Mốc dọn rác | *xmin horizon* | `xmin` nhỏ nhất trong mọi ảnh chụp đang dùng; `VACUUM` chỉ dọn tuple bị xoá trước mốc này | [Bài 39](cap-4-ben-trong-dong-co/39-mvcc.md) |
