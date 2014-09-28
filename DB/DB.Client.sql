USE [ES.Client]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 09/28/2014 17:22:20 ******/
ALTER TABLE [dbo].[Client] DROP CONSTRAINT [DF_Client_GUID]
GO
ALTER TABLE [dbo].[Client] DROP CONSTRAINT [DF_Client_Type]
GO
ALTER TABLE [dbo].[Client] DROP CONSTRAINT [DF_Client_Status]
GO
DROP TABLE [dbo].[Client]
GO
/****** Object:  Table [dbo].[TranConfig]    Script Date: 09/28/2014 17:22:20 ******/
ALTER TABLE [dbo].[TranConfig] DROP CONSTRAINT [DF_Table_1_GUID]
GO
ALTER TABLE [dbo].[TranConfig] DROP CONSTRAINT [DF_TranConfig_Sort]
GO
ALTER TABLE [dbo].[TranConfig] DROP CONSTRAINT [DF_TranConfig_MaxCount]
GO
ALTER TABLE [dbo].[TranConfig] DROP CONSTRAINT [DF_TranConfig_Direct]
GO
ALTER TABLE [dbo].[TranConfig] DROP CONSTRAINT [DF_TranConfig_Status]
GO
ALTER TABLE [dbo].[TranConfig] DROP CONSTRAINT [DF_TranConfig_CreatedTime]
GO
DROP TABLE [dbo].[TranConfig]
GO
/****** Object:  Table [dbo].[TranLog]    Script Date: 09/28/2014 17:22:20 ******/
DROP TABLE [dbo].[TranLog]
GO
/****** Object:  Table [dbo].[TranLog]    Script Date: 09/28/2014 17:22:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TranLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TranName] [nvarchar](32) NULL,
	[Source] [varchar](32) NULL,
	[Target] [varchar](32) NULL,
	[Request] [text] NOT NULL,
	[Response] [text] NULL,
	[TranTime] [datetime] NOT NULL,
 CONSTRAINT [PK_TranLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TranConfig]    Script Date: 09/28/2014 17:22:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TranConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_Table_1_GUID]  DEFAULT (newid()),
	[Name] [nvarchar](64) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Sort] [int] NOT NULL CONSTRAINT [DF_TranConfig_Sort]  DEFAULT ((0)),
	[MaxCount] [int] NOT NULL CONSTRAINT [DF_TranConfig_MaxCount]  DEFAULT ((20)),
	[LastStamp] [binary](16) NULL,
	[Direct] [int] NOT NULL CONSTRAINT [DF_TranConfig_Direct]  DEFAULT ((0)),
	[HeaderSql] [text] NULL,
	[DetailSql] [text] NOT NULL,
	[FooterSql] [text] NULL,
	[Remark] [text] NOT NULL,
	[Status] [int] NOT NULL CONSTRAINT [DF_TranConfig_Status]  DEFAULT ((0)),
	[Timestamp] [timestamp] NOT NULL,
	[CreatedTime] [datetime] NOT NULL CONSTRAINT [DF_TranConfig_CreatedTime]  DEFAULT (getdate()),
	[CreatedBy] [varchar](64) NULL,
	[ModifiedTime] [datetime] NULL,
	[ModifiedBy] [varchar](64) NULL,
 CONSTRAINT [PK_TranConfig_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据传输方向：0-Server->Client,1-Client->Server,2-Clent->Client' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TranConfig', @level2type=N'COLUMN',@level2name=N'Direct'
GO
/****** Object:  Table [dbo].[Client]    Script Date: 09/28/2014 17:22:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_Client_GUID]  DEFAULT (newid()),
	[Code] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [int] NOT NULL CONSTRAINT [DF_Client_Type]  DEFAULT ((1)),
	[Address] [nvarchar](500) NULL,
	[Timestamp] [timestamp] NOT NULL,
	[Status] [int] NOT NULL CONSTRAINT [DF_Client_Status]  DEFAULT ((0)),
	[CreatedBy] [varchar](50) NULL,
	[CreatedTime] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedTime] [datetime] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
