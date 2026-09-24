# Bảng thuật ngữ

Toàn bộ thuật ngữ chuyên ngành xuất hiện trong khóa học, đối chiếu Việt – Anh, kèm giải thích ngắn gọn và link tới bài học giải thích kỹ thuật ngữ đó.

Bảng được sắp xếp theo thứ tự chữ cái của **thuật ngữ tiếng Anh**, vì đó là dạng bạn sẽ gặp khi đọc tài liệu và khi đi phỏng vấn.

!!! info "Bảng này lớn dần theo khóa học"
    Mỗi khi một cấp độ mới được xuất bản, thuật ngữ của cấp đó được bổ sung vào đây. Hiện bảng phủ trọn **Bài 1–20**: Cấp 0 (Nhập môn), Cấp 1 (Mô hình quan hệ & ER) và Cấp 2 (Chuẩn hoá).

!!! tip "Vì sao có nhiều từ trùng nghĩa?"
    *record* / *row* / *tuple* cùng chỉ **một hàng**, còn *field* / *column* / *attribute* cùng chỉ **một cột**. Bảng giữ đủ cả ba vì bạn sẽ gặp cả ba khi đọc tài liệu; cột nghĩa có trỏ chéo sang các biến thể còn lại.

## 0–9

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Thuật toán tổng hợp 3NF | *3NF synthesis* | Cách dựng lược đồ 3NF từ phủ tối thiểu, bảo đảm vừa không mất mát vừa bảo toàn phụ thuộc | [Bài 18](cap-2-chuan-hoa/18-dang-chuan-3nf-bcnf.md) |

## A

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Ràng buộc giới hạn tổng | *aggregate constraint* | Luật nghiệp vụ phải cộng hoặc đếm qua nhiều dòng mới kiểm được, nên khoá ngoại và `UNIQUE` không cưỡng chế nổi | [Bài 14](cap-1-mo-hinh-er/14-chuyen-er-sang-bang.md) |
| Kết tập | *aggregation* | Coi cả một mối quan hệ như một thực thể duy nhất, để nó tham gia được vào một mối quan hệ khác | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Khoá thay thế | *alternate key* | Khoá dự tuyển không được chọn làm khoá chính, thường giữ bằng `UNIQUE` | [Bài 12](cap-1-mo-hinh-er/12-bay-loai-khoa.md) |
| Mô hình neo | *anchor modeling* | Kiểu thiết kế kho dữ liệu theo 6NF: mỗi thuộc tính một bảng riêng, nên thêm thuộc tính mới không phải đụng bảng cũ | [Bài 19](cap-2-chuan-hoa/19-dang-chuan-4nf-5nf-6nf.md) |
| Bất thường | *anomaly* | Tình huống mà một thao tác hoàn toàn bình thường lại làm hỏng dữ liệu | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Tiên đề Armstrong | *Armstrong's axioms* | Ba luật — phản xạ, tăng trưởng, bắc cầu — đủ để suy ra mọi phụ thuộc hàm suy ra được | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Nguyên tử | *atomic* | Không chia nhỏ hơn được nữa, theo nhu cầu nghiệp vụ | [Bài 17](cap-2-chuan-hoa/17-dang-chuan-1nf-2nf.md) |
| Tính nguyên tử | *atomicity* | Tính chất mỗi ô chỉ chứa đúng một giá trị đơn, không chứa danh sách | [Bài 6](cap-1-mo-hinh-er/06-mo-hinh-quan-he.md) |
| Thuộc tính | *attribute* | Một cột trong bảng, mô tả một đặc điểm của bản ghi — tên học thuật của *column* và *field* | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Bao đóng thuộc tính | *attribute closure* | Tập mọi thuộc tính suy ra được khi đã biết tập thuộc tính `X`, ký hiệu `X⁺` | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Kế thừa thuộc tính | *attribute inheritance* | Lớp con tự động có mọi thuộc tính của lớp cha, không cần khai lại | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Chuyên biệt hoá theo thuộc tính | *attribute-defined specialization* | Chuyên biệt hoá mà lớp con được xác định bằng giá trị của một thuộc tính, nên thường không cần tạo bảng riêng | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Tăng trưởng | *augmentation* | Tiên đề Armstrong: thêm cùng một nhóm thuộc tính vào cả hai vế thì luật vẫn đúng | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |

## B

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Hai ngôi | *binary* | Mối quan hệ có đúng hai tập thực thể tham gia — loại phổ biến nhất | [Bài 8](cap-1-mo-hinh-er/08-moi-quan-he-va-cardinality.md) |
| BCNF | *Boyce–Codd Normal Form* | Dạng chuẩn bỏ hẳn lối thoát của 3NF: mọi định thức đều phải là siêu khoá | [Bài 18](cap-2-chuan-hoa/18-dang-chuan-3nf-bcnf.md) |

