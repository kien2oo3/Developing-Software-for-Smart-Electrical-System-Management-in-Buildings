USE [ManageV2DB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/20/2024 2:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_Id] [int] IDENTITY(10,10) NOT NULL,
	[category_Name] [nvarchar](255) NOT NULL,
	[category_Notes] [nvarchar](max) NULL,
	[category_Created_Date] [datetime] NULL,
	[category_Created_Author] [nvarchar](255) NULL,
	[category_Img] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Device]    Script Date: 1/20/2024 2:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Device](
	[device_Id] [int] IDENTITY(100,1) NOT NULL,
	[project_Id] [int] NULL,
	[device_Name] [nvarchar](255) NULL,
	[device_Img] [nvarchar](255) NULL,
	[device_Description] [nvarchar](max) NULL,
	[device_Location] [nvarchar](max) NULL,
	[device_Price] [float] NULL,
	[device_Status] [nvarchar](255) NULL,
	[category_Id] [int] NULL,
	[device_Specifications] [nvarchar](max) NULL,
	[device_Warranty] [nvarchar](max) NULL,
	[device_Manufacturer] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[device_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interactions]    Script Date: 1/20/2024 2:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interactions](
	[interaction_Id] [int] IDENTITY(1111,1111) NOT NULL,
	[device_Id] [int] NULL,
	[users_Id] [int] NULL,
	[interaction_Type] [nvarchar](255) NULL,
	[interaction_Time] [datetime] NULL,
	[interaction_Details] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[interaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceSchedule]    Script Date: 1/20/2024 2:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceSchedule](
	[schedule_Id] [int] IDENTITY(1001,1) NOT NULL,
	[device_Id] [int] NULL,
	[schedule_StartDate] [datetime] NULL,
	[schedule_EndDate] [datetime] NULL,
	[schedule_Location] [nvarchar](255) NULL,
	[schedule_Description] [nvarchar](max) NULL,
	[schedule_Type] [nvarchar](255) NULL,
	[schedule_Technician] [nvarchar](255) NULL,
	[schedule_Status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[schedule_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 1/20/2024 2:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[project_Id] [int] IDENTITY(1,1) NOT NULL,
	[project_Name] [nvarchar](255) NOT NULL,
	[project_Description] [nvarchar](max) NULL,
	[project_StartDate] [datetime] NULL,
	[project_EndDate] [datetime] NULL,
	[project_Location] [nvarchar](max) NULL,
	[project_Budget] [float] NULL,
	[project_Manager] [nvarchar](255) NULL,
	[project_Client_Id] [int] NULL,
	[project_Status] [nvarchar](255) NULL,
	[project_Type] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[project_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/20/2024 2:52:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[users_Id] [int] IDENTITY(1001,1) NOT NULL,
	[users_Username] [nvarchar](50) NOT NULL,
	[users_Password] [nvarchar](12) NOT NULL,
	[users_Full_Name] [nvarchar](255) NOT NULL,
	[users_Position] [nvarchar](255) NULL,
	[users_Img] [nvarchar](255) NULL,
	[users_Phone_Number] [nvarchar](255) NULL,
	[users_Address] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[users_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_Id], [category_Name], [category_Notes], [category_Created_Date], [category_Created_Author], [category_Img]) VALUES (10, N'Thiết bị điều khiển từ xa', N'Các thiết bị có thể được điều khiển từ xa', CAST(N'2023-06-25T00:00:00.000' AS DateTime), N'Công ty ABC', NULL)
INSERT [dbo].[Category] ([category_Id], [category_Name], [category_Notes], [category_Created_Date], [category_Created_Author], [category_Img]) VALUES (20, N'Thiết bị hẹn giờ', N'Các thiết bị có thể hẹn giờ', CAST(N'2023-06-25T00:00:00.000' AS DateTime), N'Công ty ABC', NULL)
INSERT [dbo].[Category] ([category_Id], [category_Name], [category_Notes], [category_Created_Date], [category_Created_Author], [category_Img]) VALUES (30, N'Công tắc cảm ứng', NULL, CAST(N'2023-06-25T00:00:00.000' AS DateTime), N'Công ty ABC', NULL)
INSERT [dbo].[Category] ([category_Id], [category_Name], [category_Notes], [category_Created_Date], [category_Created_Author], [category_Img]) VALUES (40, N'Cảm biến bật tắt đèn', NULL, CAST(N'2023-06-25T00:00:00.000' AS DateTime), N'Công ty ABC', NULL)
INSERT [dbo].[Category] ([category_Id], [category_Name], [category_Notes], [category_Created_Date], [category_Created_Author], [category_Img]) VALUES (50, N'Chuông cửa thông minh', NULL, CAST(N'2023-06-25T00:00:00.000' AS DateTime), N'Công ty ABC', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Device] ON 

INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (100, 1, N'Bộ công tắc điều khiển không dây KONO KN-RF43', N'rf43.PNG', N'Sử dụng công tắc không dây KONO KN-RF43 sẽ giúp bạn điều khiển các bóng đèn trong nhà thật dễ dàng và tiện lợi.', N'Tầng 9, 10, 11 tòa A1 - Haui', 500, N'Ngừng kích hoạt', 10, N'Tần số hoạt động: 433Mhz, Khoảng cách truyền tín hiệu: 70 mét (Không vật cản).', N'2 năm', N'Công ty Smart Live')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (101, 3, N'Chuông báo khách báo trộm thông minh KN-M6', N'm6.PNG', N'KN-M6 có khả năng Báo khách hoặc Báo động khi có đối tượng cố tình xâm phạm các khu vực quan trọng như quầy tính tiền, khu trưng bày, cửa tiệm….', N'Tầng hầm', 150, N'Kích hoạt', 50, N'Dòng làm việc: 100 mA, nguồn: DC 5V (3 viên Pin AAA), dòng khi không hoạt động: < 40uA, khoảng cách phát hiện: < 8m', N'2 năm', N'Công ty Smart Live')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (102, 1, N'Công tắc hẹn giờ (Timer) 24h TB 35-N', N'tb35n.PNG', N'Hẹn giờ tắt mở tự động tủ điện, bật tắt tự động đèn, đèn sân vườn, hệ thống lạnh, bơm nước, tưới cây….', N'Tầng 4,5,6 tòa A1 - Haui', 300, N'Kích hoạt', 20, N'Điện áp sử dụng 220VAC – 50 Hz, 3 chế độ hoạt động : ON – AUTO – OFF, thời gian cài đặt tối thiểu là 15 phút, kích thước 11x4x8 cm', N'1 năm', N'Công ty Samrt Live')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (103, 1, N'Chuông báo khách hồng ngoại không dây KN-M7', N'kn-m7.png', N'Chuông cửa không dây KN-M7 là sự lựa chọn hoàn hảo với nhu cầu của bạn. Giúp báo khách từ xa cho cửa hàng, nhà ở, văn phòng. Thiết kế hoàn toàn không dây, sử dụng bằng pin tiện lợi với 1 đầu cảm biến phát hiện di chuyển và 1 chuông báo.', N'Tầng 12 tòa A1 - Haui', 440, N'Kích hoạt', 50, N'Chuông báo khách không dây KN-M7 gồm 2 phần: Mắt hồng ngoại và Chuông không dây, Nguồn điện sử dụng: Mắt quét hồng ngoại: 2 pin AAA hoặc Adapter DC 5V, Chuông: 3 pin AAA hoặc Adapter DC 5V, Khoảng cách thu phát tín hiệu của cảm biến: Không vật cản: 45-50m, 
		Có vật cản: 15-20m, Vùng cảm ứng mắt hồng ngoại: 4~6m, Góc quét: Ngang 110 độ, Góc dọc 15 độ, Mức chỉnh âm lượng: 4 mức, Số kiểu nhạc chuông: 32 kiểu, Chiều cao lắp đặt của cảm biến: Gắn trần: 2.5 – 3.5m, Gắn tường: 1.5 – 2m.', N'2 năm', N'Công ty Smart Live')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (104, 2, N'Chuông báo khách hồng ngoại không dây KONO KN-M20', N'kn-m20.png', N'Chuông báo khách hồng ngoại KN-M20 được thiết kế không dây, dễ dàng sử dụng. Chuông sẽ tự động kêu khi có khách ra vào. Thích hợp dùng làm chuông báo khách cho cửa hàng, shop thời trang, khách sạn, văn phòng, nhà ở…', N'Tầng 1', 500, N'Kích hoạt', 50, N'Điện áp hoạt động:Cảm biến hồng ngoại: Pin AAA x 2 hoặc Adapter: 5V DC, Chuông: Điện 220V, Khoảng cách thu phát tín hiệu của cảm biến: Không vật cản: 45-50m, Có vật cản: 15-20m; Vùng quét của cảm biến: Từ 4~6 mét; Góc quét: Ngang 110 độ, Góc dọc 15 độ;		Chiều cao lắp đặt của cảm biến: Gắn trần: 2.5 – 3.5m, Gắn tường: 1.5 – 2m; Mức chỉnh âm lượng: 4 mức; Số kiểu nhạc chuông: 32 kiểu; Có thể cho học thêm nhiều cảm biến cho 1 chuông', N'1 nam', N'Công ty Smart Live')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (105, 2, N'Chuông báo khách không dây không dùng Pin KONO KN-M528', N'kn-m528.png', N'Chuông báo khách không dây không dùng Pin KONO KN-M528 gồm 2 bộ phận là nút nhấn và chuông. Nút nhấn của chuông KN-M528 không cần dùng năng lượng pin hay điện. Khi ấn vào nút nhấn thì chuông sẽ phát ra tiếng nhạc để báo có khách. KN-M528 thích hợp sử dụng để làm chuông báo khách cho nhà ở, cửa hàng, shop thời trang, văn phòng công ty…', N'Tầng hầm để xe', 380, N'Kích hoạt', 50, N'Điện áp: AC 85-260V 50Hz/60Hz; Nhiệt độ hoạt động: Từ -20 – 55 độ C; Chỉ số chống nước: IP 44; Khoảng cách từ chuông đến nút nhấn: 150 mét; Có 51 loại nhạc chuông và 4 mức âm lượng.', N'2 năm', N'Công ty Smart Live')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (106, 1, N'Chuông cửa Wifi có hình Tuya C600', N'c600.png', N'Chuông cửa Wifi thông minh C600 cho phép bạn xem được hình ảnh và trò chuyện với khách từ xa ngay trên điện thoại, hoặc thông báo bằng âm thanh qua chuông báo được gắn trong nhà. Dễ dàng cài đặt và sử dụng. Thích hợp lắp đặt sử dụng cho nhà ở, căn hộ chung cư, văn phòng, cửa hàng…', N'Tầng 10 tòa A1 - Haui', 1900, N'Kích hoạt', 50, N'Nguồn sử dụng: DC 5V 1A, Cổng nguồn: USB, Công suất tiêu thụ: 0.2W, Kiểu kết nối: Tần số vô tuyến, Tần số: 433 MHz ~ 868 MHz, Kiểu chuông: 4 kiểu, Mức âm lượng: 3 mức (Nhỏ – Vừa – Lớn), Âm lượng: Max 90dB, Nơi lắp đặt: Trong nhà.', N'1 năm', N'Công ty Smart Live')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (107, 1, N'Chuông cửa không dây cao cấp KN-M525', N'kn-m525.png', N'Dùng làm chuông báo khách cho nhà, shop, văn phòng công ty. Hoàn Toàn Không Dây. Nhấn chuông báo có khách đến văn phòng, nhà, cửa hàng, … Kiểu dáng đẹp, sang trọng, độ bền cao', N'Tầng 6 tòa A1 - Haui', 300, N'Kích hoạt', 50, N'Chuông cửa không dây KN-M525 gồm 2 bộ phận: nút nhấn chuông và chuông. Nút nhấn chuông: dùng pin A23 – Chuông cắm vào ổ điện 220V (rất dễ dàng). Hoàn toàn không dây, khoảng cách giữ nút và chuông: 45~50 m. Tín hiệu truyền vô tuyến xuyên tường. Có thể lựa chọn 32 kiển chuông tùy thích – và 4 mức âm lượng. Tính năng tự học lệnh của nút bấm, có thể mở rộng thêm nhiều nút bấm, mà các chuông cửa khách không có được..', N'1 nam', N'Công ty Smart Live')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (108, 1, N'Chuông cửa không dây kín nước KONO KN-C1', N'kn-c1.png', N'Chuông cửa không dây dùng làm chuông báo khách cho nhà, shop, văn phòng công ty. Hoàn Toàn Không Dây, Kiểu dáng đẹp, sang trọng, độ bền cao.', N'Tầng 1 tòa A1 - Haui', 390, N'Kích hoạt', 50, N'Chuông cửa không dây KN-C1 gồm 2 bộ phận: nút nhấn chuông và chuông, Nút nhấn chuông: dùng pin CR2032- Chuông cắm vào ổ điện 220V (rất dễ dàng); Hoàn toàn không dây, khoảng cách giữ nút và chuông: 35~50m. Tín hiệu truyền vô tuyến xuyên tường; Có thể lựa chọn 52 kiểu chuông tùy thích – và 4 mức âm lượng; Tính năng tự học lệnh của nút bấm, có thể mở rộng thêm nhiều nút bấm, mà các chuông cửa khách không có được; Nút chuông thiết kế kín nước nên có thể đặt ngoài trời; Chỉ số chống nước: IP55.', N'2 nam', N'Công ty Smart Live')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (109, 2, N'Chiết áp cảm ứng Lumi LM-DR', N'c4.PNG', N'Chiết áp cảm ứng Lumi LM-DR sử dụng công nghệ cảm ứng điện dung, mặt kính cường lực, chống xước, chống va đập, cho phép điều chỉnh độ sáng trên điện thoại, máy tính bảng, kết hợp với vòng tròn tỏa sáng LED bao quanh tạo nên sự lôi cuốn, tinh tế và sang trọng.Sản phẩm thường đươc dùng để điều chỉnh độ sáng đèn chùm, đèn ngủ…Chiết áp cảm ứng Lumi LM-DR tích hợp công nghệ không dây Zigbee cho phép bật tắt công tắc điều khiển từ xa trên điện thoại, máy tính bảng từ bất cứ đâu có kết nối Internet.Sản phẩm có 2 kiểu dáng là: Kính đen viền vàng và kính trắng viền vàng.', N'Tầng 1, 2, 3, 4, 5', 1200, N'Kích hoạt', 10, N'Nguồn cung cấp: 100-240V 50/60Hz; Công suất: 350W; Kích thước: Hình vuông(86 x 86 mm), Hình chữ nhật (125 x 95 mm); Nhiệt độ hoạt động: 65ºC max; Chuẩn không dây: Zigbee', N'2 năm', N'Công ty LUMI')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (110, 1, N'Hạt công tắc cảm ứng điều khiển từ xa Smart Control P218 Plus', N'c2.PNG', N'Hạt công tắc cảm ứng điều khiển từ xa Smart Control P218 Plus được thiết kế bằng chất liệu nhựa ABS cao cấp, chống cháy nổ. Được thiết kế và lập trình đóng tại tiếp điểm 0, đảm bảo không có tình trạng đánh tia lửa điện khi tải sử dụng nhiều bóng Led như các công tắc thông thường trên thị trường.', N'Tầng 1,2,3 tòa A1 - Haui', 218, N'Ngừng kích hoạt', 10, N'Điện áp: 24 – 265V 50/60Hz.
Dòng tải: 10A Relay Hongfa.
Tần số: RF 315Mhz.
Khoảng cách: Khoảng từ 100 – 150 mét (Không vật cản).
Kích thước: 42 x 22 x 22 mm.', N'1 năm', N'Công ty Smart Control')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (111, 2, N'Remote điều khiển từ xa KN-RM11', N'c3.PNG', N'Remote điều khiển từ xa KN-RM11 là phụ kiện chống trộm điều khiển từ xa sử dụng bằng nguồn pin A23 tìm mua tại các cửa hàng bán linh kiện điện, giúp bạn dễ dàng sử dụng và thay mới pin khi có nhu cầu.Remote điều khiển từ xa KN-RM11 giúp bạn điều khiển bộ trung tâm chống trộm từ xa và các thiết bị có tấn số 433 MHz bằng công nghệ sóng vô tuyến RF, có khả năng truyền lệnh xuyên qua các vật cản (tường, kính, sắt…) với tầm xa đạt tới 50m. Đặc biệt, ăng-ten được thiết kế gắn bên trong remote, đem lại kiểu dáng đẹp mắt và tân thời cho sản phẩm.', N'Tầng 2, 3, 4, 5', 160, N'Ngừng kích hoạt', 10, N'Remote điều khiển từ xa KN-RM11Tắt/mở từ xa trung tâm báo trộmĐiều khiển tắt/mở các thiết bị có tần số 433 MHzCó 4 nút nhấnDùng Pin: 1 viên CR2032Khoảng cách truyền không dây 50m, xuyên vật cản', N'1 năm', N'Công ty KONO - Việt Nam')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (112, 1, N'Công tắc Wifi điều khiển từ xa Smart Life SK3-US', N'c4.PNG', N'Công tắc Wifi điều khiển từ xa Smart Life SK3-US giúp bạn có thể điều khiển các thiết bị điện trong nhà từ xa qua điện thoại, điều khiển bằng giọng nói, hay là hẹn giờ bật tắt thiết bị điện hoàn toàn tự động.
Công tắc Wifi SK3 sẽ mang đến cho bạn một cuộc sống thật tiện nghi và dễ dàng.', N'Tầng 1,2,3 tòa A1 - Haui', 500, N'Ngừng kích hoạt', 10, N'Điện áp: AC 100V – 250V 50/60Hz.
Cường độ dòng điện: 10A (Max).
Công suất: 2000W.
App hỗ trợ: IOS/Android (SmartLife).
Tiêu chuẩn không dây: IEE802.11 b/g/n.
Tần số không dây: Wifi 2.4GHz hoặc Wifi 2.4GHz + RF433.92MHz.
Màu sắc: Trắng.', N'2 năm', N'Công ty Smart Live')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (113, 1, N'Công tắc thời gian 24h Han Seung HTS-24BB', N't1.PNG', N'Công tắc thời gian Han Seung HTS-24BB là một loại đồng hồ hẹn giờ nổi tiếng của thương hiệu Han Seung được sản xuất tại Hàn Quốc, thiết kế với dạng đồng hồ cơ, cho phép lập trình hoạt động bật/tắt thiết bị hàng ngày (24h), hoạt động chính xác và độ an toàn cao.Thời gian Bật hoặc Tắt tối thiểu (ON hoặc OFF) là 10 phút, với 144 phân đoạn trong 24h. Chu kỳ bật và tắt (ON và OFF) tối thiểu là 20 phút, với 72 chu kỳ trong vòng 24h.', N'Tầng 9, 10,11 tòa A1 - Haui', 636, N'Ngừng kích hoạt', 20, N'Điện áp sử dụng: 110 ~ 220 VAC, 50~60HzCường độ dòng điện:Thuần trở: 16AĐộng cơ: 3AĐèn huỳnh quang: <1.000WTiếp điểm: COM, NO, NC (3 chân)Chế độ hoạt động: Tự động (AUTO) hoặc luôn bật (ON)Thời gian cài đặt ngắn nhất: 10 phútPin dự phòng NiMH: 72 giờKiểu lắp đặt: Gắn nổi hoặc gắn thanh DIN RailNhiệt độ hoạt động: -10 độ C ~ 60 độ CKích thước: 112.5 × 77.5 × 40.2mm', N'1 năm', N'Han Seung – Hàn Quốc')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (114, 1, N'Công tắc thời gian Simplexa 602 Top LI', N't2.PNG', N'Công tắc SIMPLEXA 602 Top LI là loại công tắc hẹn giờ kỹ thuật số cao cấp của thương hiệu TheBen – Đức. Sản phẩm chuyên dụng lắp đặt trong tủ điện để hẹn giờ bật tắt các hệ thống điện hoặc các thiết bị điện có công suất lớn theo thời gian thực tế.Sản phẩm thường được sử dụng để điều khiển chiếu sáng công cộng, đèn bảng hiệu, đèn quảng cáo, đèn sinh hoạt, máy bơm nước, tưới cây tự động,…', N'Tầng 7,8,9 tòa A1 - Haui', 1490, N'Ngừng kích hoạt', 20, N'Số kênh: 2 kênhSố chương trình cài đặt: 28 chương trìnhĐiện áp hoạt động: 220-230V/AC, 50-60HzCông suất không tải: 0.8WCông suất đèn LED < 2W: 30WCông suất đèn LED > 2W: 300WCông suất đèn sợi đốt/Halogen: 2600WCông suất đèn huỳnh quang Compact: 2600WThời gian chuyển mạch ngắn nhất: 1 phútNhập liệu và điều khiển: 4 nút + 1 nút tái lậpPin dự phòng: 48 giờ và có thể sạc lạiNhiệt độ môi trường hoạt động: –30 °C đến +55 °CĐộ kín bụi và nước: IP 20 (theo EN 60 529)Cấp độ an toàn điện: II (theo EN 60 730-1)Vỏ và vật liệu cách điện: Chịu nhiệt độ cao, chất dẻo nhiệt tự tắtKiểu gắn: DIN-rail/ 2 modules', N'2 năm', N'TheBen – Đức')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (115, 1, N'Ổ cắm điện hẹn giờ ETG-63A', N't4.PNG', N'Hẹn giờ tự động thiết bị điện trong nhà: đèn, quạt, motor bơm nước, lọc nước thủy sinh, tưới cây tự động. Chỉ cài đặt một làn và ổ cắm hẹn giờ ETG-63A hẹn giờ tắt mở tự động các thiết bị với thời gian hẹn sẵn. Tiết kiệm thời gian và điện cho gia đình bạn.', N'Tầng 1,2,3 tòa A1 - Haui', 220, N'Ngừng kích hoạt', 20, N'Điệp áp: 220V AC – 50 Hz Công suất tải: điện trờ 1500 W , điện cảm ( máy bơm, máy lạnh ) : 350W ( 0,5 HP ) Với những tải công suất lớn hơn công suất trên, kết hợp timer ETG-63A với khởi động từ Hẹn giờ 20 lần ON ( mở ) và 20 lần OFF ( tắt ) thiết bị trong một ngày Thời gian hẹn giờ tối thiểu là 1 giây Có pin chờ khi cúp điện lên đến 100 giờ Có thể chọn lịch làm việc cho timer trong cả tuần hoặc từng ngày riêng lẻ', N'1 năm', N'Công ty KONO - Việt Nam')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (116, 1, N'Công tắc cảm ứng mặt kính Smart Control S686', N'm1.PNG', N'Công tắc cảm ứng S686 rất thích hợp để ứng dụng cho các công trình như: Căn hộ chung cư, nhà ở, biệt thự, văn phòng công ty…Công tắc cảm ứng Smart Control S686 được thiết kế đẹp với mặt kính cường lực hiện đại, màu trắng sang trọng, phù hợp với mọi không gian sống.
Sản phẩm có 2 kích thước là Hình Vuông và Hình Chữ Nhật cho bạn lựa chọn.', N'Tầng 6, 7, 8 tòa A1- Haui', 686, N'Ngừng kích hoạt', 10, N'Điện áp ngõ vào: 85-265V AC/50-60Hz.
Đèn báo trạng thái On/Off: Đỏ/Xanh dương.
Tần số học lệnh: 315Mhz.
Số lệnh nhớ cho mỗi nút: 3.
Số ngõ ra Relay: 4.
Dòng chịu tải: 10A.
Độ xa nhận sóng ngoài không gian trống: > 50 mét.
Vật liệu mặt nạ: Kính cường lực 2mm.
Màu sắc nhựa: Trắng.
Kích thước:
Mặt nạ vuông: 86 x 86mm.
Mặt nạ chữ nhật: 120 x 70mm.
Trọng lượng: 300g.', N'1 năm', N'Công ty Smart Control')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (117, 3, N'Hạt công tắc cảm ứng điều khiển từ xa Smart Control S168', N'm2.PNG', N'Công tắc cảm ứng chạm thông minh S168 – Giải pháp hoàn toàn mới giúp bạn điều khiển bật tắt các thiết bị điện trong nhà từ xa qua remote hay smartphone vô cùng dễ dàng, tiện lợi.Công tắc cảm ứng chạm thông minh S168 là công tắc điện tử dùng để thay thế cho hạt công tắc cơ, có hạt SINO hoặc Clipsal.Nếu như công tắc thường bạn phải đến gần vị trí để tắt bật đèn, các thiết bị điện trong nhà, văn phòng… thì với công tắc thông minh S168, bạn chỉ cần ngồi một chỗ, dùng remote hay smartphone để điều khiển bật tắt.', N'Tất cả các tầng', 160, N'Ngừng kích hoạt', 30, N'Chất liệu: Nhựa ABSCông suất: <1WTần số: RF315Mhz (chip 2262, 1527)Điện áp: 220VAC – 50/60HzĐiều khiển: Chạm cảm ứngKích thước: 42x22x22mmDòng tải: 10A relay PanasonicBộ nhớ: 5 cặp lệnh on/offKhoảng cách: 100-150 mét trong môi trường trốngMặt nạ: Sino, ClipsalSố hạt trên mặt nạ: 1-6', N'1 năm', N'Công ty Smart Control')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (118, 1, N'Bật đèn hồng ngoại KONO KN-S08', N'm3.PNG', N'Bật đèn hồng ngoại KN-S08 ứng dụng bật đèn tự động cho hành lang, sân vườn, kho bãi, nhà xưởng và cả các khu vực ngoài trời như sân thượng, mái hiên, hẻm tối, ngõ sau, sân vườn… Đèn sẽ tự động bật sáng khi có người đến, và tự động tắt khi không còn ai.', N'Tầng 6,7,8,9 tòa A1 - Haui', 260, N'Kích hoạt', 40, N'Điện áp: 220VAC – 50/60 hz
Công suất tải: 1200W (sợi đốt, Huỳnh quang 300W, Cuộn dây 300W
Góc cảm ứng: 180 độ
Khoảng cách cảm ứng: 5 ~ 12m (tùy chỉnh)
Thời gian trễ: 10 giây ~ 10 phút (tùy chỉnh)
Cảm ứng ánh sáng: <10 lux ~ 2000 lux chỉnh hoạt động ngày đêm hoặc chỉ ban đêm
Chỉ số bảo vệ: IP44
Nhiệt độ làm việc: -20 đến + 40 độ C', N'1 năm', N'Công ty KONO - Việt Nam')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (119, 3, N'Bộ điều khiển thiết bị điện từ xa bằng Remote Smart Control S688', N'c5.PNG', N'Bạn có muốn điều khiển các thiết bị điện trong nhà có công suất lớn như: Máy bơm nước, bóng đèn, quạt điện, máy nước nóng… từ xa?Thiết bị Remote Smart Control S688 sẽ giúp bạ điều khiển tắt mở các thiết bị điện từ xa bằng Remote một cách dễ dàng. Trung tâm điều khiển được thiết kế hoàn toàn kín nước, lắp đặt ngoài trời mà không sợ vô nước, không cần lắp thêm tủ điện.', N'Tầng 2, 3, 4, 5', 688, N'Kích hoạt', 10, N'– Thương hiệu: Smart Control – Việt Nam.– Tần số hoạt động: 315Mhz.– Dòng chịu tải: 40A.– Điện áp hoạt động: 220V.– Pin dùng cho Remote: 1 viên pin 9V.– Trọng lượng: 200g.– Kích thước hộp giấy: 150 x 110 x 55 mm.', N'2 năm', N'Công ty Smart Control')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (120, 3, N'Chuông cửa Wifi có hình Tuya C600', N'c600.PNG', N'Chuông cửa Wifi thông minh C600 cho phép bạn xem được hình ảnh và trò chuyện với khách từ xa ngay trên điện thoại, hoặc thông báo bằng âm thanh qua chuông báo được gắn trong nhà. Dễ dàng cài đặt và sử dụng. Thích hợp lắp đặt sử dụng cho nhà ở, căn hộ chung cư, văn phòng, cửa hàng…', N'Tầng 1', 1900, N'Ngừng kích hoạt', 50, N'1 nút nhấn chuông cửa có Camera (Gắn bên ngoài)
1 chuông báo (Gắn bên trong nhà)
1 cáp USB dài 2m
2 pin sạc 18650
2 giấy HDSD và kết nối
2 miếng keo dán hai mặt 3M
1 khóa vặn 6 cạnh
1 vít 3 ke nhỏ
1 cây nhấn để Reset thiết bị và 1 ốc vít gắn chặt nút nhấn chuông video
3 tắc kê nhựa và 3 ốc vít bắt vào tường', N'2 năm', N'Tập đoàn TUYA')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (121, 3, N'Cảm biến bật đèn tự động hồng ngoại Theben theMura S180-100 UP WH', N'k2.PNG', N'Cảm biến bật đèn tự động hồng ngoại Theben the Mura S180-100 giúp bật/tắt các bóng đèn hoàn toàn tự động dựa theo sự hiện diện của con người và theo ánh sáng của môi trường xung quanh.Thiết bị thích hợp để lắp đặt tại các khu vực có người đi lại trong ngôi nhà của bạn, như: Phòng khách, sảnh đợi, lối đi trong nhà, hành lang, cầu thang…Sử dụng cảm biến bật đèn Theben the Mura S180 sẽ giúp bạn tránh được tình trạng quên tắt đèn sau khi sử dụng => Giúp tiết kiệm điện và mang đến sự tiện lợi cho bạn và người thân trong gia đình.', N'Tầng 5, 6, 7, 8', 1830, N'Ngừng kích hoạt', 40, N'Điện áp hoạt động: 230VAC.Tần số: 50 – 60 Hz.
Công suất tiêu thụ: 0.4 W.
Hệ thống phát hiện: Cảm biến hồng ngoại thụ động.
Số kênh: 1 đèn – Rơ le.
Thời gian trễ: Từ 10 giây – 30 phút.
Chế độ hoạt động: Tự động/bán tự động.
Chỉ số bảo vệ: IP20.
Môi trường hoạt động: Từ -15 đến 45 độ C.
Tải đèn sợi đốt/Halogen: 2300 W.Tải đèn Led < 2W: 40 W.
Tải đèn Led > 2W: 450W.Ngưỡng chiếu sáng: 5 – 1000 Lux.Góc quét: 170o, lên đến 14x17m (238m2 ).
Chiều cao lắp đặt: Từ 0.8 – 1.2m.
Vị trí lắp đặt: Gắn tường phẳng (âm tường, ở trong nhà).', N'2 năm', N'Công ty Theben - Đức')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (122, 3, N'Ổ cắm điện hẹn giờ ETG-63A', N'k3.PNG', N'Hẹn giờ tự động thiết bị điện trong nhà: đèn, quạt, motor bơm nước, lọc nước thủy sinh, tưới cây tự động.
Chỉ cài đặt một làn và ổ cắm hẹn giờ ETG-63A hẹn giờ tắt mở tự động các thiết bị với thời gian hẹn sẵn.
Tiết kiệm thời gian và điện cho gia đình bạn.', N'Tầng 2, 3, 4, 5, 6, 7, 8', 220, N'Ngừng kích hoạt', 20, N'Điệp áp: 220V AC – 50 Hz
Công suất tải: điện trờ 1500 W , điện cảm ( máy bơm, máy lạnh ) : 350W ( 0,5 HP )
Với những tải công suất lớn hơn công suất trên, kết hợp timer ETG-63A với khởi động từ
Hẹn giờ 20 lần ON ( mở ) và 20 lần OFF ( tắt ) thiết bị trong một ngày
Thời gian hẹn giờ tối thiểu là 1 giây
Có pin chờ khi cúp điện lên đến 100 giờ
Có thể chọn lịch làm việc cho timer trong cả tuần hoặc từng ngày riêng lẻ', N'2 năm', N'Công ty KONO - Việt Nam')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (123, 2, N'Cảm biến chuyển động Theben TheLuxa E180 WH', N't7.PNG', N'Theben TheLuxa E180 WH là cảm biến hồng ngoại có tính năng tự động bật/tắt đèn theo sự chuyển động và theo ánh sáng trong khu vực giám sát.
Cảm biến hồng ngoại Theben TheLuxa E180 WH thích hợp ứng dụng dùng để lắp ở một số vị trí trong nhà bạn, như: ban công, hành lang, lối đi, cầu thang, nhà kho… hay tại các văn phòng công ty, cửa hàng…', N'Tầng 2, 3, 4, 5', 1330, N'Ngừng kích hoạt', 40, N'Góc phát hiện: 180 độ.
Phạm vi: 4m ~ 12 mét.
Ngưỡng chiếu sáng: Từ 5 ~ 1000 lux.
Thời gian trễ: Từ 5 giây ~ 15 phút.
Điều chỉnh độ nhạy: Có.
Số kênh: 01 (đèn).
Độ kín: IP55.
Vị trí lắp đặt: Gắn nổi trên tường.
Cao độ lắp đặt: Từ 2 ~ 4 mét.
Môi trường hoạt động: Từ -20°C đến 40°C.
Điện áp hoạt động: 220VAC +10%/-15%.
Tần số: 50 – 60Hz.
Công suất: < 1 W.
Ngõ ra Relay 230VAC.
Có thể điều chỉnh độ sáng bật tắt.
Có thể điều chỉnh thời gian bật tắt.', N'2 năm', N'Công ty Theben - Đức')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (124, 3, N'Cảm biến hồng ngoại gắn tường KONO KN-S15B', N't8.PNG', N'Cảm biến hồng ngoại gắn tường KONO KN-S15B sẽ tự động bật đèn khi có người chuyển động trong vùng cảm ứng và sẽ tự động tắt khi không còn chuyển động. Thích hợp gắn ở hành lan, phòng khách, nhà vệ sinh…Cảm biến hồng ngoại gắn tường KONO KN-S15B tự động bật tắt ngõ ra khi có người di chuyển trong vùng cảm ứng.', N'Tầng 2, 3, 4, 5', 190, N'Ngừng kích hoạt', 40, N'Nguồn điện: 220V/AC-240V/AC.
Cường độ dòng điện: 50Hz.
Dòng chịu tải: 2000W.
Thời gian trễ: 10 giây – 15 phút (Có thể tùy chỉnh).
Cảm biến ánh sáng: 10-2000LUX (Có thể tùy chỉnh).
Khoảng cách cảm ứng: 12 mét.
Chiều cao lắp đặt: 1.8 mét – 2.5 mét.
Vùng cảm ứng: 180 độ.
Mức tiêu thụ điện năng: 0.45 W (Khi làm việc); 0.1 W (Khi ở chế độ chờ).
Nhiệt độ làm việc: -20 đến 40 độ C.
Đổ ẩm làm việc: < 93%RH.', N'1 năm', N'Công ty KONO - Việt Nam')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (125, 2, N'Ổ cắm hẹn giờ Wifi Tuya SK601 Plus', N't5.PNG', N'Ổ cắm hẹn giờ Wifi SK601 Plus có tính năng cho phép bạn dùng điện thoại để điều khiển Bật/Tắt ổ cắm từ xa một cách dễ dàng và tiện lợi. Bạn cũng có thể thiết lập hẹn giờ và đặt lịch tự động Bật/Tắt theo ý mình, tránh trường hợp hay quên tắt các thiết bị điện trong nhà, đảm bảo an toàn điện khi sử dụng.', N'Tầng 2, 3, 4, 5', 350, N'Ngừng kích hoạt', 10, N'Nguồn điện: 100-240V AC, 50/60Hz
Tải tối đa: 3750W – 15A
Nhiệt độ hoạt động: -20 ~ +50 độ C
Tần số wifi sử dụng: 2.4GHz', N'1 năm', N'Công ty TUYA')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (126, 2, N'Ổ cắm hẹn giờ Wifi Tuya SK017', N't9.PNG', N'Ổ cắm hẹn giờ Wifi thông minh SK017 cho phép bạn dễ dàng điều khiển Bật / Tắt các thiết bị điện từ xa bằng điện thoại ở bất cứ đâu. Bạn cũng có thể hẹn giờ và đặt lịch tự động theo ý mình. Không còn phải lo lắng về việc hay đi ra ngoài và quên tắt nguồn điện các thiết bị.', N'Tầng 2, 3, 4, 5, 6, 7', 990, N'Kích hoạt', 10, N'Nguồn điện sử dụng: 110-240 V/AC, 50-60Hz
Đầu ra nguồn AC: 10A (hoặc 15A)
Nguồn USB: 5V – 2.1A
Mạng kết nối: Wifi
Chuẩn Wifi: 2.4GHz
Số lượng ổ cắm: 4 (AC)
Số lượng cổng USB: 2 cổng sạc nhanh
Chiều dài dây: 1.2m
Kích thước: 33.5 x 6.5 x 4cm
Tương thích hệ điều hành: Android/iOS
Bảo vệ quá tải điện khi sử dụng
Bảo vệ đa năng trên tất cả các ổ cắm
Kết hợp được với Amazon Alexa và Google Assistant', N'1 năm', N'Công ty TUYA')
INSERT [dbo].[Device] ([device_Id], [project_Id], [device_Name], [device_Img], [device_Description], [device_Location], [device_Price], [device_Status], [category_Id], [device_Specifications], [device_Warranty], [device_Manufacturer]) VALUES (127, 1, N'Hạt công tắc cảm ứng điều khiển từ xa Smart Control S168', N't10.PNG', N'Công tắc cảm ứng chạm thông minh S168 – Giải pháp hoàn toàn mới giúp bạn điều khiển bật tắt các thiết bị điện trong nhà từ xa qua remote hay smartphone vô cùng dễ dàng, tiện lợi.
Công tắc cảm ứng chạm thông minh S168 là công tắc điện tử dùng để thay thế cho hạt công tắc cơ, có hạt SINO hoặc Clipsal.
Nếu như công tắc thường bạn phải đến gần vị trí để tắt bật đèn, các thiết bị điện trong nhà, văn phòng… thì với công tắc thông minh S168, bạn chỉ cần ngồi một chỗ, dùng remote hay smartphone để điều khiển bật tắt.', N'Tầng 2, 3, 4, 5', 168, N'Ngừng kích hoạt', 10, N'Chất liệu: Nhựa ABS
Công suất: <1W
Tần số: RF315Mhz (chip 2262, 1527)
Điện áp: 220VAC – 50/60Hz
Điều khiển: Chạm cảm ứng
Kích thước: 42x22x22mm
Dòng tải: 10A relay Panasonic
Bộ nhớ: 5 cặp lệnh on/off
Khoảng cách: 100-150 mét trong môi trường trống
Mặt nạ: Sino, Clipsal
Số hạt trên mặt nạ: 1-6', N'1 năm', N'Công ty Smart Control')
SET IDENTITY_INSERT [dbo].[Device] OFF
GO
SET IDENTITY_INSERT [dbo].[Interactions] ON 

INSERT [dbo].[Interactions] ([interaction_Id], [device_Id], [users_Id], [interaction_Type], [interaction_Time], [interaction_Details]) VALUES (1111, 100, 1002, N'Kích hoạt', CAST(N'2023-01-05T08:30:00.000' AS DateTime), N'Người dùng 1001 đã kích hoạt thiết bị 100')
INSERT [dbo].[Interactions] ([interaction_Id], [device_Id], [users_Id], [interaction_Type], [interaction_Time], [interaction_Details]) VALUES (2222, 100, 1002, N'Kích hoạt', CAST(N'2023-01-05T08:30:00.000' AS DateTime), N'Người dùng 1001 đã kích hoạt thiết bị 100')
INSERT [dbo].[Interactions] ([interaction_Id], [device_Id], [users_Id], [interaction_Type], [interaction_Time], [interaction_Details]) VALUES (3333, 100, 1002, N'Ngừng kích hoạt', CAST(N'2023-12-27T01:14:25.953' AS DateTime), N'Người dùng 1002 đã ngừng kích hoạt thiết bị 100')
INSERT [dbo].[Interactions] ([interaction_Id], [device_Id], [users_Id], [interaction_Type], [interaction_Time], [interaction_Details]) VALUES (4444, 101, 1002, N'Ngừng kích hoạt', CAST(N'2023-12-27T01:24:00.020' AS DateTime), N'Người dùng 1002 đã ngừng kích hoạt thiết bị 101')
INSERT [dbo].[Interactions] ([interaction_Id], [device_Id], [users_Id], [interaction_Type], [interaction_Time], [interaction_Details]) VALUES (5555, 100, 1002, N'Kích hoạt', CAST(N'2023-12-27T01:31:18.853' AS DateTime), N'Người dùng duybede(id = 1002) đã kích hoạt thiết bị bộ công tắc điều khiển không dây kono kn-rf43(id = 100).')
INSERT [dbo].[Interactions] ([interaction_Id], [device_Id], [users_Id], [interaction_Type], [interaction_Time], [interaction_Details]) VALUES (6666, 100, 1002, N'Ngừng kích hoạt', CAST(N'2023-12-27T17:10:51.613' AS DateTime), N'Người dùng duybede(id = 1002) đã ngừng kích hoạt thiết bị bộ công tắc điều khiển không dây kono kn-rf43(id = 100).')
INSERT [dbo].[Interactions] ([interaction_Id], [device_Id], [users_Id], [interaction_Type], [interaction_Time], [interaction_Details]) VALUES (7777, 101, 1002, N'Kích hoạt', CAST(N'2023-12-27T19:20:36.990' AS DateTime), N'Người dùng duybede(id = 1002) đã kích hoạt thiết bị chuông báo khách báo trộm thông minh kn-m6(id = 101).')
INSERT [dbo].[Interactions] ([interaction_Id], [device_Id], [users_Id], [interaction_Type], [interaction_Time], [interaction_Details]) VALUES (8888, 103, 1002, N'Kích hoạt', CAST(N'2023-12-27T22:15:43.797' AS DateTime), N'Người dùng duybede(id = 1002) đã kích hoạt thiết bị chuông báo khách hồng ngoại không dây kn-m7(id = 103).')
INSERT [dbo].[Interactions] ([interaction_Id], [device_Id], [users_Id], [interaction_Type], [interaction_Time], [interaction_Details]) VALUES (9999, 109, 1002, N'Kích hoạt', CAST(N'2023-12-30T21:35:17.050' AS DateTime), N'Người dùng duybede(id = 1002) đã kích hoạt thiết bị chiết áp cảm ứng lumi lm-dr(id = 109).')
INSERT [dbo].[Interactions] ([interaction_Id], [device_Id], [users_Id], [interaction_Type], [interaction_Time], [interaction_Details]) VALUES (11110, 118, 1002, N'Kích hoạt', CAST(N'2023-12-30T23:58:22.997' AS DateTime), N'Người dùng duybede(id = 1002) đã kích hoạt thiết bị bật đèn hồng ngoại kono kn-s08(id = 118).')
INSERT [dbo].[Interactions] ([interaction_Id], [device_Id], [users_Id], [interaction_Type], [interaction_Time], [interaction_Details]) VALUES (12221, 126, 1002, N'Kích hoạt', CAST(N'2024-01-03T00:58:28.760' AS DateTime), N'Người dùng duybede(id = 1002) đã kích hoạt thiết bị ổ cắm hẹn giờ wifi tuya sk017(id = 126).')
INSERT [dbo].[Interactions] ([interaction_Id], [device_Id], [users_Id], [interaction_Type], [interaction_Time], [interaction_Details]) VALUES (13332, 119, 1004, N'Kích hoạt', CAST(N'2024-01-03T08:39:57.860' AS DateTime), N'Người dùng hoang1(id = 1004) đã kích hoạt thiết bị bộ điều khiển thiết bị điện từ xa bằng remote smart control s688(id = 119).')
SET IDENTITY_INSERT [dbo].[Interactions] OFF
GO
SET IDENTITY_INSERT [dbo].[MaintenanceSchedule] ON 

INSERT [dbo].[MaintenanceSchedule] ([schedule_Id], [device_Id], [schedule_StartDate], [schedule_EndDate], [schedule_Location], [schedule_Description], [schedule_Type], [schedule_Technician], [schedule_Status]) VALUES (1001, 100, CAST(N'2024-01-03T08:43:47.900' AS DateTime), NULL, N'Tầng 9, 10, 11 tòa A1 - Haui', N'none.', N'Cập nhật phần mềm', NULL, N'Đang chờ xử lý')
INSERT [dbo].[MaintenanceSchedule] ([schedule_Id], [device_Id], [schedule_StartDate], [schedule_EndDate], [schedule_Location], [schedule_Description], [schedule_Type], [schedule_Technician], [schedule_Status]) VALUES (1002, 103, CAST(N'2024-01-02T19:59:12.000' AS DateTime), NULL, N'Tầng 12 tòa A1 - Haui', N'Kiểm tra tình trạng Pin sau khi đã sử dụng 2 tháng.', N'Kiểm tra nguồn năng lượng', N'Nguyễn Duy', N'Đã xác nhận')
INSERT [dbo].[MaintenanceSchedule] ([schedule_Id], [device_Id], [schedule_StartDate], [schedule_EndDate], [schedule_Location], [schedule_Description], [schedule_Type], [schedule_Technician], [schedule_Status]) VALUES (1003, 111, CAST(N'2024-01-02T18:27:02.020' AS DateTime), NULL, N'Tầng 2,3,4', N'Cập nhật phần mềm phiên bản mới của Remote điều khiển từ xa KN-RM11', N'Cập nhật phần mềm', NULL, N'Đang chờ xử lý')
INSERT [dbo].[MaintenanceSchedule] ([schedule_Id], [device_Id], [schedule_StartDate], [schedule_EndDate], [schedule_Location], [schedule_Description], [schedule_Type], [schedule_Technician], [schedule_Status]) VALUES (1004, 108, CAST(N'2024-01-03T00:13:15.000' AS DateTime), NULL, N'Tầng 1 tòa A1 - Haui', N'Do bị ngấm nước khi mưa ẩm nên nó đã bị chập.', N'Sửa chữa hư hại', N'Nguyễn Long', N'Đã xác nhận')
SET IDENTITY_INSERT [dbo].[MaintenanceSchedule] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([project_Id], [project_Name], [project_Description], [project_StartDate], [project_EndDate], [project_Location], [project_Budget], [project_Manager], [project_Client_Id], [project_Status], [project_Type]) VALUES (1, N'Dự án tòa nhà thông minh Haui', N'Triển khai hệ thống điện thông minh', CAST(N'2023-09-09T09:30:42.000' AS DateTime), NULL, N'Tòa nhà A1 - Haui - Cơ sở 1', 500000, N'Bùi Trung Kiên', 1002, N'Đang triển khai', N'Cải tiến hệ thống hiện tại')
INSERT [dbo].[Project] ([project_Id], [project_Name], [project_Description], [project_StartDate], [project_EndDate], [project_Location], [project_Budget], [project_Manager], [project_Client_Id], [project_Status], [project_Type]) VALUES (2, N'Dự án tối ưu hóa tòa chung cư ABC', N'Lắp đặt hệ thống điện thông minh', CAST(N'2023-12-26T23:53:55.000' AS DateTime), NULL, N'Chung cư ABC - Hà Nội', 750000, N'Tất Thắng', 1002, N'Đang thực thi', N'Xây dựng hệ thống điện thông minh')
INSERT [dbo].[Project] ([project_Id], [project_Name], [project_Description], [project_StartDate], [project_EndDate], [project_Location], [project_Budget], [project_Manager], [project_Client_Id], [project_Status], [project_Type]) VALUES (3, N'Dự án chung cư mini Huy Hoàng', N'Lắp đặt hệ thống điện thông minh', CAST(N'2023-12-30T19:32:47.000' AS DateTime), NULL, N'Chung cư mini Huy Hoàng - Khu tái định cư Tu Hoàng - Hà Nội', 360000, N'Tất Thắng', 1004, N'Đang thực thi', N'Xây dựng hệ thống điện thông minh')
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([users_Id], [users_Username], [users_Password], [users_Full_Name], [users_Position], [users_Img], [users_Phone_Number], [users_Address]) VALUES (1001, N'kienbt', N'kien2oo3', N'Bùi Trung Kiên', N'Quản trị viên', N'anhchandung.jpg', N'0398768562', N'Kiến Xương-Thái Bình')
INSERT [dbo].[Users] ([users_Id], [users_Username], [users_Password], [users_Full_Name], [users_Position], [users_Img], [users_Phone_Number], [users_Address]) VALUES (1002, N'duybede', N'duy1', N'Duy bede', N'Khách hàng', NULL, NULL, NULL)
INSERT [dbo].[Users] ([users_Id], [users_Username], [users_Password], [users_Full_Name], [users_Position], [users_Img], [users_Phone_Number], [users_Address]) VALUES (1003, N'hungwibu', N'hung1', N'Hưng bede', N'Kỹ thuật viên', N'hungwibu.jpg', NULL, NULL)
INSERT [dbo].[Users] ([users_Id], [users_Username], [users_Password], [users_Full_Name], [users_Position], [users_Img], [users_Phone_Number], [users_Address]) VALUES (1004, N'hoang1', N'123', N'Nhất Hoàng', N'Khách hàng', N'abc.jpg', NULL, NULL)
INSERT [dbo].[Users] ([users_Id], [users_Username], [users_Password], [users_Full_Name], [users_Position], [users_Img], [users_Phone_Number], [users_Address]) VALUES (1005, N'hieu1', N'123', N'Hoàng Hiếu', N'Khách hàng', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__DC1E72C7EA2CA577]    Script Date: 1/20/2024 2:52:43 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[users_Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD FOREIGN KEY([category_Id])
REFERENCES [dbo].[Category] ([category_Id])
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD FOREIGN KEY([project_Id])
REFERENCES [dbo].[Project] ([project_Id])
GO
ALTER TABLE [dbo].[Interactions]  WITH CHECK ADD FOREIGN KEY([device_Id])
REFERENCES [dbo].[Device] ([device_Id])
GO
ALTER TABLE [dbo].[Interactions]  WITH CHECK ADD FOREIGN KEY([users_Id])
REFERENCES [dbo].[Users] ([users_Id])
GO
ALTER TABLE [dbo].[MaintenanceSchedule]  WITH CHECK ADD FOREIGN KEY([device_Id])
REFERENCES [dbo].[Device] ([device_Id])
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD FOREIGN KEY([project_Client_Id])
REFERENCES [dbo].[Users] ([users_Id])
GO
