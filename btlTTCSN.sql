GO
CREATE DATABASE ManageV2DB
GO
USE ManageV2DB
GO 
CREATE TABLE Users
(
	users_Id int Identity(1001,1) not null,		--ID
	users_Username nvarchar(50) unique not null,	    --Tài khoản
	users_Password nvarchar(12) not null,		--Mật khẩu
	users_Full_Name nvarchar(255) not null,		--Họ tên
	users_Position nvarchar(255),				--Chức vụ
	users_Img nvarchar(255),					--Ảnh
	users_Phone_Number nvarchar(255),			--Số điện thoại
	users_Address nvarchar(MAX),				--Địa chỉ
	primary key(users_Id)		
)
--Chèn dữ liệu vào bảng Users:
INSERT INTO Users(users_Username, users_Password, users_Full_Name, users_Position, users_Img, users_Phone_Number,
					users_Address)
VALUES (N'kienbt',N'kien2oo3',N'Bùi Trung Kiên',N'Quản trị viên','anhchandung.jpg','0398768562',N'Kiến Xương-Thái Bình'),
(N'duybede',N'duy1',N'Duy bede',N'Khách hàng',null,null,null),
(N'hungwibu',N'hung1',N'Hưng bede',N'Kỹ thuật viên',null,null,null)
GO
CREATE TABLE Project
(
	project_Id int Identity(1,1) not null,			--Mã dự án
	project_Name nvarchar(255) not null,			--Tên dự án
	project_Description nvarchar(MAX),			--Mô tả
	project_StartDate datetime,							--Ngày bắt đầu
	project_EndDate datetime,							--Ngày kết thúc
	project_Location nvarchar(MAX),						--Địa điểm
	project_Budget float,							--Ngân sách
	project_Manager nvarchar(255),						--Người quản lý
	project_Client_Id int,							--Khách hàng
	project_Status nvarchar(255),						--Trạng thái(đang triển khai, đã hoàn thành, đang trong giai đoạn bảo trì, ...)
	project_Type nvarchar(255),						--Loại dự án(cải tiến hệ thống hiện tại, triển khai từ đầu,...)
	primary key(project_Id),
	foreign key(project_Client_Id) references Users(users_Id),
)
--Chèn dữ liệu vào bảng Project:
INSERT INTO Project(project_Name, project_Description, project_StartDate, project_EndDate, project_Location, project_Budget,
					project_Manager, project_Client_Id, project_Status, project_Type)
VALUES (N'Dự án tòa nhà thông minh',N'Triển khai hệ thống điện thông minh','2023-01-01','2023-06-30',N'Tu Hoàng-Hà Nội',50000,N'Bùi Trung Kiên',1002,N'Đang triển khai',N'Cải tiến hệ thống hiện tại')
GO
CREATE TABLE Category
(
	category_Id int Identity(10,10) not null,     --Mã danh mục
	category_Name nvarchar(255) not null,		--Tên danh mục
	category_Notes nvarchar(MAX),				--Ghi chú
	category_Created_Date datetime,					--Ngày tạo
	category_Created_Author nvarchar(255),		--Người tạo
	category_Img nvarchar(255),					--Hình ảnh
	primary key(category_Id),
)
--Chèn dữ liệu vào bảng Category:
INSERT INTO Category(category_Name, category_Notes, category_Created_Date, category_Created_Author, category_Img)
VALUES (N'Thiết bị điều khiển từ xa', N'Các thiết bị có thể được điều khiển từ xa','2023-06-25',N'Công ty ABC',null),
(N'Thiết bị hẹn giờ', N'Các thiết bị có thể hẹn giờ','2023-06-25',N'Công ty ABC',null),
(N'Công tắc cảm biến', null,'2023-06-25',N'Công ty ABC',null),
(N'Thiết bị chiếu sáng', null,'2023-06-25',N'Công ty ABC',null),
(N'Chuông cửa thông minh', null,'2023-06-25',N'Công ty ABC',null)
GO
CREATE TABLE Device
(
	device_Id int Identity(100,1) not null,			--Mã thiết bị
	project_Id int,						--Mã dự án
	device_Name nvarchar(255),				--Tên sản phẩm
	device_Img nvarchar(255),				--Hình ảnh
	device_Description nvarchar(MAX),			--Mô tả
	device_Location nvarchar(MAX),				--Nơi sản xuất
	device_Price float,					--Giá bán
	device_Status nvarchar(255),				--Trạng thái
	category_Id int,					--Mã danh mục
	device_Specifications nvarchar(MAX),			--Thông số kỹ thuật
	device_Warranty nvarchar(MAX),				--Bảo hành
	device_Manufacturer nvarchar(255),			--Nhà sản xuất
	primary key(device_Id),
	foreign key(project_Id) references Project(project_Id),
	foreign key(category_Id) references Category(category_Id),
)
--Chèn dữ liệu vào bảng Device:
INSERT INTO Device(project_Id, device_Name, device_Img, device_Description, device_Location, device_Price,
					device_Status, category_Id,device_Specifications, device_Warranty, device_Manufacturer)