## C

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Khoá dự tuyển | *candidate key* | Siêu khoá tối giản — bỏ bất kỳ cột nào là mất khả năng phân biệt | [Bài 12](cap-1-mo-hinh-er/12-bay-loai-khoa.md) |
| Bản số | *cardinality* | Một thực thể phía này ghép được với tối đa bao nhiêu thực thể phía kia | [Bài 8](cap-1-mo-hinh-er/08-moi-quan-he-va-cardinality.md) |
| Lực lượng | *cardinality of a relation* | Số dòng của một bảng — đừng nhầm với *cardinality* (bản số) ở Bài 8 | [Bài 6](cap-1-mo-hinh-er/06-mo-hinh-quan-he.md) |
| Tỉ lệ bản số | *cardinality ratio* | Cách viết gọn bản số: 1:1, 1:N hoặc M:N | [Bài 8](cap-1-mo-hinh-er/08-moi-quan-he-va-cardinality.md) |
| Danh mục hệ thống | *catalog* | Tên gọi khác của từ điển dữ liệu | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Ký hiệu Chen | *Chen notation* | Bộ ký hiệu ER gốc năm 1976: mỗi loại phần tử một hình riêng, mỗi thuộc tính một elip treo ra ngoài | [Bài 10](cap-1-mo-hinh-er/10-bieu-do-er-ky-hieu-chen.md) |
| Máy khách | *client* | Chương trình gõ cửa máy chủ để gửi câu lệnh, ví dụ `psql` | [Bài 5](cap-0-nhap-mon/05-cai-dat-postgresql.md) |
| Máy khách – máy chủ | *client–server* | Mô hình nhiều máy khách cùng kết nối tới một máy chủ giữ kho dữ liệu duy nhất | [Bài 5](cap-0-nhap-mon/05-cai-dat-postgresql.md) |
| Bao đóng của tập phụ thuộc hàm | *closure of F* | Tập mọi phụ thuộc hàm suy ra được từ `F`, ký hiệu `F⁺` | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Cụm cơ sở dữ liệu | *cluster* | Tập hợp các database do một máy chủ PostgreSQL quản lý | [Bài 5](cap-0-nhap-mon/05-cai-dat-postgresql.md) |
| Cột | *column* | Cách gọi khác của *field* (trường) và *attribute* (thuộc tính) | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Cột rộng | *column-family* | Họ NoSQL lưu bảng khổng lồ mà mỗi dòng có bộ cột riêng | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Đầy đủ (của hệ tiên đề) | *complete* | Mọi phụ thuộc hàm thật sự đúng đều suy ra được từ ba tiên đề Armstrong | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Thuộc tính phức hợp | *composite attribute* | Thuộc tính tách được thành nhiều thuộc tính con có ý nghĩa riêng | [Bài 7](cap-1-mo-hinh-er/07-thuc-the-va-thuoc-tinh.md) |
| Khoá phức hợp | *composite key* | Khoá gồm từ hai cột trở lên | [Bài 12](cap-1-mo-hinh-er/12-bay-loai-khoa.md) |
| Mức khái niệm (mức ý niệm) | *conceptual level* | Mức mô tả toàn bộ database — có bảng nào, cột nào, ràng buộc gì — dùng chung cho mọi người | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Đồng thời | *concurrency* | Nhiều người cùng đọc và ghi trên một tập dữ liệu tại cùng một thời điểm | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Vùng chứa | *container* | Cái hộp chạy sẵn một phần mềm, tách biệt hẳn với máy thật | [Bài 5](cap-0-nhap-mon/05-cai-dat-postgresql.md) |
| Chân quạ | *crow's foot* | Ba nhánh toẽ ra sát hình chữ nhật, nghĩa là phía nhiều | [Bài 11](cap-1-mo-hinh-er/11-bieu-do-er-crows-foot.md) |
| Ký hiệu Crow's Foot | *Crow's Foot notation* | Bộ ký hiệu ER gọn: cột liệt kê bên trong hình chữ nhật, bản số ghi bằng ký hiệu ở đầu đường | [Bài 11](cap-1-mo-hinh-er/11-bieu-do-er-crows-foot.md) |

