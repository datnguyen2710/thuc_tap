USE [QuanLyQuanCafe]
GO
/****** Object:  UserDefinedFunction [dbo].[fuConvertToUnsign1]    Script Date: 6/21/2021 11:44:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fuConvertToUnsign1] ( @strInput NVARCHAR(4000) ) RETURNS NVARCHAR(4000) AS BEGIN IF @strInput IS NULL RETURN @strInput IF @strInput = '' RETURN @strInput DECLARE @RT NVARCHAR(4000) DECLARE @SIGN_CHARS NCHAR(136) DECLARE @UNSIGN_CHARS NCHAR (136) SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý ĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍ ÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ' +NCHAR(272)+ NCHAR(208) SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee iiiiiooooooooooooooouuuuuuuuuuyyyyy AADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIII OOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD' DECLARE @COUNTER int DECLARE @COUNTER1 int SET @COUNTER = 1 WHILE (@COUNTER <=LEN(@strInput)) BEGIN SET @COUNTER1 = 1 WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1) BEGIN IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) ) BEGIN IF @COUNTER=1 SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1) ELSE SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER) BREAK END SET @COUNTER1 = @COUNTER1 +1 END SET @COUNTER = @COUNTER +1 END SET @strInput = replace(@strInput,' ','-') RETURN @strInput END


GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/21/2021 11:44:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserName] [nvarchar](100) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
	[Type] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bill]    Script Date: 6/21/2021 11:44:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateCheckIn] [date] NOT NULL DEFAULT (getdate()),
	[DateCheckOut] [date] NOT NULL,
	[idTable] [int] NOT NULL,
	[status] [int] NOT NULL DEFAULT ((0)),
	[discount] [int] NULL,
	[totalPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 6/21/2021 11:44:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBill] [int] NOT NULL,
	[idFood] [int] NOT NULL,
	[count] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Food]    Script Date: 6/21/2021 11:44:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL DEFAULT (N'Chưa đặt tên'),
	[idCategory] [int] NOT NULL,
	[price] [float] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 6/21/2021 11:44:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL DEFAULT (N'Chưa đặt tên'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableFood]    Script Date: 6/21/2021 11:44:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableFood](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL DEFAULT (N'Bàn chưa có tên'),
	[status] [nvarchar](100) NOT NULL DEFAULT (N'Trống'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([UserName], [DisplayName], [Password], [Type]) VALUES (N'dat', N'Quốc Đạt', N'123456', 1)
INSERT [dbo].[Account] ([UserName], [DisplayName], [Password], [Type]) VALUES (N'staff', N'Nhân viên', N'123456', 0)
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (67, CAST(N'2021-01-12' AS Date), CAST(N'2021-01-12' AS Date), 5, 1, 20, 46.4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (68, CAST(N'2021-01-14' AS Date), CAST(N'2021-01-14' AS Date), 6, 1, 10, 78.3)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (69, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-15' AS Date), 8, 1, 5, 111.15)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (70, CAST(N'2021-01-16' AS Date), CAST(N'2021-01-16' AS Date), 6, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (71, CAST(N'2021-01-17' AS Date), CAST(N'2021-01-17' AS Date), 5, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (72, CAST(N'2021-01-18' AS Date), CAST(N'2021-01-18' AS Date), 9, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (73, CAST(N'2021-01-19' AS Date), CAST(N'2021-01-19' AS Date), 7, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (74, CAST(N'2021-01-19' AS Date), CAST(N'2021-01-19' AS Date), 5, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (75, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-02' AS Date), 6, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (76, CAST(N'2021-02-11' AS Date), CAST(N'2021-02-11' AS Date), 12, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (77, CAST(N'2021-02-13' AS Date), CAST(N'2021-02-13' AS Date), 27, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (78, CAST(N'2021-02-14' AS Date), CAST(N'2021-02-14' AS Date), 12, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (79, CAST(N'2021-02-15' AS Date), CAST(N'2021-02-15' AS Date), 8, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (80, CAST(N'2021-03-01' AS Date), CAST(N'2021-03-01' AS Date), 10, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (81, CAST(N'2021-03-03' AS Date), CAST(N'2021-03-03' AS Date), 11, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (82, CAST(N'2021-03-05' AS Date), CAST(N'2021-03-05' AS Date), 3, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (83, CAST(N'2021-03-17' AS Date), CAST(N'2021-03-17' AS Date), 1, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (84, CAST(N'2021-03-19' AS Date), CAST(N'2021-03-19' AS Date), 8, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (85, CAST(N'2021-03-19' AS Date), CAST(N'2021-03-19' AS Date), 12, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (86, CAST(N'2021-03-19' AS Date), CAST(N'2021-03-19' AS Date), 12, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (87, CAST(N'2021-03-19' AS Date), CAST(N'2021-03-19' AS Date), 8, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (88, CAST(N'2021-04-19' AS Date), CAST(N'2021-04-19' AS Date), 12, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (89, CAST(N'2021-04-19' AS Date), CAST(N'2021-04-19' AS Date), 12, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (90, CAST(N'2021-04-19' AS Date), CAST(N'2021-04-19' AS Date), 9, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (91, CAST(N'2021-04-19' AS Date), CAST(N'2021-04-19' AS Date), 11, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (92, CAST(N'2021-04-19' AS Date), CAST(N'2021-04-19' AS Date), 26, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (93, CAST(N'2021-04-19' AS Date), CAST(N'2021-04-19' AS Date), 1, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (94, CAST(N'2021-04-19' AS Date), CAST(N'2021-04-19' AS Date), 1, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (95, CAST(N'2021-04-19' AS Date), CAST(N'2021-04-19' AS Date), 1, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (96, CAST(N'2021-04-19' AS Date), CAST(N'2021-04-19' AS Date), 1, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (97, CAST(N'2021-04-19' AS Date), CAST(N'2021-04-19' AS Date), 7, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (98, CAST(N'2021-04-19' AS Date), CAST(N'2021-04-19' AS Date), 8, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (99, CAST(N'2021-04-19' AS Date), CAST(N'2021-04-19' AS Date), 7, 1, 0, 290)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (100, CAST(N'2021-04-19' AS Date), CAST(N'2021-04-19' AS Date), 2, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (101, CAST(N'2021-04-19' AS Date), CAST(N'2021-04-19' AS Date), 8, 1, 0, 319)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (102, CAST(N'2021-04-19' AS Date), CAST(N'2021-04-19' AS Date), 7, 1, 0, 319)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (103, CAST(N'2021-04-19' AS Date), CAST(N'2021-04-19' AS Date), 11, 1, 0, 319)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (104, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 12, 1, 0, 319)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (105, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 15, 1, 0, 319)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (106, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 2, 1, 0, 300)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (107, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 2, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (108, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 1, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (109, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 8, 1, 0, 87)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (110, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 4, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (111, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 11, 1, 0, 145)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (112, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 2, 1, 0, 87)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (113, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 7, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (114, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 2, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (115, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 3, 1, 0, 87)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (116, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 4, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (117, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 3, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (118, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 2, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (119, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 3, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (120, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 4, 1, 0, 87)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (121, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 3, 1, 0, 87)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (122, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 8, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (123, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 4, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (124, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 4, 1, 0, 87)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (125, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 4, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (126, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 4, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (127, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 3, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (128, CAST(N'2021-05-20' AS Date), CAST(N'2021-05-20' AS Date), 2, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (129, CAST(N'2021-06-20' AS Date), CAST(N'2021-06-20' AS Date), 4, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (130, CAST(N'2021-06-20' AS Date), CAST(N'2021-06-20' AS Date), 7, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (131, CAST(N'2021-06-20' AS Date), CAST(N'2021-06-20' AS Date), 4, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (132, CAST(N'2021-06-20' AS Date), CAST(N'2021-06-21' AS Date), 1, 1, 0, 116)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (133, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 3, 1, 0, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (135, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 1, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (136, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 2, 1, 0, 232)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (137, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 1, 1, 0, 522)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (138, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 6, 1, 0, -87)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (140, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 2, 1, 0, 87)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (142, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 1, 1, 0, 319)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (143, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 6, 1, 0, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (145, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 8, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (146, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 3, 1, 0, 78)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (148, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 7, 1, 0, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (149, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 10, 1, 0, 290)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (152, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 1, 1, 0, 261)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (155, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 5, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (156, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 1, 1, 0, 300)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (157, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 3, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (158, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 1, 1, 0, 19)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (159, CAST(N'2021-06-21' AS Date), CAST(N'1900-01-01' AS Date), 9, 0, 0, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (160, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 6, 1, 0, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (161, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 4, 1, 0, 68)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (162, CAST(N'2021-06-21' AS Date), CAST(N'1900-01-01' AS Date), 16, 0, 0, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (163, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 8, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (164, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 2, 1, 0, 77)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (166, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 3, 1, 0, 39)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (167, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 1, 1, 0, 146)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (168, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 1, 1, 7, 144.15)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (169, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 3, 1, 0, 19)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (170, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 4, 1, 5, 110.2)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (172, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 1, 1, 7, 26.97)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (173, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 1, 1, 5, 134.9)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (174, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 2, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (175, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 3, 1, 0, 78)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (176, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 4, 1, 5, 45.6)
GO
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (177, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 2, 1, 0, 58)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (178, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 3, 1, 5, 82.65)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (179, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 2, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (180, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 4, 1, 5, 110.2)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (181, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 3, 1, 0, 126)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (182, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 4, 1, 5, 115.9)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (183, CAST(N'2021-06-21' AS Date), CAST(N'1900-01-01' AS Date), 4, 0, 0, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (184, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 1, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (185, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 1, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (186, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 1, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (187, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 1, 1, 0, 29)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (188, CAST(N'2021-06-21' AS Date), CAST(N'2021-06-21' AS Date), 1, 1, 10, 17.1)
SET IDENTITY_INSERT [dbo].[Bill] OFF
SET IDENTITY_INSERT [dbo].[BillInfo] ON 

INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (75, 67, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (76, 67, 20, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (77, 68, 20, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (78, 68, 29, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (79, 68, 33, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (80, 69, 33, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (81, 69, 4, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (82, 69, 10, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (84, 70, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (85, 71, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (86, 72, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (87, 73, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (88, 74, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (89, 75, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (90, 76, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (91, 77, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (92, 78, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (93, 79, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (94, 80, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (95, 81, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (96, 82, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (97, 83, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (98, 84, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (99, 85, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (100, 86, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (101, 87, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (102, 88, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (103, 89, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (104, 90, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (105, 91, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (106, 92, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (107, 93, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (108, 94, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (109, 95, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (110, 96, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (111, 97, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (112, 98, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (113, 99, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (114, 100, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (115, 100, 2, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (116, 101, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (117, 102, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (118, 103, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (119, 104, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (120, 105, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (121, 106, 1, 7)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (124, 106, 2, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (126, 106, 4, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (128, 108, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (131, 111, 1, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (132, 107, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (133, 112, 1, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (134, 109, 1, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (135, 113, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (136, 114, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (137, 110, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (138, 115, 1, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (139, 116, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (140, 117, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (141, 118, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (142, 119, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (143, 120, 1, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (144, 121, 1, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (145, 122, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (146, 123, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (147, 124, 1, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (148, 125, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (149, 126, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (150, 127, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (151, 128, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (152, 129, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (153, 130, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (154, 131, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (165, 138, 1, -3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (169, 135, 1, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (175, 136, 1, 6)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (180, 142, 1, 11)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (181, 137, 1, 7)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (189, 132, 1, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (195, 149, 1, 10)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (215, 152, 1, 9)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (216, 157, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (224, 140, 1, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (226, 161, 20, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (227, 161, 33, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (230, 155, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (231, 156, 33, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (232, 156, 1, 7)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (233, 156, 29, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (234, 146, 15, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (235, 163, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (236, 164, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (237, 164, 29, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (239, 164, 20, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (240, 166, 33, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (241, 158, 29, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (242, 167, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (244, 169, 29, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (246, 167, 33, 1)
GO
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (248, 167, 15, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (256, 168, 1, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (257, 168, 20, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (258, 168, 33, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (259, 172, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (260, 173, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (262, 173, 29, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (264, 173, 33, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (266, 173, 15, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (267, 175, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (268, 175, 15, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (269, 174, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (270, 176, 29, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (271, 176, 25, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (275, 170, 2, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (276, 170, 35, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (280, 180, 1, 4)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (284, 182, 20, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (288, 182, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (289, 182, 2, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (290, 182, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (291, 179, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (293, 177, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (296, 181, 10, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (298, 181, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (299, 181, 2, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (302, 184, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (303, 185, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (304, 186, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (305, 187, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (306, 188, 29, 1)
SET IDENTITY_INSERT [dbo].[BillInfo] OFF
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (1, N'Phin sữa đá/nóng', 1, 29000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (2, N'Phin đen đá/nóng', 1, 29000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (3, N'Bạc xỉu đá/nóng', 1, 29000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (4, N'PhinDi kem sữa', 2, 39000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (5, N'PhinDi hạnh nhân', 2, 39000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (6, N'PhinDi Choco', 2, 39000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (7, N'Espresso/ Americano', 3, 35000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (8, N'Cappuccino/ Latte', 3, 55000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (9, N'Mocha/ Caramel Macchiato', 3, 59000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (10, N'Trà sen vàng', 4, 39000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (11, N'Trà thạch đào', 4, 39000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (12, N'Trà thanh đào', 4, 39000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (13, N'Trà thạch vải', 4, 39000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (14, N'Trà xanh đậu đỏ', 4, 39000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (15, N'Freeze trà xanh', 5, 49000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (16, N'Freeze Chocolate', 5, 49000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (17, N'Cookies & Cream', 5, 49000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (18, N'Caramel phin Freeze', 5, 49000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (19, N'classic phin Freeze', 5, 49000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (20, N'Tiramisu', 6, 29000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (21, N'Bánh chuối', 6, 29000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (22, N'Mousse đào', 6, 29000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (23, N'Mousse cacao', 6, 29000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (24, N'Phô mai trà xanh', 6, 29000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (25, N'Phô mai chanh dây', 6, 29000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (26, N'Phô mai cà phê', 6, 29000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (27, N'Phô mai caramel', 6, 29000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (28, N'Chocolate Cake', 6, 29000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (29, N'Bánh mì gà xé', 7, 19000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (30, N'Bánh mì cà ri gà', 7, 19000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (31, N'Bánh mì cá ngừ', 7, 19000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (32, N'Bánh mì nấm', 7, 19000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (33, N'Chanh đá xay/ đá viên', 8, 39000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (34, N'Chanh dây đá viên', 8, 39000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (35, N'Tắc/ quất đá viên', 8, 39000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (36, N'Chocolate nóng/ đá', 8, 55000)
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (1, N'Cà phê pha phin')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (2, N'Phin di')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (3, N'Cà phê Espresso')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (4, N'Trà')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (5, N'Freeze')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (6, N'Bánh')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (7, N'Bánh mì')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (8, N'Thức uống khác')
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
SET IDENTITY_INSERT [dbo].[TableFood] ON 

INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (1, N'Bàn 1', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (2, N'Bàn 2', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (3, N'Bàn 3', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (4, N'Bàn 4', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (5, N'Bàn 5', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (6, N'Bàn 6', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (7, N'Bàn 7', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (8, N'Bàn 8', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (9, N'Bàn 9', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (10, N'Bàn 10', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (11, N'Bàn 11', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (12, N'Bàn 12', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (13, N'Bàn 13', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (14, N'Bàn 14', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (15, N'Bàn 15', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (16, N'Bàn 16', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (17, N'Bàn 17', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (18, N'Bàn 18', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (19, N'Bàn 19', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (20, N'Bàn 20', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (21, N'Bàn 21', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (22, N'Bàn 22', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (23, N'Bàn 23', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (24, N'Bàn 24', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (25, N'Bàn 25', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (26, N'Bàn 26', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (27, N'Bàn 27', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (28, N'Bàn 28', N'Trống')
SET IDENTITY_INSERT [dbo].[TableFood] OFF
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([idTable])
REFERENCES [dbo].[TableFood] ([id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idBill])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([id])
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([idCategory])
REFERENCES [dbo].[FoodCategory] ([id])
GO
/****** Object:  StoredProcedure [dbo].[SwitchTable]    Script Date: 6/21/2021 11:44:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[SwitchTable]
	@idTableOld INT,
	@idTableNew INT
	AS
    BEGIN
		DECLARE @id INT 
    	SELECT  @id=id FROM dbo.Bill WHERE status = 0 AND idTable = @idTableOld
		UPDATE dbo.Bill SET idTable = @idTableNew WHERE id= @id
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id= @idTableOld
		UPDATE dbo.TableFood SET status = N'Có người' WHERE id=@idTableNew
    END


GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDate]    Script Date: 6/21/2021 11:44:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetListBillByDate]
@checkIn date, @checkOut date
AS 
BEGIN
	SELECT t.name AS [Tên bàn], b.totalPrice AS [Tổng tiền], DateCheckIn AS [Ngày vào], DateCheckOut AS [Ngày ra], discount AS [Giảm giá]
	FROM dbo.Bill AS b,dbo.TableFood AS t
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut AND b.status = 1
	AND t.id = b.idTable
END



GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDateAndPage]    Script Date: 6/21/2021 11:44:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetListBillByDateAndPage]
@checkIn date, @checkOut date, @page int
AS 
BEGIN
	DECLARE @pageRows INT = 10
	DECLARE @selectRows INT = @pageRows
	DECLARE @exceptRows INT = (@page - 1) * @pageRows
	
	;WITH BillShow AS( SELECT b.ID, t.name AS [Tên bàn], b.totalPrice AS [Tổng tiền], DateCheckIn AS [Ngày vào], DateCheckOut AS [Ngày ra], discount AS [Giảm giá]
	FROM dbo.Bill AS b,dbo.TableFood AS t
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut AND b.status = 1
	AND t.id = b.idTable)
	
	SELECT TOP (@selectRows) * FROM BillShow WHERE id NOT IN (SELECT TOP (@exceptRows) id FROM BillShow)
END



GO
/****** Object:  StoredProcedure [dbo].[USP_GetNumBillByDate]    Script Date: 6/21/2021 11:44:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_GetNumBillByDate]
@checkIn date, @checkOut date
AS 
BEGIN
	SELECT COUNT(*)
	FROM dbo.Bill AS b,dbo.TableFood AS t
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut AND b.status = 1
	AND t.id = b.idTable
END



GO
/****** Object:  StoredProcedure [dbo].[USP_GetTableList]    Script Date: 6/21/2021 11:44:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetTableList]
AS SELECT * FROM dbo.TableFood



GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBill]    Script Date: 6/21/2021 11:44:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertBill]
@idTable INT
AS
BEGIN
	INSERT dbo.Bill
	        ( DateCheckIn ,
	          DateCheckOut ,
	          idTable ,
	          status,
			  discount
	        )
	VALUES  ( GETDATE() , -- DateCheckIn - date
	          '' , -- DateCheckOut - date
	          @idTable , -- idTable - int
	          0,  -- status - int
			  0
	        )   
END


GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillInfo]    Script Date: 6/21/2021 11:44:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertBillInfo]
@idBill INT, @idFood INT, @count INT
AS
BEGIN
	DECLARE @isExitsBillInfo INT
	DECLARE @foodCount INT = 1

	SELECT @isExitsBillInfo = id, @foodCount = b.count FROM dbo.BillInfo AS b WHERE idBill = @idBill AND idFood = @idFood

	IF (@isExitsBillInfo > 0)
	BEGIN
		DECLARE @newCount INT = @foodCount + @count
		IF (@newCount > 0)
			UPDATE dbo.BillInfo SET count = @foodCount + @count WHERE idFood = @idFood AND idBill =@idBill
		ELSE
			DELETE dbo.BillInfo WHERE idBill = @idBill AND idFood = @idFood
	END 
	ELSE
BEGIN
INSERT dbo.BillInfo
        ( idBill, idFood, count )
VALUES  ( @idBill, -- idBill - int
          @idFood, -- idFood - int
          @count  -- count - int
          )
  END


END

GO
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 6/21/2021 11:44:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_Login]
@userName nvarchar(100), @passWord nvarchar(100)
AS
BEGIN
SELECT * FROM dbo.Account WHERE UserName = @userName AND Password = @passWord
END



GO
/****** Object:  StoredProcedure [dbo].[USP_SwitchTable]    Script Date: 6/21/2021 11:44:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_SwitchTable]
@idTable1 INT, @idTable2 int
AS BEGIN

	DECLARE @idFirstBill int
	DECLARE @idSeconrdBill INT
	
	DECLARE @isFirstTablEmty INT = 1
	DECLARE @isSecondTablEmty INT = 1
	
	
	SELECT @idSeconrdBill = id FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0
	SELECT @idFirstBill = id FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0
		
	IF (@idFirstBill IS NULL)
	BEGIN
		PRINT '0000001'
		INSERT dbo.Bill
		        ( DateCheckIn ,
		          DateCheckOut ,
		          idTable ,
		          status
		        )
		VALUES  ( GETDATE() , -- DateCheckIn - date
		          '' , -- DateCheckOut - date
		          @idTable1 , -- idTable - int
		          0  -- status - int
		        )
		        
		SELECT @idFirstBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0
		
	END
	
	SELECT @isFirstTablEmty = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idFirstBill
	
	IF (@idSeconrdBill IS NULL)
	BEGIN
		INSERT dbo.Bill
		        ( DateCheckIn ,
		          DateCheckOut ,
		          idTable ,
		          status
		        )
		VALUES  ( GETDATE() , -- DateCheckIn - date
		          '' , -- DateCheckOut - date
		          @idTable2 , -- idTable - int
		          0  -- status - int
		        )
		SELECT @idSeconrdBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0
		
	END
	
	SELECT @isSecondTablEmty = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idSeconrdBill
	
	SELECT id INTO IDBillInfoTable FROM dbo.BillInfo WHERE idBill = @idSeconrdBill
	
	UPDATE dbo.BillInfo SET idBill = @idSeconrdBill WHERE idBill = @idFirstBill
	
	UPDATE dbo.BillInfo SET idBill = @idFirstBill WHERE id IN (SELECT * FROM IDBillInfoTable)
	
	DROP TABLE IDBillInfoTable
	
	IF (@isFirstTablEmty = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable2
		
	IF (@isSecondTablEmty= 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable1
END



GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateAccount]    Script Date: 6/21/2021 11:44:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateAccount]
@userName NVARCHAR(100), @displayName NVARCHAR(100), @password NVARCHAR(100), @newPassword NVARCHAR(100)
AS
BEGIN
	DECLARE @isRightPass INT = 0
	
	SELECT @isRightPass = COUNT(*) FROM dbo.Account WHERE USERName = @userName AND PassWord = @password
	
	IF (@isRightPass = 1)
	BEGIN
		IF (@newPassword = NULL OR @newPassword = '')
		BEGIN
			UPDATE dbo.Account SET DisplayName = @displayName WHERE UserName = @userName
		END		
		ELSE
			UPDATE dbo.Account SET DisplayName = @displayName, PassWord = @newPassword WHERE UserName = @userName
	end
END



GO
