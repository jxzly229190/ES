USE [master]
GO
/****** Object:  Database [ES.Server]    Script Date: 05/18/2015 17:03:30 ******/
CREATE DATABASE [ES.Server] ON  PRIMARY 
( NAME = N'ES.Server', FILENAME = N'E:\DB\MSSQL\ES.Server.mdf' , SIZE = 29696KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ES.Server_log', FILENAME = N'E:\DB\MSSQL\ES.Server_log.ldf' , SIZE = 15040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ES.Server] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ES.Server].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ES.Server] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ES.Server] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ES.Server] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ES.Server] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ES.Server] SET ARITHABORT OFF
GO
ALTER DATABASE [ES.Server] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ES.Server] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ES.Server] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ES.Server] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ES.Server] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ES.Server] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ES.Server] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ES.Server] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ES.Server] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ES.Server] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ES.Server] SET  DISABLE_BROKER
GO
ALTER DATABASE [ES.Server] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ES.Server] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ES.Server] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ES.Server] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ES.Server] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ES.Server] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ES.Server] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ES.Server] SET  READ_WRITE
GO
ALTER DATABASE [ES.Server] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ES.Server] SET  MULTI_USER
GO
ALTER DATABASE [ES.Server] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ES.Server] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'ES.Server', N'ON'
GO
USE [ES.Server]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 05/18/2015 17:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 05/18/2015 17:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201504101420207_InitialCreate', N'ES.Server.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EDC36107D2FD07F10F4D416CECA9726488DDD04CEDA6E8DC617649DA06F0157E2AE8548942A518E8DA25FD6877E527FA14389BAF1A2CBAEBCBB0E020416393C331C0EC9E170B8FFFDF3EFF8ED83EF19F7388ADD804CCC83D1BE696062078E4B961333A18B17AFCDB76FBEFF6E7CE6F80FC6A79CEE88D1414B124FCC3B4AC363CB8AED3BECA378E4BB7614C4C1828EECC0B790135887FBFBBF58070716060813B00C63FC2121D4F571FA019FD380D838A409F22E03077B312F879A598A6A5C211FC721B2F1C43C9B8D663802894719AD699C782E023966D85B98062224A0888294C71F633CA3514096B3100A9077FB1862A05B202FC65CFAE392BC6B47F60F5947ACB2610E6527310DFC9E8007475C3396D87C25FD9A85E6407767A063FAC87A9DEA6F625E38382DFA1078A00091E1F1D48B18F1C4BC2C589CC4E115A6A3BCE128833C8F00EE6B107D195511F78CCEEDF60A4B3A1CEDB37F7BC634F16812E109C1098D90B767DC2473CFB57FC78FB7C1174C264707F3C5D1EB97AF9073F4EA677CF4B2DA53E82BD0D50AA0E8260A421C816C7851F4DF34AC7A3B4B6C5834ABB4C9B402B60493C2342ED1C37B4C96F40EA6CBE16BD338771FB0939770E3FA485C9843D08846097C5E259E87E61E2EEAAD469EECFF06AE872F5F0DC2F50ADDBBCB74E805FE30712298571FB097D6C6776E984DAFDA787FE664E751E0B3EFBA7D65B59F674112D9AC338196E416454B4CEBD28DADD2783B9934831ADEAC73D4DD376D26A96CDE4A52D6A1556642CE62D3B32197F769F976B6B8933084C14B4D8B69A4C9E0C4AD6A24B4DD330A8AD26C0EBA9A0D81EE7CCBABE0998F5C6F8065B00317F03F166EE4E3A297EF02303A447ACB7C83E2185601E73714DF35880E7F0E20FA0CDB4904C639A3C80F9F9CDBCD5D40F055E2CF99CD6F8ED7604373FB353847360DA233C25AAD8DF73EB0BF04093D23CE29A2F823B57340F679EBFADD010611E7C4B6711C9F833163671A807B9D035E107A74D81B8E2D4FDB7643A61E727DB51F222CA49F73D2D217515348FE88864CE5933489FA3E58BAA49BA839A95ED48CA255544ED6575406D64D524EA9173425689533A31ACCCB4B476878372F85DD7D3F6FBDCD5BB71654D438831512FF8A098E6019736E10A53822E508745937B6E12CA4C3C7983EF9DE9472FA84BC6468562BCD867411187E36A4B0BB3F1B5231A1F8DE759857D2E1F09313037C277AF5B9AA7DCE09926D7A3AD4BAB969E69B590374D3E5248E03DB4D678122ECC5831675F9C18733DA2318596FC42808740C0CDD655B1E9440DF4CD1A8AEC929F630C5C6899D8505A728B69123AB113AE4F4102CDF51158295D190BA703F493CC1D271C41A2176088A61A6BA84CAD3C225B61B22AF554B42CB8E5B18EB7BC143AC39C521268C61AB26BA3057073F9800051F6150DA3434B62A16D76C881AAF5537E66D2E6C39EE524C622336D9E23B6BEC92FB6F4F6298CD1ADB807136ABA48B00DA40DE360C949F55BA1A807870D93503154E4C1A03E52ED5460CB4AEB12D18685D25CFCE40B3236AD7F117CEABBB669EF583F2E6B7F546756DC1366BFAD831D3CC7C4F6843A1058E64F33C9DB34AFC4015873390939FCF62EEEA8A26C2C06798D64336A5BFABF443AD6610D1889A004B436B01E55780129034A17A0897C7F21AA5E35E440FD83CEED608CBD77E01B662033276F52AB442A8BF30158DB3D3E9A3E859610D9291773A2C54701406212E5EF58E77508A2E2E2B2BA68B2FDCC71BAE748C0F4683825A3C578D92F2CE0CAEA5DC34DBB5A472C8FAB8646B6949709F345ACA3B33B896B88DB62B49E114F4700BD652517D0B1F68B2E5918E62B729EAC656961FC50BC69626916A7C89C2D025CB4A62152F31665956D5F4C5AC7FC2919F615876ACC83B2AA42D38D120424B2CD4026B90F4DC8D627A8A289A2316E7993ABE44A6DC5B35CB7FCEB2BA7DCA8398EF033935FB9B5F0A8B17F7B59D56764538C239F4CF67FE4C1A44578CBEBAB9C1D2DC90872245DC7E1A78894FF4EE95BE75767B576D9F95C808634B905F729F245D494E6E5DF19D86459E12830C51E1BBAC3E4C7A089DB273CFB3AA6E9D37AA47C9835355145DC06A6BC3A673627A0C95E81DF61FA95684A799533C25A50AC08B7A6254B21A24B04A5D77D47AE24915B35ED31D51C82EA9420A553DA4ACE690D484AC56AC84A7D1A89AA23B07396BA48A2ED7764756E48F54A115D52B602B6416EBBAA32A524CAAC08AEAEED865BE89B884EEF0AEA53DB3ACB86D6587DAF5F62D0DC6D3AC87C36C7B95BBFB2A50A5B82716BF9D97C078F94EDA92F664B7A22D65918CF56C4983A15F756A77DEF545A7F1A25E8F59BBC8AE2DEC4D17F97ABC7E16FBA476211DEB4492827B71BC138E71637EA46A7F34239DB13212D3C8D5089BFA634CB13F6204A3D99FDED473315BC273824B44DC058E6996BC61C211F0B5F0F266775EC15871EC788A23A9EE294C7DCC36908745EE5164DFA148CE8A58E3A548092A059C2F88831F26E65F69ABE33476C1FE4A8BF78C8BF82371FF4CA0E2364AB0F1B79CE5394CE67CF3F16A47DF3974D7EAC51F9FB3A67BC6750433E6D8D81774B9CA08D75F3FF492266BBA86342BBF8978BE13AAF6E840892A4C88D5DF18CC5D3AC8FB825CCA1F7CF4F0635FD1946F08D64254BC13180A6F1015EADE01AC82A57D03E0C0274DDF00F4EBACFA4DC02AA269DF03B8A43F98F81AA0FB3294B7DCE256A338116D62494AF5DC9A4DBD566AE5B6F72629E97AAD892E2756F7805B23797A05CB786679C783ED8E8AB4E2C1B0B769DA4F9E4BBC2BE9C36562C776B386379928DC7021F44DE507EF40469B224367FB59C09BB6355D1477C75329FBE5FAEE98B1F1BCADED67F46EDAD87461DE1D37B65E79BB3B666BDBDA3FB76C699DB7D0AD67E1CA09459ADB18552CB82DCB360B9CC3097F1E8011641E65F638529DD6D59492DAC2B024D133D5E793898CA58923F195289AD9F6EB2BDFF01B3BCB699AD96AB2309B78F3F5BF9137A769E6ADC96DDC467EB032BB5095B3DDB28E35A53F3DA77CE05A4F5AD2CFDB7CD6C6ABF5E794FE3B88526AB3477347FC7CB27D0751C99053A74776AF7CDD0B7B67E5971461FF8EDD6509C17E579160BBB66B1634176411E49BB720514E2244682E31450E6CA927117517C8A650CD62CCE9EBEE346EC76E3AE6D8B920D7090D130A5DC6FEDCAB05BC9813D0C43F4D61AECB3CBE0ED31F2A19A20B20A6CB62F3D7E45DE27A4E21F7B92226A48160DE058FE8B2B1A42CB2BB7C2C90AE02D21188ABAF708A6EB11F7A00165F9319BAC7ABC806E6F71E2F91FD5846007520ED035157FBF8D445CB08F931C728DBC327D8B0E33FBCF91F749363E450540000, N'6.1.1-30610')
/****** Object:  Table [dbo].[User]    Script Date: 05/18/2015 17:03:31 ******/
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
/****** Object:  Table [dbo].[TranLog]    Script Date: 05/18/2015 17:03:31 ******/
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
	[TransferNo] [nvarchar](50) NULL,
	[IsSuccess] [bit] NULL,
	[Direct] [int] NULL,
	[Header] [nvarchar](4000) NULL,
	[Detail] [text] NULL,
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tranferTempLog]    Script Date: 05/18/2015 17:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tranferTempLog](
	[ConfigCode] [nvarchar](128) NOT NULL,
	[TransferNo] [uniqueidentifier] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TranConfig]    Script Date: 05/18/2015 17:03:31 ******/
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
	[Cstamp] [bigint] NULL,
	[Sstamp] [bigint] NULL,
	[Direct] [int] NOT NULL,
	[Import] [int] NULL,
	[SourceTableName] [nvarchar](128) NULL,
	[TargetTableName] [nvarchar](128) NULL,
	[BlobColumn] [nvarchar](128) NULL,
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
SET IDENTITY_INSERT [dbo].[TranConfig] ON
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [Cstamp], [Sstamp], [Direct], [Import], [SourceTableName], [TargetTableName], [BlobColumn], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (1, N'58ea51c1-ce07-4cd7-bb5b-fcac7d87f33e', N'配置数据（不能删除）', N'PZSJ', -1, 20, 0, 0, 0, 0, N'TranConfig', N'TranConfig', NULL, N'if object_id(''tempdb..#temp_TranConfig'') is not null drop table #temp_TranConfig;select top 0 [Guid],[Name],[Code],[Sort],[MaxCount],[Cstamp],[Sstamp],[Direct],[Import],[SourceTableName],[TargetTableName],[BlobColumn],[HeaderSql],[DetailSql],[FooterSql],[Remark],[Status],[CreatedTime],[CreatedBy],[ModifiedTime],[ModifiedBy] into #temp_TranConfig from [TranConfig](nolock);', N'select top $rowCount$ ''insert #temp_TranConfig([Guid],[Name],[Code],[Sort],[MaxCount],[Cstamp],[Sstamp],[Direct],[Import],[SourceTableName],[TargetTableName],[BlobColumn],[HeaderSql],[DetailSql],[FooterSql],[Remark],[Status],[CreatedTime],[CreatedBy],[ModifiedTime],[ModifiedBy]) select ''+dbo.bims_f_var_to_string(Guid)+'',''+dbo.bims_f_var_to_string(Name)+'',''+dbo.bims_f_var_to_string(Code)+'',''+dbo.bims_f_var_to_string(Sort)+'',''+dbo.bims_f_var_to_string(MaxCount)+'',''+dbo.bims_f_var_to_string(Cstamp)+'',''+dbo.bims_f_var_to_string(Sstamp)+'',''+dbo.bims_f_var_to_string(Direct)+'',''+dbo.bims_f_var_to_string(Import)+'',''+dbo.bims_f_var_to_string(SourceTableName)+'',''+dbo.bims_f_var_to_string(TargetTableName)+'',''+dbo.bims_f_var_to_string(BlobColumn)+'',''+dbo.bims_f_var_to_string(HeaderSql)+'',''+dbo.bims_f_var_to_string(DetailSql)+'',''+dbo.bims_f_var_to_string(FooterSql)+'',''+dbo.bims_f_var_to_string(Remark)+'',''+dbo.bims_f_var_to_string(Status)+'',''+dbo.bims_f_var_to_string(CreatedTime)+'',''+dbo.bims_f_var_to_string(CreatedBy)+'',''+dbo.bims_f_var_to_string(ModifiedTime)+'',''+dbo.bims_f_var_to_string(ModifiedBy) as sql,cast(timestamp as bigint) as stamp,[Guid] as Guid from [TranConfig] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) {templog: And [Guid] not in (Select [guid] from tranferTempLog where TransferNo = ''$tranferNo$'' and ConfigCode = ''$configCode$'') :templog} Order by [TimeStamp];', N'Update b set b.Guid = a.Guid,b.Name = a.Name,b.Code = a.Code,b.Sort = a.Sort,b.MaxCount = a.MaxCount,b.Cstamp = a.Cstamp,b.Sstamp = a.Sstamp,b.Direct = a.Direct,b.Import = a.Import,b.SourceTableName = a.SourceTableName,b.TargetTableName = a.TargetTableName,b.BlobColumn = a.BlobColumn,b.HeaderSql = a.HeaderSql,b.DetailSql = a.DetailSql,b.FooterSql = a.FooterSql,b.Remark = a.Remark,b.Status = a.Status,b.CreatedTime = a.CreatedTime,b.CreatedBy = a.CreatedBy,b.ModifiedTime = a.ModifiedTime,b.ModifiedBy = a.ModifiedBy from #temp_TranConfig a,[TranConfig] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [TranConfig]([Guid],[Name],[Code],[Sort],[MaxCount],[Cstamp],[Sstamp],[Direct],[Import],[SourceTableName],[TargetTableName],[BlobColumn],[HeaderSql],[DetailSql],[FooterSql],[Remark],[Status],[CreatedTime],[CreatedBy],[ModifiedTime],[ModifiedBy]) select [Guid],[Name],[Code],[Sort],[MaxCount],[Cstamp],[Sstamp],[Direct],[Import],[SourceTableName],[TargetTableName],[BlobColumn],[HeaderSql],[DetailSql],[FooterSql],[Remark],[Status],[CreatedTime],[CreatedBy],[ModifiedTime],[ModifiedBy] from #temp_TranConfig a   where a.Guid not in (Select [GUID] From [TranConfig]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', NULL, 0, CAST(0x0000A3BF014A788A AS DateTime), NULL, CAST(0x0000A4950109629A AS DateTime), N'abc@live.cn')
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [Cstamp], [Sstamp], [Direct], [Import], [SourceTableName], [TargetTableName], [BlobColumn], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (2, N'02d3160d-da23-4890-b546-bab377842671', N'客户资料传门店', N'KHZL2C', 2, 50, 0, 0, 2, 0, N'User', N'User', NULL, N'if object_id(''tempdb..#temp_User'') is not null drop table #temp_User;select top 0 [Guid],[Name],[Address],[Remark],[State],[CreatedTime] into #temp_User from [User](nolock);', N'select top $rowCount$ ''insert #temp_User([Guid],[Name],[Address],[Remark],[State],[CreatedTime]) select ''+dbo.bims_f_var_to_string(Guid)+'',''+dbo.bims_f_var_to_string(Name)+'',''+dbo.bims_f_var_to_string(Address)+'',''+dbo.bims_f_var_to_string(Remark)+'',''+dbo.bims_f_var_to_string(State)+'',''+dbo.bims_f_var_to_string(CreatedTime) as sql,cast(timestamp as bigint) as stamp,[Guid] as Guid from [User] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) {templog: And [Guid] not in (Select [guid] from tranferTempLog where TransferNo = ''$tranferNo$'' and ConfigCode = ''$configCode$'') :templog} Order by [TimeStamp];', N'Update b set b.Guid = a.Guid,b.Name = a.Name,b.Address = a.Address,b.Remark = a.Remark,b.State = a.State,b.CreatedTime = a.CreatedTime from #temp_User a,[User] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [User]([Guid],[Name],[Address],[Remark],[State],[CreatedTime]) select [Guid],[Name],[Address],[Remark],[State],[CreatedTime] from #temp_User a   where a.Guid not in (Select [GUID] From [User]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', NULL, 0, CAST(0x0000A3C100E5B2E0 AS DateTime), NULL, CAST(0x0000A495010973BD AS DateTime), N'abc@live.cn')
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [Cstamp], [Sstamp], [Direct], [Import], [SourceTableName], [TargetTableName], [BlobColumn], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (3, N'158af478-2bb2-4690-aaab-801a38e25503', N'客户端数据', N'KHD', 1, 20, 0, 0, 2, 0, N'LoginUser', N'LoginUser', NULL, N'if object_id(''tempdb..#temp_LoginUser'') is not null drop table #temp_LoginUser;select top 0 [Name],[Pwd],[RName],[Role],[LastLogin],[CreateTime],[ModifiedTime] into #temp_LoginUser from [LoginUser](nolock);', N'select top $rowCount$ ''insert #temp_LoginUser([Name],[Pwd],[RName],[Role],[LastLogin],[CreateTime],[ModifiedTime]) select ''+dbo.bims_f_var_to_string(Name)+'',''+dbo.bims_f_var_to_string(Pwd)+'',''+dbo.bims_f_var_to_string(RName)+'',''+dbo.bims_f_var_to_string(Role)+'',''+dbo.bims_f_var_to_string(LastLogin)+'',''+dbo.bims_f_var_to_string(CreateTime)+'',''+dbo.bims_f_var_to_string(ModifiedTime) as sql,cast(timestamp as bigint) as stamp,[Guid] as Guid from [LoginUser] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) {templog: And [Guid] not in (Select [guid] from tranferTempLog where TransferNo = ''$tranferNo$'' and ConfigCode = ''$configCode$'') :templog} Order by [TimeStamp];', N'Update b set b.Name = a.Name,b.Pwd = a.Pwd,b.RName = a.RName,b.Role = a.Role,b.LastLogin = a.LastLogin,b.CreateTime = a.CreateTime,b.ModifiedTime = a.ModifiedTime from #temp_LoginUser a,[LoginUser] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [LoginUser]([Name],[Pwd],[RName],[Role],[LastLogin],[CreateTime],[ModifiedTime]) select [Name],[Pwd],[RName],[Role],[LastLogin],[CreateTime],[ModifiedTime] from #temp_LoginUser a   where a.Guid not in (Select [GUID] From [LoginUser]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', NULL, 1, CAST(0x0000A3BF015D31D7 AS DateTime), NULL, CAST(0x0000A49501098A34 AS DateTime), N'abc@live.cn')
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [Cstamp], [Sstamp], [Direct], [Import], [SourceTableName], [TargetTableName], [BlobColumn], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (4, N'02d3160d-da23-4890-b546-bab377842670', N'客户资料', N'KHZL', 2, 20, 0, 0, 1, 0, N'User', NULL, NULL, N'if object_id(''tempdb..#temp_User'') is not null drop table #temp_User;select top 0 [GUID]      ,[Name]     ,[Address],[Remark]      ,[State]      ,[CreatedTime]  into #temp_User from [User](nolock);', N'select top $rowCount$ ''insert #temp_User([GUID],[Name],[Address],[Remark],[State],[CreatedTime]) select ''+dbo.bims_f_var_to_string(Guid)+'',''+dbo.bims_f_var_to_string(Name)+'',''+dbo.bims_f_var_to_string(Address)+'',''+dbo.bims_f_var_to_string(Remark)+'',''+dbo.bims_f_var_to_string(State)+'',''+dbo.bims_f_var_to_string(CreatedTime) from [User] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) Order by [TimeStamp];', N'Update b set b.name = a.name,b.Address = a.Address ,b.State = a.State,b.Remark = a.Remark,b.CreatedTime = a.CreatedTime from #temp_User a,[User] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [User]([GUID],[Name],[Address],[Remark],[State],[CreatedTime]) select [GUID],[Name],[Address],[Remark],[State],[CreatedTime] from #temp_User a   where a.Guid not in (Select [GUID] From [User]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', NULL, 255, CAST(0x0000A3C100E5B2E0 AS DateTime), NULL, CAST(0x0000A48401078A24 AS DateTime), N'abc@live.cn')
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [Cstamp], [Sstamp], [Direct], [Import], [SourceTableName], [TargetTableName], [BlobColumn], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (6, N'0b2de912-abbf-4f2b-9ba3-69d34e68b8c8', N'下拉资料', N'DDDW', 3, 30, NULL, 0, 0, 0, N'Client', NULL, NULL, N'if object_id(''tempdb..#temp_sys_dddw'') is not null drop table #temp_sys_dddw;select top 0 [dddwno]      ,[funcname]  ,[dddwlist]      ,[descr]      ,[notes]      ,[isdefault] into #temp_sys_dddw from sys_dddw(nolock);', N'select top $rowCount$ ''insert #temp_sys_dddw([dddwno]      ,[funcname]  ,[dddwlist]      ,[descr]      ,[notes]      ,[isdefault]) select   ''+dbo.bims_f_var_to_string(dddwno)+'',''+dbo.bims_f_var_to_string(funcname)+'',''+dbo.bims_f_var_to_string(dddwlist)+'',''+dbo.bims_f_var_to_string(descr)+'',''+dbo.bims_f_var_to_string(notes)+'',''+dbo.bims_f_var_to_string(isdefault)from sys_dddw where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) Order by [timeStamp];', N'insert into [sys_dddw]([dddwno],[funcname],[dddwlist],[descr],[notes],[isdefault]) select [dddwno],[funcname],[dddwlist],[descr],[notes],[isdefault]  from #temp_[sys_dddw] a  ;if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', NULL, 255, CAST(0x0000A3CB0161BEA0 AS DateTime), NULL, CAST(0x0000A48401079C63 AS DateTime), N'abc@live.cn')
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [Cstamp], [Sstamp], [Direct], [Import], [SourceTableName], [TargetTableName], [BlobColumn], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (7, N'29b15f62-eb46-4d55-b477-dacf0ef4e52a', N'元数据表', N'Meta_KV_T_C', 0, 20, NULL, NULL, 0, 0, N'Meta_KeyValue', NULL, NULL, N'if object_id(''tempdb..#temp_Meta_KeyValue'') is not null drop table #temp_Meta_KeyValue;select top 0 [TableName],[ColName],[Value],[Text] into #temp_Meta_KeyValue from [Meta_KeyValue](nolock);', N'select top $rowCount$ ''insert #temp_Meta_KeyValue([TableName],[ColName],[Value],[Text]) select ''+dbo.bims_f_var_to_string(TableName)+'',''+dbo.bims_f_var_to_string(ColName)+'',''+dbo.bims_f_var_to_string(Value)+'',''+dbo.bims_f_var_to_string(Text) as sql,cast(timestamp as bigint) as stamp,[Guid] as Guid from [Meta_KeyValue] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) {templog: And [Guid] not in (Select [guid] from tranferTempLog where TransferNo = ''$tranferNo$'' and ConfigCode = ''$configCode$'') :templog} Order by [TimeStamp];', N'Update b set b.TableName = a.TableName,b.ColName = a.ColName,b.Value = a.Value,b.Text = a.Text from #temp_Meta_KeyValue a,[Meta_KeyValue] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [Meta_KeyValue]([TableName],[ColName],[Value],[Text]) select [TableName],[ColName],[Value],[Text] from #temp_Meta_KeyValue a   where a.Guid not in (Select [GUID] From [Meta_KeyValue]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', N'元数据表传输到客户端', 1, CAST(0x0000A47801190A44 AS DateTime), N'abc@live.cn', CAST(0x0000A48800D3F5BB AS DateTime), N'abc@live.cn')
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [Cstamp], [Sstamp], [Direct], [Import], [SourceTableName], [TargetTableName], [BlobColumn], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (8, N'9d460fd2-fa16-4671-b258-120955c91da9', N'北京店', N'DDDW1', 200, 30, NULL, NULL, 2, 0, N'Client', NULL, NULL, N'if object_id(''tempdb..#temp_Client'') is not null drop table #temp_Client;select top 0 [GUID],[Code],[Name],[IsCurrent],[Type],[Address],[Status],[CreatedBy],[CreatedTime],[ModifiedBy],[ModifiedTime] into #temp_Client from [Client](nolock);', N'select top $rowCount$ ''insert #temp_Client([GUID],[Code],[Name],[IsCurrent],[Type],[Address],[Status],[CreatedBy],[CreatedTime],[ModifiedBy],[ModifiedTime]) select ''+dbo.bims_f_var_to_string(GUID)+'',''+dbo.bims_f_var_to_string(Code)+'',''+dbo.bims_f_var_to_string(Name)+'',''+dbo.bims_f_var_to_string(IsCurrent)+'',''+dbo.bims_f_var_to_string(Type)+'',''+dbo.bims_f_var_to_string(Address)+'',''+dbo.bims_f_var_to_string(Status)+'',''+dbo.bims_f_var_to_string(CreatedBy)+'',''+dbo.bims_f_var_to_string(CreatedTime)+'',''+dbo.bims_f_var_to_string(ModifiedBy)+'',''+dbo.bims_f_var_to_string(ModifiedTime) as sql,cast(timestamp as bigint) as stamp,[Guid] as Guid from [Client] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) {templog: And [Guid] not in (Select [guid] from tranferTempLog where TransferNo = ''$tranferNo$'' and ConfigCode = ''$configCode$'') :templog} Order by [TimeStamp];', N'Update b set b.GUID = a.GUID,b.Code = a.Code,b.Name = a.Name,b.IsCurrent = a.IsCurrent,b.Type = a.Type,b.Address = a.Address,b.Status = a.Status,b.CreatedBy = a.CreatedBy,b.CreatedTime = a.CreatedTime,b.ModifiedBy = a.ModifiedBy,b.ModifiedTime = a.ModifiedTime from #temp_Client a,[Client] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [Client]([GUID],[Code],[Name],[IsCurrent],[Type],[Address],[Status],[CreatedBy],[CreatedTime],[ModifiedBy],[ModifiedTime]) select [GUID],[Code],[Name],[IsCurrent],[Type],[Address],[Status],[CreatedBy],[CreatedTime],[ModifiedBy],[ModifiedTime] from #temp_Client a   where a.Guid not in (Select [GUID] From [Client]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', NULL, 1, CAST(0x0000A4780121DD14 AS DateTime), N'abc@live.cn', CAST(0x0000A4840107CAE3 AS DateTime), N'abc@live.cn')
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [Cstamp], [Sstamp], [Direct], [Import], [SourceTableName], [TargetTableName], [BlobColumn], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (9, N'4bea9f29-e97b-4e6d-988f-245f4e63a837', N'二进制文件传输测试', N'BD_T_C', 10, 10, NULL, NULL, 2, 0, N'DataTest', N'DataTest', N'Data', N'if object_id(''tempdb..#temp_DataTest'') is not null drop table #temp_DataTest;select top 0 [Guid],[Name],[Data] into #temp_DataTest from [DataTest](nolock);', N'select top $rowCount$ ''insert #temp_DataTest([Guid],[Name],[Data]) select ''+dbo.bims_f_var_to_string(Guid)+'',''+dbo.bims_f_var_to_string(Name)+'',0xFF'' as sql,cast(timestamp as bigint) as stamp,[Guid] as Guid,[Data] as Blob from [DataTest] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) {templog: And [Guid] not in (Select [guid] from tranferTempLog where TransferNo = ''$tranferNo$'' and ConfigCode = ''$configCode$'') :templog} Order by [TimeStamp];', N'Update b set b.Guid = a.Guid,b.Name = a.Name,b.Data = a.Data from #temp_DataTest a,[DataTest] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [DataTest]([Guid],[Name],[Data]) select [Guid],[Name],[Data] from #temp_DataTest a   where a.Guid not in (Select [GUID] From [DataTest]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', N'更新', 0, CAST(0x0000A47900FD9064 AS DateTime), N'abc@live.cn', CAST(0x0000A495012379D7 AS DateTime), N'abc@live.cn')
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [Cstamp], [Sstamp], [Direct], [Import], [SourceTableName], [TargetTableName], [BlobColumn], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (10, N'e9371547-9393-463f-93ed-2baefec5f8aa', N'日志资料的上传', N'Log2Server', 100, 20, NULL, NULL, 1, 1, N'TranLog', N'TranLog', NULL, N'if object_id(''tempdb..#temp_TranLog'') is not null drop table #temp_TranLog;select top 0 [Client],[Target],[Sort],[ConfigCode],[ConfigName],[TransferNo],[IsSuccess],[Direct],[Header],[Detail],[Footer],[Count],[Result],[Remark],[TranTime] into #temp_TranLog from [TranLog](nolock);', N'select top $rowCount$ ''insert #temp_TranLog([Client],[Target],[Sort],[ConfigCode],[ConfigName],[TransferNo],[IsSuccess],[Direct],[Header],[Detail],[Footer],[Count],[Result],[Remark],[TranTime]) select ''+dbo.bims_f_var_to_string(Client)+'',''+dbo.bims_f_var_to_string(Target)+'',''+dbo.bims_f_var_to_string(Sort)+'',''+dbo.bims_f_var_to_string(ConfigCode)+'',''+dbo.bims_f_var_to_string(ConfigName)+'',''+dbo.bims_f_var_to_string(TransferNo)+'',''+dbo.bims_f_var_to_string(IsSuccess)+'',''+dbo.bims_f_var_to_string(Direct)+'',''+dbo.bims_f_var_to_string(Header)+'',''+dbo.bims_f_var_to_string(Detail)+'',''+dbo.bims_f_var_to_string(Footer)+'',''+dbo.bims_f_var_to_string(Count)+'',''+dbo.bims_f_var_to_string(Result)+'',''+dbo.bims_f_var_to_string(Remark)+'',''+dbo.bims_f_var_to_string(TranTime) as sql,cast(timestamp as bigint) as stamp,[Guid] as Guid from [TranLog] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) {templog: And [Guid] not in (Select [guid] from tranferTempLog where TransferNo = ''$tranferNo$'' and ConfigCode = ''$configCode$'') :templog} Order by [TimeStamp];', N'Update b set b.Client = a.Client,b.Target = a.Target,b.Sort = a.Sort,b.ConfigCode = a.ConfigCode,b.ConfigName = a.ConfigName,b.TransferNo = a.TransferNo,b.IsSuccess = a.IsSuccess,b.Direct = a.Direct,b.Header = a.Header,b.Detail = a.Detail,b.Footer = a.Footer,b.Count = a.Count,b.Result = a.Result,b.Remark = a.Remark,b.TranTime = a.TranTime from #temp_TranLog a,[TranLog] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [TranLog]([Client],[Target],[Sort],[ConfigCode],[ConfigName],[TransferNo],[IsSuccess],[Direct],[Header],[Detail],[Footer],[Count],[Result],[Remark],[TranTime]) select [Client],[Target],[Sort],[ConfigCode],[ConfigName],[TransferNo],[IsSuccess],[Direct],[Header],[Detail],[Footer],[Count],[Result],[Remark],[TranTime] from #temp_TranLog a   where a.Guid not in (Select [GUID] From [TranLog]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', N'日志资料同步到公司总部', 0, CAST(0x0000A49501221CF5 AS DateTime), N'abc@live.cn', NULL, NULL)
SET IDENTITY_INSERT [dbo].[TranConfig] OFF
/****** Object:  Table [dbo].[TranBlobConfig]    Script Date: 05/18/2015 17:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TranBlobConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TableName] [varchar](64) NOT NULL,
	[ColName] [varchar](64) NOT NULL,
	[Sort] [int] NOT NULL,
	[Direct] [tinyint] NOT NULL,
	[MaxCount] [int] NULL,
	[Cstamp] [bigint] NULL,
	[Sstamp] [bigint] NULL,
	[Timestamp] [timestamp] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedTime] [datetime] NULL,
 CONSTRAINT [PK_BlobTranConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MidTransfer]    Script Date: 05/18/2015 17:03:31 ******/
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
/****** Object:  Table [dbo].[Meta_KeyValue]    Script Date: 05/18/2015 17:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Meta_KeyValue](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](64) NULL,
	[ColName] [varchar](64) NULL,
	[Value] [nvarchar](256) NULL,
	[Text] [nvarchar](256) NULL,
 CONSTRAINT [PK_Meta_KeyValue] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Meta_KeyValue] ON
INSERT [dbo].[Meta_KeyValue] ([ID], [TableName], [ColName], [Value], [Text]) VALUES (1, N'Client', N'Status', N'0', N'正常')
INSERT [dbo].[Meta_KeyValue] ([ID], [TableName], [ColName], [Value], [Text]) VALUES (4, N'Client', N'Status', N'1', N'注销')
INSERT [dbo].[Meta_KeyValue] ([ID], [TableName], [ColName], [Value], [Text]) VALUES (5, N'Client', N'Status', N'255', N'删除')
INSERT [dbo].[Meta_KeyValue] ([ID], [TableName], [ColName], [Value], [Text]) VALUES (6, N'Client', N'Status', N'2', N'停用')
INSERT [dbo].[Meta_KeyValue] ([ID], [TableName], [ColName], [Value], [Text]) VALUES (7, N'Client', N'Type', N'0', N'服务中心')
INSERT [dbo].[Meta_KeyValue] ([ID], [TableName], [ColName], [Value], [Text]) VALUES (8, N'Client', N'Type', N'1', N'门店')
INSERT [dbo].[Meta_KeyValue] ([ID], [TableName], [ColName], [Value], [Text]) VALUES (9, N'TranConfig', N'Status', N'0', N'正常')
INSERT [dbo].[Meta_KeyValue] ([ID], [TableName], [ColName], [Value], [Text]) VALUES (10, N'TranConfig', N'Status', N'1', N'停用')
INSERT [dbo].[Meta_KeyValue] ([ID], [TableName], [ColName], [Value], [Text]) VALUES (11, N'TranConfig', N'Status', N'255', N'删除')
INSERT [dbo].[Meta_KeyValue] ([ID], [TableName], [ColName], [Value], [Text]) VALUES (12, N'TranConfig', N'Import', N'0', N'不重要')
INSERT [dbo].[Meta_KeyValue] ([ID], [TableName], [ColName], [Value], [Text]) VALUES (13, N'TranConfig', N'Import', N'1', N'一般')
INSERT [dbo].[Meta_KeyValue] ([ID], [TableName], [ColName], [Value], [Text]) VALUES (14, N'TranConfig', N'Import', N'2', N'重要')
INSERT [dbo].[Meta_KeyValue] ([ID], [TableName], [ColName], [Value], [Text]) VALUES (15, N'TranConfig', N'Direct', N'0', N'公司总部到门店')
INSERT [dbo].[Meta_KeyValue] ([ID], [TableName], [ColName], [Value], [Text]) VALUES (16, N'TranConfig', N'Direct', N'1', N'门店到公司总部')
INSERT [dbo].[Meta_KeyValue] ([ID], [TableName], [ColName], [Value], [Text]) VALUES (17, N'TranConfig', N'Direct', N'2', N'双向(先总部后门店)')
SET IDENTITY_INSERT [dbo].[Meta_KeyValue] OFF
/****** Object:  Table [dbo].[LoginUser]    Script Date: 05/18/2015 17:03:31 ******/
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
SET IDENTITY_INSERT [dbo].[LoginUser] ON
INSERT [dbo].[LoginUser] ([ID], [Name], [Pwd], [RName], [Role], [LastLogin], [CreateTime], [ModifiedTime]) VALUES (1, N'admin', N'admin', N'admin', N'admin', CAST(0x0000A475017A7375 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[LoginUser] OFF
/****** Object:  Table [dbo].[DataTest]    Script Date: 05/18/2015 17:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataTest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] ROWGUIDCOL  NULL,
	[Name] [nvarchar](50) NULL,
	[Data] [varbinary](max) NULL,
	[Timestamp] [timestamp] NULL,
 CONSTRAINT [PK_DataTest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DataTest] ON
INSERT [dbo].[DataTest] ([ID], [Guid], [Name], [Data]) VALUES (1, N'2432c313-d6dd-4cd8-b0e5-5b157437f314', N'Test1', 0xFF)
INSERT [dbo].[DataTest] ([ID], [Guid], [Name], [Data]) VALUES (2, N'5ce59fcc-9c5d-4273-9890-54c51746a06d', N'Test2', 0xFF)
INSERT [dbo].[DataTest] ([ID], [Guid], [Name], [Data]) VALUES (3, N'7b63c7ed-6140-4498-ae89-12ca3b42b638', N'Test2', 0xFF)
INSERT [dbo].[DataTest] ([ID], [Guid], [Name], [Data]) VALUES (4, N'ad98f58c-ae63-4f18-a292-bebd98001cde', N'Test2', 0xFF)
INSERT [dbo].[DataTest] ([ID], [Guid], [Name], [Data]) VALUES (5, N'61a5614a-8c8f-4071-9d6c-2123c3d20be2', N'Test3', 0xFF)
INSERT [dbo].[DataTest] ([ID], [Guid], [Name], [Data]) VALUES (6, N'33993102-5833-4e12-bb99-7919ef3ae934', N'Test1', 0xFFD8FFE000104A46494600010100000100010000FFDB00840009060714101014141014161414171514161414181614141517141415161615151515181C2820181A251D141722312125292B2E2E2E17203438332D37282D2E2B010A0A0A0E0D0E1810101B2F2520242C2C2C2C2C2C2C2C2C2C2C2C2C2D2B2C2C2E302C2F2C2C2C2C2D2C2C2C2C2C2C2C2C2C2C2E2C2C2C2C2C372C2C2C302C2C2FFFC0001108008B016B03012200021101031101FFC4001B00000105010100000000000000000000000200010405060307FFC4003E1000010400040306040405020505000000010002031104122131054151061322617191143281A142B1C1F0072352D1E162F115173343A272828392D2FFC400190100030101010000000000000000000000000102030405FFC4002A11000202020103030401050000000000000001021112210313314104225161A1B1F0910523326281FFDA000C03010002110311003F00F39441004417A567954184E108441325841134260882A2584E8EB985D3B8F342D692BB007CFF0021F7DD3241187F342C86D7605DC89D3A03A7A92998C24D00E249A006E494C9B390875DD0BE3AE7F9FF0065A5E1FD957BC174A7BA1B01A9738F217F28B2473BF254B8DC218A47C6F07335C5A75E9CF6E7BFD524D37486E2D2B670EEC345EF99A7AE86EBF45C5E09FDF45DC437B5F33B721B9D13180F4542B2316A12149EE88E5FBFD9404754A87670A4D4BB16202121D9CD244426A40C149152621003249248012492480124924801249248012492480124924801D384C9C200209D304E800822098221B200708A93046D29086A4A91077EA8B36DF4401CEBC92A3D174CFA2174B4802A4146D281A2D3ACACE868EE1CA46170EE76C0D288CDD5FE180DB90AAFEE86C58D95F20733470AD3F7BA3C060CCAE00579D9A15E6558E31A0C66F955795EFF00DFE8A060313DD481E7972EA0EE0AA4DB44B4932F387F67EDC43C9A1F281A5822C1B234F6E4ABB8B607B99728F10AB04D93E855A62F8CB68774E19B5E5A6524900DF31CBA6AA97152991E5CF759FB7A6C9C32EEC9E4C56916B82ECDCF2C6D7B5D135AE16333B29DF4FC2B962B07260A6617642E14F6D6AD22C8E80D6851F0FED0CF0B03237B69A0816C69201375A9F35C7178E9310F0E91C0D0A14D000164E82A86EA9295EFB11270AD5D9ACE09DA433CA5923431AE6784DEBDE3082DB24551AE7D15776BA16493E789E1C7280F2CBCA5CDD03879D69A13F28D545C040D14E7825B63364D5D96FC440E66AF41D365B8C3F05C3CEC6BE13719D039A4383AB9EFA107420D1B074593C612B358A972428F30761CDD55FD35FEEB949165344169F3B1FE56F38C767BBB7784DF369DBDCF25ACC341139A0466191A1AD6F76E7309240A2E1BE4F315AEF40EF72E649599C3D3B9369BA3C4A48EB7F7E4ADF85F66DF3B73511ED43A593A6DF9AD976CB84C5146D3DD46C7BA66372B18D6B4B4E676F56EBCB5CB5BD39ABEE1980688A36B756863083FD45C3317F99249294B9BDB68B8F07BB16CF2EC7F669D16A73575D3EC458FD553E270C0579DAF65E2580058F074191C4F965161DEA0AF2FE2500EF40AFC4E15FA6CAB8E79A2796183281F1D2E642BE384691CBEA971AE12C8DA0C66EC81BEF6371FBE6A9BA256D594002621769222D3A8AF6404200E4532270428189249240092492400924924009249240093A64E10024E124E801C27099A1100801C220980440200708804804402403008B2A7A46D280A39E54B2A3CA89AD246C80A2841440A84673E49C620F92E6C91D9832CA08CB8FEAA747892CA0E17D0DD68A9A0C696A3971A5C79279225C196F89C5178A0401D2FE9F55C19EA157B663E4BAF7AEF2D55A923394596110077FB23CB5B7F9501B33BCBF7F55D7BE70AD968A464E0C9CC775FDFD54C872B5E2B420D75BD689BF4552D9C9E97F6534619F745CCDEB7F2BE8B44ECC5C5A35D0E11F973C60E5DCE9A0F43CBD15970CC416B8BF0EE11CA7E763AFBA96B948DE4EFF5B7C43FD43451382F688FC288CB413948BF5DF4EBA940CD4DEC7911BFFB2E77BD33A97B77136D80C6C78BB61698E668B7C4EACC07F5B48D248CF270F43474555C5F8083763EB56156C3377AD6779608F1452B4E57B5DD58FF00C2EE441D0EC410B4BC3F8ABC1EE71C1BA8F06200CB1BDBA5095BFF006A4D771E13C88F9567B83D1B5479553EE610E15914ACEF83DD1B4925ADB07635975146EB6AD96A7817170C8256CE7BBEE1C00F137300E162368FC5AE8056975B36D42C77097BE4209F08750AD5C46A41683A1DBFC1513FE031CD2B23A95D2C86DF266CC1A5D64DD01674DF61BEBB1DE4E325B38F8D4E0F48EDC5BB4AE9EE1C2309738124936E2D6825D9CD06B5800B3577B69CF1B6F8F16D6CE5EC2C70CF9B2E76BB2F88F4DF507A52F6AC0766A1C2C2E640D6891F4D7BCF89CE6E6B7349DF2D58591FE2A470B800FC9F174DCA581DFF004F36A25E474BAE7BF2DF3E3E58E58C568DF97824A1949EFEC632663376B9A46621A33373572B683E6153E25B4E24102E883A1D056A3EA0FDD0E2A60006B5BE200677593AF90D80DB7E6B807FE269CB945BDC7913A5340D79D7F65D0E47328B13D9CF36A0F9DFADAE6E08E2C0CCF34D6D0DEDC328A22C1F6ADAF75DF13C3A56346CE3CC007F33BA8EA44D571C8AF78409A52F160B76F22A23B12EF2F64B3452E364B4942F8A77927F8A77925D441D364C4943F8977925F14EF24751074D931250FE29DE497C53BC93CD074D931250FE29DE497C53BC919A0E9B262750BE29DE497C53BC919A0E9B27270A0FC53BC93FC53BC919A0E9B278288155FF0014EF24FF0016EF246685D391621102AB462DDE48BE2DDE48CD074D9640A2B556318EF2F64431AEF2F64B341D3659828EFF0076AADB8B772AF645F14FF2F646683A722C6CF5FBA567F65577C53FC92F8A7F923341D3914A52098EE902B90EF3B319A5A41007A705344B4778F420AB2C6E31B235A003A73FD155B5C8DA55A33677695D5B5E7F9AE0D72ECD2B5463244A8612E1E116A4B306F3F84DFD175E12DF09F5577846662079D7A2D518483E03C3A431FCBCCD6A3AABBC270F98FE1BD6BE66F2FAAB5C170F1133C24DEBD2BDAB45221BE7A2C1F25BD1BE38A49A0BB3D856D4B0CAD0E2D76ADDE9AFF10160FAABBC2F06631C5D1E604823E73601DC0BDC2A1E184C78FF00F4C9106FFEE8F51FF8977B2DA43428FEF5584E4D48ECE38C6515A2AB19810C6BA57121A01CC181BE2074D456A753AF9AB333C4DC3B9E1AD73034F84006F28BCA40F4E6A4073BF080D17BBB53F468FEE8A0C1800806812490D01A2CEFA049B55B2545DE8CE71CED7B2380FC253A47565B14D8C651E270EA36CBD474DFCDB138696773A6CADA2E19F2991EEB25A1C7C4492756F3FC417AB633B2B091E12E6937B51167CA95645C00E14BE48E9EFA21AE3795A0D597460171ADFC26D7471CA115ECEE7372A9C9FF00716BEC52E0B0190BA38D85B1060B7386573E43798BADBE22006D5682CF40A2FF00C1E18FE58D99B7CD95B77D76D37E5415B62A7C4B9A418DE5B7A4F088DE0806FC21DA51AD49DAFAAB7C4E1E9DAD1F0EA285DDEF5EFECB2936BB9D104A4B461E6C3017543FC683EC15562A3A0B63C420B7500069FAACD716C398C13A134481B6C2D24CA68C87159033707E83F55478997CBFDBCD58F16C667E80694D1F724EDCBEEA9F2977CA34EBCBDD69546576715A5EC7F048B14D98C998B9A0358D1A0CD27CAE04B802E195DE126A967246D2D67F0FB88B2393BB7C8F697BEC3436331BA98ED5EF70B6FD08E4B4E2A735670FF517C91F4D3971F75BD7D3BFD8971F64F0F243086C8F0E790EEF3BB24B99293DD07373533407D956709ECFB5EDC5B882F0C90410B858B95D2860790390CCC246D44AB8C4E23085AEC3BA624E28897BDF0542E0D67721C580346AD2481557AEF6ABB8171674183C5B0963C43242E8F534F73A639C83A123C008F55B350BEDF3F83CC8727AA7C726A4EF28D5AAD392BA7AF3AAD6B7DA895C4BB2903207F773441CDC41677B24B5E10CF144ECA328903AF4AD943E09D998E5C3C3349DFBB397173238F30CAC908A2ED08CC0723CCA96FE38C3C3FBC761F0E49C51B88825A49659908BBCDCAD72E0C22184634E2638E692512B6DC406471BC03166FC19A89AE7E7BA2A0DE97805C9EA63C2D4A4EF3ABABF0EFB5D2F3FF341714ECB44239E58C62220C639ED63E3A67845E5CE493CB9AADE17C360EE62C4CB99F1899D1E29BA8EEC11FCB78CBE2AD5B7BDDD2BCED5C8D944E633862D22FBC18B7190800120422C12688AE76A1767DD0E0A17498999923268EBE1583BC2E17A17835948D46B4353AA1C6390F8B9B99FA6B726E4DAA5E6AB6AD5EFCA6EA9AD953C6784B30F042F0E7BA494C8E683407700911BCB6AC39C0B4FD4E8AE781766207B8F79248FFE538E4761B11165750D739A0E235F0F3513B58C64EE38B8B131BDA7234446D92C63935ACE606A7973DD5FF04E3CC8DEE88621D897774F91F348E2230E6819638DAE3E66CEFA7D0118C73DF6FDFA8F9F9BD43F4C9C1BCB77AAAF35B8EAAEBC37E2CC7F14E151C190B6591ED2EA79761A58328D36EF3471ABD0745A4C3F663082391C6491FF00C9648D7D0F0B5E480E66534E3A551E8ABB8AF166CCE8658B15236E56B8C32E69040F1FF7013A3982F41AEE7D069305DA963639807F7E61607191C19177AE2E399B1B001A0034DF7E7B920A16EFF7EE4FAAE5F57D286395F9F0FBAFF54BE9AEFF00556CC4768B8747869BBA8DEE790067CC1A0B5C750DF093C8AAC57DDABE222731964E666788B58E8DAC7C5740B5E5A0076DBF97D4D0AC27593A3D7F48E6F862F93FCBCFEB4BF1FCF71C27098270A4E80804F48414680100914C4A76A005953E54E9D202AC82951E8A524B2A37B2301E4BA35A576051829A426C584C3E63ADA524795C46FF00446D72918788BB656910D919A3D7D976637D7D975CB468E8575615A23164DE120807D55D42C27C8F2D3D956F0C3A1FA7556D1BF4FD95AA336AD97583C6CA4004D8157A51FF002B410BE8EA0D72D165F87C2E90D337F5207AAD3E0C3C1A711E9FE565C891AC62FC9D4383A66168712C7076C7E5A2D77D895AC8885498568B3E62AFCA95870D92E36DEE051F51A1FB85CDC9B3B38BB170D3748A49FA28D1C9D391F5F3FD5741A9D47D694A41293EC84E7F5D4FAA0CDB7E88F28DDC0EFB6A99CDCC0160E7E7B5EF65568C5DB2062706612648F56B85CB09F95C39B9BD1DF62B19DBFE2B2401B1C2F6934497650E91AD345A0E94D35A7326AF4B5E8730769B799E7F92C876E306C31E7C80BBE526B5D8D7FBFA2D22F26B23371C2D474BF7F279FE0FB58E11E59DCECE2C67CB64B6C16FCA3D41F41E6A271EED009BBBEE9CE00071906C083400D75BBBD3D3925C4A48C34D305D55E5E75D52E0FC329BDE4CD194D1630D9BA361E6F6F2EA0F4DF5705DC95CB2EC541C0190F7B392EBF94104661C9C4721D07ECD771196B403E95B2D3F12989B0D16EABFA753E6792CCE3053CD8AF537F74B10C99525A7A14390F4FB2B12AD381C1842D91F8D965197288E181AD32C85C7521CF19001D3737EE38D14A5666F29E87D92C87A7D97A2633B1F0E164C63B132CA70F87EE001188C4EF7E200731843FC2D2D07C57F4E89B0FD8863B883603896B70EE1048C91C4365923C40263646CD7349A11D0566F253EDF92AA5F079E643D3EC9643D0FB2D8F0AE138774D8964EEC43BBA7B9B141878C49889A9EE692096E501A0027ADE9B29F8AEC535B88C63062991C58510B9D2CA0E8271E16B832E9C0F84A7A17B9F83CFF0021E87D93E43D0FB2F4DED3F61228BBE761B12C3DCE19B3BE17677485B96CB81A0289D95BE0BF86D847C6D7779892EEEA37BE9F08033B18F343BA3A78C73B4B28D5D9584EEA8F1BC87A1F64B21E87D97AB47D83C31E20D80493774709F10736473DCF74AF85AC0F686868CC18458D751A5E8EFF00E1D4261872E2CB5E448E7BDD0B8B1C29EF60A0EA888644F26DC6F4DB4B328FC8B19FC1E5394F43EC9F21E87D97A3F07EC3B66C1453CD2181D247889B3BCB5B0B638CC6C883C9160B9D2037FD37A28FDA7ECDC183C7F759DD24166E381CD9B17186C6D77F3184002DCEB1FE9B54B16EAC96A495D181CA7A1F644187A1F65EAF88EC460A397131976389C3C62473847096BC16B5D9623F89DE31A69B150BB23D90C363181C6670730CEE9E1BCB23636DB61D030D38BA89D76D004AE3563C6775479B061E87D93E43D0FB2F42E2DD8E64030A04ED3248432661B6F8AEDCF84CAC602D0DE4E228D6A6D5FF00FCB9C39862709DF1D97892579C318F43E0072CA40357594BAF9D22E2BC89466FC1E3D90F43EC8834F43ECB7782EC73E5C439AC7C7DD367119CD344D90B0969B00388712D78DAC5D8E48BB4FD8E930D2CA6331989B206B1A668CCC43DCD636DBA1BB70BE83D157B6EAC9F7D5D183311E87D920D3D0FB2F5BC17F0E1DDCE598BBE2240E2C7B29D8784B7664CE06C971B16DB0DAF7C1714E1D261A5745300D7B6AC021C288B69041D8820FD5115196930939455B452643D0FB2E6587A1F65719F440ABA64754A249249729D83A205027B4C5474054DC1E2B20A2A0028C1544B44B965CCEBFDE88D8545695DD855A64344E814D8982F555F0BE94C8A4569828973C3712E85D99957B7910AFB058C2F25CF3A9E83A741E94B211CA49D169B8039CE76579D00B03CC69AA527E4DB8F8E8D4F0BC6667002CEF7ECAF30669CE6F9870F470FFF0041CA9F0828F43E5F75267739B24643880E0E69F503337EC1EB9F919B421EE347867EB5E5F97FB8531A551E06421EDCC49B06B5D3A52B60F59A1CE341F3D5067CADF034BBCB5D3DD746EBB7BAE6CF0B753D7F34ECC9C48A716EBF136851D76AAB37E62BEE3CD5071EC4992296DB4DAB63B4362F7DFD3EEAF38834398EDC785D7F50B3D244044E699465C849739B4D63469557A91D02E8838D59C7C909DA57F83CD84D1B24265A2D0090D23C25D62B3000923C970C7F68CBAF2DFD0068F7367F25278D40F32B9B0BFBC0068EF0C7980E6D05D6EF5DD66310D3A926CF3EA3D5696989C6896789BA86568EAEB24971E66D41C7E233B850E5F5D5031DA207A06AC072D3762F8AE130824926323713A0C3C8D89933611F8A40C7BC0326E013755E6565C9527091C6592979A706DB2C8009CAF25B5776486D1008BD0D66B12F68A8E9E8D261F8C619CCC5E1A79B10E8B10E8A56E29D1B5D289A336E32479FC40D91A3B90FA34FDA589FC570D880D7B70F87F87630100C9DD4000B201ACC75357CD544582803CB5F2870FE58CC1C0019A52C73B7D69803C74CC2C685708F0719630F7AD0E739AD734E5F0DBCB4B89BA2D005DEDE21E695229B916DC2F8861BBEC43E493118791F239F06261CD998D73DC5CC7C6D7B490E046A0AB1C7F6ECB711887E123696CD1C11B9D3B1AE7BCC17FCD7B01CB99C4EB77B0D8ACEFF00C3E2CC477EDD0CBA8C945AC2DCA412E02DC0920122F2900DA0E190C4E638CA434E602F353837BB9492D6FE221CD8C556B75A5D8297715CBB2365DAFF00E20194CB1E1844F866C332273CC45920716F8E9DA1A07606C2D0603B75808723C4B2F79DC431BE99892CB6323BF0778D666B60F165BAD2C85E57361636835282444D78ACA439C7F00A71362C68403A3B4D05F67E0A204B7BD69F1329F6DA20B652EAA71144B63D4D65CF4692C235452E49DD9BC9FB7185671486788C8E87E1E285EE0648721F889247E66538C8D0D703941D7AAE3C6FB55C3F10C9202D97BB9EF1124F4E7491E2DAC63630C6BCDB981B1E53AFE3D286D8C3C2E3A69EF8539EF0D272B416B33EA0976965AD1674F1EFA28BDC461F10321CAE3FCC750B637BD732E813AE56E6AFF50DD350889F24BC9A93DB57B303838D8639248C4D1CAD9616C81B10743DC35B9856D1F2FE916A6F19ED63311C533327EE30C1E08C4C3096CE59DDB43DAE200790482DD6EB43469639D8661EF2DCC61683403C481E6A470A75EBF2B1BA73783556A40C1421C5A256BADCC6B5C4801A1D248C73C80750031AFF0047EAAB18939CFF007E86BFFE613E497883CCD2C6D92170C1C76E391E0B4308CB618E20124ED64EA97643B5F87C2C2EEF4CA2573DEFC510C0F93165FDE06B44A5C3BA6B438389D0971B1CEF1D1E0A226BBEAFFA9BF7774CAA179F2971B246B472E875090C247941EF45E4CC5BE00736588E516ED7FEA3875FE53B9E88C23542EA4EECD3F6ABB4D14FF0D2E16495AF83C2CC3CAC120669E290CAF73BBD24868F1593E5CF687F88583EFC1133FBBCCDFF00B589AA005E9DE57FE1F45E4CDC346268DAE92D8434B9E08005DE9609A1B5DD1166C69A93608CC6F25CD63DA594D0F0E0EE4EAD7CEF4BD927C716921AE59A6D973C178861609A6C5481F2CED95EEC2C392A3B24B99348FDFC24FCB40D81BF26E39C560C5C6CC43839B8F6E46C83207433E5D3BD3FD06800456BA0AAD456330511701DF345B9C09B6801B7300412EE91B4FF00F2B7EB1E1636A5CD4728F09CED69BBD0B5A4F8C69AD5E9EA15D2BB32B7547A3C1DA8E1E0439C30D34F7E070F8EDEF70FC2ED981A4F20EBADCAC071C98498995CCCAE697535CC8BB9696B406B488C0F09200BF3B438A8A3064C8EBA65B3C57E2EFC3401D6E3F111C893B552E38D0D0FA61D32B2E8E601D946717641F15EC4FE888452768739B92A673CA7A1F64394F4FB26051B98473FBAD0C8CFA4924B84F44490492400E118281384C448848BD765630E2983F0B7D82A90BA353045F0313C7F49EA3FB294DE1248B63C3BCAB2FEAB3F13E95C70BC651D5D5EF48B68D145325451961A228F42AFF82369ED24F97BE89063656D1ABE474B0A460F0B95D41C09DEB635E89A9DA2A3DCD6E100E4A563DBFCA2EE6C21FEDF37FE25CAB3874CAE5803810762083E845158CCD13C64995B0E38B9B9CFCACF0B07F53C9A07DEBEFD11C2F34D04926F7EB9773EE42E63834B1C2C6C6E133DAE27C6E31B4583B656389DEB5EA54B9709905D0B1405BB955BAFC075BF71ECB2499DCF938FC0CDC468DF37B8FD29F5FA2E266072DDE8F70E7CC9CBB79E55C9B8F8E3A12022B4686F8AEC16EB980BDD41C5F68B0ADB05B38B37F2C63515A8D74D82B516613689D24A5AE701A8F987A1DC7BFE6B8BE777450A5E3901C8E225F13B29BC83BBCCE0017F2A3BE97B2A9E23DA986371018F7804B7335ECA2455D6874D7EB49A8B309491698BF16A5AD3A7300FE7EAB3D8C85C2FE4FF00EA47EAA2E27B6ADB39603D0132EE36BAEED5562BB54E76D1347A92EFD07E4B58C648E69CA2CAEE200F794E63584F304E53E6A0BCA9B89E2A5FA16B48E4751F51CC282F916B662D1C932569916143DA7B436922C5415A743692762A0AD3DA1B493B150569C204E13B1506110401104EC541844100440A2C5418441005D18CB4EC54384E84B6910F54EC9A1C04E9BEA89BEA80A1C0D3CD0A5AF54F67AA6228924925C47A02492490024E132740040AE8D2B905D623AA62264A1A1A3FABF7769406C8175AEEA3C8764EC7265C4DCF0A786814E2EF53FA2B96B1AFAB1E87623D0AF3DC0634B1C3A2D970EC6870042CDE8B7F269A13A0235207BD7EAAC707C402A083155568F10C20668B5EADFD5BFD917F25C69E99AC18F14A063B1672E6D2BCC803EBAACB378B1DB9ED5E696378A3E806348D28DBB426B53408A4FB1AA82445E27C4BC609D68835C8E53B7A68B3F8EC5677B9DB59243790B3B04A690BDD4059BA006BAF4564EC0F750B5CF6778E04E97E11B9DBF114EE86D5950F7B8C0E22EB300F37A11F86FEA55731F9ADBD751FFA86DE97B2978FC7E84474C0FF009DA1A28D6A2AC69F4A55F4DCB7643BA51DF96A152672CD6C8CF7217B0D5D6886592C92773AA0CE76B3EEAACC1A1028DCD34B8DA30F458A862853BCA1B4AC2874F68524EC282493249D8A82B490A74EC5415A70505A7458A8308814011029D8A8305102802209D934182BA35E573088009D8A8E85D69C14000441A13B15077FBB4E3E9EE3FBA10D1D51060EA9D8A87F6F71FDD3FB7B8FEE8728EA9651D5162A28D24925C87709249240092492400E89A50270803B3DE935CB9B5384C6892D72B4E19C472687654CD5D58527B348B37785E28D70AB5650F1103F12F38638A90D99DD4A9A34514CF4493151C9F3806B9F31F5DD4096368D4C9A7A6BF9AC7C133AF729E69DC7424A5B345148B49789362044235E6F3A93F555F2712765AB377777F6AAFD541715C5C55244CA6FC0F24966D333145A0815AF55C9C57372A39E4348FB24F541698A49998AD3DA1490143A64932002B49324810E9D32498874F68524082B4E85384C28205104088264861102802309882088210882764841384C1104EC543A49D3A621AD3E64E92623FFD9)
SET IDENTITY_INSERT [dbo].[DataTest] OFF
/****** Object:  Table [dbo].[Client]    Script Date: 05/18/2015 17:03:31 ******/
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
SET IDENTITY_INSERT [dbo].[Client] ON
INSERT [dbo].[Client] ([ID], [GUID], [Code], [Name], [IsCurrent], [Type], [Address], [Status], [CreatedBy], [CreatedTime], [ModifiedBy], [ModifiedTime]) VALUES (1, N'4b5d693c-5a5b-4953-925d-87df2b5ac3b2', N'S1', N'服务器1', 0, 0, N'', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [GUID], [Code], [Name], [IsCurrent], [Type], [Address], [Status], [CreatedBy], [CreatedTime], [ModifiedBy], [ModifiedTime]) VALUES (2, N'35c246cd-503e-41ce-aefb-99c0c1deaf4c', N'C1', N'客户端1', 1, 1, N'上海市南京路', 0, NULL, NULL, N'abc@live.cn', CAST(0x0000A477017DB1FE AS DateTime))
INSERT [dbo].[Client] ([ID], [GUID], [Code], [Name], [IsCurrent], [Type], [Address], [Status], [CreatedBy], [CreatedTime], [ModifiedBy], [ModifiedTime]) VALUES (7, N'6a503325-a822-4749-8100-0979612daad0', N'C2', N'浦东2店', NULL, 1, N'上海浦东', 0, NULL, NULL, N'abc@live.cn', CAST(0x0000A477017DBE43 AS DateTime))
INSERT [dbo].[Client] ([ID], [GUID], [Code], [Name], [IsCurrent], [Type], [Address], [Status], [CreatedBy], [CreatedTime], [ModifiedBy], [ModifiedTime]) VALUES (8, N'd279b4f3-f686-4f74-a556-07c514d838ef', N'C3', N'浦东3店', NULL, 0, N'上海普通新区', 1, N'abc@live.cn', CAST(0x0000A47700A3AF73 AS DateTime), N'abc@live.cn', CAST(0x0000A477017DB83C AS DateTime))
INSERT [dbo].[Client] ([ID], [GUID], [Code], [Name], [IsCurrent], [Type], [Address], [Status], [CreatedBy], [CreatedTime], [ModifiedBy], [ModifiedTime]) VALUES (9, N'aa29cecf-7533-469e-88d4-71219c5221c3', N'C4', N'北京店', NULL, 0, N'北京市', 0, NULL, NULL, N'abc@live.cn', CAST(0x0000A47700B043E7 AS DateTime))
INSERT [dbo].[Client] ([ID], [GUID], [Code], [Name], [IsCurrent], [Type], [Address], [Status], [CreatedBy], [CreatedTime], [ModifiedBy], [ModifiedTime]) VALUES (10, N'caea4ffd-04b1-4df4-86af-9e9464770a55', N'CNew', N'上海新店', 0, 1, N'上海浦东区', 0, N'abc@live.cn', CAST(0x0000A49C00F3F522 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
/****** Object:  UserDefinedFunction [dbo].[bims_f_var_to_string]    Script Date: 05/18/2015 17:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- Batch submitted through debugger: SQLQuery20.sql|7|0|C:\Users\Administrator\AppData\Local\Temp\~vs53.sql
--将变量转换成带边界的字符串，如果是空值，则返回字符串'NULL'    
CREATE function [dbo].[bims_f_var_to_string] (    
        @ssvar sql_variant    
)    
returns nvarchar(max)    
as    
begin    
        declare @pstrout varchar(max)    
    
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
                        select @pstrout = Upper(sys.fn_varbintohexstr(CAST(@ssvar as varbinary)))    
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 05/18/2015 17:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers] 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'12481168-44f9-4f2a-b2f9-2710eede6eca', N'abc@live.cn', 0, N'ABV+B1OXl+1tzXtXu5YNGpSIo2I2BhoigZgVd+t6YUPL7/QIUU/xi6koNcGEQ6pn1A==', N'e9064d90-24eb-4108-a3f5-6272e892d278', NULL, 0, 0, NULL, 1, 0, N'abc@live.cn')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'faab3919-eb0e-4e3f-9a9e-7417e2af5e2a', N'abc@qq.com', 0, N'AKzXWWcIl3DNlnF6qBd9ktjYTm8dXH8ilnXHECbwYP5zPZqB8HHiKOn01xdaJ0hiLQ==', N'a0b2a27c-5d3d-4be2-bdb0-edd9db149135', NULL, 0, 0, NULL, 1, 0, N'abc@qq.com')
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 05/18/2015 17:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 05/18/2015 17:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 05/18/2015 17:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Default [DF_User_Guid]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Guid]  DEFAULT (newid()) FOR [Guid]
GO
/****** Object:  Default [DF_User_CreatedTime]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
/****** Object:  Default [DF_TranLog_IsSuccess]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[TranLog] ADD  CONSTRAINT [DF_TranLog_IsSuccess]  DEFAULT ((0)) FOR [IsSuccess]
GO
/****** Object:  Default [DF_TranLog_TranTime]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[TranLog] ADD  CONSTRAINT [DF_TranLog_TranTime]  DEFAULT (getdate()) FOR [TranTime]
GO
/****** Object:  Default [DF_Table_1_GUID]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_Table_1_GUID]  DEFAULT (newid()) FOR [Guid]
GO
/****** Object:  Default [DF_TranConfig_Sort]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Sort]  DEFAULT ((0)) FOR [Sort]
GO
/****** Object:  Default [DF_TranConfig_MaxCount]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_MaxCount]  DEFAULT ((20)) FOR [MaxCount]
GO
/****** Object:  Default [DF_TranConfig_Direct]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Direct]  DEFAULT ((0)) FOR [Direct]
GO
/****** Object:  Default [DF_TranConfig_Import]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Import]  DEFAULT ((1)) FOR [Import]
GO
/****** Object:  Default [DF_TranConfig_Status]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_TranConfig_CreatedTime]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
/****** Object:  Default [DF_BlobTranConfig_Guid]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[TranBlobConfig] ADD  CONSTRAINT [DF_BlobTranConfig_Guid]  DEFAULT (newid()) FOR [Guid]
GO
/****** Object:  Default [DF_BlobTranConfig_MaxCount]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[TranBlobConfig] ADD  CONSTRAINT [DF_BlobTranConfig_MaxCount]  DEFAULT ((5)) FOR [MaxCount]
GO
/****** Object:  Default [DF_BlobTranConfig_Cstamp]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[TranBlobConfig] ADD  CONSTRAINT [DF_BlobTranConfig_Cstamp]  DEFAULT ((0)) FOR [Cstamp]
GO
/****** Object:  Default [DF_BlobTranConfig_Sstamp]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[TranBlobConfig] ADD  CONSTRAINT [DF_BlobTranConfig_Sstamp]  DEFAULT ((0)) FOR [Sstamp]
GO
/****** Object:  Default [DF_MidTransfer_Guid]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[MidTransfer] ADD  CONSTRAINT [DF_MidTransfer_Guid]  DEFAULT (newid()) FOR [Guid]
GO
/****** Object:  Default [DF_DataTest_Guid]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[DataTest] ADD  CONSTRAINT [DF_DataTest_Guid]  DEFAULT (newid()) FOR [Guid]
GO
/****** Object:  Default [DF_Client_GUID]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_GUID]  DEFAULT (newid()) FOR [GUID]
GO
/****** Object:  Default [DF_Client_IsCurrent]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_IsCurrent]  DEFAULT ((0)) FOR [IsCurrent]
GO
/****** Object:  Default [DF_Client_Type]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_Type]  DEFAULT ((1)) FOR [Type]
GO
/****** Object:  Default [DF_Client_Status]    Script Date: 05/18/2015 17:03:31 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 05/18/2015 17:03:32 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 05/18/2015 17:03:32 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 05/18/2015 17:03:32 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]    Script Date: 05/18/2015 17:03:32 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