## D

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Dữ liệu | *data* | Sự kiện thô đã được ghi lại, chưa qua xử lý | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Làm sạch dữ liệu | *data cleansing* | Việc dọn dữ liệu đã gõ sai, gõ thiếu hoặc gõ không thống nhất — khác hẳn chuẩn hoá | [Bài 18](cap-2-chuan-hoa/18-dang-chuan-3nf-bcnf.md) |
| Từ điển dữ liệu | *data dictionary* | Các bảng nằm trong chính database, dùng để lưu lược đồ của nó | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Độc lập dữ liệu | *data independence* | Khả năng sửa một mức mà không phải sửa mức phía trên | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Toàn vẹn dữ liệu | *data integrity* | Tính đúng đắn và nhất quán của dữ liệu trong suốt vòng đời của nó | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Mô hình dữ liệu | *data model* | Tập quy ước về cách tổ chức dữ liệu, ràng buộc đặt được và phép thao tác dùng được | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Dư thừa dữ liệu | *data redundancy* | Cùng một sự thật được lưu ở nhiều chỗ | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Cơ sở dữ liệu | *database* | Tập hợp các bảng có liên quan, được tổ chức để dễ dùng lại | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Hệ quản trị cơ sở dữ liệu | *DBMS — database management system* | Phần mềm quản lý cơ sở dữ liệu, ví dụ PostgreSQL, MySQL, Oracle | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Lược đồ cơ sở dữ liệu | *database schema* | Toàn bộ lược đồ quan hệ của một database ghép lại | [Bài 6](cap-1-mo-hinh-er/06-mo-hinh-quan-he.md) |
| Hệ cơ sở dữ liệu | *database system* | DBMS cộng các database nó quản lý, cộng người dùng và ứng dụng dùng chúng | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Khai báo | *declarative* | Kiểu ngôn ngữ chỉ mô tả thứ mình muốn, để phần mềm tự tìm cách lấy | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Luật tách | *decomposition* | Luật suy diễn: `X → YZ` thì `X → Y` và `X → Z` | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Ràng buộc hoãn | *deferrable constraint* | Ràng buộc hoãn được việc kiểm tra tới lúc `COMMIT` thay vì kiểm ngay | [Bài 15](cap-1-mo-hinh-er/15-rang-buoc-toan-ven.md) |
| Bậc của quan hệ | *degree / arity* | Số cột của một bảng | [Bài 6](cap-1-mo-hinh-er/06-mo-hinh-quan-he.md) |
| Bậc của mối quan hệ | *degree of a relationship* | Số tập thực thể tham gia vào một mối quan hệ | [Bài 8](cap-1-mo-hinh-er/08-moi-quan-he-va-cardinality.md) |
| Bất thường khi xoá | *deletion anomaly* | Xoá một sự thật thì vô tình mất luôn một sự thật khác | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Phi chuẩn hoá | *denormalization* | Cố ý đưa dư thừa trở lại một lược đồ **đã được chuẩn hoá**, để đổi lấy tốc độ đọc | [Bài 20](cap-2-chuan-hoa/20-denormalization.md) |
| Bảo toàn phụ thuộc | *dependency preservation* | Phép tách mà gom các phụ thuộc hàm kiểm được trên từng bảng con lại vẫn suy ra được toàn bộ `F⁺` | [Bài 18](cap-2-chuan-hoa/18-dang-chuan-3nf-bcnf.md) |
| Cột tính sẵn | *derived / computed column* | Cột lưu sẵn kết quả một phép tính từ dữ liệu khác | [Bài 20](cap-2-chuan-hoa/20-denormalization.md) |
| Thuộc tính dẫn xuất | *derived attribute* | Thuộc tính tính ra được từ thuộc tính khác hoặc từ bảng khác | [Bài 7](cap-1-mo-hinh-er/07-thuc-the-va-thuoc-tinh.md) |
| Định thức | *determinant* | Vế trái của một phụ thuộc hàm — thứ mà khi biết nó thì biết được vế phải | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Ràng buộc disjoint | *disjoint* | Mỗi thực thể lớp cha thuộc tối đa một lớp con | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Tài liệu | *document* | Họ NoSQL lưu mỗi bản ghi thành một tệp JSON tự chứa mọi thứ | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Miền giá trị | *domain* | Tập hợp tất cả các giá trị hợp lệ mà một thuộc tính được phép nhận | [Bài 6](cap-1-mo-hinh-er/06-mo-hinh-quan-he.md) |
| Toàn vẹn miền | *domain integrity* | Mọi ô phải nằm trong miền giá trị hợp lệ của cột | [Bài 15](cap-1-mo-hinh-er/15-rang-buoc-toan-ven.md) |

## E

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Mô hình ER mở rộng | *EER — Enhanced ER / Extended ER* | Mô hình ER cơ bản cộng thêm lớp cha – lớp con, các ràng buộc chuyên biệt hoá, và kết tập | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Thực thể | *entity* | Một đối tượng cụ thể ngoài đời mà ta muốn lưu dữ liệu, và phân biệt được với đối tượng khác | [Bài 7](cap-1-mo-hinh-er/07-thuc-the-va-thuoc-tinh.md) |
| Toàn vẹn thực thể | *entity integrity* | Khoá chính không bao giờ được `NULL`, và không bao giờ được trùng | [Bài 15](cap-1-mo-hinh-er/15-rang-buoc-toan-ven.md) |
| Tập thực thể | *entity set* | Tập hợp mọi thực thể cùng loại — chính nó mới là thứ trở thành một bảng | [Bài 7](cap-1-mo-hinh-er/07-thuc-the-va-thuoc-tinh.md) |
| Biểu đồ ER | *Entity–Relationship Diagram / ERD* | Bản vẽ mô tả các tập thực thể, thuộc tính của chúng, và các mối quan hệ giữa chúng | [Bài 10](cap-1-mo-hinh-er/10-bieu-do-er-ky-hieu-chen.md) |
| Ánh xạ ER sang quan hệ | *ER-to-relational mapping* | Thuật toán bảy bước chuyển một biểu đồ ER thành các bảng | [Bài 14](cap-1-mo-hinh-er/14-chuyen-er-sang-bang.md) |
| Ràng buộc tồn tại | *existence dependency* | Tên gọi khác của tham gia toàn phần: thực thể không được phép tồn tại nếu thiếu liên kết đó | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |
| Mức ngoài | *external level* | Mức mô tả góc nhìn của từng người dùng, mỗi người chỉ thấy phần dữ liệu liên quan tới mình | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |

