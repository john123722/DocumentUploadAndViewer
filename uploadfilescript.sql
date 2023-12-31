USE [master]
GO
/****** Object:  Database [UploadFiles]    Script Date: 11/27/2023 9:37:45 PM ******/
CREATE DATABASE [UploadFiles]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UploadFiles', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MICROSOFTSQL2022\MSSQL\DATA\UploadFiles.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UploadFiles_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MICROSOFTSQL2022\MSSQL\DATA\UploadFiles_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [UploadFiles] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UploadFiles].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UploadFiles] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UploadFiles] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UploadFiles] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UploadFiles] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UploadFiles] SET ARITHABORT OFF 
GO
ALTER DATABASE [UploadFiles] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UploadFiles] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UploadFiles] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UploadFiles] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UploadFiles] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UploadFiles] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UploadFiles] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UploadFiles] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UploadFiles] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UploadFiles] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UploadFiles] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UploadFiles] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UploadFiles] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UploadFiles] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UploadFiles] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UploadFiles] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UploadFiles] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UploadFiles] SET RECOVERY FULL 
GO
ALTER DATABASE [UploadFiles] SET  MULTI_USER 
GO
ALTER DATABASE [UploadFiles] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UploadFiles] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UploadFiles] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UploadFiles] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UploadFiles] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UploadFiles] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'UploadFiles', N'ON'
GO
ALTER DATABASE [UploadFiles] SET QUERY_STORE = ON
GO
ALTER DATABASE [UploadFiles] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UploadFiles]
GO
/****** Object:  Table [dbo].[AdminMst]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminMst](
	[IID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_AdminMst] PRIMARY KEY CLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CateMst]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CateMst](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[CName] [nvarchar](50) NULL,
 CONSTRAINT [PK_CateMst] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbackmstr]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbackmstr](
	[FID] [int] IDENTITY(1,1) NOT NULL,
	[UNAME] [nvarchar](50) NULL,
	[MESSAGE] [nvarchar](50) NULL,
	[ENTRYDATE] [datetime] NULL,
 CONSTRAINT [PK_Feedbackmstr] PRIMARY KEY CLUSTERED 
(
	[FID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemMst]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemMst](
	[IID] [int] IDENTITY(1,1) NOT NULL,
	[IName] [nvarchar](50) NULL,
	[Detail] [nvarchar](500) NULL,
	[Price] [float] NULL,
	[Image] [nvarchar](50) NULL,
	[Qnt] [int] NULL,
	[AQnt] [int] NULL,
	[SQnt] [int] NULL,
	[CName] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[Image1] [nvarchar](500) NULL,
	[Image2] [nvarchar](500) NULL,
	[Size] [int] NULL,
 CONSTRAINT [PK_ItemMst] PRIMARY KEY CLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderMst]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMst](
	[OID] [int] IDENTITY(1,1) NOT NULL,
	[Uname] [nvarchar](50) NULL,
	[Iname] [nvarchar](50) NULL,
	[Qnt] [int] NULL,
	[Price] [float] NULL,
	[TPrice] [float] NULL,
	[Status] [int] NULL,
	[EntryDate] [datetime] NULL,
	[image] [nvarchar](500) NULL,
 CONSTRAINT [PK_OrderMst] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMst]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMst](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[Uname] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[Type] [nvarchar](50) NULL,
	[Bank] [nvarchar](50) NULL,
	[Branch] [nvarchar](50) NULL,
	[CardNo] [nvarchar](50) NULL,
	[CCV] [int] NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_PaymentMst] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UploadTable]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UploadTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccessionId] [int] NOT NULL,
	[FileName] [varchar](50) NOT NULL,
	[FileSize] [bigint] NOT NULL,
	[FileType] [varchar](50) NOT NULL,
	[FilePath] [varchar](max) NOT NULL,
	[UploadDate] [date] NOT NULL,
	[Version] [int] NULL,
	[Reason] [varchar](max) NULL,
 CONSTRAINT [PK_UploadTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMst]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMst](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Pincode] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_UserMst] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UploadTable] ADD  CONSTRAINT [DF_UploadTable_Version]  DEFAULT ((0)) FOR [Version]
GO
/****** Object:  StoredProcedure [dbo].[ADMIN_CHANGE_PASSWORD]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ADMIN_CHANGE_PASSWORD] 
	@NAME AS NVARCHAR(200),
	@PASSWORD AS NVARCHAR(200)
	
AS
BEGIN
UPDATE ADMINMST SET Password=@PASSWORD WHERE IID=1

	
END
GO
/****** Object:  StoredProcedure [dbo].[ADMIN_DELETE]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ADMIN_DELETE] 
	@ID AS INT
	
	
AS
BEGIN
DELETE FROM ADMINMST WHERE IID=@ID;

	
END
GO
/****** Object:  StoredProcedure [dbo].[ADMIN_INSERT]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ADMIN_INSERT] 
	
	@USERNAME AS NVARCHAR(200),
	@PASSWORD AS NVARCHAR(200)
	
AS
BEGIN
INSERT INTO ADMINMST VALUES(@USERNAME,@PASSWORD);

	
END
GO
/****** Object:  StoredProcedure [dbo].[ADMIN_LOGIN]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ADMIN_LOGIN] 
	
	@USERNAME AS NVARCHAR(200),
	@PASSWORD AS NVARCHAR(200)
	
AS
BEGIN

SELECT * FROM AdminMst WHERE Username=@USERNAME AND Password=@PASSWORD;

	
END
GO
/****** Object:  StoredProcedure [dbo].[ADMIN_SELECT]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ADMIN_SELECT] 
	
	
AS
BEGIN
SELECT * FROM ADMINMST 

	
END
GO
/****** Object:  StoredProcedure [dbo].[CATEMST_DELETE]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CATEMST_DELETE] 
	@ID AS INT
	
	
AS
BEGIN
DELETE FROM CateMst WHERE CID=@ID;

	
END
GO
/****** Object:  StoredProcedure [dbo].[CATEMST_SELECT]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CATEMST_SELECT] 
	
	
	
	
AS
BEGIN
SELECT * FROM CATEMST;

	
END
GO
/****** Object:  StoredProcedure [dbo].[CATEMST_UPADATE]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CATEMST_UPADATE]
        @CID AS INT ,
        @CNAME AS NVARCHAR(200)
	
	
AS
BEGIN
UPDATE CateMst SET CNAME=@CNAME WHERE CID=@CID;

	
END
GO
/****** Object:  StoredProcedure [dbo].[FEEDBACKMSTR_DELETE]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FEEDBACKMSTR_DELETE] 
	@FID AS INT
	
	
AS
BEGIN
DELETE FROM FEEDBACKMSTR WHERE FID=@FID;

	
END
GO
/****** Object:  StoredProcedure [dbo].[FEEDBACKMSTR_SELECT]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FEEDBACKMSTR_SELECT]
	
	
AS
BEGIN
SELECT * FROM FEEDBACKMSTR;
END
GO
/****** Object:  StoredProcedure [dbo].[FEEDBACKMSTR_UPADATE]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FEEDBACKMSTR_UPADATE]
        @FID AS INT ,
        @UNAME AS NVARCHAR(256),
        @MESSAGE AS NVARCHAR(256),
        @ENTRYDATE AS NVARCHAR(256)
	
	
AS
BEGIN
UPDATE FEEDBACKMSTR SET UNAME=@UNAME,MESSAGE=@MESSAGE,ENTRYDATE=@ENTRYDATE WHERE FID=@FID;

	
END
GO
/****** Object:  StoredProcedure [dbo].[ITEM_DELETE]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ITEM_DELETE] 
	@IID AS INT
	
	
AS
BEGIN
DELETE FROM ItemMst WHERE IID=@IID

	
END
GO
/****** Object:  StoredProcedure [dbo].[ITEM_SELECT]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ITEM_SELECT]
	
	
AS
BEGIN
SELECT * FROM ItemMst 
END
GO
/****** Object:  StoredProcedure [dbo].[ITEM_SELECT_BY_CNAME]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ITEM_SELECT_BY_CNAME]

@cname as nvarchar(256)	
	
AS
BEGIN
SELECT * FROM ItemMst where CName = @cname
END
GO
/****** Object:  StoredProcedure [dbo].[ITEM_SELECT_FOR_SELL]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ITEM_SELECT_FOR_SELL]

@INAME AS NVARCHAR(256),
@QNT AS INT

AS
BEGIN
	UPDATE ItemMst SET AQnt=AQnt-@QNT,SQnt=SQnt+@QNT WHERE IName=@INAME
END
GO
/****** Object:  StoredProcedure [dbo].[ITEM_SELECT_IID]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ITEM_SELECT_IID]
	
	@IID AS INT
	
AS
BEGIN
SELECT * FROM ItemMst  WHERE IID=@IID
END
GO
/****** Object:  StoredProcedure [dbo].[ITEM_SELECT_SEARCH]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ITEM_SELECT_SEARCH]

@name as nvarchar(256)	
	
AS
BEGIN
SELECT * FROM ItemMst where iname like @name
END
GO
/****** Object:  StoredProcedure [dbo].[ITEM_SELECT_TOP7]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ITEM_SELECT_TOP7]
	
	
AS
BEGIN
SELECT top 7 * FROM ItemMst order by newid()
END
GO
/****** Object:  StoredProcedure [dbo].[ITEM_SELECT_TOP8]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ITEM_SELECT_TOP8]
	
	
AS
BEGIN
SELECT top 8 * FROM ItemMst order by newid()
END
GO
/****** Object:  StoredProcedure [dbo].[ORDER_UPDATE]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ORDER_UPDATE]
        @OID AS INT ,
        @INAME AS NVARCHAR(256),
        @QNT AS INT,
        @PRICE AS FLOAT,
        @TPRICE AS INT,
        @STATUS AS INT,
        @ENTRYDATE AS DATETIME
	
	
AS
BEGIN
UPDATE OrderMst SET INAME=@INAME,QNT=@QNT,PRICE=@PRICE,TPRICE=@TPRICE,STATUS=@STATUS,ENTRYDATE=@ENTRYDATE WHERE OID=@OID;

	
END
GO
/****** Object:  StoredProcedure [dbo].[ORDERMST_INSERT]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ORDERMST_INSERT] 
	@UNAME AS NVARCHAR(256),
	@INAME AS NVARCHAR(256),
	@QNT AS NVARCHAR(256),
	@PRICE AS NVARCHAR(256),
	@TPRICE  AS NVARCHAR(256),
	@STATUS AS NVARCHAR(256),
 
@img as nvarchar(500)



	
	
AS
BEGIN
INSERT INTO OrderMst VALUES(@UNAME,@INAME,@QNT,@PRICE,@TPRICE,@STATUs,getdate(),@img);

	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DisplayAllFileById]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_DisplayAllFileById]
	@AccessionId int
as 
begin

select * from UploadTable
where AccessionId = @AccessionId
end
GO
/****** Object:  StoredProcedure [dbo].[SP_DisplayFile]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_DisplayFile]
As
Begin
WITH CTE AS (
    SELECT AccessionId, MAX(Version) AS MaxVersion
    FROM UploadTable
    GROUP BY AccessionId
)
SELECT UT.*
FROM UploadTable UT
INNER JOIN CTE ON UT.AccessionId = CTE.AccessionId AND UT.Version = CTE.MaxVersion;
 
end
GO
/****** Object:  StoredProcedure [dbo].[SP_DisplayFileById]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_DisplayFileById]
	@AccessionId int
as 
begin
DECLARE @v1 int;
SELECT @v1 = MAX(Version) FROM UploadTable where AccessionId = @AccessionId;


select * from UploadTable
where AccessionId = @AccessionId AND Version = @v1
end
GO
/****** Object:  StoredProcedure [dbo].[SP_UploadFile]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UploadFile]
    @AccessionID INT,
    @FilePath NVARCHAR(500),
    @FileSize BIGINT,
    @FileType NVARCHAR(100),
    @FileName NVARCHAR(200),
    @UploadDate DATETIME
AS
BEGIN
    INSERT INTO UploadTable(AccessionID, FilePath, FileSize, FileType, FileName, UploadDate)
    VALUES (@AccessionID, @FilePath, @FileSize, @FileType, @FileName, @UploadDate)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UploadFiles]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_UploadFiles]
	@AccessionID INT,
    @FilePath NVARCHAR(500),
    @FileSize BIGINT,
	@Reason NVARCHAR(500),
    @FileType NVARCHAR(100),
    @FileName NVARCHAR(200),
    @UploadDate DATETIME,
	@Version INT
	

As 
IF EXISTS (
    SELECT 1
    FROM UploadTable
    WHERE AccessionId = @AccessionId
)
BEGIN
    INSERT INTO UploadTable(AccessionID, FilePath, FileSize, FileType, FileName, UploadDate,Reason,Version)
    VALUES (@AccessionID, @FilePath, @FileSize, @FileType, @FileName, @UploadDate,@Reason,@Version)
END
ELSE
BEGIN
    INSERT INTO UploadTable(AccessionID, FilePath, FileSize, FileType, FileName, UploadDate)
    VALUES (@AccessionID, @FilePath, @FileSize, @FileType, @FileName, @UploadDate)
END
GO
/****** Object:  StoredProcedure [dbo].[USER_SELECT]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USER_SELECT]
	

	
AS
BEGIN
SELECT * FROM UserMst
END
GO
/****** Object:  StoredProcedure [dbo].[USER_SELECT_by_UID]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USER_SELECT_by_UID]
	
@UID AS INT
	
AS
BEGIN
SELECT * FROM UserMst WHERE UID=@UID
END
GO
/****** Object:  StoredProcedure [dbo].[USER_SELECT_FOR_LOGIN]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USER_SELECT_FOR_LOGIN]
@UNAME AS NVARCHAR(256),
@UPASS AS NVARCHAR(256)	
AS
BEGIN
SELECT * FROM UserMst WHERE Email=@UNAME AND Password=@UPASS
END
GO
/****** Object:  StoredProcedure [dbo].[USER_UPDATE_PASSWORD]    Script Date: 11/27/2023 9:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USER_UPDATE_PASSWORD]
	
	@email as nvarchar(256),
@PASS AS NVARCHAR(256)
AS
BEGIN
UPDATE UserMst SET Password=@PASS WHERE Email=@email
END
GO
USE [master]
GO
ALTER DATABASE [UploadFiles] SET  READ_WRITE 
GO