VALUES(1,N'Bộ công tắc điều khiển không dây KONO KN-RF43','rf43.PNG',N'Sử dụng công tắc không dây KONO KN-RF43 sẽ giúp bạn điều khiển các bóng đèn trong nhà thật dễ dàng và tiện lợi.',
		N'Hà Nội - Việt Nam', 500, N'Kích hoạt', 10, N'Tần số hoạt động: 433Mhz, Khoảng cách truyền tín hiệu: 70 mét (Không vật cản).', '2 năm',N'Công ty Smart Live'),
		(1,N'Chuông báo khách báo trộm thông minh KN-M6','m6.PNG',N'KN-M6 có khả năng Báo khách hoặc Báo động khi có đối tượng cố tình xâm phạm các khu vực quan trọng như quầy tính tiền, khu trưng bày, cửa tiệm….',
		N'Hà Nội - Việt Nam', 150, N'Kích hoạt', 50, N'Dòng làm việc: 100 mA, nguồn: DC 5V (3 viên Pin AAA), dòng khi không hoạt động: < 40uA, khoảng cách phát hiện: < 8m', null,N'Công ty Smart Live'),
		(1,N'Công tắc hẹn giờ (Timer) 24h TB 35-N','tb35n.PNG',N'Hẹn giờ tắt mở tự động tủ điện, bật tắt tự động đèn, đèn sân vườn, hệ thống lạnh, bơm nước, tưới cây….',
		N'Hà Nội - Việt Nam', 300, N'Kích hoạt', 20, N'Điện áp sử dụng 220VAC – 50 Hz, 3 chế độ hoạt động : ON – AUTO – OFF, thời gian cài đặt tối thiểu là 15 phút, kích thước 11x4x8 cm', null,N'Công ty Samrt Live'),
		(1, N'Chuông báo khách hồng ngoại không dây KN-M7','kn-m7.png',N'Chuông cửa không dây KN-M7 là sự lựa chọn hoàn hảo với nhu cầu của bạn. Giúp báo khách từ xa cho cửa hàng, nhà ở, văn phòng. Thiết kế hoàn toàn không dây, sử dụng bằng pin tiện lợi với 1 đầu cảm biến phát hiện di chuyển và 1 chuông báo.',
		N'Thanh Hóa - Việt Nam',440,N'Ngừng kích hoạt',50, N'Chuông báo khách không dây KN-M7 gồm 2 phần: Mắt hồng ngoại và Chuông không dây, Nguồn điện sử dụng: Mắt quét hồng ngoại: 2 pin AAA hoặc Adapter DC 5V, Chuông: 3 pin AAA hoặc Adapter DC 5V, Khoảng cách thu phát tín hiệu của cảm biến: Không vật cản: 45-50m, 
		Có vật cản: 15-20m, Vùng cảm ứng mắt hồng ngoại: 4~6m, Góc quét: Ngang 110 độ, Góc dọc 15 độ, Mức chỉnh âm lượng: 4 mức, Số kiểu nhạc chuông: 32 kiểu, Chiều cao lắp đặt của cảm biến: Gắn trần: 2.5 – 3.5m, Gắn tường: 1.5 – 2m.',
		N'2 năm',N'Công ty Smart Live'),
		(1,N'Chuông báo khách hồng ngoại không dây KONO KN-M20','kn-m20.png',N'Chuông báo khách hồng ngoại KN-M20 được thiết kế không dây, dễ dàng sử dụng. Chuông sẽ tự động kêu khi có khách ra vào. Thích hợp dùng làm chuông báo khách cho cửa hàng, shop thời trang, khách sạn, văn phòng, nhà ở…',
		N'Hà Nội - Việt Nam', 500, N'Kích hoạt', 50, N'Điện áp hoạt động:Cảm biến hồng ngoại: Pin AAA x 2 hoặc Adapter: 5V DC, Chuông: Điện 220V, Khoảng cách thu phát tín hiệu của cảm biến: Không vật cản: 45-50m, Có vật cản: 15-20m; Vùng quét của cảm biến: Từ 4~6 mét; Góc quét: Ngang 110 độ, Góc dọc 15 độ;
		Chiều cao lắp đặt của cảm biến: Gắn trần: 2.5 – 3.5m, Gắn tường: 1.5 – 2m; Mức chỉnh âm lượng: 4 mức; Số kiểu nhạc chuông: 32 kiểu; Có thể cho học thêm nhiều cảm biến cho 1 chuông', '1 năm',N'Công ty Smart Live'),
		(1,N'Chuông báo khách không dây không dùng Pin KONO KN-M528','kn-m528.png',N'Chuông báo khách không dây không dùng Pin KONO KN-M528 gồm 2 bộ phận là nút nhấn và chuông. Nút nhấn của chuông KN-M528 không cần dùng năng lượng pin hay điện. Khi ấn vào nút nhấn thì chuông sẽ phát ra tiếng nhạc để báo có khách. KN-M528 thích hợp sử dụng để làm chuông báo khách cho nhà ở, cửa hàng, shop thời trang, văn phòng công ty…',
		N'Hà Nội - Việt Nam', 380, N'Kích hoạt', 50, N'Điện áp: AC 85-260V 50Hz/60Hz; Nhiệt độ hoạt động: Từ -20 – 55 độ C; Chỉ số chống nước: IP 44; Khoảng cách từ chuông đến nút nhấn: 150 mét; Có 51 loại nhạc chuông và 4 mức âm lượng.', '2 năm',N'Công ty Smart Live'),
		(1,N'Chuông cửa Wifi có hình Tuya C600','c600.png',N'Chuông cửa Wifi thông minh C600 cho phép bạn xem được hình ảnh và trò chuyện với khách từ xa ngay trên điện thoại, hoặc thông báo bằng âm thanh qua chuông báo được gắn trong nhà. Dễ dàng cài đặt và sử dụng. Thích hợp lắp đặt sử dụng cho nhà ở, căn hộ chung cư, văn phòng, cửa hàng…',
		N'Hà Nội - Việt Nam', 1900, N'Kích hoạt', 50, N'Nguồn sử dụng: DC 5V 1A, Cổng nguồn: USB, Công suất tiêu thụ: 0.2W, Kiểu kết nối: Tần số vô tuyến, Tần số: 433 MHz ~ 868 MHz, Kiểu chuông: 4 kiểu, Mức âm lượng: 3 mức (Nhỏ – Vừa – Lớn), Âm lượng: Max 90dB, Nơi lắp đặt: Trong nhà.', '1 năm',N'Công ty Smart Live'),
		(1,N'Chuông cửa không dây cao cấp KN-M525','kn-m525.png',N'Dùng làm chuông báo khách cho nhà, shop, văn phòng công ty. Hoàn Toàn Không Dây. Nhấn chuông báo có khách đến văn phòng, nhà, cửa hàng, … Kiểu dáng đẹp, sang trọng, độ bền cao',
		N'Hà Nội - Việt Nam', 300, N'Kích hoạt', 50, N'Chuông cửa không dây KN-M525 gồm 2 bộ phận: nút nhấn chuông và chuông. Nút nhấn chuông: dùng pin A23 – Chuông cắm vào ổ điện 220V (rất dễ dàng). Hoàn toàn không dây, khoảng cách giữ nút và chuông: 45~50 m. Tín hiệu truyền vô tuyến xuyên tường. Có thể lựa chọn 32 kiển chuông tùy thích – và 4 mức âm lượng. Tính năng tự học lệnh của nút bấm, có thể mở rộng thêm nhiều nút bấm, mà các chuông cửa khách không có được..', '1 năm',N'Công ty Smart Live'),
		(1,N'Chuông cửa không dây kín nước KONO KN-C1','kn-c1.png',N'Chuông cửa không dây dùng làm chuông báo khách cho nhà, shop, văn phòng công ty. Hoàn Toàn Không Dây, Kiểu dáng đẹp, sang trọng, độ bền cao.',
		N'Hà Nội - Việt Nam', 390, N'Kích hoạt', 50, N'Chuông cửa không dây KN-C1 gồm 2 bộ phận: nút nhấn chuông và chuông, Nút nhấn chuông: dùng pin CR2032- Chuông cắm vào ổ điện 220V (rất dễ dàng); Hoàn toàn không dây, khoảng cách giữ nút và chuông: 35~50m. Tín hiệu truyền vô tuyến xuyên tường; Có thể lựa chọn 52 kiểu chuông tùy thích – và 4 mức âm lượng; Tính năng tự học lệnh của nút bấm, có thể mở rộng thêm nhiều nút bấm, mà các chuông cửa khách không có được; Nút chuông thiết kế kín nước nên có thể đặt ngoài trời; Chỉ số chống nước: IP55.', '2 năm',N'Công ty Smart Live')
GO
CREATE TABLE MaintenanceSchedule                 --Bảng lịch bảo trì
(
	schedule_Id int Identity(1001,1) not null,     		--Mã bảo trì
	device_Id int,						--Mã thiết bị
	schedule_StartDate datetime,				--Ngày bắt đầu
	schedule_EndDate datetime,					--Ngày kết thúc
	schedule_Location nvarchar(255),			--Địa điểm
	schedule_Description nvarchar(MAX),			--Mô tả
	schedule_Type nvarchar(255),				--Loại(Kiểm tra định kỳ, Nâng cấp firmware, thay thế pin...)
	schedule_Technician nvarchar(255),			--Kỹ thuật viên
	schedule_Status nvarchar(255),				--Trạng thái(đã hoàn thành, đang chờ xử lý, đang tiến hành...)
	primary key(schedule_Id),
	foreign key(device_Id) references Device(device_Id),
)
--Chèn dữ liệu vào bảng MaintenanceSchedule:
INSERT INTO MaintenanceSchedule(device_Id, schedule_StartDate, schedule_EndDate, schedule_Location, schedule_Description, schedule_Type,
			schedule_Technician, schedule_Status)
VALUES (100,'2024-01-12',null,N'Toà A1-Haui',null,N'Kiểm tra định kỳ',N'Nguyễn A',N'Đang chờ xử lý')
GO
CREATE TABLE Interactions                    --Bảng tương tác
(
	interaction_Id int Identity(1111,1111) not null,			 --MÃ tương tác
	device_Id int,										--Mã thiết bị
	users_Id int,										--Mã người dùng
	interaction_Type nvarchar(255),						 --Loại tương tác(bật/tắt, đặt nhiệt độ, phát hiện chuyển động,...)
	interaction_Time datetime,							 --Thời gian tương tác
	interaction_Details nvarchar(255),					 --Chi tiết(giá trị đặt nhiệt độ, thông báo khi có chuyển động,...)		
	primary key(interaction_Id),
	foreign key(device_Id) references Device(device_Id),
	foreign key(users_Id) references Users(users_Id)
)
--Chèn dữ liệu vào bảng Interactions:
INSERT INTO Interactions(device_Id, users_Id, interaction_Type, interaction_Time, interaction_Details)
VALUES (100,1002,N'Kích hoạt','2023-01-05 08:30:00',N'Người dùng 1001 đã kích hoạt thiết bị 100'),
(100,1002,N'Kích hoạt','2023-01-05 08:30:00',N'Người dùng 1001 đã kích hoạt thiết bị 100')