## F

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Định lý Fagin | *Fagin's theorem* | `R` tách đôi không mất mát khi và chỉ khi có phụ thuộc đa trị tương ứng | [Bài 19](cap-2-chuan-hoa/19-dang-chuan-4nf-5nf-6nf.md) |
| Trường | *field* | Một cột trong bảng — cách gọi khác của *column* và *attribute* | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Dạng chuẩn 5 | *Fifth Normal Form — 5NF / PJ-NF* | Mọi phụ thuộc kết nối không tầm thường của bảng đều suy ra được từ các khoá dự tuyển | [Bài 19](cap-2-chuan-hoa/19-dang-chuan-4nf-5nf-6nf.md) |
| Dạng chuẩn 1 | *First Normal Form — 1NF* | Mọi ô nguyên tử, không nhóm lặp, cột có tên riêng và cùng kiểu, thứ tự dòng và cột vô nghĩa, bảng có khoá chính | [Bài 17](cap-2-chuan-hoa/17-dang-chuan-1nf-2nf.md) |
| Bảng bẹt | *flat table* | Một bảng duy nhất nhồi mọi thứ vào — gốc rễ của dư thừa và ba loại bất thường | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Khoá ngoại | *foreign key* | Cột mang giá trị khoá chính của bảng khác, và chỉ được chứa giá trị có thật ở bảng đó | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Dạng chuẩn 4 | *Fourth Normal Form — 4NF* | Bảng đã ở BCNF và mọi định thức đa trị đều là siêu khoá | [Bài 19](cap-2-chuan-hoa/19-dang-chuan-4nf-5nf-6nf.md) |
| Phụ thuộc đầy đủ | *full functional dependency* | `X → Y` mà bỏ bất kỳ thuộc tính nào khỏi `X` là luật không còn đúng | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Phụ thuộc hàm | *functional dependency* | Luật *biết `X` thì biết chắc `Y`*, đúng với mọi trạng thái dữ liệu — Cấp 2 viết tắt là **PTH** | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |

## G

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Tổng quát hoá | *generalization* | Đi từ nhiều tập thực thể riêng lên, gom phần chung lại thành lớp cha | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Đồ thị | *graph* | Họ NoSQL lưu các điểm nối nhau bằng cạnh có nhãn | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |

## H

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Mô hình phân cấp | *hierarchical model* | Mô hình tổ chức dữ liệu thành cây: mỗi bản ghi có đúng một bản ghi cha | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Mở rộng ngang | *horizontal scaling* | Tăng sức chứa bằng cách thêm máy, thay vì mua một máy to hơn | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |

## I

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Định danh | *identifier* | Giá trị dùng để phân biệt bản ghi này với bản ghi khác | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Quan hệ nhận diện | *identifying relationship* | Mối quan hệ nối thực thể yếu với thực thể chủ cho nó mượn khoá | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |
| Ảnh | *image* | Khuôn mẫu dùng để tạo ra một vùng chứa | [Bài 5](cap-0-nhap-mon/05-cai-dat-postgresql.md) |
| Chỉ mục | *index* | Cấu trúc ở mức trong giúp tìm dữ liệu nhanh hơn | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Thông tin | *information* | Kết quả sau khi xử lý dữ liệu để trả lời một câu hỏi | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Ký hiệu IE | *Information Engineering notation* | Tên gọi học thuật khác của Crow's Foot | [Bài 11](cap-1-mo-hinh-er/11-bieu-do-er-crows-foot.md) |
| Bất thường khi thêm | *insertion anomaly* | Không ghi được một sự thật vì thiếu một sự thật khác chẳng liên quan | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Thực thể lưu trữ (thể hiện) | *instance* | Dữ liệu đang nằm trong lược đồ tại một thời điểm cụ thể | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Ràng buộc toàn vẹn | *integrity constraint* | Luật khai trong lược đồ, mà database bắt buộc kiểm tra trước mọi thay đổi dữ liệu | [Bài 15](cap-1-mo-hinh-er/15-rang-buoc-toan-ven.md) |
| Mức trong | *internal level* | Mức mô tả dữ liệu thật sự được ghi xuống đĩa như thế nào | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Quan hệ IS-A | *IS-A relationship* | Quan hệ *một A là một B* giữa lớp con và lớp cha | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |

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
| Độc lập dữ liệu logic | *logical data independence* | Đổi mức khái niệm mà mức ngoài không phải đổi theo | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Mức logic | *logical level* | Mức đã biết sẽ có bảng nào, cột nào, nhưng chưa chọn hệ quản trị và chưa nói tới lưu trữ vật lý | [Bài 11](cap-1-mo-hinh-er/11-bieu-do-er-crows-foot.md) |
| Phân rã không mất mát | *lossless-join decomposition* | Tách bảng rồi nối lại ra đúng bảng gốc: không thiếu dòng nào và không sinh thêm dòng nào | [Bài 18](cap-2-chuan-hoa/18-dang-chuan-3nf-bcnf.md) |
| Mất cập nhật | *lost update* | Người này lưu đè mất phần người kia vừa ghi, vì mỗi người giữ một bản chụp riêng | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |

