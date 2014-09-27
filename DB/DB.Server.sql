USE [ES.Server]
GO
/****** Object:  Table [dbo].[TranLog]    Script Date: 09/27/2014 22:17:36 ******/
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
/****** Object:  Table [dbo].[TranConfig]    Script Date: 09/27/2014 22:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TranConfig](
	[Guid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Sort] [int] NOT NULL,
	[MaxCount] [int] NOT NULL,
	[LastStamp] [binary](16) NULL,
	[Direct] [int] NOT NULL,
	[HeaderSql] [text] NULL,
	[DetailSql] [text] NOT NULL,
	[FooterSql] [text] NULL,
	[Remark] [text] NOT NULL,
	[Status] [int] NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [varchar](64) NULL,
	[ModifiedTime] [datetime] NULL,
	[ModifiedBy] [varchar](64) NULL,
 CONSTRAINT [PK_TranConfig] PRIMARY KEY CLUSTERED 
(
	[Guid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据传输方向：0-Server->Client,1-Client->Server,2-Clent->Client' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TranConfig', @level2type=N'COLUMN',@level2name=N'Direct'
GO
/****** Object:  Table [dbo].[MidTransfer]    Script Date: 09/27/2014 22:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MidTransfer](
	[Guid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ConfigGuid] [binary](64) NOT NULL,
	[ConfigName] [nvarchar](64) NULL,
	[Target] [varchar](64) NOT NULL,
	[Source] [varchar](64) NULL,
	[HeaderSql] [text] NULL,
	[DetailSql] [text] NOT NULL,
	[FooterSql] [text] NULL,
	[TranTime] [datetime] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_MidTransfer] PRIMARY KEY CLUSTERED 
(
	[Guid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Client]    Script Date: 09/27/2014 22:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [int] NOT NULL,
	[Address] [nvarchar](500) NULL,
	[Timestamp] [timestamp] NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedTime] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedTime] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_Client_GUID]    Script Date: 09/27/2014 22:17:36 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_GUID]  DEFAULT (newid()) FOR [GUID]
GO
/****** Object:  Default [DF_Client_Type]    Script Date: 09/27/2014 22:17:36 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_Type]  DEFAULT ((1)) FOR [Type]
GO
/****** Object:  Default [DF_MidTransfer_Guid]    Script Date: 09/27/2014 22:17:36 ******/
ALTER TABLE [dbo].[MidTransfer] ADD  CONSTRAINT [DF_MidTransfer_Guid]  DEFAULT (newid()) FOR [Guid]
GO
/****** Object:  Default [DF_Table_1_GUID]    Script Date: 09/27/2014 22:17:36 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_Table_1_GUID]  DEFAULT (newid()) FOR [Guid]
GO
/****** Object:  Default [DF_TranConfig_Sort]    Script Date: 09/27/2014 22:17:36 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Sort]  DEFAULT ((0)) FOR [Sort]
GO
/****** Object:  Default [DF_TranConfig_MaxCount]    Script Date: 09/27/2014 22:17:36 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_MaxCount]  DEFAULT ((20)) FOR [MaxCount]
GO
/****** Object:  Default [DF_TranConfig_Direct]    Script Date: 09/27/2014 22:17:36 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Direct]  DEFAULT ((0)) FOR [Direct]
GO
/****** Object:  Default [DF_TranConfig_Status]    Script Date: 09/27/2014 22:17:36 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_TranConfig_CreatedTime]    Script Date: 09/27/2014 22:17:36 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
