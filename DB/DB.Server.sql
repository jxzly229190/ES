USE [ES.Server]
GO
/****** Object:  Table [dbo].[User]    Script Date: 03/15/2015 22:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](2000) NULL,
	[Address] [nvarchar](500) NULL,
	[Remark] [nvarchar](2000) NULL,
	[State] [int] NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[CreatedTime] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TranLog]    Script Date: 03/15/2015 22:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TranLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Client] [varchar](32) NULL,
	[Target] [varchar](32) NULL,
	[Sort] [int] NULL,
	[ConfigCode] [nvarchar](50) NULL,
	[ConfigName] [nvarchar](100) NULL,
	[Direct] [int] NULL,
	[Header] [nvarchar](4000) NULL,
	[Detail] [nvarchar](4000) NULL,
	[Footer] [nvarchar](4000) NULL,
	[Count] [int] NULL,
	[Stamp] [bigint] NULL,
	[Result] [nvarchar](500) NULL,
	[Remark] [nvarchar](2000) NULL,
	[TranTime] [datetime] NOT NULL,
 CONSTRAINT [PK_TranLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TranConfig]    Script Date: 03/15/2015 22:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TranConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Sort] [int] NOT NULL,
	[MaxCount] [int] NOT NULL,
	[LastStamp] [bigint] NULL,
	[Direct] [int] NOT NULL,
	[HeaderSql] [nvarchar](4000) NULL,
	[DetailSql] [nvarchar](4000) NOT NULL,
	[FooterSql] [nvarchar](4000) NULL,
	[Remark] [nvarchar](4000) NULL,
	[Status] [int] NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [varchar](64) NULL,
	[ModifiedTime] [datetime] NULL,
	[ModifiedBy] [varchar](64) NULL,
 CONSTRAINT [PK_TranConfig_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据传输方向：0-Server->Client,1-Client->Server,2-Clent->Client' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TranConfig', @level2type=N'COLUMN',@level2name=N'Direct'
GO
/****** Object:  Table [dbo].[MidTransfer]    Script Date: 03/15/2015 22:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MidTransfer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[LoginUser]    Script Date: 03/15/2015 22:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[Pwd] [varchar](32) NOT NULL,
	[RName] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
	[LastLogin] [datetime] NULL,
	[CreateTime] [datetime] NULL,
	[ModifiedTime] [datetime] NULL,
 CONSTRAINT [PK_LoginUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Client]    Script Date: 03/15/2015 22:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[IsCurrent] [bit] NULL,
	[Type] [int] NOT NULL,
	[Address] [nvarchar](500) NULL,
	[Timestamp] [timestamp] NOT NULL,
	[Status] [int] NOT NULL,
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
/****** Object:  UserDefinedFunction [dbo].[bims_f_var_to_string]    Script Date: 03/15/2015 22:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--将变量转换成带边界的字符串，如果是空值，则返回字符串'NULL'    
CREATE function [dbo].[bims_f_var_to_string] (    
        @ssvar sql_variant    
)    
returns nvarchar(4000)    
as    
begin    
        declare @pstrout varchar(4000)    
    
        if @ssvar is null return('NULL')    
    
        declare @basetype sysname    
    
        select @basetype = CAST(SQL_VARIANT_PROPERTY ( @ssvar, 'BaseType' ) as nvarchar(255))    
        if (@ssvar IS NOT NULL and @basetype IS NOT NULL)    
        begin    
                if (lower(@basetype) in ('varchar','nvarchar'))    
                        select @pstrout = N'''' + REPLACE(CAST(@ssvar as nvarchar(4000)), '''', '''''') + N''''    
                else if (lower(@basetype) in ('char','nchar'))    
                        select @pstrout = N'''' + REPLACE(RTRIM(CAST(@ssvar as nvarchar(4000))), '''', '''''') + N''''    
                else if (lower(@basetype) in ('binary','varbinary'))    
                        select @pstrout = master.dbo.fn_varbintohexsubstring(1, CAST(@ssvar as varbinary(8000)), 1, 0)    
                else if (lower(@basetype) in ('bit','bigint','int','smallint','tinyint','float','real','decimal','numeric'))    
                        select @pstrout = CAST(@ssvar as nvarchar(40))    
                else if (lower(@basetype) in ('money','smallmoney'))    
                        select @pstrout = CONVERT(nvarchar(40), @ssvar, 2)    
                else if (lower(@basetype) = 'uniqueidentifier')    
                        select @pstrout = N'''' + CAST(@ssvar as nvarchar(40)) + N''''    
                else if (lower(@basetype) in ('datetime','smalldatetime'))    
                        select @pstrout = N'''' + CONVERT(nvarchar(40), @ssvar, 121) + N''''    
                else    
                        select @pstrout = N'''Invalid Datatype' + lower(@basetype) + N'(' + CAST(@ssvar as nvarchar) + N')'''    
        end    
    
        return(@pstrout)    
    
end
GO
/****** Object:  Default [DF_Client_GUID]    Script Date: 03/15/2015 22:17:35 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_GUID]  DEFAULT (newid()) FOR [GUID]
GO
/****** Object:  Default [DF_Client_IsCurrent]    Script Date: 03/15/2015 22:17:35 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_IsCurrent]  DEFAULT ((0)) FOR [IsCurrent]
GO
/****** Object:  Default [DF_Client_Type]    Script Date: 03/15/2015 22:17:35 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_Type]  DEFAULT ((1)) FOR [Type]
GO
/****** Object:  Default [DF_Client_Status]    Script Date: 03/15/2015 22:17:35 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_MidTransfer_Guid]    Script Date: 03/15/2015 22:17:35 ******/
ALTER TABLE [dbo].[MidTransfer] ADD  CONSTRAINT [DF_MidTransfer_Guid]  DEFAULT (newid()) FOR [Guid]
GO
/****** Object:  Default [DF_Table_1_GUID]    Script Date: 03/15/2015 22:17:35 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_Table_1_GUID]  DEFAULT (newid()) FOR [Guid]
GO
/****** Object:  Default [DF_TranConfig_Sort]    Script Date: 03/15/2015 22:17:35 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Sort]  DEFAULT ((0)) FOR [Sort]
GO
/****** Object:  Default [DF_TranConfig_MaxCount]    Script Date: 03/15/2015 22:17:35 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_MaxCount]  DEFAULT ((20)) FOR [MaxCount]
GO
/****** Object:  Default [DF_TranConfig_Direct]    Script Date: 03/15/2015 22:17:35 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Direct]  DEFAULT ((0)) FOR [Direct]
GO
/****** Object:  Default [DF_TranConfig_Status]    Script Date: 03/15/2015 22:17:35 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_TranConfig_CreatedTime]    Script Date: 03/15/2015 22:17:35 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
/****** Object:  Default [DF_TranLog_TranTime]    Script Date: 03/15/2015 22:17:35 ******/
ALTER TABLE [dbo].[TranLog] ADD  CONSTRAINT [DF_TranLog_TranTime]  DEFAULT (getdate()) FOR [TranTime]
GO
/****** Object:  Default [DF_User_Guid]    Script Date: 03/15/2015 22:17:35 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Guid]  DEFAULT (newid()) FOR [Guid]
GO
/****** Object:  Default [DF_User_CreatedTime]    Script Date: 03/15/2015 22:17:35 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