## M

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Khung nhìn vật chất hoá | *materialized view* | Khung nhìn **có lưu** dữ liệu thật, phải `REFRESH` mới cập nhật | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Lệnh meta | *meta-command* | Lệnh của riêng `psql`, bắt đầu bằng `\` và không có dấu chấm phẩy | [Bài 5](cap-0-nhap-mon/05-cai-dat-postgresql.md) |
| Siêu dữ liệu | *metadata* | Dữ liệu nói về dữ liệu | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Phủ tối thiểu | *minimal cover / canonical cover* | Bản rút gọn hết cỡ của một tập phụ thuộc hàm, vẫn suy ra được y hệt tập gốc | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Thuộc tính đa trị | *multi-valued attribute* | Thuộc tính mà một thực thể có thể có nhiều giá trị cùng lúc | [Bài 7](cap-1-mo-hinh-er/07-thuc-the-va-thuoc-tinh.md) |
| Ô đa trị | *multi-valued cell* | Một ô bị nhồi nhiều giá trị — vi phạm 1NF | [Bài 17](cap-2-chuan-hoa/17-dang-chuan-1nf-2nf.md) |
| Phụ thuộc đa trị | *multi-valued dependency — MVD* | Với mỗi giá trị của `X`, tập giá trị `Y` đi kèm là cố định và độc lập hẳn với phần còn lại của bảng | [Bài 19](cap-2-chuan-hoa/19-dang-chuan-4nf-5nf-6nf.md) |

## N

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Khoá tự nhiên | *natural key* | Khoá làm từ dữ liệu có thật ngoài đời, mang ý nghĩa nghiệp vụ | [Bài 12](cap-1-mo-hinh-er/12-bay-loai-khoa.md) |
| Điều hướng thủ công | *navigational programming* | Kiểu lập trình phải tự viết lộ trình đi theo con trỏ mới lấy được dữ liệu | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Mô hình mạng | *network model* | Mô hình cho phép một bản ghi có nhiều cha, nối nhau bằng con trỏ | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Thuộc tính không khoá | *non-prime attribute* | Thuộc tính không nằm trong bất kỳ khoá dự tuyển nào | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Dạng chuẩn | *normal form* | Một điều kiện đặt lên lược đồ bảng; các dạng chuẩn lồng nhau | [Bài 17](cap-2-chuan-hoa/17-dang-chuan-1nf-2nf.md) |
| Chuẩn hoá | *normalization* | Tách một bảng thành nhiều bảng nhỏ hơn cho tới khi mọi bảng đều đạt dạng chuẩn mong muốn | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| NoSQL | *Not Only SQL* | Nhóm mô hình dữ liệu chấp nhận hy sinh một phần tính nhất quán để đổi lấy khả năng mở rộng ngang | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |

## O

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Mô hình đối tượng | *object-oriented model* | Mô hình bỏ bảng, lưu thẳng đối tượng kèm kế thừa và phương thức xuống đĩa | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Quan hệ–đối tượng | *object-relational* | RDBMS có thêm kiểu dữ liệu tự định nghĩa, mảng, `JSONB` và kế thừa bảng | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Trở ngại trở kháng đối tượng–quan hệ | *object-relational impedance mismatch* | Sự lệch pha giữa lớp đối tượng trong code và bảng trong database | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Dòng mồ côi | *orphan row* | Dòng con trỏ tới một dòng cha đã biến mất | [Bài 15](cap-1-mo-hinh-er/15-rang-buoc-toan-ven.md) |
| Ràng buộc overlapping | *overlapping* | Một thực thể lớp cha được thuộc nhiều lớp con cùng lúc | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Thực thể chủ | *owner entity* | Thực thể cho thực thể yếu mượn khoá | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |

## P

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Phụ thuộc bộ phận | *partial functional dependency* | `X → Y` mà chỉ một phần của `X` đã đủ xác định `Y` — vế trái thừa cột | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Khoá bộ phận | *partial key / discriminator* | Phần riêng của thực thể yếu, ghép với khoá của thực thể chủ mới đủ định danh | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |
| Tham gia bộ phận | *partial participation* | Được phép có thực thể không tham gia mối quan hệ — tối thiểu 0 | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |
| Chuyên biệt hoá bộ phận | *partial specialization* | Được phép có thực thể chỉ thuộc lớp cha, không thuộc lớp con nào | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Ràng buộc tham gia | *participation constraint* | Quy định một thực thể phía này có bắt buộc tham gia mối quan hệ hay không | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |
| Độc lập dữ liệu vật lý | *physical data independence* | Đổi mức trong mà mức khái niệm không phải đổi theo | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Cổng | *port* | Con số phân biệt các máy chủ chạy trên cùng một máy; PostgreSQL mặc định là 5432 | [Bài 5](cap-0-nhap-mon/05-cai-dat-postgresql.md) |
| Khoá chính | *primary key* | Khoá dự tuyển được người thiết kế chọn làm định danh chính thức của bảng | [Bài 12](cap-1-mo-hinh-er/12-bay-loai-khoa.md) |
| Thuộc tính khoá (mức chuẩn hoá) | *prime attribute* | Thuộc tính nằm trong ít nhất một khoá dự tuyển của lược đồ | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Thủ tục | *procedural* | Kiểu ngôn ngữ bắt bạn nói rõ từng bước phải làm thế nào | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Luật giả bắc cầu | *pseudotransitivity* | Luật suy diễn: `X → Y` và `WY → Z` thì `WX → Z` | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |

## Q

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Truy vấn | *query* | Một câu hỏi đặt ra cho cơ sở dữ liệu | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Bộ tối ưu truy vấn | *query optimizer* | Bộ phận của DBMS tự chọn cách chạy nhanh nhất cho một câu truy vấn | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |

## R

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Bản ghi | *record* | Một hàng trong bảng — cách gọi khác của *row* và *tuple* | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Cột nhân bản | *redundant column* | Cột chép từ bảng khác sang để khỏi phải `JOIN` | [Bài 20](cap-2-chuan-hoa/20-denormalization.md) |
| Toàn vẹn tham chiếu | *referential integrity* | Mọi giá trị trong cột khoá ngoại phải tồn tại thật ở bảng cha, hoặc phải là `NULL` | [Bài 15](cap-1-mo-hinh-er/15-rang-buoc-toan-ven.md) |
| Phản xạ | *reflexivity* | Tiên đề Armstrong: `Y ⊆ X` thì `X → Y` | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Quan hệ | *relation* | Tên chính thức của một cái **bảng** — khác hẳn *relationship* (mối quan hệ) | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Lược đồ quan hệ | *relation schema* | Cái khung của một bảng: tên bảng, danh sách thuộc tính, và miền giá trị của từng thuộc tính | [Bài 6](cap-1-mo-hinh-er/06-mo-hinh-quan-he.md) |
| Cơ sở dữ liệu quan hệ | *relational database* | Database xây trên mô hình quan hệ | [Bài 8](cap-1-mo-hinh-er/08-moi-quan-he-va-cardinality.md) |
| Hệ quản trị cơ sở dữ liệu quan hệ | *RDBMS — relational database management system* | DBMS xây trên mô hình quan hệ | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Mô hình quan hệ | *relational model* | Mô hình của Codd: dữ liệu chỉ gồm các bảng, nối nhau bằng giá trị trùng nhau chứ không bằng con trỏ | [Bài 4](cap-0-nhap-mon/04-cac-mo-hinh-du-lieu.md) |
| Lược đồ quan hệ (mức bảng) | *relational schema* | Danh sách các bảng kèm cột và ràng buộc của chúng | [Bài 14](cap-1-mo-hinh-er/14-chuyen-er-sang-bang.md) |
| Mối quan hệ | *relationship* | Một sự liên kết cụ thể giữa các thực thể — khác hẳn *relation* (một cái bảng) | [Bài 6](cap-1-mo-hinh-er/06-mo-hinh-quan-he.md) |
| Tập mối quan hệ | *relationship set* | Tập hợp mọi mối quan hệ cùng loại giữa cùng các tập thực thể | [Bài 8](cap-1-mo-hinh-er/08-moi-quan-he-va-cardinality.md) |
| Nhóm lặp | *repeating group* | Cùng một nhóm thuộc tính bị lặp lại thành nhiều cột đánh số — vi phạm 1NF | [Bài 17](cap-2-chuan-hoa/17-dang-chuan-1nf-2nf.md) |
| Vai trò | *role* | Người dùng trong PostgreSQL, hoàn toàn riêng với tài khoản đăng nhập máy tính | [Bài 5](cap-0-nhap-mon/05-cai-dat-postgresql.md) |
| Dòng | *row* | Một hàng trong bảng — cách gọi khác của *record* và *tuple* | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |

## S

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Lược đồ | *schema* | Cái khung của database — có bảng nào, cột nào, kiểu gì — thứ hầu như không đổi theo thời gian | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Dạng chuẩn 2 | *Second Normal Form — 2NF* | Bảng đã ở 1NF và mọi thuộc tính không khoá đều phụ thuộc đầy đủ vào mọi khoá dự tuyển | [Bài 17](cap-2-chuan-hoa/17-dang-chuan-1nf-2nf.md) |
| Ràng buộc ngữ nghĩa | *semantic constraint* | Luật nghiệp vụ riêng của từng bài toán, ngoài ba loại toàn vẹn chung | [Bài 15](cap-1-mo-hinh-er/15-rang-buoc-toan-ven.md) |
| Máy chủ | *server* | Chương trình chạy âm thầm và liên tục ở nền, nằm chờ máy khách gõ cửa | [Bài 5](cap-0-nhap-mon/05-cai-dat-postgresql.md) |
| Thuộc tính đơn | *simple attribute* | Thuộc tính không tách nhỏ thêm được mà vẫn giữ nghĩa | [Bài 7](cap-1-mo-hinh-er/07-thuc-the-va-thuoc-tinh.md) |
| Gộp một bảng | *single table / single table inheritance* | Cách hiện thực kế thừa: một bảng duy nhất chứa mọi cột của cha lẫn con, thêm một cột cho biết dòng đó là loại gì | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Thuộc tính đơn trị | *single-valued attribute* | Với mỗi thực thể, thuộc tính chỉ có đúng một giá trị | [Bài 7](cap-1-mo-hinh-er/07-thuc-the-va-thuoc-tinh.md) |
| Dạng chuẩn 6 | *Sixth Normal Form — 6NF* | Mọi phụ thuộc kết nối của bảng đều tầm thường — bảng chỉ còn khoá cộng tối đa một thuộc tính không khoá | [Bài 19](cap-2-chuan-hoa/19-dang-chuan-4nf-5nf-6nf.md) |
| Xoá mềm | *soft delete* | Đánh dấu một dòng là đã bỏ bằng cột trạng thái, thay vì `DELETE` thật | [Bài 15](cap-1-mo-hinh-er/15-rang-buoc-toan-ven.md) |
| Đúng đắn (của hệ tiên đề) | *sound* | Mọi phụ thuộc hàm suy ra được từ ba tiên đề Armstrong đều thật sự đúng | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Chuyên biệt hoá | *specialization* | Đi từ lớp cha xuống: nhận ra các nhóm khác nhau bên trong rồi tách thành lớp con | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Dòng ma | *spurious tuple* | Dòng do phép nối sinh ra nhưng chưa từng có trong bảng gốc | [Bài 18](cap-2-chuan-hoa/18-dang-chuan-3nf-bcnf.md) |
| Ngôn ngữ truy vấn có cấu trúc | *SQL — Structured Query Language* | Ngôn ngữ chuẩn để đặt câu hỏi và ra lệnh cho cơ sở dữ liệu quan hệ | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Dữ liệu cũ | *stale data* | Bản sao phi chuẩn hoá chưa được cập nhật theo nguồn | [Bài 20](cap-2-chuan-hoa/20-denormalization.md) |
| Lược đồ hình sao | *star schema* | Kiểu phi chuẩn hoá có hệ thống, dành cho kho dữ liệu phân tích chỉ đọc | [Bài 20](cap-2-chuan-hoa/20-denormalization.md) |
| Thuộc tính lưu trữ | *stored attribute* | Thuộc tính phải ghi thật vào database vì không có cách nào tính ra nó | [Bài 7](cap-1-mo-hinh-er/07-thuc-the-va-thuoc-tinh.md) |
| Thực thể mạnh | *strong entity* | Thực thể có thuộc tính khoá tự nhiên, tự đứng được | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |
| Lớp con | *subclass* | Tập thực thể chuyên biệt hơn, mà mọi thành viên của nó cũng là thành viên của lớp cha | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Ngôn ngữ con | *sublanguage* | Một trong bốn nhóm câu lệnh ghép nên SQL: DDL, DML, DCL, TCL | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Bảng tổng hợp | *summary table* | Bảng thật chứa sẵn kết quả `GROUP BY`, được tính lại theo lịch | [Bài 20](cap-2-chuan-hoa/20-denormalization.md) |
| Siêu khoá | *super key* | Tập cột mà không có hai dòng nào trùng nhau trên toàn bộ tập đó — được phép thừa cột | [Bài 12](cap-1-mo-hinh-er/12-bay-loai-khoa.md) |
| Lớp cha | *superclass* | Tập thực thể tổng quát mà các lớp con đều thuộc về | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Khoá nhân tạo | *surrogate key* | Khoá không mang ý nghĩa nghiệp vụ nào, chỉ tồn tại để định danh dòng | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |

## T

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Bảng | *table* | Khung lưới gồm hàng và cột chứa dữ liệu cùng loại | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Gộp bảng 1:1 | *table merging* | Nhập hai bảng quan hệ 1:1 luôn được đọc cùng nhau làm một | [Bài 20](cap-2-chuan-hoa/20-denormalization.md) |
| Bảng cho mỗi lớp con cụ thể | *table per concrete class* | Cách hiện thực kế thừa: không có bảng cha, mỗi lớp con một bảng đầy đủ tự lặp lại các cột chung | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Bảng cho mỗi lớp con | *table per subclass / class table inheritance* | Cách hiện thực kế thừa: một bảng cho lớp cha, mỗi lớp con thêm một bảng chứa phần riêng và trỏ về cha bằng khoá ngoại | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Dữ liệu theo thời gian | *temporal data* | Dữ liệu ghi kèm khoảng thời gian mà giá trị đó có hiệu lực | [Bài 19](cap-2-chuan-hoa/19-dang-chuan-4nf-5nf-6nf.md) |
| Mối quan hệ bậc ba | *ternary relationship* | Mối quan hệ có ba tập thực thể tham gia cùng lúc; tách ra là mất thông tin | [Bài 8](cap-1-mo-hinh-er/08-moi-quan-he-va-cardinality.md) |
| Dạng chuẩn 3 | *Third Normal Form — 3NF* | Bảng đã ở 2NF và không thuộc tính không khoá nào phụ thuộc bắc cầu vào một khoá dự tuyển | [Bài 18](cap-2-chuan-hoa/18-dang-chuan-3nf-bcnf.md) |
| Tham gia toàn phần | *total participation* | Mọi thực thể phía này đều bắt buộc phải tham gia mối quan hệ | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |
| Chuyên biệt hoá toàn phần | *total specialization* | Mọi thực thể lớp cha phải thuộc ít nhất một lớp con | [Bài 13](cap-1-mo-hinh-er/13-mo-hinh-eer.md) |
| Giao dịch | *transaction* | Một nhóm thao tác được bọc lại thành một đơn vị: `COMMIT` để giữ, `ROLLBACK` để trả lại nguyên trạng | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |
| Phụ thuộc bắc cầu | *transitive functional dependency* | `X → Z` đi vòng qua một tập `Y` trung gian, trong khi `Y` không xác định ngược lại `X` | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Bắc cầu | *transitivity* | Tiên đề Armstrong: `X → Y` và `Y → Z` thì `X → Z` | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Bẫy sự kiện | *trigger* | Đoạn lệnh mà database tự chạy mỗi khi một sự kiện dữ liệu xảy ra | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |
| Phụ thuộc hàm tầm thường | *trivial functional dependency* | `X → Y` với `Y ⊆ X` — luôn đúng nên chẳng nói lên điều gì | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Bộ | *tuple* | Tên học thuật của một hàng trong bảng — cùng nghĩa với *record* và *row* | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |

## U

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Một ngôi | *unary / recursive* | Mối quan hệ mà một tập thực thể tự liên kết với chính nó | [Bài 8](cap-1-mo-hinh-er/08-moi-quan-he-va-cardinality.md) |
| Luật hợp | *union* | Luật suy diễn: `X → Y` và `X → Z` thì `X → YZ` | [Bài 16](cap-2-chuan-hoa/16-phu-thuoc-ham.md) |
| Bất thường khi cập nhật | *update anomaly* | Muốn sửa một sự thật phải sửa nhiều dòng; sót một dòng là dữ liệu tự mâu thuẫn | [Bài 2](cap-0-nhap-mon/02-tu-so-giay-den-excel.md) |

## V

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Khoảng thời gian có hiệu lực | *valid-time period* | Cặp mốc đầu – cuối được tính là **một** giá trị duy nhất, cho biết một sự thật đúng trong khoảng nào | [Bài 19](cap-2-chuan-hoa/19-dang-chuan-4nf-5nf-6nf.md) |
| Giá trị | *value* | Nội dung của một ô trong bảng | [Bài 1](cap-0-nhap-mon/01-du-lieu-va-thong-tin.md) |
| Khung nhìn | *view* | Một câu truy vấn được đặt tên; bản thân nó **không chứa** dữ liệu thật | [Bài 3](cap-0-nhap-mon/03-dbms-la-gi.md) |

## W

| Tiếng Việt | English | Nghĩa trong một câu | Học ở bài |
|---|---|---|---|
| Thực thể yếu | *weak entity* | Thực thể không có thuộc tính khoá của riêng nó, nên phải mượn khoá của thực thể chủ | [Bài 9](cap-1-mo-hinh-er/09-participation-va-thuc-the-yeu.md) |
