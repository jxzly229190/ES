USE [ES.Client]
GO
/****** Object:  Table [dbo].[TranLog]    Script Date: 09/27/2014 22:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TranLog]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TranConfig]    Script Date: 09/27/2014 22:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TranConfig]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'TranConfig', N'COLUMN',N'Direct'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据传输方向：0-Server->Client,1-Client->Server,2-Clent->Client' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TranConfig', @level2type=N'COLUMN',@level2name=N'Direct'
GO
/****** Object:  Table [dbo].[Client]    Script Date: 09/27/2014 22:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Client]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_Client_GUID]    Script Date: 09/27/2014 22:21:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Client_GUID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Client]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Client_GUID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_GUID]  DEFAULT (newid()) FOR [GUID]
END


End
GO
/****** Object:  Default [DF_Client_Type]    Script Date: 09/27/2014 22:21:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Client_Type]') AND parent_object_id = OBJECT_ID(N'[dbo].[Client]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Client_Type]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_Type]  DEFAULT ((1)) FOR [Type]
END


End
GO
/****** Object:  Default [DF_Table_1_GUID]    Script Date: 09/27/2014 22:21:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_GUID]') AND parent_object_id = OBJECT_ID(N'[dbo].[TranConfig]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Table_1_GUID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_Table_1_GUID]  DEFAULT (newid()) FOR [Guid]
END


End
GO
/****** Object:  Default [DF_TranConfig_Sort]    Script Date: 09/27/2014 22:21:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TranConfig_Sort]') AND parent_object_id = OBJECT_ID(N'[dbo].[TranConfig]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TranConfig_Sort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Sort]  DEFAULT ((0)) FOR [Sort]
END


End
GO
/****** Object:  Default [DF_TranConfig_MaxCount]    Script Date: 09/27/2014 22:21:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TranConfig_MaxCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[TranConfig]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TranConfig_MaxCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_MaxCount]  DEFAULT ((20)) FOR [MaxCount]
END


End
GO
/****** Object:  Default [DF_TranConfig_Direct]    Script Date: 09/27/2014 22:21:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TranConfig_Direct]') AND parent_object_id = OBJECT_ID(N'[dbo].[TranConfig]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TranConfig_Direct]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Direct]  DEFAULT ((0)) FOR [Direct]
END


End
GO
/****** Object:  Default [DF_TranConfig_Status]    Script Date: 09/27/2014 22:21:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TranConfig_Status]') AND parent_object_id = OBJECT_ID(N'[dbo].[TranConfig]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TranConfig_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Status]  DEFAULT ((0)) FOR [Status]
END


End
GO
/****** Object:  Default [DF_TranConfig_CreatedTime]    Script Date: 09/27/2014 22:21:44 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TranConfig_CreatedTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[TranConfig]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TranConfig_CreatedTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
END


End
GO
