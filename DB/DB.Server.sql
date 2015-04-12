USE [ES.Server]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 04/12/2015 21:53:42 ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 04/12/2015 21:53:42 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 04/12/2015 21:53:42 ******/
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
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (1, N'3f4713c1-0cbd-431d-8c8e-133127e3d699', N'Jimmy_0_9', N'江西省广昌县塘方向天要存_9', N'小地方_9', 0, CAST(0x0000A3C100E75D84 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (2, N'e0f4236e-54e7-432c-b87d-56c4269c6d77', N'Tom_10', N'USA_10', N'USA_10', 0, CAST(0x0000A3C100E75D84 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (3, N'1b45a01a-a92e-4063-bd1a-6679ab270ee4', N'Peter_11', N'湖南省_11', N'湖南达到_11', 0, CAST(0x0000A3C100E75D84 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (4, N'76605f6a-9c58-4a86-adb1-7dba9f85b38d', N'Jimmy_12', N'江西省广昌县塘方向天要存_12', N'小地方_12', 0, CAST(0x0000A3C100E75D84 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (5, N'68ab04cd-f221-4fd9-b15b-e652d240dbc9', N'Jimmy_12_1', N'江西省广昌县塘方向天要存_12_1', N'小地方_12_1', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (6, N'929730b4-8f81-4901-a373-d9b0e471d9b1', N'Peter_11_2', N'湖南省_11_2', N'湖南达到_11_2', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (7, N'e7ecb67e-03b0-45b5-a954-d438f410f6ae', N'Tom_10_3', N'USA_10_3', N'USA_10_3', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (8, N'6d72cd61-121e-452f-a312-d5bec22ed9fb', N'Jimmy_0_9_4', N'江西省广昌县塘方向天要存_9_4', N'小地方_9_4', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (9, N'2dba99a9-f9b0-4aed-b614-094f97e90c69', N'Peter_0_8_5', N'湖南省_8_5', N'湖南达到_8_5', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (10, N'baf963e1-738b-451d-831c-3e8f77aeee73', N'Tom_0_7_6', N'USA_7_6', N'USA_7_6', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (11, N'cc5fb72f-3657-47a3-93cc-79567849c4af', N'Tom_0_1_6_7', N'USA_1_6_7', N'USA_1_6_7', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (12, N'd76eeb47-64cd-4530-ba68-fc17781309e6', N'Peter_0_2_5_8', N'湖南省_2_5_8', N'湖南达到_2_5_8', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (13, N'd3ca6d7e-dc5b-4c5e-997d-aee5d9173d9f', N'Jimmy_0_3_4_9', N'江西省广昌县塘方向天要存_3_4_9', N'小地方_3_4_9', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (14, N'18abffb0-45e1-4fef-be0c-a6797b07c725', N'Tom_4_3_10', N'USA_4_3_10', N'USA_4_3_10', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (15, N'faa4cada-1742-4d19-beb7-38290d48dee8', N'Peter_5_2_11', N'湖南省_5_2_11', N'湖南达到_5_2_11', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (16, N'9e129356-d32b-46e0-9236-478071a5eeb6', N'Jimmy_6_1_12', N'江西省广昌县塘方向天要存_6_1_12', N'小地方_6_1_12', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (17, N'f307a76d-b464-4ede-a7a5-4a460b82c9f6', N'Jimmy_6_13', N'江西省广昌县塘方向天要存_6_13', N'小地方_6_13', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (18, N'46e9093c-a8ff-4f34-bc1d-04049580513d', N'Peter_5_14', N'湖南省_5_14', N'湖南达到_5_14', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (19, N'd9063d5d-be9d-4143-9d5b-7125cfcccf20', N'Tom_4_15', N'USA_4_15', N'USA_4_15', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (20, N'54cea53f-fc9c-4718-b7ab-ed32ea5b6160', N'Jimmy_0_3_16', N'江西省广昌县塘方向天要存_3_16', N'小地方_3_16', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (21, N'ad5422e7-9158-49ad-accc-0ba4204bbea1', N'Peter_0_2_17', N'湖南省_2_17', N'湖南达到_2_17', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (22, N'f425898a-5f64-4dbe-8574-9716fe0fed78', N'Tom_0_1_18', N'USA_1_18', N'USA_1_18', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (23, N'94814c52-0066-4a19-b686-4503589b92f8', N'Tom_0_19', N'USA_19', N'USA_19', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (24, N'c82922ab-12c5-4333-b457-5237d4c7a3ff', N'Peter_0_20', N'湖南省_20', N'湖南达到_20', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (25, N'4ae64159-5647-43d4-b9ae-803fcdd46c79', N'Jimmy_0_21', N'江西省广昌县塘方向天要存_21', N'小地方_21', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (26, N'51967441-cab1-4b8a-a617-750768ad5d37', N'Tom_22', N'USA_22', N'USA_22', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (27, N'0855ddcc-b768-4068-98c4-e46363f3f1f4', N'Peter_23', N'湖南省_23', N'湖南达到_23', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (28, N'30187917-6f5a-497d-84ad-dd75401d0c9c', N'Jimmy_24', N'江西省广昌县塘方向天要存_24', N'小地方_24', 0, CAST(0x0000A3C100E75E21 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (29, N'3757a349-ab0a-44d7-840d-d15a8495d53d', N'Jimmy_24_1', N'江西省广昌县塘方向天要存_24_1', N'小地方_24_1', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (30, N'1b7c2d05-1eb9-4816-ac7c-de606113cdfe', N'Peter_23_2', N'湖南省_23_2', N'湖南达到_23_2', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (31, N'b63804c7-d7ee-4437-90ab-a020ff5ba5be', N'Tom_22_3', N'USA_22_3', N'USA_22_3', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (32, N'1abfb205-dcd8-431a-9d1b-56edbab655c8', N'Jimmy_0_21_4', N'江西省广昌县塘方向天要存_21_4', N'小地方_21_4', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (33, N'94fa6613-686b-4255-9047-ec22e3dfaa70', N'Peter_0_20_5', N'湖南省_20_5', N'湖南达到_20_5', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (34, N'bd891f19-9067-4c7e-8c43-6aa037b3d3b7', N'Tom_0_19_6', N'USA_19_6', N'USA_19_6', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (35, N'cb3959db-565e-4c3a-8ef5-0154788fc890', N'Tom_0_1_18_7', N'USA_1_18_7', N'USA_1_18_7', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (36, N'7d93ce40-925c-46d0-8ebe-f0def20acef5', N'Peter_0_2_17_8', N'湖南省_2_17_8', N'湖南达到_2_17_8', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (37, N'331b0fb0-73ff-45bf-a666-1f83fc940c8e', N'Jimmy_0_3_16_9', N'江西省广昌县塘方向天要存_3_16_9', N'小地方_3_16_9', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (38, N'dc357e26-d5e5-41f7-9e2c-3af7747a3e10', N'Tom_4_15_10', N'USA_4_15_10', N'USA_4_15_10', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (39, N'1425491c-1261-4639-871c-8e8c784c284b', N'Peter_5_14_11', N'湖南省_5_14_11', N'湖南达到_5_14_11', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (40, N'840a1abf-cf09-4153-848c-727b4891097b', N'Jimmy_6_13_12', N'江西省广昌县塘方向天要存_6_13_12', N'小地方_6_13_12', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (41, N'8c60b4fe-3dd3-4ec1-83f5-5464de5eb6a5', N'Jimmy_6_1_12_13', N'江西省广昌县塘方向天要存_6_1_12_13', N'小地方_6_1_12_13', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (42, N'9dfcba0b-5528-48f9-af8c-03e7b08f5c71', N'Peter_5_2_11_14', N'湖南省_5_2_11_14', N'湖南达到_5_2_11_14', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (43, N'05206c58-5161-4ccc-bbbe-8f1e3a055dfb', N'Tom_4_3_10_15', N'USA_4_3_10_15', N'USA_4_3_10_15', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (44, N'5019a10f-82a7-4e56-bab6-364b5bac8f56', N'Jimmy_0_3_4_9_16', N'江西省广昌县塘方向天要存_3_4_9_16', N'小地方_3_4_9_16', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (45, N'529492ac-d161-4137-a64b-ada95e54575c', N'Peter_0_2_5_8_17', N'湖南省_2_5_8_17', N'湖南达到_2_5_8_17', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (46, N'6abd0356-4c74-4c39-bfdc-20cf649439ac', N'Tom_0_1_6_7_18', N'USA_1_6_7_18', N'USA_1_6_7_18', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (47, N'c8259da4-d605-49d1-819a-6230ee23e0e4', N'Tom_0_7_6_19', N'USA_7_6_19', N'USA_7_6_19', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (48, N'b310b77e-d118-46da-b9fb-035dadc811b2', N'Peter_0_8_5_20', N'湖南省_8_5_20', N'湖南达到_8_5_20', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (49, N'c2023068-fe0f-489a-b343-1e527b920113', N'Jimmy_0_9_4_21', N'江西省广昌县塘方向天要存_9_4_21', N'小地方_9_4_21', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (50, N'd57ac16d-18b5-4633-975d-08401c0ff7c4', N'Tom_10_3_22', N'USA_10_3_22', N'USA_10_3_22', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (51, N'8e6fec26-3fc7-44f2-858f-e79236164f71', N'Peter_11_2_23', N'湖南省_11_2_23', N'湖南达到_11_2_23', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (52, N'c1375a5a-8b14-42b3-adf7-9b5f825734cf', N'Jimmy_12_1_24', N'江西省广昌县塘方向天要存_12_1_24', N'小地方_12_1_24', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (53, N'6a3b96bf-16de-4448-9706-b0a29122422b', N'Jimmy_12_25', N'江西省广昌县塘方向天要存_12_25', N'小地方_12_25', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (54, N'bdfe8aed-ebe4-4842-97d2-89e287ea37eb', N'Peter_11_26', N'湖南省_11_26', N'湖南达到_11_26', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (55, N'ee0be58e-479d-4b5a-8760-4ee00a282f03', N'Tom_10_27', N'USA_10_27', N'USA_10_27', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (56, N'a40e6ca2-4dd1-44fc-991b-f775c3ac3aab', N'Jimmy_0_9_28', N'江西省广昌县塘方向天要存_9_28', N'小地方_9_28', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (57, N'9c0a8003-7100-48f7-9dff-75c2b0c6f7b7', N'Peter_0_8_29', N'湖南省_8_29', N'湖南达到_8_29', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (58, N'13448bbb-4c38-4031-8976-ac7e1dbb7b2a', N'Tom_0_7_30', N'USA_7_30', N'USA_7_30', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (59, N'50bf22d1-6a92-4d0c-8050-b1d2e7fb0e4c', N'Tom_0_1_6_31', N'USA_1_6_31', N'USA_1_6_31', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (60, N'6349141b-7def-4518-b608-269da4ac2511', N'Peter_0_2_5_32', N'湖南省_2_5_32', N'湖南达到_2_5_32', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (61, N'622d1044-0e85-4d2a-b967-f17294f940f3', N'Jimmy_0_3_4_33', N'江西省广昌县塘方向天要存_3_4_33', N'小地方_3_4_33', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (62, N'0b2c29a4-fcec-4c98-b7c7-9bcbf5c37632', N'Tom_4_3_34', N'USA_4_3_34', N'USA_4_3_34', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (63, N'5009856a-b9a9-42bb-8b9b-6b891ec7b28c', N'Peter_5_2_35', N'湖南省_5_2_35', N'湖南达到_5_2_35', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (64, N'0affae94-9003-4115-8df4-5ade31a9a862', N'Jimmy_6_1_36', N'江西省广昌县塘方向天要存_6_1_36', N'小地方_6_1_36', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (65, N'dde779c4-588f-4fcd-a6d0-0e171952400f', N'Jimmy_6_37', N'江西省广昌县塘方向天要存_6_37', N'小地方_6_37', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (66, N'467abbdf-5159-4a3c-9d39-d41c6f3f33ac', N'Peter_5_38', N'湖南省_5_38', N'湖南达到_5_38', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (67, N'1d8edb68-48af-48fc-8cec-ee01a9228608', N'Tom_4_39', N'USA_4_39', N'USA_4_39', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (68, N'07ed7fe7-2cfd-42ed-a57d-0787681c1155', N'Jimmy_0_3_40', N'江西省广昌县塘方向天要存_3_40', N'小地方_3_40', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (69, N'119253d8-a319-4d00-94d1-508219074bbd', N'Peter_0_2_41', N'湖南省_2_41', N'湖南达到_2_41', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (70, N'8307fb38-dd6f-49cc-906b-d984a8e0e61b', N'Tom_0_1_42', N'USA_1_42', N'USA_1_42', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (71, N'3fb16ec0-3507-4fff-95b5-55593897b13f', N'Tom_0_43', N'USA_43', N'USA_43', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (72, N'8c3136c6-313c-40cc-9b27-88ac8082b486', N'Peter_0_44', N'湖南省_44', N'湖南达到_44', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (73, N'5bee0ed3-6f21-4d47-8d5e-0e447e520f32', N'Jimmy_0_45', N'江西省广昌县塘方向天要存_45', N'小地方_45', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (74, N'391ef8b2-5845-4b6e-bd7b-980daacf2fef', N'Tom_46', N'USA_46', N'USA_46', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (75, N'7cf04d3b-1e31-44af-af7d-4bcdad595ed1', N'Peter_47', N'湖南省_47', N'湖南达到_47', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (76, N'a2dd0db1-c684-4534-9712-778b08719036', N'Jimmy_48', N'江西省广昌县塘方向天要存_48', N'小地方_48', 0, CAST(0x0000A3C100E75E60 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (77, N'0c42bca8-14fb-45a2-a0d1-08df59c37a0c', N'Jimmy_48_1', N'江西省广昌县塘方向天要存_48_1', N'小地方_48_1', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (78, N'869eb8aa-9a7f-4a0f-9784-a60af69c89a8', N'Peter_47_2', N'湖南省_47_2', N'湖南达到_47_2', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (79, N'a924db1d-eb6e-47c9-9da5-3baf84ec9da8', N'Tom_46_3', N'USA_46_3', N'USA_46_3', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (80, N'92be4a65-7caf-4ad7-b451-8ed328ae5395', N'Jimmy_0_45_4', N'江西省广昌县塘方向天要存_45_4', N'小地方_45_4', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (81, N'cb56c73d-c415-4537-938d-09e9b1e9b6cb', N'Peter_0_44_5', N'湖南省_44_5', N'湖南达到_44_5', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (82, N'024c1ee6-1e46-4f54-8a27-5548acfabe77', N'Tom_0_43_6', N'USA_43_6', N'USA_43_6', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (83, N'2baa16d3-bf3d-45de-81d9-af85e3d58be6', N'Tom_0_1_42_7', N'USA_1_42_7', N'USA_1_42_7', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (84, N'77f7d9cc-d391-486c-863f-c2efacadf6e4', N'Peter_0_2_41_8', N'湖南省_2_41_8', N'湖南达到_2_41_8', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (85, N'1dc5f15c-0d51-447b-9910-12c038102fc2', N'Jimmy_0_3_40_9', N'江西省广昌县塘方向天要存_3_40_9', N'小地方_3_40_9', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (86, N'cc9f7e58-1aa2-4531-94c9-151cbf00e395', N'Tom_4_39_10', N'USA_4_39_10', N'USA_4_39_10', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (87, N'330f898c-9321-4444-b022-99d71b9129cf', N'Peter_5_38_11', N'湖南省_5_38_11', N'湖南达到_5_38_11', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (88, N'769965ad-092f-461a-86c9-dc9ea10ed223', N'Jimmy_6_37_12', N'江西省广昌县塘方向天要存_6_37_12', N'小地方_6_37_12', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (89, N'cc209048-b66e-4dbb-a25d-7a1a0888b7bb', N'Jimmy_6_1_36_13', N'江西省广昌县塘方向天要存_6_1_36_13', N'小地方_6_1_36_13', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (90, N'51783e79-cf72-446d-bdaf-f2d5b3935d52', N'Peter_5_2_35_14', N'湖南省_5_2_35_14', N'湖南达到_5_2_35_14', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (91, N'45355cf4-11d9-446c-8834-f1f8eb9f5940', N'Tom_4_3_34_15', N'USA_4_3_34_15', N'USA_4_3_34_15', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (92, N'81efcb88-8d5a-4d71-a776-e8ca5d92ec85', N'Jimmy_0_3_4_33_16', N'江西省广昌县塘方向天要存_3_4_33_16', N'小地方_3_4_33_16', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (93, N'cf2edaea-0900-4ef7-970f-1226a072413b', N'Peter_0_2_5_32_17', N'湖南省_2_5_32_17', N'湖南达到_2_5_32_17', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (94, N'19225fa2-a06b-4f66-b4e7-dcf3367bf8c8', N'Tom_0_1_6_31_18', N'USA_1_6_31_18', N'USA_1_6_31_18', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (95, N'0bfdaa6a-e0b3-49bb-b6b7-403c73ad5db9', N'Tom_0_7_30_19', N'USA_7_30_19', N'USA_7_30_19', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (96, N'0f4cfe17-3c50-4b89-8298-dec945fc0d5a', N'Peter_0_8_29_20', N'湖南省_8_29_20', N'湖南达到_8_29_20', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (97, N'33adace1-1585-400d-9378-72ede01f1f40', N'Jimmy_0_9_28_21', N'江西省广昌县塘方向天要存_9_28_21', N'小地方_9_28_21', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (98, N'8223d60d-68c2-45c2-9d9c-81869f64d788', N'Tom_10_27_22', N'USA_10_27_22', N'USA_10_27_22', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (99, N'98b464cb-22ff-4d6c-b314-e9acb9093faf', N'Peter_11_26_23', N'湖南省_11_26_23', N'湖南达到_11_26_23', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (100, N'8d661c91-2b0c-4ad9-8fd7-cc272b2f46cb', N'Jimmy_12_25_24', N'江西省广昌县塘方向天要存_12_25_24', N'小地方_12_25_24', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (101, N'cfa11f20-7d46-4b8a-b481-64f845d31c97', N'Jimmy_12_1_24_25', N'江西省广昌县塘方向天要存_12_1_24_25', N'小地方_12_1_24_25', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (102, N'b200891c-fa43-4483-91da-e5b3e733cc09', N'Peter_11_2_23_26', N'湖南省_11_2_23_26', N'湖南达到_11_2_23_26', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (103, N'760df6b4-2eba-48a0-bce7-69c449b4d8ec', N'Tom_10_3_22_27', N'USA_10_3_22_27', N'USA_10_3_22_27', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (104, N'3554f92a-c6da-4844-b757-88eb365fe361', N'Jimmy_0_9_4_21_28', N'江西省广昌县塘方向天要存_9_4_21_28', N'小地方_9_4_21_28', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (105, N'5978f9f3-7ec4-4159-81d3-980cafd1b87d', N'Peter_0_8_5_20_29', N'湖南省_8_5_20_29', N'湖南达到_8_5_20_29', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (106, N'14b267b2-ed16-48a7-80c6-30f9fe3c5dfe', N'Tom_0_7_6_19_30', N'USA_7_6_19_30', N'USA_7_6_19_30', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (107, N'8cd62430-5532-46e8-9b2d-35bc63ee2fc1', N'Tom_0_1_6_7_18_31', N'USA_1_6_7_18_31', N'USA_1_6_7_18_31', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (108, N'78ea53f4-7c67-45b4-934c-8d999452db3e', N'Peter_0_2_5_8_17_32', N'湖南省_2_5_8_17_32', N'湖南达到_2_5_8_17_32', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (109, N'e5e75565-7416-408f-8bdd-703e3a557adc', N'Jimmy_0_3_4_9_16_33', N'江西省广昌县塘方向天要存_3_4_9_16_33', N'小地方_3_4_9_16_33', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (110, N'e0a9ba2a-05bb-4458-bfb7-3a2bbff72e24', N'Tom_4_3_10_15_34', N'USA_4_3_10_15_34', N'USA_4_3_10_15_34', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (111, N'dab01c3e-0417-4b16-8fe9-997cfaedb3c0', N'Peter_5_2_11_14_35', N'湖南省_5_2_11_14_35', N'湖南达到_5_2_11_14_35', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (112, N'a39d752e-fff6-45b3-a23d-646b8c98b7bf', N'Jimmy_6_1_12_13_36', N'江西省广昌县塘方向天要存_6_1_12_13_36', N'小地方_6_1_12_13_36', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (113, N'851391e4-70e7-4880-85b6-0bd269199a4b', N'Jimmy_6_13_12_37', N'江西省广昌县塘方向天要存_6_13_12_37', N'小地方_6_13_12_37', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (114, N'61c8d326-81ec-423a-bef8-e2747f18d8fe', N'Peter_5_14_11_38', N'湖南省_5_14_11_38', N'湖南达到_5_14_11_38', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (115, N'a60be379-556e-4df8-8d5e-46948542c4a5', N'Tom_4_15_10_39', N'USA_4_15_10_39', N'USA_4_15_10_39', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (116, N'2116ae93-e7ef-480c-9659-36995739d0a9', N'Jimmy_0_3_16_9_40', N'江西省广昌县塘方向天要存_3_16_9_40', N'小地方_3_16_9_40', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (117, N'8f10bece-29fb-4842-b6ed-56243d2f6f3b', N'Peter_0_2_17_8_41', N'湖南省_2_17_8_41', N'湖南达到_2_17_8_41', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (118, N'4726cddc-654b-43d5-96d3-ee77b6778ee0', N'Tom_0_1_18_7_42', N'USA_1_18_7_42', N'USA_1_18_7_42', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (119, N'426ee883-d6b3-44b0-9745-acc816d8aaf8', N'Tom_0_19_6_43', N'USA_19_6_43', N'USA_19_6_43', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (120, N'754a3112-b786-4798-999d-6c43aedd0b62', N'Peter_0_20_5_44', N'湖南省_20_5_44', N'湖南达到_20_5_44', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (121, N'd6f6a055-e1bd-4b60-94c2-0de5d7278d60', N'Jimmy_0_21_52', N'江西省广昌县塘方向天要存_21_52', N'小地方_21_52', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (122, N'a588d744-fa50-485c-99b3-49d4ac3a1b5b', N'Peter_0_20_53', N'湖南省_20_53', N'湖南达到_20_53', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (123, N'8d2094d2-876f-4940-a868-6381b76242d0', N'Tom_0_19_54', N'USA_19_54', N'USA_19_54', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (124, N'0f642e27-9dad-489f-8ab2-59a77ca1c1f4', N'Tom_0_1_18_55', N'USA_1_18_55', N'USA_1_18_55', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (125, N'766daa20-548a-4592-87c5-ef7f52cb1911', N'Peter_0_2_17_56', N'湖南省_2_17_56', N'湖南达到_2_17_56', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (126, N'9cc777d9-a004-4918-a93f-e6d0ce9c9448', N'Jimmy_0_3_16_57', N'江西省广昌县塘方向天要存_3_16_57', N'小地方_3_16_57', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (127, N'804c03a8-a7ae-493d-a877-dcf7069148f2', N'Tom_4_15_58', N'USA_4_15_58', N'USA_4_15_58', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (128, N'efa04936-c710-486c-9e71-b67e614c4c96', N'Peter_5_14_59', N'湖南省_5_14_59', N'湖南达到_5_14_59', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (129, N'13cb3b3e-fa27-4178-bcee-9436cd2ace10', N'Jimmy_6_13_60', N'江西省广昌县塘方向天要存_6_13_60', N'小地方_6_13_60', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (130, N'd2b57f01-c758-4701-836a-f5fde0a7aeca', N'Jimmy_6_1_12_61', N'江西省广昌县塘方向天要存_6_1_12_61', N'小地方_6_1_12_61', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (131, N'ae2189e9-a9ff-4a5f-9505-4b874316e777', N'Peter_5_2_11_62', N'湖南省_5_2_11_62', N'湖南达到_5_2_11_62', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (132, N'dbef18ab-3c17-426c-adff-0aaf2ab04a00', N'Tom_4_3_10_63', N'USA_4_3_10_63', N'USA_4_3_10_63', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (133, N'ca28f762-7cc7-49ec-88f9-f85a3fa891b7', N'Jimmy_0_3_4_9_64', N'江西省广昌县塘方向天要存_3_4_9_64', N'小地方_3_4_9_64', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (134, N'f80c2d4b-65ab-4a68-832c-210bcb38f9f0', N'Jimmy_0_21_4_45', N'江西省广昌县塘方向天要存_21_4_45', N'小地方_21_4_45', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (135, N'dee5b0be-9336-4a22-95ab-74a8c467ded7', N'Tom_22_3_46', N'USA_22_3_46', N'USA_22_3_46', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (136, N'1fd28ee1-c8b5-45ae-95ea-c12c005135de', N'Peter_23_2_47', N'湖南省_23_2_47', N'湖南达到_23_2_47', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (137, N'3c5d0415-127c-421a-ad19-366a92576c3f', N'Jimmy_24_1_48', N'江西省广昌县塘方向天要存_24_1_48', N'小地方_24_1_48', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (138, N'1000bca4-e96d-4847-a5b8-37b7a3b2d000', N'Jimmy_24_49', N'江西省广昌县塘方向天要存_24_49', N'小地方_24_49', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (139, N'9444d82c-d17c-493c-b43b-c7c8a54433b6', N'Peter_23_50', N'湖南省_23_50', N'湖南达到_23_50', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (140, N'690ee0dc-17aa-4573-8dd0-4c9b3c1d360d', N'Tom_22_51', N'USA_22_51', N'USA_22_51', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (141, N'867d89af-2ba0-412d-a719-de3fc376f742', N'Peter_0_2_5_8_65', N'湖南省_2_5_8_65', N'湖南达到_2_5_8_65', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (142, N'7b723c52-2411-4bb1-b782-24c1d77112d6', N'Tom_0_1_6_7_66', N'USA_1_6_7_66', N'USA_1_6_7_66', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (143, N'a056830a-157a-4ae1-abf5-51c3894be382', N'Tom_0_7_6_67', N'USA_7_6_67', N'USA_7_6_67', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (144, N'045a486e-c469-4ac7-9446-9cdfd0456b87', N'Peter_0_8_5_68', N'湖南省_8_5_68', N'湖南达到_8_5_68', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (145, N'0b6b258f-6870-4a01-a309-d7131079a7c1', N'Jimmy_0_9_4_69', N'江西省广昌县塘方向天要存_9_4_69', N'小地方_9_4_69', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (146, N'4f801995-89b9-4d35-bf05-7261691bab86', N'Tom_10_3_70', N'USA_10_3_70', N'USA_10_3_70', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (147, N'9d2ce65c-266a-466b-a166-68ce66337e4c', N'Peter_11_2_71', N'湖南省_11_2_71', N'湖南达到_11_2_71', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (148, N'29522677-cb2b-4be1-a085-72160810533f', N'Jimmy_12_1_72', N'江西省广昌县塘方向天要存_12_1_72', N'小地方_12_1_72', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (149, N'547245ca-ae82-4ede-b336-bbc27fcb90ce', N'Jimmy_12_73', N'江西省广昌县塘方向天要存_12_73', N'小地方_12_73', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (150, N'0a2bcd3f-0262-41e3-9215-917593486d91', N'Peter_11_74', N'湖南省_11_74', N'湖南达到_11_74', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (151, N'0eb6e1fa-c649-46ad-8964-37ff287c0837', N'Tom_10_75', N'USA_10_75', N'USA_10_75', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (152, N'258e0394-1e9c-4821-a3f9-7b25456bb6cb', N'Jimmy_0_9_76', N'江西省广昌县塘方向天要存_9_76', N'小地方_9_76', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (153, N'929dae6b-e4f2-40ec-be6d-a889353d0229', N'Peter_0_8_77', N'湖南省_8_77', N'湖南达到_8_77', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (154, N'5d476777-04e2-4cb5-bda6-6f2706d0679f', N'Tom_0_7_78', N'USA_7_78', N'USA_7_78', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (155, N'3d118a1d-eef2-4cb1-b0c2-ed3de19eb08c', N'Tom_0_1_6_79', N'USA_1_6_79', N'USA_1_6_79', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (156, N'2d376f21-1c99-4db5-95eb-2916e4b9671f', N'Peter_0_2_5_80', N'湖南省_2_5_80', N'湖南达到_2_5_80', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (157, N'4fd468b4-b7a4-4265-8aba-c2a815ae36e9', N'Jimmy_0_3_4_81', N'江西省广昌县塘方向天要存_3_4_81', N'小地方_3_4_81', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (158, N'd2cdde4a-f1d9-4e4d-9e07-97395d46ab6e', N'Tom_4_3_82', N'USA_4_3_82', N'USA_4_3_82', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (159, N'8fbad994-a93b-437a-a74d-56f1010f7c97', N'Peter_5_2_83', N'湖南省_5_2_83', N'湖南达到_5_2_83', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (160, N'e1c8d274-ccca-491d-80a9-8291cdcef883', N'Jimmy_6_1_84', N'江西省广昌县塘方向天要存_6_1_84', N'小地方_6_1_84', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (161, N'fd1a2f94-0944-4f5f-982c-2b59f77203a8', N'Jimmy_6_85', N'江西省广昌县塘方向天要存_6_85', N'小地方_6_85', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (162, N'61796789-d2c4-4640-ab5a-a40df7ecff42', N'Peter_5_86', N'湖南省_5_86', N'湖南达到_5_86', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (163, N'85348a26-667d-4d9d-9431-158bfeb753b3', N'Tom_4_87', N'USA_4_87', N'USA_4_87', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (164, N'372ce78c-df30-46ca-9a9d-9d6754bd53c0', N'Jimmy_0_3_88', N'江西省广昌县塘方向天要存_3_88', N'小地方_3_88', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (165, N'28854d51-abec-448f-b843-ab9a86b57486', N'Peter_0_2_89', N'湖南省_2_89', N'湖南达到_2_89', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (166, N'b7f30e81-9454-4bcf-a41c-4cd8a428e538', N'Tom_0_1_90', N'USA_1_90', N'USA_1_90', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (167, N'c139493a-caba-40c5-a51d-3dc787042675', N'Tom_0_91', N'USA_91', N'USA_91', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (168, N'd921c1b7-f4f6-4a38-8a62-6b2e96b2053b', N'Peter_0_92', N'湖南省_92', N'湖南达到_92', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (169, N'346255a1-5814-4d44-8c9b-1f7d3f8a898f', N'Jimmy_0_93', N'江西省广昌县塘方向天要存_93', N'小地方_93', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (170, N'612765aa-4add-4e60-88f5-16e5169afe6f', N'Tom_94', N'USA_94', N'USA_94', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (171, N'63a6c081-f154-42dc-87e4-f2a3111414ed', N'Peter_95', N'湖南省_95', N'湖南达到_95', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (172, N'9ed68b5a-0b54-4c2a-9d07-aa9a9b8bcf07', N'Jimmy_96', N'江西省广昌县塘方向天要存_96', N'小地方_96', 0, CAST(0x0000A3C100E75EA1 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (173, N'330a56f8-b0ba-417e-a803-829943232981', N'Jimmy_96_1', N'江西省广昌县塘方向天要存_96_1', N'小地方_96_1', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (174, N'3ebd858c-f975-4d67-acc1-8f5c342bcf2e', N'Peter_95_2', N'湖南省_95_2', N'湖南达到_95_2', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (175, N'4fcdfe80-1651-4555-a6f3-b98df5c12a22', N'Tom_94_3', N'USA_94_3', N'USA_94_3', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (176, N'568c2feb-6d00-4001-82cd-ede73a85533f', N'Jimmy_0_93_4', N'江西省广昌县塘方向天要存_93_4', N'小地方_93_4', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (177, N'b656a1d2-fc65-42a4-b2c3-414084e272cd', N'Peter_0_92_5', N'湖南省_92_5', N'湖南达到_92_5', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (178, N'962fdce2-fa8d-4e64-b33b-c507929764e9', N'Tom_0_91_6', N'USA_91_6', N'USA_91_6', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (179, N'b7847056-c9cd-4868-9fa4-c5778cb3a13b', N'Tom_0_1_90_7', N'USA_1_90_7', N'USA_1_90_7', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (180, N'67e7e6b9-88db-4248-bfab-f17dc55b7fa2', N'Peter_0_2_89_8', N'湖南省_2_89_8', N'湖南达到_2_89_8', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (181, N'bc629588-74a6-45dc-b2be-66c9077b8b1e', N'Jimmy_0_3_88_9', N'江西省广昌县塘方向天要存_3_88_9', N'小地方_3_88_9', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (182, N'bb9a8674-eab0-4ffd-8f66-83dd7e9d9066', N'Tom_4_87_10', N'USA_4_87_10', N'USA_4_87_10', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (183, N'7204153a-6277-421e-a26a-235cf8447869', N'Peter_5_86_11', N'湖南省_5_86_11', N'湖南达到_5_86_11', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (184, N'2657ccc0-2c9b-4ae3-aece-3650dfc12a9c', N'Jimmy_6_85_12', N'江西省广昌县塘方向天要存_6_85_12', N'小地方_6_85_12', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (185, N'43edbd49-0cdd-4e70-a57a-0788de78b1ef', N'Jimmy_6_1_84_13', N'江西省广昌县塘方向天要存_6_1_84_13', N'小地方_6_1_84_13', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (186, N'7d02ef61-3e93-46ad-9543-b92a77ff7cc5', N'Peter_5_2_83_14', N'湖南省_5_2_83_14', N'湖南达到_5_2_83_14', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (187, N'f24bba87-19fa-46e7-8688-30803c1275e5', N'Tom_4_3_82_15', N'USA_4_3_82_15', N'USA_4_3_82_15', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (188, N'af3b0c1b-ad7b-48c2-aff7-74454427cce5', N'Jimmy_0_3_4_81_16', N'江西省广昌县塘方向天要存_3_4_81_16', N'小地方_3_4_81_16', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (189, N'68272668-9604-4d0b-a59d-fdd1e684120a', N'Peter_0_2_5_80_17', N'湖南省_2_5_80_17', N'湖南达到_2_5_80_17', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (190, N'1d0e200a-8163-4688-a21a-ec1d5b79cc8a', N'Tom_0_1_6_79_18', N'USA_1_6_79_18', N'USA_1_6_79_18', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (191, N'10e9e823-f108-4124-8087-f5f07540f6a1', N'Tom_0_7_78_19', N'USA_7_78_19', N'USA_7_78_19', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (192, N'e6a60ddb-79d6-4e03-b581-743fc8d1edac', N'Peter_0_8_77_20', N'湖南省_8_77_20', N'湖南达到_8_77_20', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (193, N'd7715396-3e60-4ff5-8487-d5472acd7390', N'Jimmy_0_9_76_21', N'江西省广昌县塘方向天要存_9_76_21', N'小地方_9_76_21', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (194, N'8c59a0be-1698-4c2e-b2ed-a25609e063f7', N'Tom_10_75_22', N'USA_10_75_22', N'USA_10_75_22', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (195, N'3b6f740b-303a-430a-b9b7-a6452249fe07', N'Peter_11_74_23', N'湖南省_11_74_23', N'湖南达到_11_74_23', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (196, N'02105008-7643-4767-81ad-97ad15a3c913', N'Jimmy_12_73_24', N'江西省广昌县塘方向天要存_12_73_24', N'小地方_12_73_24', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (197, N'ea969299-f1a6-4ae2-8b8f-22aefb94a54d', N'Jimmy_12_1_72_25', N'江西省广昌县塘方向天要存_12_1_72_25', N'小地方_12_1_72_25', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (198, N'3f368543-e14a-4780-b727-1ab0472c7d6b', N'Peter_11_2_71_26', N'湖南省_11_2_71_26', N'湖南达到_11_2_71_26', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (199, N'97e13216-6161-4fe7-8550-6da3be2c0c79', N'Tom_10_3_70_27', N'USA_10_3_70_27', N'USA_10_3_70_27', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (200, N'8671f23b-1657-4fa9-821c-75889c039c0c', N'Jimmy_0_9_4_69_28', N'江西省广昌县塘方向天要存_9_4_69_28', N'小地方_9_4_69_28', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (201, N'd319f432-273d-41d5-a5ae-88e9a40efc1c', N'Peter_0_8_5_68_29', N'湖南省_8_5_68_29', N'湖南达到_8_5_68_29', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
GO
print 'Processed 200 total records'
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (202, N'c35a899d-9cc5-4b29-b896-22703ced2be1', N'Tom_0_7_6_67_30', N'USA_7_6_67_30', N'USA_7_6_67_30', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (203, N'27a964d9-a6b8-425b-9dde-454e60f41658', N'Tom_0_1_6_7_66_31', N'USA_1_6_7_66_31', N'USA_1_6_7_66_31', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (204, N'b5859a9e-2cda-487a-841b-f3afcbf901c0', N'Peter_0_2_5_8_65_32', N'湖南省_2_5_8_65_32', N'湖南达到_2_5_8_65_32', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (205, N'0b4d670a-4f93-40d5-b2de-ec0b2a7ff462', N'Jimmy_0_3_4_9_64_33', N'江西省广昌县塘方向天要存_3_4_9_64_33', N'小地方_3_4_9_64_33', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (206, N'98a3e1d2-9992-4fd6-9f7b-6ad118dd16ef', N'Tom_4_3_10_63_34', N'USA_4_3_10_63_34', N'USA_4_3_10_63_34', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (207, N'c9f7b760-7046-4777-a7dc-10de2d32cb93', N'Peter_5_2_11_62_35', N'湖南省_5_2_11_62_35', N'湖南达到_5_2_11_62_35', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (208, N'92824626-57ea-44e2-b012-e64d846b8493', N'Jimmy_6_1_12_61_36', N'江西省广昌县塘方向天要存_6_1_12_61_36', N'小地方_6_1_12_61_36', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (209, N'91fa258a-ce00-49d6-a88b-f0be6c62d6c8', N'Jimmy_6_13_60_37', N'江西省广昌县塘方向天要存_6_13_60_37', N'小地方_6_13_60_37', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (210, N'ea12a77f-eb31-422b-8e1e-f50d6b455468', N'Peter_5_14_59_38', N'湖南省_5_14_59_38', N'湖南达到_5_14_59_38', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (211, N'cb28e628-69b0-4415-994d-fd76a2735189', N'Tom_4_15_58_39', N'USA_4_15_58_39', N'USA_4_15_58_39', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (212, N'c356a369-a1b5-4342-ae36-e7182f03759c', N'Jimmy_0_3_16_57_40', N'江西省广昌县塘方向天要存_3_16_57_40', N'小地方_3_16_57_40', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (213, N'7a6444e3-ea56-430e-86ff-59f7cd06b1e1', N'Peter_0_2_17_56_41', N'湖南省_2_17_56_41', N'湖南达到_2_17_56_41', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (214, N'86dfed63-b980-40a4-8c37-a3b7be330760', N'Tom_0_1_18_55_42', N'USA_1_18_55_42', N'USA_1_18_55_42', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (215, N'3ba588a5-2ecc-43cb-9dbf-90d7f43d2d1b', N'Tom_0_19_54_43', N'USA_19_54_43', N'USA_19_54_43', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (216, N'3097b8ac-8157-4ce9-97e1-bfe0fd205f5f', N'Peter_0_20_53_44', N'湖南省_20_53_44', N'湖南达到_20_53_44', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (217, N'48b188b2-da49-4872-8fa8-3d455382b3ab', N'Jimmy_0_21_52_45', N'江西省广昌县塘方向天要存_21_52_45', N'小地方_21_52_45', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (218, N'd60bfe66-638f-48d9-9701-0335a62be457', N'Tom_22_51_46', N'USA_22_51_46', N'USA_22_51_46', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (219, N'aadf021e-504e-4dd5-b555-57a05f9d4b96', N'Peter_23_50_47', N'湖南省_23_50_47', N'湖南达到_23_50_47', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (220, N'8b8f3413-65f6-4514-b08a-9c7e1bc21071', N'Jimmy_24_49_48', N'江西省广昌县塘方向天要存_24_49_48', N'小地方_24_49_48', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (221, N'c44fdf3b-902d-4852-b7a8-bebc9b44befa', N'Jimmy_24_1_48_49', N'江西省广昌县塘方向天要存_24_1_48_49', N'小地方_24_1_48_49', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (222, N'10346923-6545-4ad8-a9f0-3fb89a7ac529', N'Peter_23_2_47_50', N'湖南省_23_2_47_50', N'湖南达到_23_2_47_50', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (223, N'cf2e242d-2e52-4b57-bdaa-e2df611bd047', N'Tom_22_3_46_51', N'USA_22_3_46_51', N'USA_22_3_46_51', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (224, N'a01e8b64-7b84-466c-8ad9-b946c70afbae', N'Jimmy_0_21_4_45_52', N'江西省广昌县塘方向天要存_21_4_45_52', N'小地方_21_4_45_52', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (225, N'494525c7-9d37-4591-9ae8-4cac6a4b73ee', N'Peter_0_20_5_44_53', N'湖南省_20_5_44_53', N'湖南达到_20_5_44_53', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (226, N'477ee52c-5f6f-4f34-b932-2830f20baca0', N'Tom_0_19_6_43_54', N'USA_19_6_43_54', N'USA_19_6_43_54', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (227, N'41ea1a05-3a51-458a-9310-ad781c210577', N'Tom_0_1_18_7_42_55', N'USA_1_18_7_42_55', N'USA_1_18_7_42_55', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (228, N'fabfb327-20e4-42ca-abca-6b3067d45f68', N'Peter_0_2_17_8_41_56', N'湖南省_2_17_8_41_56', N'湖南达到_2_17_8_41_56', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (229, N'59d38907-272f-4f6d-ad46-35ff31a6e546', N'Jimmy_0_3_16_9_40_57', N'江西省广昌县塘方向天要存_3_16_9_40_57', N'小地方_3_16_9_40_57', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (230, N'1fc5f74d-d622-4bbb-bd66-d7530313e5cd', N'Tom_4_15_10_39_58', N'USA_4_15_10_39_58', N'USA_4_15_10_39_58', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (231, N'ce8e073a-9bfb-47c3-8311-89c624668480', N'Peter_5_14_11_38_59', N'湖南省_5_14_11_38_59', N'湖南达到_5_14_11_38_59', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (232, N'e6746843-a78c-41b3-a007-9234541b1a55', N'Jimmy_6_13_12_37_60', N'江西省广昌县塘方向天要存_6_13_12_37_60', N'小地方_6_13_12_37_60', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (233, N'de8137dc-c908-4249-bf5c-27d33cd89270', N'Jimmy_6_1_12_13_36_61', N'江西省广昌县塘方向天要存_6_1_12_13_36_61', N'小地方_6_1_12_13_36_61', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (234, N'b8c08ac5-d45e-4a85-9125-38f6bda2d9e1', N'Peter_5_2_11_14_35_62', N'湖南省_5_2_11_14_35_62', N'湖南达到_5_2_11_14_35_62', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (235, N'c447f62d-e714-44cc-ac47-f881aea3436d', N'Tom_4_3_10_15_34_63', N'USA_4_3_10_15_34_63', N'USA_4_3_10_15_34_63', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (236, N'38c7ba0e-38d2-4613-a16b-84742239fca3', N'Jimmy_0_3_4_9_16_33_64', N'江西省广昌县塘方向天要存_3_4_9_16_33_64', N'小地方_3_4_9_16_33_64', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (237, N'd9057cf1-5667-4170-81d2-7768cfc48219', N'Peter_0_2_5_8_17_32_65', N'湖南省_2_5_8_17_32_65', N'湖南达到_2_5_8_17_32_65', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (238, N'd11aae98-44fb-4628-b709-fff81a72b792', N'Tom_0_1_6_7_18_31_66', N'USA_1_6_7_18_31_66', N'USA_1_6_7_18_31_66', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (239, N'346b1785-dbff-4997-a21b-f0aee167c431', N'Tom_0_7_6_19_30_67', N'USA_7_6_19_30_67', N'USA_7_6_19_30_67', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (240, N'16aad7e1-9f2c-4bec-b333-f96d154af337', N'Peter_0_8_5_20_29_68', N'湖南省_8_5_20_29_68', N'湖南达到_8_5_20_29_68', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (241, N'2c5b4795-f0fa-4dfd-8c8e-10a3be987dc0', N'Jimmy_0_9_4_21_28_69', N'江西省广昌县塘方向天要存_9_4_21_28_69', N'小地方_9_4_21_28_69', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (242, N'3a9e62bc-6616-46c2-8381-6b875a4c31f5', N'Tom_10_3_22_27_70', N'USA_10_3_22_27_70', N'USA_10_3_22_27_70', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (243, N'b7f8892f-f762-4938-95d8-183114739bfb', N'Peter_11_2_23_26_71', N'湖南省_11_2_23_26_71', N'湖南达到_11_2_23_26_71', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (244, N'51ca0c80-b5b5-432b-bafb-1bea2f0066f2', N'Jimmy_12_1_24_25_72', N'江西省广昌县塘方向天要存_12_1_24_25_72', N'小地方_12_1_24_25_72', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (245, N'eb32e61d-4097-4133-b31b-b7ba8b63b28c', N'Jimmy_12_25_24_73', N'江西省广昌县塘方向天要存_12_25_24_73', N'小地方_12_25_24_73', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (246, N'873002aa-e64c-43c1-836f-399126dc9c56', N'Peter_11_26_23_74', N'湖南省_11_26_23_74', N'湖南达到_11_26_23_74', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (247, N'553aca44-cce4-4dba-9fbc-e5c011c8e095', N'Tom_10_27_22_75', N'USA_10_27_22_75', N'USA_10_27_22_75', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (248, N'5bf35256-7793-41bd-9a5f-ae5018d764f1', N'Jimmy_0_9_28_21_76', N'江西省广昌县塘方向天要存_9_28_21_76', N'小地方_9_28_21_76', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (249, N'4e44b040-53ba-4b1c-b9e9-c2222f836784', N'Peter_0_8_29_20_77', N'湖南省_8_29_20_77', N'湖南达到_8_29_20_77', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (250, N'2b8f6268-2204-40a6-a747-77f1dbc8716f', N'Tom_0_7_30_19_78', N'USA_7_30_19_78', N'USA_7_30_19_78', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (251, N'260cefce-94bd-41cd-81a1-3abfe0594eb0', N'Tom_0_1_6_31_18_79', N'USA_1_6_31_18_79', N'USA_1_6_31_18_79', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (252, N'4d46cfe5-abcf-46b4-b52d-6c35759a1c65', N'Peter_0_2_5_32_17_80', N'湖南省_2_5_32_17_80', N'湖南达到_2_5_32_17_80', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (253, N'db7c5421-d475-483a-b192-076d4918ddfa', N'Jimmy_0_3_4_33_16_81', N'江西省广昌县塘方向天要存_3_4_33_16_81', N'小地方_3_4_33_16_81', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (254, N'5486c605-555c-4f5a-b981-8872003c1988', N'Tom_4_3_34_15_82', N'USA_4_3_34_15_82', N'USA_4_3_34_15_82', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (255, N'65dc78dc-5d4a-4329-b919-999b2f20e54b', N'Peter_5_2_35_14_83', N'湖南省_5_2_35_14_83', N'湖南达到_5_2_35_14_83', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (256, N'ed14b016-c99e-418e-b805-ae512dd239ea', N'Jimmy_6_1_36_13_84', N'江西省广昌县塘方向天要存_6_1_36_13_84', N'小地方_6_1_36_13_84', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (257, N'04edbf64-493d-4ab0-8dbe-c331d312a8c7', N'Jimmy_6_37_12_85', N'江西省广昌县塘方向天要存_6_37_12_85', N'小地方_6_37_12_85', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (258, N'b7f253c5-ca5f-40ff-8abb-a535f54db125', N'Peter_5_38_11_86', N'湖南省_5_38_11_86', N'湖南达到_5_38_11_86', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (259, N'2549a7b5-6ab0-463d-9eb1-5ca3760912eb', N'Tom_4_39_10_87', N'USA_4_39_10_87', N'USA_4_39_10_87', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (260, N'c515d263-fc9b-436f-8933-36c7618c0f13', N'Jimmy_0_3_40_9_88', N'江西省广昌县塘方向天要存_3_40_9_88', N'小地方_3_40_9_88', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (261, N'7fd1b33a-8e09-405e-a5b4-46bb3d6c77d2', N'Peter_0_2_41_8_89', N'湖南省_2_41_8_89', N'湖南达到_2_41_8_89', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (262, N'c57d0fac-c1d4-40a3-b4cd-a33010fdba36', N'Tom_0_1_42_7_90', N'USA_1_42_7_90', N'USA_1_42_7_90', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (263, N'ed21752f-0e0d-4132-91fc-c3a8f348b30a', N'Tom_0_43_6_91', N'USA_43_6_91', N'USA_43_6_91', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (264, N'8f0cab7a-7a69-4fea-95cc-3e0ed12cddbe', N'Peter_0_44_5_92', N'湖南省_44_5_92', N'湖南达到_44_5_92', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (265, N'17856907-4fd2-40e0-b5d2-d0b2cd79194e', N'Jimmy_0_45_4_93', N'江西省广昌县塘方向天要存_45_4_93', N'小地方_45_4_93', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (266, N'47e1dde2-1449-44c7-9c4c-980222f59094', N'Tom_46_3_94', N'USA_46_3_94', N'USA_46_3_94', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (267, N'29fab047-bcdd-4db0-a289-957f32d99276', N'Peter_47_2_95', N'湖南省_47_2_95', N'湖南达到_47_2_95', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (268, N'01270265-e68d-4952-96a8-5c0ecbdbeb7a', N'Jimmy_48_1_96', N'江西省广昌县塘方向天要存_48_1_96', N'小地方_48_1_96', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (269, N'c105f3fa-d5d2-40e4-b0ae-4a1eca2ce943', N'Jimmy_48_97', N'江西省广昌县塘方向天要存_48_97', N'小地方_48_97', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (270, N'5e6a9e18-d9db-49ba-af3f-73418e0e7e3f', N'Peter_47_98', N'湖南省_47_98', N'湖南达到_47_98', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (271, N'cafa6f3b-dee2-40bc-a537-1ac9d1354722', N'Tom_46_99', N'USA_46_99', N'USA_46_99', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (272, N'3c5f4f25-0ab0-48ae-be0c-9171218f3bba', N'Jimmy_0_45_100', N'江西省广昌县塘方向天要存_45_100', N'小地方_45_100', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (273, N'60e6869a-4bfa-4add-bc3d-c4fe26449dcc', N'Peter_0_44_101', N'湖南省_44_101', N'湖南达到_44_101', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (274, N'efbe6852-63ed-4550-834a-6e9e8bfedc94', N'Tom_0_43_102', N'USA_43_102', N'USA_43_102', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (275, N'462ca988-eb01-4bab-922c-6c4f66b12586', N'Tom_0_1_42_103', N'USA_1_42_103', N'USA_1_42_103', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (276, N'307c5042-197b-42ab-97cb-8b4d82912c67', N'Peter_0_2_41_104', N'湖南省_2_41_104', N'湖南达到_2_41_104', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (277, N'86bb92ff-5bd0-4f36-bd4f-4683b32e3be9', N'Jimmy_0_3_40_105', N'江西省广昌县塘方向天要存_3_40_105', N'小地方_3_40_105', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (278, N'20cd1b7f-4064-4779-a147-1be4a13adc5a', N'Tom_4_39_106', N'USA_4_39_106', N'USA_4_39_106', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (279, N'19698d25-c647-4ef6-bf5b-ff8f6d43cb3f', N'Peter_5_38_107', N'湖南省_5_38_107', N'湖南达到_5_38_107', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (280, N'9dfa3505-b9d8-4a53-80b9-5abfe0570272', N'Jimmy_6_37_108', N'江西省广昌县塘方向天要存_6_37_108', N'小地方_6_37_108', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (281, N'71cec6f3-ac58-4d39-b592-2f6e357e28d5', N'Jimmy_6_1_36_109', N'江西省广昌县塘方向天要存_6_1_36_109', N'小地方_6_1_36_109', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (282, N'44b009e1-3708-48d4-822e-24484709052a', N'Peter_5_2_35_110', N'湖南省_5_2_35_110', N'湖南达到_5_2_35_110', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (283, N'c09397c9-6672-48ee-bf0d-1f63c9af8c94', N'Tom_4_3_34_111', N'USA_4_3_34_111', N'USA_4_3_34_111', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (284, N'8fec054c-116d-4c45-97a8-9afd64c7a8ed', N'Jimmy_0_3_4_33_112', N'江西省广昌县塘方向天要存_3_4_33_112', N'小地方_3_4_33_112', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (285, N'680e0023-d1de-421b-9b28-91454309c570', N'Peter_0_2_5_32_113', N'湖南省_2_5_32_113', N'湖南达到_2_5_32_113', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (286, N'c40761e0-bfe2-497d-9212-9719d5d87bba', N'Tom_0_1_6_31_114', N'USA_1_6_31_114', N'USA_1_6_31_114', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (287, N'8e4db830-0d99-437d-a42d-d5c8725ed283', N'Tom_0_7_30_115', N'USA_7_30_115', N'USA_7_30_115', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (288, N'f4c414cc-bc61-4f5f-8049-aa591eb5c55c', N'Peter_0_8_29_116', N'湖南省_8_29_116', N'湖南达到_8_29_116', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (289, N'f0866ce8-adcc-4f21-84ca-58c2538fbae8', N'Jimmy_0_9_28_117', N'江西省广昌县塘方向天要存_9_28_117', N'小地方_9_28_117', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (290, N'e37f140a-014d-4818-a643-963a98bef029', N'Tom_10_27_118', N'USA_10_27_118', N'USA_10_27_118', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (291, N'12e801a2-7e28-41f2-ad91-ff9d65613d67', N'Peter_11_26_119', N'湖南省_11_26_119', N'湖南达到_11_26_119', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (292, N'20d222af-d291-4b16-b38b-8e3e221b54ba', N'Jimmy_12_25_120', N'江西省广昌县塘方向天要存_12_25_120', N'小地方_12_25_120', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (293, N'42de3e6d-e2aa-4e4c-ba45-a62867b6eae8', N'Jimmy_12_1_24_121', N'江西省广昌县塘方向天要存_12_1_24_121', N'小地方_12_1_24_121', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (294, N'0cf9e3dd-2dc1-4988-ab9c-d92ccfe57f84', N'Peter_11_2_23_122', N'湖南省_11_2_23_122', N'湖南达到_11_2_23_122', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (295, N'59a647b8-8339-4a9d-a589-be25a519e6cd', N'Tom_10_3_22_123', N'USA_10_3_22_123', N'USA_10_3_22_123', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (296, N'614f67b2-464a-43d4-86e3-8940f027f382', N'Jimmy_0_9_4_21_124', N'江西省广昌县塘方向天要存_9_4_21_124', N'小地方_9_4_21_124', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (297, N'c09c6092-ee08-4da3-9952-4056aeb3210f', N'Peter_0_8_5_20_125', N'湖南省_8_5_20_125', N'湖南达到_8_5_20_125', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (298, N'd1e8ed30-2a0f-49f8-90a2-e9481ae17bca', N'Tom_0_7_6_19_126', N'USA_7_6_19_126', N'USA_7_6_19_126', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (299, N'a623a2f8-8ffc-4f14-885a-f55904032e14', N'Tom_0_1_6_7_18_127', N'USA_1_6_7_18_127', N'USA_1_6_7_18_127', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (300, N'fd63351d-0f14-4bf7-a5f5-c0718669ef06', N'Peter_0_2_5_8_17_128', N'湖南省_2_5_8_17_128', N'湖南达到_2_5_8_17_128', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (301, N'ff47ca5b-daf6-4a66-bfd9-31a5386cf57e', N'Jimmy_0_3_4_9_16_129', N'江西省广昌县塘方向天要存_3_4_9_16_129', N'小地方_3_4_9_16_129', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (302, N'0fc1e7fa-318f-4809-a539-ca4a2c7e2907', N'Tom_4_3_10_15_130', N'USA_4_3_10_15_130', N'USA_4_3_10_15_130', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
GO
print 'Processed 300 total records'
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (303, N'a5f1a9b4-e883-4077-ac46-f783b7f88f0c', N'Peter_5_2_11_14_131', N'湖南省_5_2_11_14_131', N'湖南达到_5_2_11_14_131', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (304, N'998a201d-2cfb-4b9b-87cd-7d519bc6a1ba', N'Jimmy_6_1_12_13_132', N'江西省广昌县塘方向天要存_6_1_12_13_132', N'小地方_6_1_12_13_132', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (305, N'd3ab505a-7688-42db-9cfd-3820092a6dd7', N'Jimmy_6_13_12_133', N'江西省广昌县塘方向天要存_6_13_12_133', N'小地方_6_13_12_133', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (306, N'9956c71d-a37f-4678-a9ec-508b78610148', N'Peter_5_14_11_134', N'湖南省_5_14_11_134', N'湖南达到_5_14_11_134', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (307, N'0fc55208-1e0d-4e10-b8c5-6176c0468396', N'Tom_4_15_10_135', N'USA_4_15_10_135', N'USA_4_15_10_135', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (308, N'f296e77c-5b94-4e4f-b1a5-f90f5f9986b6', N'Jimmy_0_3_16_9_136', N'江西省广昌县塘方向天要存_3_16_9_136', N'小地方_3_16_9_136', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (309, N'03b0c26a-3fae-4f67-a98b-9dd96000597b', N'Peter_0_2_17_8_137', N'湖南省_2_17_8_137', N'湖南达到_2_17_8_137', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (310, N'561b698e-36f5-49ad-a8c6-13a6be30b279', N'Tom_0_1_18_7_138', N'USA_1_18_7_138', N'USA_1_18_7_138', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (311, N'92b79a86-1877-454a-a2b7-f15148c5fb72', N'Tom_0_19_6_139', N'USA_19_6_139', N'USA_19_6_139', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (312, N'4aadcfab-2963-47b8-a8bd-8623d67ffeac', N'Peter_0_20_5_140', N'湖南省_20_5_140', N'湖南达到_20_5_140', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (313, N'42d64a6d-a5a3-43b0-958d-79aabf80d90a', N'Jimmy_0_21_4_141', N'江西省广昌县塘方向天要存_21_4_141', N'小地方_21_4_141', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (314, N'b6bdc9d4-a525-49d3-8d27-14507d9ddc17', N'Tom_22_3_142', N'USA_22_3_142', N'USA_22_3_142', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (315, N'72df62cc-599f-420a-a87b-28888428db97', N'Peter_23_2_143', N'湖南省_23_2_143', N'湖南达到_23_2_143', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (316, N'69bfbc41-db91-44e6-9af3-58fceb4084ca', N'Jimmy_24_1_144', N'江西省广昌县塘方向天要存_24_1_144', N'小地方_24_1_144', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (317, N'dad1ecf7-6c83-46e4-906e-0e448d456999', N'Jimmy_24_145', N'江西省广昌县塘方向天要存_24_145', N'小地方_24_145', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (318, N'62420d01-8de1-4899-b264-46844166563b', N'Peter_23_146', N'湖南省_23_146', N'湖南达到_23_146', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (319, N'8030ac69-1f53-42dd-8161-5d53bdef10fa', N'Tom_22_147', N'USA_22_147', N'USA_22_147', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (320, N'e966531f-bdb5-4b81-bdd4-f84f63ed7d1e', N'Jimmy_0_21_148', N'江西省广昌县塘方向天要存_21_148', N'小地方_21_148', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (321, N'a67f0675-cf1a-492f-8e93-32b39a7674f9', N'Peter_0_20_149', N'湖南省_20_149', N'湖南达到_20_149', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (322, N'b0bf173c-859b-4b47-9037-c1af84a49327', N'Tom_0_19_150', N'USA_19_150', N'USA_19_150', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (323, N'f49b585a-72fc-4939-a2f5-5d6b1efce4d5', N'Tom_0_1_18_151', N'USA_1_18_151', N'USA_1_18_151', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (324, N'8814d3a3-de50-4cc2-b7a4-f7bfadce821e', N'Peter_0_2_17_152', N'湖南省_2_17_152', N'湖南达到_2_17_152', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (325, N'e49580cb-eabe-4881-b00a-1e85bd3e731f', N'Jimmy_0_3_16_153', N'江西省广昌县塘方向天要存_3_16_153', N'小地方_3_16_153', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (326, N'c7015f14-f749-42e1-9469-a08cf94dc99b', N'Tom_4_15_154', N'USA_4_15_154', N'USA_4_15_154', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (327, N'bd77b5e6-485b-40b3-8b23-e8116e89269b', N'Peter_5_14_155', N'湖南省_5_14_155', N'湖南达到_5_14_155', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (328, N'a1ec7bb7-f8e8-40f5-9e9f-286afaa41aa7', N'Jimmy_6_13_156', N'江西省广昌县塘方向天要存_6_13_156', N'小地方_6_13_156', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (329, N'53afd90c-7161-46d2-ab64-144cb67c266d', N'Jimmy_6_1_12_157', N'江西省广昌县塘方向天要存_6_1_12_157', N'小地方_6_1_12_157', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (330, N'a1662e2f-08a2-4242-a687-7103f9f1ba8c', N'Peter_5_2_11_158', N'湖南省_5_2_11_158', N'湖南达到_5_2_11_158', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (331, N'b8a4a8ef-3020-4de1-80dd-4703a8f53d76', N'Tom_4_3_10_159', N'USA_4_3_10_159', N'USA_4_3_10_159', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (332, N'c50faeca-f555-41e0-a9d7-7be09602b65b', N'Jimmy_0_3_4_9_160', N'江西省广昌县塘方向天要存_3_4_9_160', N'小地方_3_4_9_160', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (333, N'caefa273-7a21-43fa-b0ea-c938ae53ee8f', N'Peter_0_2_5_8_161', N'湖南省_2_5_8_161', N'湖南达到_2_5_8_161', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (334, N'c0db7b3e-0c51-4966-bdf8-be5e22ede522', N'Tom_0_1_6_7_162', N'USA_1_6_7_162', N'USA_1_6_7_162', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (335, N'1e7044ae-f636-4688-bbac-5a878124e1dd', N'Tom_0_7_6_163', N'USA_7_6_163', N'USA_7_6_163', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (336, N'467cead0-d4f1-48c6-83fe-56a094f7023a', N'Peter_0_8_5_164', N'湖南省_8_5_164', N'湖南达到_8_5_164', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (337, N'9b6ea404-aa8c-4859-b323-c5d26d2efb3a', N'Jimmy_0_9_4_165', N'江西省广昌县塘方向天要存_9_4_165', N'小地方_9_4_165', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (338, N'b2ab4341-44b4-43fc-a39a-a67576a8f9db', N'Tom_10_3_166', N'USA_10_3_166', N'USA_10_3_166', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (339, N'05e80ee4-d01d-40f0-bd92-cfbad05667ce', N'Peter_11_2_167', N'湖南省_11_2_167', N'湖南达到_11_2_167', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (340, N'e29d3ea1-7d7d-47af-8e84-48f03ddf44f9', N'Jimmy_12_1_168', N'江西省广昌县塘方向天要存_12_1_168', N'小地方_12_1_168', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (341, N'dd1e24ba-2565-4e4f-832d-951b67751b78', N'Jimmy_12_169', N'江西省广昌县塘方向天要存_12_169', N'小地方_12_169', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (342, N'c18bde15-ac10-4fb5-bf1e-4840c9860180', N'Peter_11_170', N'湖南省_11_170', N'湖南达到_11_170', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (343, N'50c0ea61-4ae0-4671-99bf-3fda7caa9b22', N'Tom_10_171', N'USA_10_171', N'USA_10_171', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (344, N'914a5c5f-36d4-4360-8a52-e2af1480ac6b', N'Jimmy_0_9_172', N'江西省广昌县塘方向天要存_9_172', N'小地方_9_172', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (345, N'8716be50-1d11-4006-954a-ae8573afa754', N'Peter_0_8_173', N'湖南省_8_173', N'湖南达到_8_173', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (346, N'09427521-ad43-4320-aa44-3a9e33289898', N'Tom_0_7_174', N'USA_7_174', N'USA_7_174', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (347, N'fc503164-f84b-403f-ae3c-c814079e481f', N'Tom_0_1_6_175', N'USA_1_6_175', N'USA_1_6_175', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (348, N'ce88ac51-2b35-4be4-af3c-03ed0ea3a965', N'Peter_0_2_5_176', N'湖南省_2_5_176', N'湖南达到_2_5_176', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (349, N'f33e608e-3a04-450f-a70f-52beac773277', N'Jimmy_0_3_4_177', N'江西省广昌县塘方向天要存_3_4_177', N'小地方_3_4_177', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (350, N'd6a24e85-cfc6-4ee9-a51e-56352b7568d9', N'Tom_4_3_178', N'USA_4_3_178', N'USA_4_3_178', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (351, N'e5dfe5f3-7590-43aa-9f3f-78081cbdd000', N'Peter_5_2_179', N'湖南省_5_2_179', N'湖南达到_5_2_179', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (352, N'aa60d125-e1a4-4a9d-b1e1-11d1d16feb40', N'Jimmy_6_1_180', N'江西省广昌县塘方向天要存_6_1_180', N'小地方_6_1_180', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (353, N'304ab019-2fc3-4283-8b29-2c263f8beabd', N'Jimmy_6_181', N'江西省广昌县塘方向天要存_6_181', N'小地方_6_181', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (354, N'b905c46b-070a-47f4-be58-6a50af4528e2', N'Peter_5_182', N'湖南省_5_182', N'湖南达到_5_182', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (355, N'add8a483-e01c-4d36-b8d4-dafc3ad7322b', N'Tom_4_183', N'USA_4_183', N'USA_4_183', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (356, N'60622ca1-bcb3-4448-b670-440fd319373f', N'Jimmy_0_3_184', N'江西省广昌县塘方向天要存_3_184', N'小地方_3_184', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (357, N'4d985aaf-2f68-4814-bdef-b85a09d04eb7', N'Peter_0_2_185', N'湖南省_2_185', N'湖南达到_2_185', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (358, N'487734a0-2b95-4ff9-8696-bd105f563885', N'Tom_0_1_186', N'USA_1_186', N'USA_1_186', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (359, N'91928f83-fa35-4006-ac6b-46f6b5a21155', N'Tom_0_187', N'USA_187', N'USA_187', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (360, N'45728c03-9ca5-447f-903c-6e8edaebc55c', N'Peter_0_188', N'湖南省_188', N'湖南达到_188', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (361, N'0d747116-73e5-4551-b06b-3b37b7d1ba44', N'Jimmy_0_189', N'江西省广昌县塘方向天要存_189', N'小地方_189', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (362, N'fd18a875-2094-42e5-9a7b-c28bda410951', N'Tom_190', N'USA_190', N'USA_190', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (363, N'613ced64-4a33-4149-a17d-78a47652684e', N'Peter_191', N'湖南省_191', N'湖南达到_191', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (364, N'4bebaf9a-514d-44d7-9e48-d47ca0361f2e', N'Jimmy_192', N'江西省广昌县塘方向天要存_192', N'小地方_192', 0, CAST(0x0000A3C100E75ED7 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (365, N'c726c399-5e12-44b3-b5bb-f7654ec40f52', N'Jimmy_192_1', N'江西省广昌县塘方向天要存_192_1', N'小地方_192_1', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (366, N'635909ca-a219-492d-a785-2d94b24baaef', N'Peter_191_2', N'湖南省_191_2', N'湖南达到_191_2', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (367, N'b4de8f49-0c78-47e1-a5e7-af83542b2dc5', N'Tom_190_3', N'USA_190_3', N'USA_190_3', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (368, N'ed3f82f3-a110-43f0-8560-28c6f33c2690', N'Jimmy_0_189_4', N'江西省广昌县塘方向天要存_189_4', N'小地方_189_4', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (369, N'fe50dbaa-0012-4179-80be-7868ba59166c', N'Peter_0_188_5', N'湖南省_188_5', N'湖南达到_188_5', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (370, N'3d5017a2-6003-429f-90e4-89ca13516e56', N'Tom_0_187_6', N'USA_187_6', N'USA_187_6', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (371, N'f5b1291e-a12b-4ee7-9cfb-47264bdb2f12', N'Tom_0_1_186_7', N'USA_1_186_7', N'USA_1_186_7', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (372, N'57f99bf6-a1b1-4bf1-b390-b26262dfbb6e', N'Peter_0_2_185_8', N'湖南省_2_185_8', N'湖南达到_2_185_8', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (373, N'ae4d3d2b-195b-4c62-bc00-505c213b58f6', N'Jimmy_0_3_184_9', N'江西省广昌县塘方向天要存_3_184_9', N'小地方_3_184_9', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (374, N'eded1f81-32bc-4762-9442-7afef5b09cd1', N'Tom_4_183_10', N'USA_4_183_10', N'USA_4_183_10', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (375, N'7e3076c4-dcee-42e2-b063-38a1d98b3d42', N'Peter_5_182_11', N'湖南省_5_182_11', N'湖南达到_5_182_11', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (376, N'b798afff-2b21-48a8-ab25-9fd630d27377', N'Jimmy_6_181_12', N'江西省广昌县塘方向天要存_6_181_12', N'小地方_6_181_12', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (377, N'35feb137-d376-48ed-99b2-e409c3b9f415', N'Jimmy_6_1_180_13', N'江西省广昌县塘方向天要存_6_1_180_13', N'小地方_6_1_180_13', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (378, N'a232903a-3f77-46f5-92dc-72f4942e0016', N'Peter_5_2_179_14', N'湖南省_5_2_179_14', N'湖南达到_5_2_179_14', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (379, N'13adcc07-a8fe-42f3-8790-b3ad77042036', N'Tom_4_3_178_15', N'USA_4_3_178_15', N'USA_4_3_178_15', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (380, N'f77205bc-c71b-4c49-9865-92ad65487933', N'Jimmy_0_3_4_177_16', N'江西省广昌县塘方向天要存_3_4_177_16', N'小地方_3_4_177_16', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (381, N'1fd17f11-58f8-4bfa-9953-5c9d7f3aa332', N'Peter_0_2_5_176_17', N'湖南省_2_5_176_17', N'湖南达到_2_5_176_17', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (382, N'399a409b-244c-4004-8e01-a3e2ea13f209', N'Tom_0_1_6_175_18', N'USA_1_6_175_18', N'USA_1_6_175_18', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (383, N'f4113c1f-e7ed-423e-ba14-ccc0b4f012d1', N'Tom_0_7_174_19', N'USA_7_174_19', N'USA_7_174_19', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (384, N'02926b32-7364-4770-847a-ce45de422cfc', N'Peter_0_8_173_20', N'湖南省_8_173_20', N'湖南达到_8_173_20', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (385, N'0ef5dea3-d048-4d26-b81c-dc27710c4528', N'Jimmy_0_9_172_21', N'江西省广昌县塘方向天要存_9_172_21', N'小地方_9_172_21', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (386, N'ac6fc258-f949-46d0-a260-7adafc985f75', N'Tom_10_171_22', N'USA_10_171_22', N'USA_10_171_22', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (387, N'305f4bc0-2174-4d2b-b1fe-7fa429afe1ee', N'Peter_11_170_23', N'湖南省_11_170_23', N'湖南达到_11_170_23', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (388, N'b5a26837-c740-413e-8929-6cb3ab5e2492', N'Jimmy_12_169_24', N'江西省广昌县塘方向天要存_12_169_24', N'小地方_12_169_24', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (389, N'33e1d178-9fe8-4625-81a8-786c92ec2497', N'Jimmy_12_1_168_25', N'江西省广昌县塘方向天要存_12_1_168_25', N'小地方_12_1_168_25', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (390, N'87ec9a1d-0ecb-4a25-9b7f-56f6361f7890', N'Peter_11_2_167_26', N'湖南省_11_2_167_26', N'湖南达到_11_2_167_26', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (391, N'f1f555aa-eab8-45c7-b38e-cef6febe1e8a', N'Tom_10_3_166_27', N'USA_10_3_166_27', N'USA_10_3_166_27', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (392, N'237d5947-5a4f-4cbb-8bd5-8c786f57e99e', N'Jimmy_0_9_4_165_28', N'江西省广昌县塘方向天要存_9_4_165_28', N'小地方_9_4_165_28', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (393, N'd8594924-693e-4edf-9213-18e8658d2e8b', N'Peter_0_8_5_164_29', N'湖南省_8_5_164_29', N'湖南达到_8_5_164_29', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (394, N'966d5206-af8a-4135-9bdd-a8d95c4febf0', N'Tom_0_7_6_163_30', N'USA_7_6_163_30', N'USA_7_6_163_30', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (395, N'38dc7f41-2f2e-4f9e-b15f-cf50f224d87a', N'Tom_0_1_6_7_162_31', N'USA_1_6_7_162_31', N'USA_1_6_7_162_31', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (396, N'b8d968cf-8dd9-4f7a-85a3-106bb7263367', N'Peter_0_2_5_8_161_32', N'湖南省_2_5_8_161_32', N'湖南达到_2_5_8_161_32', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (397, N'06a2b821-1965-4ff3-921e-5d7fff149775', N'Jimmy_0_3_4_9_160_33', N'江西省广昌县塘方向天要存_3_4_9_160_33', N'小地方_3_4_9_160_33', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (398, N'1c703ecd-9ec2-44ec-aa5a-62985d26ef3f', N'Tom_4_3_10_159_34', N'USA_4_3_10_159_34', N'USA_4_3_10_159_34', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (399, N'5a374105-aa6e-4ecc-a667-19d6cddafbe7', N'Peter_5_2_11_158_35', N'湖南省_5_2_11_158_35', N'湖南达到_5_2_11_158_35', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (400, N'a21cb0e5-1f10-4553-a032-472971cea06b', N'Jimmy_6_1_12_157_36', N'江西省广昌县塘方向天要存_6_1_12_157_36', N'小地方_6_1_12_157_36', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (401, N'f260fe04-d954-44cc-ba3b-f02702f85039', N'Peter_0_2_17_8_137_56', N'湖南省_2_17_8_137_56', N'湖南达到_2_17_8_137_56', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (402, N'ae97ad6f-2429-4310-b097-4d36d77e3cdd', N'Jimmy_6_13_156_37', N'江西省广昌县塘方向天要存_6_13_156_37', N'小地方_6_13_156_37', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (403, N'c4b30284-9a0e-4504-a742-7f44d18e2157', N'Peter_5_14_155_38', N'湖南省_5_14_155_38', N'湖南达到_5_14_155_38', 0, CAST(0x0000A3C100E75F17 AS DateTime))
GO
print 'Processed 400 total records'
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (404, N'5c09a3ed-f630-4043-9b94-e0809fa02554', N'Tom_4_15_154_39', N'USA_4_15_154_39', N'USA_4_15_154_39', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (405, N'04b5a54e-05d8-4c90-9f03-7e5784b2a5e4', N'Jimmy_0_3_16_153_40', N'江西省广昌县塘方向天要存_3_16_153_40', N'小地方_3_16_153_40', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (406, N'5ca4cfdc-dbe2-45ba-8c81-f6fbb9f1609e', N'Peter_0_2_17_152_41', N'湖南省_2_17_152_41', N'湖南达到_2_17_152_41', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (407, N'3119d028-b2ce-4d20-a03b-b37429d9ed1c', N'Tom_0_1_18_151_42', N'USA_1_18_151_42', N'USA_1_18_151_42', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (408, N'94cc9de1-9c7f-4975-ad3d-f72b2a7fbc12', N'Tom_0_19_150_43', N'USA_19_150_43', N'USA_19_150_43', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (409, N'020eef2a-1465-497b-acf4-6281dcfab610', N'Peter_0_20_149_44', N'湖南省_20_149_44', N'湖南达到_20_149_44', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (410, N'd91cf336-9ff9-4967-97bb-99d301a4aa8d', N'Jimmy_0_21_148_45', N'江西省广昌县塘方向天要存_21_148_45', N'小地方_21_148_45', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (411, N'4dafbae8-16b4-426d-8744-d758592ceb46', N'Tom_22_147_46', N'USA_22_147_46', N'USA_22_147_46', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (412, N'e126694f-1b70-4f32-a462-c15ae32917a9', N'Peter_23_146_47', N'湖南省_23_146_47', N'湖南达到_23_146_47', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (413, N'ede188c7-cc15-4681-b1af-5b75be1c7860', N'Jimmy_24_145_48', N'江西省广昌县塘方向天要存_24_145_48', N'小地方_24_145_48', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (414, N'bc955632-ee00-414e-945d-6fe51adbcf4f', N'Jimmy_24_1_144_49', N'江西省广昌县塘方向天要存_24_1_144_49', N'小地方_24_1_144_49', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (415, N'e5df48a3-2955-4591-abe4-ae366e3ea002', N'Peter_23_2_143_50', N'湖南省_23_2_143_50', N'湖南达到_23_2_143_50', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (416, N'0495ea1f-bfd1-4196-9d29-ac51526846d8', N'Tom_22_3_142_51', N'USA_22_3_142_51', N'USA_22_3_142_51', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (417, N'7c6774ff-78ab-4c58-9ec8-5e5b34620ffd', N'Jimmy_0_21_4_141_52', N'江西省广昌县塘方向天要存_21_4_141_52', N'小地方_21_4_141_52', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (418, N'8112c745-4544-4ec0-ae87-73f4182f5675', N'Peter_0_20_5_140_53', N'湖南省_20_5_140_53', N'湖南达到_20_5_140_53', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (419, N'00b54b16-e32d-448b-af07-b1753347f417', N'Tom_0_19_6_139_54', N'USA_19_6_139_54', N'USA_19_6_139_54', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (420, N'795c3e08-6c02-4147-b4a1-f769fea22001', N'Tom_0_1_18_7_138_55', N'USA_1_18_7_138_55', N'USA_1_18_7_138_55', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (421, N'e5c74046-af23-4e71-8e48-7df69df436dc', N'Jimmy_0_3_16_9_136_57', N'江西省广昌县塘方向天要存_3_16_9_136_57', N'小地方_3_16_9_136_57', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (422, N'8ebc7255-11ab-45ed-8d1e-7dfbbc53609f', N'Tom_4_15_10_135_58', N'USA_4_15_10_135_58', N'USA_4_15_10_135_58', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (423, N'5c6aedc1-7880-4eef-bafc-f97e44362957', N'Peter_5_14_11_134_59', N'湖南省_5_14_11_134_59', N'湖南达到_5_14_11_134_59', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (424, N'c3dbdd64-9831-44d8-a700-93ba0b396062', N'Jimmy_6_13_12_133_60', N'江西省广昌县塘方向天要存_6_13_12_133_60', N'小地方_6_13_12_133_60', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (425, N'64842f32-00c0-4a27-a1d7-afb6aa69efb0', N'Jimmy_6_1_12_13_132_61', N'江西省广昌县塘方向天要存_6_1_12_13_132_61', N'小地方_6_1_12_13_132_61', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (426, N'614cd6e3-b662-4d7e-8276-2f1d6b459ea9', N'Peter_5_2_11_14_131_62', N'湖南省_5_2_11_14_131_62', N'湖南达到_5_2_11_14_131_62', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (427, N'74affbac-61fb-4b93-b6bc-bd74b8111aa9', N'Tom_4_3_10_15_130_63', N'USA_4_3_10_15_130_63', N'USA_4_3_10_15_130_63', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (428, N'72cf459a-d047-4acd-b4a3-2e7452d9cb45', N'Jimmy_0_3_4_9_16_129_64', N'江西省广昌县塘方向天要存_3_4_9_16_129_64', N'小地方_3_4_9_16_129_64', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (429, N'9aae4251-7372-421d-8e49-ea60c91de9e7', N'Peter_0_2_5_8_17_128_65', N'湖南省_2_5_8_17_128_65', N'湖南达到_2_5_8_17_128_65', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (430, N'0580a182-d762-4932-9080-43675a9033e8', N'Tom_0_1_6_7_18_127_66', N'USA_1_6_7_18_127_66', N'USA_1_6_7_18_127_66', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (431, N'3d4eb654-d65e-4874-9c43-5c6ff2f1e037', N'Tom_0_7_6_19_126_67', N'USA_7_6_19_126_67', N'USA_7_6_19_126_67', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (432, N'e6dc261c-e1c5-4ec7-a55b-5f80b59a3e7e', N'Peter_0_8_5_20_125_68', N'湖南省_8_5_20_125_68', N'湖南达到_8_5_20_125_68', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (433, N'f87b9b86-5125-400f-a5b2-3499cbf2aa8a', N'Jimmy_0_9_4_21_124_69', N'江西省广昌县塘方向天要存_9_4_21_124_69', N'小地方_9_4_21_124_69', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (434, N'8320de41-da46-4ce3-80a1-719c2f9f3aae', N'Tom_10_3_22_123_70', N'USA_10_3_22_123_70', N'USA_10_3_22_123_70', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (435, N'bb6e8976-9d24-4f14-80eb-ef9372d83a24', N'Peter_11_2_23_122_71', N'湖南省_11_2_23_122_71', N'湖南达到_11_2_23_122_71', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (436, N'd61f8934-e074-4814-97ab-c86d0533ca6c', N'Jimmy_12_1_24_121_72', N'江西省广昌县塘方向天要存_12_1_24_121_72', N'小地方_12_1_24_121_72', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (437, N'b001af46-455e-4698-a3c3-ed47c7091980', N'Jimmy_12_25_120_73', N'江西省广昌县塘方向天要存_12_25_120_73', N'小地方_12_25_120_73', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (438, N'55ddbb99-4ef1-443e-aa59-ed1a5a56c32a', N'Peter_11_26_119_74', N'湖南省_11_26_119_74', N'湖南达到_11_26_119_74', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (439, N'd988855f-e014-40a8-9579-3677de53a58c', N'Tom_10_27_118_75', N'USA_10_27_118_75', N'USA_10_27_118_75', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (440, N'f4c1f384-fb34-4623-bee7-98267fa9a70c', N'Jimmy_0_9_28_117_76', N'江西省广昌县塘方向天要存_9_28_117_76', N'小地方_9_28_117_76', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (441, N'6cf39e0d-32da-419f-a6fa-165d1a37e91a', N'Peter_0_8_29_116_77', N'湖南省_8_29_116_77', N'湖南达到_8_29_116_77', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (442, N'f7e13f2b-9b96-4b92-9270-78c87481397a', N'Tom_0_7_30_115_78', N'USA_7_30_115_78', N'USA_7_30_115_78', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (443, N'570cb7c2-c945-44e6-a0d8-122783c08a9e', N'Tom_0_1_6_31_114_79', N'USA_1_6_31_114_79', N'USA_1_6_31_114_79', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (444, N'03215836-78af-42b4-8966-ce87353c73c9', N'Peter_0_2_5_32_113_80', N'湖南省_2_5_32_113_80', N'湖南达到_2_5_32_113_80', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (445, N'59db5520-beb9-4048-8fe8-f11564a72c63', N'Jimmy_0_3_4_33_112_81', N'江西省广昌县塘方向天要存_3_4_33_112_81', N'小地方_3_4_33_112_81', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (446, N'061bda2d-6560-4c61-8d8e-8af0b9c6fb0e', N'Tom_4_3_34_111_82', N'USA_4_3_34_111_82', N'USA_4_3_34_111_82', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (447, N'cd46d86a-d5d3-4547-bbd1-3daa7d2c7171', N'Peter_5_2_35_110_83', N'湖南省_5_2_35_110_83', N'湖南达到_5_2_35_110_83', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (448, N'b66d0448-5ed1-4385-a5c4-db905a719e4c', N'Jimmy_6_1_36_109_84', N'江西省广昌县塘方向天要存_6_1_36_109_84', N'小地方_6_1_36_109_84', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (449, N'37f16f69-31fe-47f4-b345-1730779dc373', N'Jimmy_6_37_108_85', N'江西省广昌县塘方向天要存_6_37_108_85', N'小地方_6_37_108_85', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (450, N'3a85105e-7a0e-4bd9-af26-c6a2caf15f6f', N'Peter_5_38_107_86', N'湖南省_5_38_107_86', N'湖南达到_5_38_107_86', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (451, N'0a8d5275-f14f-470f-ace3-43e7dc62f4f3', N'Tom_4_39_106_87', N'USA_4_39_106_87', N'USA_4_39_106_87', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (452, N'39ad8bac-9704-40dd-ae2f-fde480c1a360', N'Jimmy_0_3_40_105_88', N'江西省广昌县塘方向天要存_3_40_105_88', N'小地方_3_40_105_88', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (453, N'750e078e-a04f-45de-9e0c-58209811ff37', N'Peter_0_2_41_104_89', N'湖南省_2_41_104_89', N'湖南达到_2_41_104_89', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (454, N'9a4daa52-0b71-46d5-b94a-824cfe885d93', N'Tom_0_1_42_103_90', N'USA_1_42_103_90', N'USA_1_42_103_90', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (455, N'4d518af9-607b-4b7a-98c9-05b9b495effa', N'Tom_0_43_102_91', N'USA_43_102_91', N'USA_43_102_91', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (456, N'1e72d0d6-0ae0-4ec4-b1db-7d44c1eddd85', N'Peter_0_44_101_92', N'湖南省_44_101_92', N'湖南达到_44_101_92', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (457, N'dd9f246f-4c3e-48e0-98ac-80ff086a721c', N'Jimmy_0_45_100_93', N'江西省广昌县塘方向天要存_45_100_93', N'小地方_45_100_93', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (458, N'90896635-063f-48af-b9d3-5ceeec20aebb', N'Tom_46_99_94', N'USA_46_99_94', N'USA_46_99_94', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (459, N'7e379c55-e10a-4975-9c26-40b005f97fd9', N'Peter_47_98_95', N'湖南省_47_98_95', N'湖南达到_47_98_95', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (460, N'589f43d2-6b79-4a81-8b2d-8c873e4d582b', N'Jimmy_48_97_96', N'江西省广昌县塘方向天要存_48_97_96', N'小地方_48_97_96', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (461, N'a6c4e6e6-fff7-4178-b801-2824d18813c8', N'Jimmy_48_1_96_97', N'江西省广昌县塘方向天要存_48_1_96_97', N'小地方_48_1_96_97', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (462, N'7efc415d-1cf6-405d-bfef-1b803c5f14b0', N'Peter_47_2_95_98', N'湖南省_47_2_95_98', N'湖南达到_47_2_95_98', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (463, N'0ff8de0b-a345-4433-8adc-772e679e7393', N'Tom_46_3_94_99', N'USA_46_3_94_99', N'USA_46_3_94_99', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (464, N'31879ec8-ff0c-4f10-98fb-5a95992c5762', N'Jimmy_0_45_4_93_100', N'江西省广昌县塘方向天要存_45_4_93_100', N'小地方_45_4_93_100', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (465, N'291cfd28-9f91-47e9-8d3e-62a31123d260', N'Peter_0_44_5_92_101', N'湖南省_44_5_92_101', N'湖南达到_44_5_92_101', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (466, N'5047732e-2f24-4b21-bd1c-f3ef1e21981c', N'Tom_0_43_6_91_102', N'USA_43_6_91_102', N'USA_43_6_91_102', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (467, N'ff9568bc-ee7a-49be-b09f-0854214c771b', N'Tom_0_1_42_7_90_103', N'USA_1_42_7_90_103', N'USA_1_42_7_90_103', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (468, N'56d6548c-7a0f-4f5b-9704-40fad95906bb', N'Peter_0_2_41_8_89_104', N'湖南省_2_41_8_89_104', N'湖南达到_2_41_8_89_104', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (469, N'5187d45d-402b-4b50-b5bc-f753b6a130fd', N'Jimmy_0_3_40_9_88_105', N'江西省广昌县塘方向天要存_3_40_9_88_105', N'小地方_3_40_9_88_105', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (470, N'e90d3472-516a-458a-8b6a-5fd967533503', N'Tom_4_39_10_87_106', N'USA_4_39_10_87_106', N'USA_4_39_10_87_106', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (471, N'533473f6-97e1-4d3a-af1e-9cc46f2b3270', N'Peter_5_38_11_86_107', N'湖南省_5_38_11_86_107', N'湖南达到_5_38_11_86_107', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (472, N'6afb3fe7-f61f-4dfc-996d-7c93d1e02c33', N'Jimmy_6_37_12_85_108', N'江西省广昌县塘方向天要存_6_37_12_85_108', N'小地方_6_37_12_85_108', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (473, N'8a849493-1385-4d51-83d3-059269db5806', N'Jimmy_6_1_36_13_84_109', N'江西省广昌县塘方向天要存_6_1_36_13_84_109', N'小地方_6_1_36_13_84_109', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (474, N'a1f5b493-dbd5-49ea-987e-c8f5d5736a96', N'Peter_5_2_35_14_83_110', N'湖南省_5_2_35_14_83_110', N'湖南达到_5_2_35_14_83_110', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (475, N'c42e9c04-3543-476a-9c03-efadbb9ff3d6', N'Tom_4_3_34_15_82_111', N'USA_4_3_34_15_82_111', N'USA_4_3_34_15_82_111', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (476, N'cf3c2d0a-9425-48f2-a4b7-5cb39495663c', N'Jimmy_0_3_4_33_16_81_112', N'江西省广昌县塘方向天要存_3_4_33_16_81_112', N'小地方_3_4_33_16_81_112', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (477, N'0b008503-0d12-434b-8189-420ff4e55698', N'Peter_0_2_5_32_17_80_113', N'湖南省_2_5_32_17_80_113', N'湖南达到_2_5_32_17_80_113', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (478, N'b5ee3827-f70c-449f-8d87-c377d60e40ae', N'Tom_0_1_6_31_18_79_114', N'USA_1_6_31_18_79_114', N'USA_1_6_31_18_79_114', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (479, N'a6c76255-4b82-46ae-84e3-20553debb9ca', N'Tom_0_7_30_19_78_115', N'USA_7_30_19_78_115', N'USA_7_30_19_78_115', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (480, N'66f16877-5933-4dfa-84d3-c834919d2a20', N'Peter_0_8_29_20_77_116', N'湖南省_8_29_20_77_116', N'湖南达到_8_29_20_77_116', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (481, N'd31ba586-c2fd-4c8f-a0cb-851b7e50690b', N'Jimmy_0_9_28_21_76_117', N'江西省广昌县塘方向天要存_9_28_21_76_117', N'小地方_9_28_21_76_117', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (482, N'2e54f8c1-f780-4773-9c2b-50dfe01a71e8', N'Tom_10_27_22_75_118', N'USA_10_27_22_75_118', N'USA_10_27_22_75_118', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (483, N'bd20fce2-ae6f-438d-9f1c-3da37c41e47c', N'Peter_11_26_23_74_119', N'湖南省_11_26_23_74_119', N'湖南达到_11_26_23_74_119', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (484, N'86d1c982-5eb1-4387-980e-a7735c40f63d', N'Jimmy_12_25_24_73_120', N'江西省广昌县塘方向天要存_12_25_24_73_120', N'小地方_12_25_24_73_120', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (485, N'020108cf-3858-406c-a174-610b513935f7', N'Jimmy_12_1_24_25_72_121', N'江西省广昌县塘方向天要存_12_1_24_25_72_121', N'小地方_12_1_24_25_72_121', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (486, N'91af9d08-f21d-4341-b57f-e11509b0d0be', N'Peter_11_2_23_26_71_122', N'湖南省_11_2_23_26_71_122', N'湖南达到_11_2_23_26_71_122', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (487, N'90271e9d-68b5-4619-8ba4-dccdc7e942a0', N'Tom_10_3_22_27_70_123', N'USA_10_3_22_27_70_123', N'USA_10_3_22_27_70_123', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (488, N'71390247-c3ca-4387-b8a9-7f6a8e171a3d', N'Jimmy_0_9_4_21_28_69_124', N'江西省广昌县塘方向天要存_9_4_21_28_69_124', N'小地方_9_4_21_28_69_124', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (489, N'e144ba72-f6cf-46ea-bbca-691ec1b1cdc1', N'Peter_0_8_5_20_29_68_125', N'湖南省_8_5_20_29_68_125', N'湖南达到_8_5_20_29_68_125', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (490, N'999dd1e5-f57c-419d-90d3-82b5c12ea14b', N'Tom_0_7_6_19_30_67_126', N'USA_7_6_19_30_67_126', N'USA_7_6_19_30_67_126', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (491, N'c86b4bd1-5203-4b9f-9e10-af41887cdab4', N'Tom_0_1_6_7_18_31_66_127', N'USA_1_6_7_18_31_66_127', N'USA_1_6_7_18_31_66_127', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (492, N'f18962ad-3bdd-4ffc-83eb-8af82f5a9e80', N'Peter_0_2_5_8_17_32_65_128', N'湖南省_2_5_8_17_32_65_128', N'湖南达到_2_5_8_17_32_65_128', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (493, N'd21c35e1-a630-452f-a9b3-3c9cbe3680bd', N'Jimmy_0_3_4_9_16_33_64_129', N'江西省广昌县塘方向天要存_3_4_9_16_33_64_129', N'小地方_3_4_9_16_33_64_129', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (494, N'a8ffb436-6540-459e-8c00-ca9d693e0c81', N'Tom_4_3_10_15_34_63_130', N'USA_4_3_10_15_34_63_130', N'USA_4_3_10_15_34_63_130', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (495, N'91c9d07a-9db6-478a-a2ba-4ce0c69cad1e', N'Peter_5_2_11_14_35_62_131', N'湖南省_5_2_11_14_35_62_131', N'湖南达到_5_2_11_14_35_62_131', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (496, N'975e1cc9-0afc-439e-a0b5-2c78852c4e06', N'Jimmy_6_1_12_13_36_61_132', N'江西省广昌县塘方向天要存_6_1_12_13_36_61_132', N'小地方_6_1_12_13_36_61_132', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (497, N'2ba8c41b-ea45-451f-9905-0c54e544b432', N'Jimmy_6_13_12_37_60_133', N'江西省广昌县塘方向天要存_6_13_12_37_60_133', N'小地方_6_13_12_37_60_133', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (498, N'9868d558-22e4-48a2-93e6-2a6fa79bf42e', N'Peter_5_14_11_38_59_134', N'湖南省_5_14_11_38_59_134', N'湖南达到_5_14_11_38_59_134', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (499, N'd7aebb10-3b1e-4d45-ad8e-bce11a6df2e5', N'Tom_4_15_10_39_58_135', N'USA_4_15_10_39_58_135', N'USA_4_15_10_39_58_135', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (500, N'76eb3a39-1690-4894-a5c6-1f433a133ebe', N'Jimmy_0_3_16_9_40_57_136', N'江西省广昌县塘方向天要存_3_16_9_40_57_136', N'小地方_3_16_9_40_57_136', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (501, N'd10b2e8b-0a17-4630-ab86-2d97aab1b60d', N'Peter_0_2_17_8_41_56_137', N'湖南省_2_17_8_41_56_137', N'湖南达到_2_17_8_41_56_137', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (502, N'fd2a3453-9a34-4783-83f1-cf0042088cb4', N'Tom_0_1_18_7_42_55_138', N'USA_1_18_7_42_55_138', N'USA_1_18_7_42_55_138', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (503, N'555dda7e-3e0f-46bd-a564-5408bf144b6d', N'Tom_0_19_6_43_54_139', N'USA_19_6_43_54_139', N'USA_19_6_43_54_139', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (504, N'1dc9b787-ab2f-4d66-a01b-3c6420101d55', N'Peter_0_20_5_44_53_140', N'湖南省_20_5_44_53_140', N'湖南达到_20_5_44_53_140', 0, CAST(0x0000A3C100E75F17 AS DateTime))
GO
print 'Processed 500 total records'
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (505, N'3675aac6-3db5-40ea-8aac-f68689e95680', N'Jimmy_0_21_4_45_52_141', N'江西省广昌县塘方向天要存_21_4_45_52_141', N'小地方_21_4_45_52_141', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (506, N'ac2a8d47-de05-4687-b931-9d2688264cda', N'Tom_22_3_46_51_142', N'USA_22_3_46_51_142', N'USA_22_3_46_51_142', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (507, N'c06a3cd6-a17a-4846-86bc-19544bcef368', N'Peter_23_2_47_50_143', N'湖南省_23_2_47_50_143', N'湖南达到_23_2_47_50_143', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (508, N'f5a6b124-4e29-4a64-8f34-643bf66d245c', N'Jimmy_24_1_48_49_144', N'江西省广昌县塘方向天要存_24_1_48_49_144', N'小地方_24_1_48_49_144', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (509, N'8046ee30-e806-46e0-9676-5ca6901db85e', N'Jimmy_24_49_48_145', N'江西省广昌县塘方向天要存_24_49_48_145', N'小地方_24_49_48_145', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (510, N'334faffc-8709-418b-a449-cae1a98badb7', N'Peter_23_50_47_146', N'湖南省_23_50_47_146', N'湖南达到_23_50_47_146', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (511, N'19749a40-2888-40c0-be45-69dab43cb5fb', N'Tom_22_51_46_147', N'USA_22_51_46_147', N'USA_22_51_46_147', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (512, N'e0f4b972-07db-4131-bd31-3cae4e60fed9', N'Jimmy_0_21_52_45_148', N'江西省广昌县塘方向天要存_21_52_45_148', N'小地方_21_52_45_148', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (513, N'ec180537-f63b-4483-a187-14526c4b16f8', N'Peter_0_20_53_44_149', N'湖南省_20_53_44_149', N'湖南达到_20_53_44_149', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (514, N'e820c45c-a522-4dff-826e-9fd7ded9b76b', N'Tom_0_19_54_43_150', N'USA_19_54_43_150', N'USA_19_54_43_150', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (515, N'ad92b2a3-8561-4e5a-9bc8-a6e58cb4a033', N'Tom_0_1_18_55_42_151', N'USA_1_18_55_42_151', N'USA_1_18_55_42_151', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (516, N'e5cda00e-d383-4b35-93c3-b0277d1b48bd', N'Peter_0_2_17_56_41_152', N'湖南省_2_17_56_41_152', N'湖南达到_2_17_56_41_152', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (517, N'87016ede-b7d4-4526-ae5e-8e53f8801ed6', N'Jimmy_0_3_16_57_40_153', N'江西省广昌县塘方向天要存_3_16_57_40_153', N'小地方_3_16_57_40_153', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (518, N'b73a7f8e-471d-4bfa-8ab6-955f2270efdc', N'Tom_4_15_58_39_154', N'USA_4_15_58_39_154', N'USA_4_15_58_39_154', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (519, N'51e713fa-4393-4e07-b8f1-44555d993899', N'Peter_5_14_59_38_155', N'湖南省_5_14_59_38_155', N'湖南达到_5_14_59_38_155', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (520, N'556c5628-db61-4924-ad4c-7e05131cb998', N'Jimmy_6_13_60_37_156', N'江西省广昌县塘方向天要存_6_13_60_37_156', N'小地方_6_13_60_37_156', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (521, N'bacf40f8-36a9-4929-a828-77b3b9eaea80', N'Jimmy_6_1_12_61_36_157', N'江西省广昌县塘方向天要存_6_1_12_61_36_157', N'小地方_6_1_12_61_36_157', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (522, N'e9f668df-023d-4f2c-b888-33913dce14fb', N'Peter_5_2_11_62_35_158', N'湖南省_5_2_11_62_35_158', N'湖南达到_5_2_11_62_35_158', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (523, N'b80715e6-b100-421c-aba5-beb934149050', N'Tom_4_3_10_63_34_159', N'USA_4_3_10_63_34_159', N'USA_4_3_10_63_34_159', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (524, N'78f8ac4a-82e0-4484-86c3-6cf710b043e5', N'Jimmy_0_3_4_9_64_33_160', N'江西省广昌县塘方向天要存_3_4_9_64_33_160', N'小地方_3_4_9_64_33_160', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (525, N'ab4c7000-25e9-41e9-993a-19c34346362c', N'Peter_0_2_5_8_65_32_161', N'湖南省_2_5_8_65_32_161', N'湖南达到_2_5_8_65_32_161', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (526, N'97f51a52-498e-4abe-a8b5-3194d1719af8', N'Tom_0_1_6_7_66_31_162', N'USA_1_6_7_66_31_162', N'USA_1_6_7_66_31_162', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (527, N'454ce2b2-bca6-4c1b-b561-1d7acaae248c', N'Tom_0_7_6_67_30_163', N'USA_7_6_67_30_163', N'USA_7_6_67_30_163', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (528, N'b6050f54-1042-4a63-abb5-e08c040c2a69', N'Peter_0_8_5_68_29_164', N'湖南省_8_5_68_29_164', N'湖南达到_8_5_68_29_164', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (529, N'a98a2855-ac83-4cc0-a838-dc2946f63e04', N'Jimmy_0_9_4_69_28_165', N'江西省广昌县塘方向天要存_9_4_69_28_165', N'小地方_9_4_69_28_165', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (530, N'0cb9c272-5bca-4a25-8383-59a2709f075f', N'Tom_10_3_70_27_166', N'USA_10_3_70_27_166', N'USA_10_3_70_27_166', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (531, N'005efe57-4b95-40f1-baeb-ce86da6014ac', N'Peter_11_2_71_26_167', N'湖南省_11_2_71_26_167', N'湖南达到_11_2_71_26_167', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (532, N'5b17763f-28bc-46aa-ac84-85d663cbfb53', N'Jimmy_12_1_72_25_168', N'江西省广昌县塘方向天要存_12_1_72_25_168', N'小地方_12_1_72_25_168', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (533, N'2522f4aa-00fe-46af-ab37-2ef2b5d41a57', N'Jimmy_12_73_24_169', N'江西省广昌县塘方向天要存_12_73_24_169', N'小地方_12_73_24_169', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (534, N'd059d22e-7b11-41ff-b036-3a950057012c', N'Peter_11_74_23_170', N'湖南省_11_74_23_170', N'湖南达到_11_74_23_170', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (535, N'8c2a07ae-69be-4fe5-a19f-cec6baec41a7', N'Tom_10_75_22_171', N'USA_10_75_22_171', N'USA_10_75_22_171', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (536, N'a52a192f-4f1e-4536-b413-2298c8866b9a', N'Jimmy_0_9_76_21_172', N'江西省广昌县塘方向天要存_9_76_21_172', N'小地方_9_76_21_172', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (537, N'ca9752fb-fa8d-4473-9bd2-dcc545a31456', N'Peter_0_8_77_20_173', N'湖南省_8_77_20_173', N'湖南达到_8_77_20_173', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (538, N'a1aeb31f-b99d-4307-81d6-11538b4597e4', N'Tom_0_7_78_19_174', N'USA_7_78_19_174', N'USA_7_78_19_174', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (539, N'3f3298ec-a065-40e0-8172-4aa3d66659d0', N'Tom_0_1_6_79_18_175', N'USA_1_6_79_18_175', N'USA_1_6_79_18_175', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (540, N'8b6d09e6-9d2a-4ba7-a5eb-5ed5a2d8f6fc', N'Peter_0_2_5_80_17_176', N'湖南省_2_5_80_17_176', N'湖南达到_2_5_80_17_176', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (541, N'c4e5a6fa-eb7e-41e8-ad37-eb5c76e8c107', N'Jimmy_0_3_4_81_16_177', N'江西省广昌县塘方向天要存_3_4_81_16_177', N'小地方_3_4_81_16_177', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (542, N'1bedd744-f096-4e8e-a44b-78ff5906fa84', N'Tom_4_3_82_15_178', N'USA_4_3_82_15_178', N'USA_4_3_82_15_178', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (543, N'b21e8342-2e47-4ed8-994c-1d0c94e8460c', N'Peter_5_2_83_14_179', N'湖南省_5_2_83_14_179', N'湖南达到_5_2_83_14_179', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (544, N'cc8bc62e-b0eb-494c-8406-0c4f334b7d78', N'Jimmy_6_1_84_13_180', N'江西省广昌县塘方向天要存_6_1_84_13_180', N'小地方_6_1_84_13_180', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (545, N'c9932923-d6c0-4e3d-9d02-c109de228da1', N'Jimmy_6_85_12_181', N'江西省广昌县塘方向天要存_6_85_12_181', N'小地方_6_85_12_181', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (546, N'24683cda-91dc-4ad0-a9c1-00b6d837fc2e', N'Peter_5_86_11_182', N'湖南省_5_86_11_182', N'湖南达到_5_86_11_182', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (547, N'cbbd4344-0ba2-4306-abce-1dfbb16eaccd', N'Tom_4_87_10_183', N'USA_4_87_10_183', N'USA_4_87_10_183', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (548, N'86e37379-d984-4cac-9bc5-e03fc2e5c831', N'Jimmy_0_3_88_9_184', N'江西省广昌县塘方向天要存_3_88_9_184', N'小地方_3_88_9_184', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (549, N'541adb41-c1b5-4efd-94e4-cb56fc1e7397', N'Peter_0_2_89_8_185', N'湖南省_2_89_8_185', N'湖南达到_2_89_8_185', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (550, N'e628eb15-f1d7-4c0a-be11-78140115619f', N'Tom_0_1_90_7_186', N'USA_1_90_7_186', N'USA_1_90_7_186', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (551, N'b481fc99-4b00-4bae-995c-6c99decf617e', N'Tom_0_91_6_187', N'USA_91_6_187', N'USA_91_6_187', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (552, N'7d5e0074-be42-4a74-a064-812357e04d20', N'Peter_0_92_5_188', N'湖南省_92_5_188', N'湖南达到_92_5_188', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (553, N'25c615d1-db19-4e3c-b64d-95f8da6da70a', N'Jimmy_0_93_4_189', N'江西省广昌县塘方向天要存_93_4_189', N'小地方_93_4_189', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (554, N'2be6cb70-67a5-4fbc-a7d7-a3c351de5f98', N'Tom_94_3_190', N'USA_94_3_190', N'USA_94_3_190', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (555, N'9e07ae58-c14a-47e0-892e-c3ff92001a99', N'Peter_95_2_191', N'湖南省_95_2_191', N'湖南达到_95_2_191', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (556, N'd097b391-fa92-4958-a255-ca2444f62fe0', N'Jimmy_96_1_192', N'江西省广昌县塘方向天要存_96_1_192', N'小地方_96_1_192', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (557, N'0748e070-11e8-4702-b07b-4e1d3a9b33ff', N'Jimmy_96_193', N'江西省广昌县塘方向天要存_96_193', N'小地方_96_193', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (558, N'22502b2e-ee2b-4565-8e77-6819ce1783e1', N'Peter_95_194', N'湖南省_95_194', N'湖南达到_95_194', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (559, N'53967709-0065-4787-9480-d1989ee9e2a8', N'Tom_94_195', N'USA_94_195', N'USA_94_195', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (560, N'f992ee07-508f-49a7-b094-fc629350c620', N'Jimmy_0_93_196', N'江西省广昌县塘方向天要存_93_196', N'小地方_93_196', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (561, N'4d7a7b97-02ac-43b2-b2ad-b9e2fb3ab91b', N'Peter_0_92_197', N'湖南省_92_197', N'湖南达到_92_197', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (562, N'47c2ca92-715a-4112-9862-d533fdb0c494', N'Tom_0_91_198', N'USA_91_198', N'USA_91_198', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (563, N'c8a89985-dba6-475a-a9fc-8db89472d0aa', N'Tom_0_1_90_199', N'USA_1_90_199', N'USA_1_90_199', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (564, N'8925c9fe-f3e4-4bb9-8084-d6ac5c10837b', N'Peter_0_2_89_200', N'湖南省_2_89_200', N'湖南达到_2_89_200', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (565, N'4b2ad1d5-4db4-4b25-a4de-347437f9d89f', N'Jimmy_0_3_88_201', N'江西省广昌县塘方向天要存_3_88_201', N'小地方_3_88_201', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (566, N'ff273e25-05f2-4d7e-87fa-3444c0768308', N'Tom_4_87_202', N'USA_4_87_202', N'USA_4_87_202', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (567, N'466294e7-2bf7-4e1b-b994-dc3babd57784', N'Peter_5_86_203', N'湖南省_5_86_203', N'湖南达到_5_86_203', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (568, N'b734ad76-a1f8-41e8-b1a3-61c576b7c05d', N'Jimmy_6_85_204', N'江西省广昌县塘方向天要存_6_85_204', N'小地方_6_85_204', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (569, N'a46f0911-d380-4d07-90b7-cfafde5e81bf', N'Jimmy_6_1_84_205', N'江西省广昌县塘方向天要存_6_1_84_205', N'小地方_6_1_84_205', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (570, N'b6856052-3d12-4a55-b8d7-1bfdb9f2b6eb', N'Peter_5_2_83_206', N'湖南省_5_2_83_206', N'湖南达到_5_2_83_206', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (571, N'2eb6a312-0cd0-43e0-858e-62d01ae8d3bd', N'Tom_4_3_82_207', N'USA_4_3_82_207', N'USA_4_3_82_207', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (572, N'8e992093-57fc-4244-8780-2dd697ab692d', N'Jimmy_0_3_4_81_208', N'江西省广昌县塘方向天要存_3_4_81_208', N'小地方_3_4_81_208', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (573, N'7c4bb8fc-48d0-42ad-9733-204a0becf80e', N'Peter_0_2_5_80_209', N'湖南省_2_5_80_209', N'湖南达到_2_5_80_209', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (574, N'a342e266-287d-4776-8aa1-1ff97b18f2f0', N'Tom_0_1_6_79_210', N'USA_1_6_79_210', N'USA_1_6_79_210', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (575, N'8502fb26-1650-41f9-aa8c-606861266383', N'Tom_0_7_78_211', N'USA_7_78_211', N'USA_7_78_211', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (576, N'cc6e221f-f115-4449-94dc-f9bb33968ea1', N'Peter_0_8_77_212', N'湖南省_8_77_212', N'湖南达到_8_77_212', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (577, N'8166001c-eda2-4d86-b74d-2415e97a008c', N'Jimmy_0_9_76_213', N'江西省广昌县塘方向天要存_9_76_213', N'小地方_9_76_213', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (578, N'84fb2a06-65ed-41fd-9f0f-d643823d0d3e', N'Tom_10_75_214', N'USA_10_75_214', N'USA_10_75_214', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (579, N'5afa6ef1-993e-4dbd-b7d7-d62b305806ba', N'Peter_11_74_215', N'湖南省_11_74_215', N'湖南达到_11_74_215', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (580, N'dde640f1-1313-47f3-b05d-1215807f343c', N'Jimmy_12_73_216', N'江西省广昌县塘方向天要存_12_73_216', N'小地方_12_73_216', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (581, N'983beafb-e066-42c2-a7a2-dd66627fd3b3', N'Jimmy_12_1_72_217', N'江西省广昌县塘方向天要存_12_1_72_217', N'小地方_12_1_72_217', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (582, N'c4d1183e-260a-4bd1-8a6b-e12f57169fed', N'Peter_11_2_71_218', N'湖南省_11_2_71_218', N'湖南达到_11_2_71_218', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (583, N'a05ec55e-41f8-4a20-8fa3-ad03b1a47dbe', N'Tom_10_3_70_219', N'USA_10_3_70_219', N'USA_10_3_70_219', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (584, N'651080f9-2ddd-4515-8d7e-f1a756c992e9', N'Jimmy_0_9_4_69_220', N'江西省广昌县塘方向天要存_9_4_69_220', N'小地方_9_4_69_220', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (585, N'c91f3bbb-5f9e-4a44-8324-8c4f1268e646', N'Peter_0_8_5_68_221', N'湖南省_8_5_68_221', N'湖南达到_8_5_68_221', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (586, N'11edf943-3fb5-45f1-ad03-5693280fe4d5', N'Tom_0_7_6_67_222', N'USA_7_6_67_222', N'USA_7_6_67_222', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (587, N'3d708bd1-d2c1-4084-85a2-1397dc66dfef', N'Tom_0_1_6_7_66_223', N'USA_1_6_7_66_223', N'USA_1_6_7_66_223', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (588, N'76dec6b2-77c3-4914-85b3-2c7cbedd2cd2', N'Peter_0_2_5_8_65_224', N'湖南省_2_5_8_65_224', N'湖南达到_2_5_8_65_224', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (589, N'530b1656-0081-477b-92bb-98a13431dbef', N'Jimmy_0_3_4_9_64_225', N'江西省广昌县塘方向天要存_3_4_9_64_225', N'小地方_3_4_9_64_225', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (590, N'50b736a7-ffeb-419f-b397-e41eae233a70', N'Tom_4_3_10_63_226', N'USA_4_3_10_63_226', N'USA_4_3_10_63_226', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (591, N'2b51a3ca-18f9-4fa1-ad50-bc7ec9ffb581', N'Peter_5_2_11_62_227', N'湖南省_5_2_11_62_227', N'湖南达到_5_2_11_62_227', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (592, N'8bc08844-87f9-4f68-935c-410b360d2b4b', N'Jimmy_6_1_12_61_228', N'江西省广昌县塘方向天要存_6_1_12_61_228', N'小地方_6_1_12_61_228', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (593, N'3f4fa453-321e-440a-9783-111ca6f8f5ef', N'Jimmy_6_13_60_229', N'江西省广昌县塘方向天要存_6_13_60_229', N'小地方_6_13_60_229', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (594, N'9fb40365-0dbb-4114-9bab-6793feb242d7', N'Peter_5_14_59_230', N'湖南省_5_14_59_230', N'湖南达到_5_14_59_230', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (595, N'8c2ec780-e242-4ce5-bcf6-91727cb1ab02', N'Tom_4_15_58_231', N'USA_4_15_58_231', N'USA_4_15_58_231', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (596, N'0fa2112f-ba53-49de-9a44-4ed3e078e2b2', N'Jimmy_0_3_16_57_232', N'江西省广昌县塘方向天要存_3_16_57_232', N'小地方_3_16_57_232', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (597, N'fa61eff5-e563-4934-b3fb-c6f25c666cd7', N'Peter_0_2_17_56_233', N'湖南省_2_17_56_233', N'湖南达到_2_17_56_233', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (598, N'2b3c96d6-fa61-4bae-9b73-2fe68bf5213e', N'Tom_0_1_18_55_234', N'USA_1_18_55_234', N'USA_1_18_55_234', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (599, N'ff568f66-e3b8-4a7d-80cc-2d545c120532', N'Tom_0_19_54_235', N'USA_19_54_235', N'USA_19_54_235', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (600, N'3fc7d1c7-48b8-400b-ad0f-74d8c13ee6ec', N'Peter_0_20_53_236', N'湖南省_20_53_236', N'湖南达到_20_53_236', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (601, N'2b6cd86c-ffe8-43a6-8204-bcee4335cb19', N'Jimmy_0_21_52_237', N'江西省广昌县塘方向天要存_21_52_237', N'小地方_21_52_237', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (602, N'29ea1beb-e0f4-451d-adb2-f6c56c18c10e', N'Tom_22_51_238', N'USA_22_51_238', N'USA_22_51_238', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (603, N'b5bff957-bf6b-41ff-a6f7-eeb3ffb3005b', N'Peter_23_50_239', N'湖南省_23_50_239', N'湖南达到_23_50_239', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (604, N'817e7d73-9ea8-4ed3-b47d-305c67e710c8', N'Jimmy_24_49_240', N'江西省广昌县塘方向天要存_24_49_240', N'小地方_24_49_240', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (605, N'c85a6297-84ec-4618-9c5f-3a9b3b6b0c6d', N'Jimmy_24_1_48_241', N'江西省广昌县塘方向天要存_24_1_48_241', N'小地方_24_1_48_241', 0, CAST(0x0000A3C100E75F17 AS DateTime))
GO
print 'Processed 600 total records'
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (606, N'4a2b3aea-29e7-4ac1-bd09-d0b39f76b241', N'Peter_23_2_47_242', N'湖南省_23_2_47_242', N'湖南达到_23_2_47_242', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (607, N'1a51d357-fb10-4c1d-835e-12464b376c4b', N'Tom_22_3_46_243', N'USA_22_3_46_243', N'USA_22_3_46_243', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (608, N'72d4e79e-9d55-4572-9208-7b4618720715', N'Jimmy_0_21_4_45_244', N'江西省广昌县塘方向天要存_21_4_45_244', N'小地方_21_4_45_244', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (609, N'2019d8ec-8bd5-4417-a6d8-9f7545bea017', N'Peter_0_20_5_44_245', N'湖南省_20_5_44_245', N'湖南达到_20_5_44_245', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (610, N'91d85c77-892b-4ad8-8896-60ff7cc03916', N'Tom_0_19_6_43_246', N'USA_19_6_43_246', N'USA_19_6_43_246', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (611, N'5516bdc8-27ed-4c6c-9455-7c43d4f6a875', N'Tom_0_1_18_7_42_247', N'USA_1_18_7_42_247', N'USA_1_18_7_42_247', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (612, N'a346c8da-aa1a-492c-84b5-526e589838b0', N'Peter_0_2_17_8_41_248', N'湖南省_2_17_8_41_248', N'湖南达到_2_17_8_41_248', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (613, N'74797057-eba4-43fd-842e-45f9080127a6', N'Jimmy_0_3_16_9_40_249', N'江西省广昌县塘方向天要存_3_16_9_40_249', N'小地方_3_16_9_40_249', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (614, N'5fd9d89f-eb35-4f1f-b15a-a68093c4f1d1', N'Tom_4_15_10_39_250', N'USA_4_15_10_39_250', N'USA_4_15_10_39_250', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (615, N'455ba331-2bd1-4dc0-afa6-7206cbe2f369', N'Peter_5_14_11_38_251', N'湖南省_5_14_11_38_251', N'湖南达到_5_14_11_38_251', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (616, N'c96461fc-7963-4b99-872c-9b6537604690', N'Jimmy_6_13_12_37_252', N'江西省广昌县塘方向天要存_6_13_12_37_252', N'小地方_6_13_12_37_252', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (617, N'4542afc4-3aad-42a6-a8f9-bb2572155dbf', N'Jimmy_6_1_12_13_36_253', N'江西省广昌县塘方向天要存_6_1_12_13_36_253', N'小地方_6_1_12_13_36_253', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (618, N'd5b4ef0d-2e67-4aed-a3c9-b1de630a60da', N'Peter_5_2_11_14_35_254', N'湖南省_5_2_11_14_35_254', N'湖南达到_5_2_11_14_35_254', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (619, N'e104fa78-3aaf-47f9-9b1a-fe5326e78840', N'Tom_4_3_10_15_34_255', N'USA_4_3_10_15_34_255', N'USA_4_3_10_15_34_255', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (620, N'53678575-bd26-424b-aaf2-8064862a5321', N'Jimmy_0_3_4_9_16_33_256', N'江西省广昌县塘方向天要存_3_4_9_16_33_256', N'小地方_3_4_9_16_33_256', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (621, N'cf40625d-e10d-4763-8f39-57c62c7ef363', N'Peter_0_2_5_8_17_32_257', N'湖南省_2_5_8_17_32_257', N'湖南达到_2_5_8_17_32_257', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (622, N'ac65979e-674f-4128-86e0-4eec746ac71e', N'Tom_0_1_6_7_18_31_258', N'USA_1_6_7_18_31_258', N'USA_1_6_7_18_31_258', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (623, N'8ee5570c-6f76-4b9e-a98b-621e1110cd51', N'Tom_0_7_6_19_30_259', N'USA_7_6_19_30_259', N'USA_7_6_19_30_259', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (624, N'ae350da9-4ded-43cd-8357-8cc5dbe06407', N'Peter_0_8_5_20_29_260', N'湖南省_8_5_20_29_260', N'湖南达到_8_5_20_29_260', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (625, N'b79ffc7a-ab28-4a36-9ec5-21b64b754a3a', N'Jimmy_0_9_4_21_28_261', N'江西省广昌县塘方向天要存_9_4_21_28_261', N'小地方_9_4_21_28_261', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (626, N'd0956f77-ed24-460b-b677-b36c94f5b6a6', N'Tom_10_3_22_27_262', N'USA_10_3_22_27_262', N'USA_10_3_22_27_262', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (627, N'03994c1f-76f5-4e8d-9709-cfd3215b8545', N'Peter_11_2_23_26_263', N'湖南省_11_2_23_26_263', N'湖南达到_11_2_23_26_263', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (628, N'87741d26-3260-4486-9135-12f08a6dbfa0', N'Jimmy_12_1_24_25_264', N'江西省广昌县塘方向天要存_12_1_24_25_264', N'小地方_12_1_24_25_264', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (629, N'44d628d4-4c57-4bb7-b748-30713312eb50', N'Jimmy_12_25_24_265', N'江西省广昌县塘方向天要存_12_25_24_265', N'小地方_12_25_24_265', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (630, N'bfd6842c-59ac-4a8b-97d6-d58c9d143e94', N'Peter_11_26_23_266', N'湖南省_11_26_23_266', N'湖南达到_11_26_23_266', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (631, N'8932c0b8-4385-4110-ab5e-8a7957279fcf', N'Tom_10_27_22_267', N'USA_10_27_22_267', N'USA_10_27_22_267', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (632, N'f0e12013-6be5-41f4-b1dc-c3cfddac295f', N'Jimmy_0_9_28_21_268', N'江西省广昌县塘方向天要存_9_28_21_268', N'小地方_9_28_21_268', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (633, N'94c01e75-7bf9-4e0a-82c2-e2aed7045451', N'Peter_0_8_29_20_269', N'湖南省_8_29_20_269', N'湖南达到_8_29_20_269', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (634, N'91dc0d41-587c-4cba-8ca1-48d33ca1abd6', N'Tom_0_7_30_19_270', N'USA_7_30_19_270', N'USA_7_30_19_270', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (635, N'37a218c4-28ed-4104-8747-c8b93ad0b6af', N'Tom_0_1_6_31_18_271', N'USA_1_6_31_18_271', N'USA_1_6_31_18_271', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (636, N'8d81f577-8d78-4ccd-a1ae-9345fd326946', N'Peter_0_2_5_32_17_272', N'湖南省_2_5_32_17_272', N'湖南达到_2_5_32_17_272', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (637, N'ba98d9de-4279-4fcb-a355-1c3957838183', N'Jimmy_0_3_4_33_16_273', N'江西省广昌县塘方向天要存_3_4_33_16_273', N'小地方_3_4_33_16_273', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (638, N'c1addc22-4f17-4179-868e-586aeb530b68', N'Tom_4_3_34_15_274', N'USA_4_3_34_15_274', N'USA_4_3_34_15_274', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (639, N'46657cf8-1da4-43cc-9f76-8b3981be57a4', N'Peter_5_2_35_14_275', N'湖南省_5_2_35_14_275', N'湖南达到_5_2_35_14_275', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (640, N'7c78b695-947d-4374-a5dc-c3adbcc1a973', N'Jimmy_6_1_36_13_276', N'江西省广昌县塘方向天要存_6_1_36_13_276', N'小地方_6_1_36_13_276', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (641, N'dc0ea11a-7289-4924-8524-6327a658e5b1', N'Jimmy_6_37_12_277', N'江西省广昌县塘方向天要存_6_37_12_277', N'小地方_6_37_12_277', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (642, N'250893be-fb66-48a3-a77f-39860a454576', N'Peter_5_38_11_278', N'湖南省_5_38_11_278', N'湖南达到_5_38_11_278', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (643, N'097c7976-5f33-4b5f-801b-050aaaf4d973', N'Tom_4_39_10_279', N'USA_4_39_10_279', N'USA_4_39_10_279', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (644, N'2d27bd13-1a6d-471b-a533-999e64ca5d27', N'Jimmy_0_3_40_9_280', N'江西省广昌县塘方向天要存_3_40_9_280', N'小地方_3_40_9_280', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (645, N'f2331cfc-c8e8-4146-b7fd-0159e2e317e5', N'Peter_0_2_41_8_281', N'湖南省_2_41_8_281', N'湖南达到_2_41_8_281', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (646, N'f0dabf30-7d92-4ef1-8741-52f578607885', N'Tom_0_1_42_7_282', N'USA_1_42_7_282', N'USA_1_42_7_282', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (647, N'2e23e966-dd51-4778-aec7-1675cd66d6e1', N'Tom_0_43_6_283', N'USA_43_6_283', N'USA_43_6_283', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (648, N'e6463474-b673-4212-a44a-c1966331dd63', N'Peter_0_44_5_284', N'湖南省_44_5_284', N'湖南达到_44_5_284', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (649, N'fdf9bc6c-30bd-40d3-8120-19a3de363021', N'Jimmy_0_45_4_285', N'江西省广昌县塘方向天要存_45_4_285', N'小地方_45_4_285', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (650, N'93da1979-16a5-4a3b-805c-029d78447f73', N'Tom_46_3_286', N'USA_46_3_286', N'USA_46_3_286', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (651, N'e1301857-2b02-44ff-93bf-d117d78a551d', N'Peter_47_2_287', N'湖南省_47_2_287', N'湖南达到_47_2_287', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (652, N'16ca8b1a-411d-46c5-abc9-f1f6d538c681', N'Jimmy_48_1_288', N'江西省广昌县塘方向天要存_48_1_288', N'小地方_48_1_288', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (653, N'2cc37846-4a1b-4f21-80e5-a64785dacd5a', N'Jimmy_48_289', N'江西省广昌县塘方向天要存_48_289', N'小地方_48_289', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (654, N'641b1484-8da9-47d7-bd38-dff29433099d', N'Peter_47_290', N'湖南省_47_290', N'湖南达到_47_290', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (655, N'e4101a49-849a-4b8d-b6c5-2d8f92b6da74', N'Tom_46_291', N'USA_46_291', N'USA_46_291', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (656, N'237f100e-a4e1-4583-9a50-c66fcd907736', N'Jimmy_0_45_292', N'江西省广昌县塘方向天要存_45_292', N'小地方_45_292', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (657, N'10ca5a5b-f41b-4569-950f-22a69eae5cc5', N'Peter_0_44_293', N'湖南省_44_293', N'湖南达到_44_293', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (658, N'0dca5ad3-2344-4432-ac06-e48a2a5de652', N'Tom_0_43_294', N'USA_43_294', N'USA_43_294', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (659, N'ca08c145-dbfe-4a36-86a0-c97eb441a992', N'Tom_0_1_42_295', N'USA_1_42_295', N'USA_1_42_295', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (660, N'e9f9ffd7-0dd5-4314-af18-fea1d1e8db91', N'Peter_0_2_41_296', N'湖南省_2_41_296', N'湖南达到_2_41_296', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (661, N'7cea6ca4-c1e2-4c64-8aba-33926395552e', N'Jimmy_0_3_40_297', N'江西省广昌县塘方向天要存_3_40_297', N'小地方_3_40_297', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (662, N'd466d670-540c-48a7-95f7-9119a907ddb3', N'Tom_4_39_298', N'USA_4_39_298', N'USA_4_39_298', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (663, N'b870e76d-ff4b-4b67-9e2d-6643ff6f11b4', N'Peter_5_38_299', N'湖南省_5_38_299', N'湖南达到_5_38_299', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (664, N'3374a47a-24f1-4bb7-bebc-18ecece5ad19', N'Jimmy_6_37_300', N'江西省广昌县塘方向天要存_6_37_300', N'小地方_6_37_300', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (665, N'f0c9dd02-0a3d-4c06-b637-8b21bede1aae', N'Jimmy_6_1_36_301', N'江西省广昌县塘方向天要存_6_1_36_301', N'小地方_6_1_36_301', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (666, N'437a53e1-ae20-4324-acd8-7d8460fc1e57', N'Peter_5_2_35_302', N'湖南省_5_2_35_302', N'湖南达到_5_2_35_302', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (667, N'6c2475ed-9b12-4cd0-b8a6-ce6af2910696', N'Tom_4_3_34_303', N'USA_4_3_34_303', N'USA_4_3_34_303', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (668, N'1ee6ad69-680a-4230-8e76-b78e41abde10', N'Jimmy_0_3_4_33_304', N'江西省广昌县塘方向天要存_3_4_33_304', N'小地方_3_4_33_304', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (669, N'e11cedf4-e66b-4054-835e-e3e02cb0879d', N'Peter_0_2_5_32_305', N'湖南省_2_5_32_305', N'湖南达到_2_5_32_305', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (670, N'240e0280-10b6-4d95-96ef-0196764a362c', N'Tom_0_1_6_31_306', N'USA_1_6_31_306', N'USA_1_6_31_306', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (671, N'0a997a17-8e35-46cd-b389-1caf6a1447e6', N'Tom_0_7_30_307', N'USA_7_30_307', N'USA_7_30_307', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (672, N'79975214-07d4-4f70-b688-fd02f82c0edc', N'Peter_0_8_29_308', N'湖南省_8_29_308', N'湖南达到_8_29_308', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (673, N'd006b5ab-82e4-4a60-840a-6f46840303fc', N'Jimmy_0_9_28_309', N'江西省广昌县塘方向天要存_9_28_309', N'小地方_9_28_309', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (674, N'c4afd588-7ebe-4195-98c9-1378fea3427b', N'Tom_10_27_310', N'USA_10_27_310', N'USA_10_27_310', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (675, N'8a1d226a-59c2-464f-892a-bac90159506e', N'Peter_11_26_311', N'湖南省_11_26_311', N'湖南达到_11_26_311', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (676, N'c9866856-0429-4ece-945b-e99a6195ee48', N'Jimmy_12_25_312', N'江西省广昌县塘方向天要存_12_25_312', N'小地方_12_25_312', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (677, N'cbe6156c-1134-4852-b32f-6cc36c2d0cf0', N'Jimmy_12_1_24_313', N'江西省广昌县塘方向天要存_12_1_24_313', N'小地方_12_1_24_313', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (678, N'77109068-d3a6-4ad9-af34-65ec884bf3d8', N'Peter_11_2_23_314', N'湖南省_11_2_23_314', N'湖南达到_11_2_23_314', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (679, N'edad6805-803b-4e0e-bd04-2f315d39026b', N'Tom_10_3_22_315', N'USA_10_3_22_315', N'USA_10_3_22_315', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (680, N'1b0d4d17-fa25-4688-8e0f-1109a7bc87d0', N'Jimmy_0_9_4_21_316', N'江西省广昌县塘方向天要存_9_4_21_316', N'小地方_9_4_21_316', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (681, N'cdb9224c-21bc-4ecf-b180-5ff584c69a7c', N'Peter_0_8_5_20_317', N'湖南省_8_5_20_317', N'湖南达到_8_5_20_317', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (682, N'37dea654-a425-4ae0-ad8d-18dcbfc95f7d', N'Tom_0_7_6_19_318', N'USA_7_6_19_318', N'USA_7_6_19_318', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (683, N'a4361387-69b5-46f2-a2e7-483fc310fd32', N'Tom_0_1_6_7_18_319', N'USA_1_6_7_18_319', N'USA_1_6_7_18_319', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (684, N'2a1a7466-af85-4c12-8696-23a79821755f', N'Peter_0_2_5_8_17_320', N'湖南省_2_5_8_17_320', N'湖南达到_2_5_8_17_320', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (685, N'a4d9d1b9-17a7-4c58-8a78-a694539cd434', N'Jimmy_0_3_4_9_16_321', N'江西省广昌县塘方向天要存_3_4_9_16_321', N'小地方_3_4_9_16_321', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (686, N'de7dd755-9778-4e4a-a0f2-4e7c7da3362a', N'Tom_4_3_10_15_322', N'USA_4_3_10_15_322', N'USA_4_3_10_15_322', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (687, N'87e10d3e-624b-47b2-a0ba-8e8a6d7b0e15', N'Peter_5_2_11_14_323', N'湖南省_5_2_11_14_323', N'湖南达到_5_2_11_14_323', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (688, N'5bc747d2-0b1d-4bbe-ba50-af25e890316a', N'Jimmy_6_1_12_13_324', N'江西省广昌县塘方向天要存_6_1_12_13_324', N'小地方_6_1_12_13_324', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (689, N'6219d489-51da-452e-8036-4d1ac36a9bfd', N'Jimmy_6_13_12_325', N'江西省广昌县塘方向天要存_6_13_12_325', N'小地方_6_13_12_325', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (690, N'e0f6db0a-81c1-4551-862e-c8c0beb90f05', N'Peter_5_14_11_326', N'湖南省_5_14_11_326', N'湖南达到_5_14_11_326', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (691, N'd3350c9e-ee6b-4ca5-b0e8-280cba3e0bf2', N'Tom_4_15_10_327', N'USA_4_15_10_327', N'USA_4_15_10_327', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (692, N'480c8828-ad6e-4f06-abdb-1f0a1a042102', N'Jimmy_0_3_16_9_328', N'江西省广昌县塘方向天要存_3_16_9_328', N'小地方_3_16_9_328', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (693, N'eca61a3c-de23-44fb-a4bf-441be3cc69cf', N'Peter_0_2_17_8_329', N'湖南省_2_17_8_329', N'湖南达到_2_17_8_329', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (694, N'08cd69a3-010f-4925-86a9-c9a590daa09a', N'Tom_0_1_18_7_330', N'USA_1_18_7_330', N'USA_1_18_7_330', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (695, N'a65052c0-bfa3-4d10-8236-b5688d73d828', N'Tom_0_19_6_331', N'USA_19_6_331', N'USA_19_6_331', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (696, N'ca42a295-017f-4c32-9dfd-30e70b80c7fb', N'Peter_0_20_5_332', N'湖南省_20_5_332', N'湖南达到_20_5_332', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (697, N'208fca1d-fcc9-4eb6-9965-85870b3d5052', N'Jimmy_0_21_4_333', N'江西省广昌县塘方向天要存_21_4_333', N'小地方_21_4_333', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (698, N'02d8799a-a6fd-4772-973a-400c290e7b8d', N'Tom_22_3_334', N'USA_22_3_334', N'USA_22_3_334', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (699, N'7ed720ac-e48e-443d-a1e8-64426cbf299c', N'Peter_23_2_335', N'湖南省_23_2_335', N'湖南达到_23_2_335', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (700, N'c912bb00-0339-4aa0-bc10-2d641ae24d1c', N'Jimmy_24_1_336', N'江西省广昌县塘方向天要存_24_1_336', N'小地方_24_1_336', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (701, N'3eb3edd5-4ad4-41b4-9647-9a5d606486d8', N'Jimmy_24_337', N'江西省广昌县塘方向天要存_24_337', N'小地方_24_337', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (702, N'2561065f-d9f7-4b20-aaa7-af1668b45ea2', N'Peter_23_338', N'湖南省_23_338', N'湖南达到_23_338', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (703, N'75dbb2a0-e6a9-4376-a5e0-63c51340311f', N'Tom_22_339', N'USA_22_339', N'USA_22_339', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (704, N'faa75210-a9c8-4605-a775-886134db75de', N'Jimmy_0_21_340', N'江西省广昌县塘方向天要存_21_340', N'小地方_21_340', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (705, N'cdfd78bb-34ca-4818-9ce5-06c218f2e28e', N'Peter_0_20_341', N'湖南省_20_341', N'湖南达到_20_341', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (706, N'12b74349-3711-47d7-9466-20e19a06790b', N'Tom_0_19_342', N'USA_19_342', N'USA_19_342', 0, CAST(0x0000A3C100E75F17 AS DateTime))
GO
print 'Processed 700 total records'
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (707, N'74af81a9-f8f2-475c-9a9f-b7fd65a38802', N'Tom_0_1_18_343', N'USA_1_18_343', N'USA_1_18_343', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (708, N'9d72a10a-dd9a-4951-b1fc-eb3a028f7760', N'Peter_0_2_17_344', N'湖南省_2_17_344', N'湖南达到_2_17_344', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (709, N'5ec15407-2403-40d7-a3d1-15230355c6b5', N'Jimmy_0_3_16_345', N'江西省广昌县塘方向天要存_3_16_345', N'小地方_3_16_345', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (710, N'e1cc14a7-3d76-43e5-8e16-be7896899130', N'Tom_4_15_346', N'USA_4_15_346', N'USA_4_15_346', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (711, N'f590d762-66f2-4eff-9533-23bb03a3599a', N'Peter_5_14_347', N'湖南省_5_14_347', N'湖南达到_5_14_347', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (712, N'0d66511c-30bf-4a47-a04e-190135a502af', N'Jimmy_6_13_348', N'江西省广昌县塘方向天要存_6_13_348', N'小地方_6_13_348', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (713, N'744bf55d-18fd-4b50-a24c-3e3b71ecbcb9', N'Jimmy_6_1_12_349', N'江西省广昌县塘方向天要存_6_1_12_349', N'小地方_6_1_12_349', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (714, N'19eb02d3-6466-4614-ba9d-4bc318eaf45d', N'Peter_5_2_11_350', N'湖南省_5_2_11_350', N'湖南达到_5_2_11_350', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (715, N'5ff8e89c-454e-44ba-a962-77d13f471710', N'Tom_4_3_10_351', N'USA_4_3_10_351', N'USA_4_3_10_351', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (716, N'd2996909-0bfd-4033-a5a2-4a4534733965', N'Jimmy_0_3_4_9_352', N'江西省广昌县塘方向天要存_3_4_9_352', N'小地方_3_4_9_352', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (717, N'f524991e-7763-4b76-8713-10d595918dec', N'Peter_0_2_5_8_353', N'湖南省_2_5_8_353', N'湖南达到_2_5_8_353', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (718, N'c7444f89-36a4-41c3-9651-ce9b004291d4', N'Tom_0_1_6_7_354', N'USA_1_6_7_354', N'USA_1_6_7_354', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (719, N'3e1b110c-4334-411f-8814-a26d0ef12452', N'Tom_0_7_6_355', N'USA_7_6_355', N'USA_7_6_355', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (720, N'b5a4e14d-0111-48c3-9346-d286d07087f8', N'Peter_0_8_5_356', N'湖南省_8_5_356', N'湖南达到_8_5_356', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (721, N'9900f201-3b72-4448-b247-e172e2ea7ba9', N'Jimmy_0_9_4_357', N'江西省广昌县塘方向天要存_9_4_357', N'小地方_9_4_357', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (722, N'b00d17a6-15b1-4222-86bb-c104add0a628', N'Tom_10_3_358', N'USA_10_3_358', N'USA_10_3_358', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (723, N'15b76964-f35e-4d9c-8756-748bfbcfb932', N'Peter_11_2_359', N'湖南省_11_2_359', N'湖南达到_11_2_359', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (724, N'ed714b64-5fa1-4d66-996b-a6c91825aec4', N'Jimmy_12_1_360', N'江西省广昌县塘方向天要存_12_1_360', N'小地方_12_1_360', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (725, N'4202b3df-c3c0-4e72-a560-eece04574310', N'Jimmy_12_361', N'江西省广昌县塘方向天要存_12_361', N'小地方_12_361', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (726, N'86941e79-4ac0-4d0d-a234-3f81e9955700', N'Peter_11_362', N'湖南省_11_362', N'湖南达到_11_362', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (727, N'60b0437f-c56a-4656-9b8c-cc2662e5d194', N'Tom_10_363', N'USA_10_363', N'USA_10_363', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (728, N'66f83969-1410-465a-8708-61a7258a2c44', N'Jimmy_0_9_364', N'江西省广昌县塘方向天要存_9_364', N'小地方_9_364', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (729, N'23ab467d-645b-4c13-8388-817bad32133c', N'Peter_0_8_365', N'湖南省_8_365', N'湖南达到_8_365', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (730, N'41037ee6-9b14-4c00-a8b9-67a91157789d', N'Tom_0_7_366', N'USA_7_366', N'USA_7_366', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (731, N'c813c8b1-e6e2-4ff4-92cf-1d62dceae123', N'Tom_0_1_6_367', N'USA_1_6_367', N'USA_1_6_367', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (732, N'2a9a6ab3-775e-430c-a019-411ebb4d2d3b', N'Peter_0_2_5_368', N'湖南省_2_5_368', N'湖南达到_2_5_368', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (733, N'a0983c6d-95f3-48e2-b65c-51b746793fd0', N'Jimmy_0_3_4_369', N'江西省广昌县塘方向天要存_3_4_369', N'小地方_3_4_369', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (734, N'8a377687-73c1-44b2-9082-9e0c85fdea11', N'Tom_4_3_370', N'USA_4_3_370', N'USA_4_3_370', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (735, N'6d587d7c-c8b9-4332-ab20-c10543675780', N'Peter_5_2_371', N'湖南省_5_2_371', N'湖南达到_5_2_371', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (736, N'f851e220-5769-48be-9c47-62daae81aeea', N'Jimmy_6_1_372', N'江西省广昌县塘方向天要存_6_1_372', N'小地方_6_1_372', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (737, N'0d7dd893-ab99-412c-9d93-91b599cf0c31', N'Jimmy_6_373', N'江西省广昌县塘方向天要存_6_373', N'小地方_6_373', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (738, N'47278b6e-cb17-4cab-a6e2-b3613545e0f2', N'Peter_5_374', N'湖南省_5_374', N'湖南达到_5_374', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (739, N'918cc268-c760-43b4-9a19-3ae38f618270', N'Tom_4_375', N'USA_4_375', N'USA_4_375', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (740, N'91558744-ae7f-464b-abe3-4226f82679c0', N'Jimmy_0_3_376', N'江西省广昌县塘方向天要存_3_376', N'小地方_3_376', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (741, N'7ab1fa34-3989-4203-8695-c083e37d9060', N'Peter_0_2_377', N'湖南省_2_377', N'湖南达到_2_377', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (742, N'bd854465-4e68-4c5a-94c8-2236cf41302e', N'Tom_0_1_378', N'USA_1_378', N'USA_1_378', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (743, N'3857cc15-d370-42b4-b0b9-e40b26c69920', N'Tom_0_379', N'USA_379', N'USA_379', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (744, N'4c15b5bc-5ec9-45ae-986e-ac68f8e94e6e', N'Peter_0_380', N'湖南省_380', N'湖南达到_380', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (745, N'0638bbdd-c02d-49ad-8d5c-e9448a0cead5', N'Jimmy_0_381', N'江西省广昌县塘方向天要存_381', N'小地方_381', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (746, N'0c74a0ef-85c9-49d6-b9ce-ccb66076a9a5', N'Tom_382', N'USA_382', N'USA_382', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (747, N'22040961-2a30-41ec-aa87-ab90c9104ae7', N'Peter_383', N'湖南省_383', N'湖南达到_383', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (748, N'b79a965d-164c-4d73-8096-64b619ea9a69', N'Jimmy_384', N'江西省广昌县塘方向天要存_384', N'小地方_384', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (749, N'a3a5010c-43c3-4f73-8dd4-bb4830102ca4', N'Jimmy_384_1', N'江西省广昌县塘方向天要存_384_1', N'小地方_384_1', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (750, N'6bd7eeb1-a0f6-4e74-9c24-c936b67bc436', N'Peter_383_2', N'湖南省_383_2', N'湖南达到_383_2', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (751, N'b93af32c-c543-4c4b-b926-617ac2fb23b1', N'Tom_382_3', N'USA_382_3', N'USA_382_3', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (752, N'b481e16f-5152-41b2-bdb7-0f282dc6b8ad', N'Jimmy_0_381_4', N'江西省广昌县塘方向天要存_381_4', N'小地方_381_4', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (753, N'e556fd23-e1e8-4129-ba2b-e465442222a7', N'Peter_0_380_5', N'湖南省_380_5', N'湖南达到_380_5', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (754, N'ee32407e-12b6-48be-8f85-438e3ae58d55', N'Tom_0_379_6', N'USA_379_6', N'USA_379_6', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (755, N'bc654569-1fed-453c-89a7-fcc91111ac4b', N'Tom_0_1_378_7', N'USA_1_378_7', N'USA_1_378_7', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (756, N'a26615d3-5258-4335-b2a4-eb4b016e3aa6', N'Peter_0_2_377_8', N'湖南省_2_377_8', N'湖南达到_2_377_8', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (757, N'103a6507-7c35-4051-b6c3-19d3011b7cf6', N'Jimmy_0_3_376_9', N'江西省广昌县塘方向天要存_3_376_9', N'小地方_3_376_9', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (758, N'1c78ed41-1119-4d8a-baba-290060395224', N'Tom_4_375_10', N'USA_4_375_10', N'USA_4_375_10', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (759, N'0884ea6f-53f6-4fb5-9b8c-7b15b10cbf33', N'Peter_5_374_11', N'湖南省_5_374_11', N'湖南达到_5_374_11', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (760, N'8607f459-e4b2-4195-acc1-b2ae2c17da58', N'Jimmy_6_373_12', N'江西省广昌县塘方向天要存_6_373_12', N'小地方_6_373_12', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (761, N'f70386ff-56d4-4811-99e5-94ca7882efdd', N'Jimmy_6_1_372_13', N'江西省广昌县塘方向天要存_6_1_372_13', N'小地方_6_1_372_13', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (762, N'24e35fd5-ee67-47c9-85b1-4ec159feb2fb', N'Peter_5_2_371_14', N'湖南省_5_2_371_14', N'湖南达到_5_2_371_14', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (763, N'a226a239-6137-4d7a-a5ae-296830e94da3', N'Tom_4_3_370_15', N'USA_4_3_370_15', N'USA_4_3_370_15', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (764, N'a08b0ea2-e9ba-45a0-98fe-1d8736e3af41', N'Jimmy_0_3_4_369_16', N'江西省广昌县塘方向天要存_3_4_369_16', N'小地方_3_4_369_16', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (765, N'baa2e675-8ac9-4f48-83b1-533ed8611c76', N'Peter_0_2_5_368_17', N'湖南省_2_5_368_17', N'湖南达到_2_5_368_17', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (766, N'2d0c3f70-643a-448e-8af7-3c2aa0cba9cb', N'Tom_0_1_6_367_18', N'USA_1_6_367_18', N'USA_1_6_367_18', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (767, N'0fdd9c76-5592-4d86-a69c-386db0a32c58', N'Tom_0_7_366_19', N'USA_7_366_19', N'USA_7_366_19', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (768, N'0fbdf56f-4109-4349-b474-63ef80cbf1ce', N'Peter_0_8_365_20', N'湖南省_8_365_20', N'湖南达到_8_365_20', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (769, N'b7a477a6-bb0f-4005-8b00-fa41cd2ea4e8', N'Jimmy_0_9_364_21', N'江西省广昌县塘方向天要存_9_364_21', N'小地方_9_364_21', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (770, N'27d016e6-ac8b-43c6-94e5-0762abf71228', N'Tom_10_363_22', N'USA_10_363_22', N'USA_10_363_22', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (771, N'49e66b86-0202-4c4e-bdcf-db4cc2cac708', N'Peter_11_362_23', N'湖南省_11_362_23', N'湖南达到_11_362_23', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (772, N'fbfc594a-f4e9-463d-b04e-eef5de51e8f4', N'Jimmy_12_361_24', N'江西省广昌县塘方向天要存_12_361_24', N'小地方_12_361_24', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (773, N'af3f6e65-4631-4d76-9c63-a69d838ba721', N'Jimmy_12_1_360_25', N'江西省广昌县塘方向天要存_12_1_360_25', N'小地方_12_1_360_25', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (774, N'272de6d6-8c1f-40b1-97b1-29d5651499d3', N'Peter_11_2_359_26', N'湖南省_11_2_359_26', N'湖南达到_11_2_359_26', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (775, N'9b3748ac-94e8-4ddf-ada3-4042818c51bd', N'Tom_10_3_358_27', N'USA_10_3_358_27', N'USA_10_3_358_27', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (776, N'90db19ab-c9b3-4176-b83a-d3c793da7467', N'Jimmy_0_9_4_357_28', N'江西省广昌县塘方向天要存_9_4_357_28', N'小地方_9_4_357_28', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (777, N'522ba0cf-f31c-425f-9ff6-b6f71b668a9f', N'Peter_0_8_5_356_29', N'湖南省_8_5_356_29', N'湖南达到_8_5_356_29', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (778, N'2a985ddc-abcd-4682-92d3-b8f955ef9935', N'Tom_0_7_6_355_30', N'USA_7_6_355_30', N'USA_7_6_355_30', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (779, N'4d10b0f0-264d-4927-b422-3d69011898f2', N'Tom_0_1_6_7_354_31', N'USA_1_6_7_354_31', N'USA_1_6_7_354_31', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (780, N'01996da2-583d-4b6e-b1c3-e166c6cd0f84', N'Peter_0_2_5_8_353_32', N'湖南省_2_5_8_353_32', N'湖南达到_2_5_8_353_32', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (781, N'a7df5f1a-e499-4811-b460-40891a92e7fd', N'Jimmy_0_3_4_9_352_33', N'江西省广昌县塘方向天要存_3_4_9_352_33', N'小地方_3_4_9_352_33', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (782, N'e4af0345-4104-45a7-8ec4-15fea01a67ee', N'Tom_4_3_10_351_34', N'USA_4_3_10_351_34', N'USA_4_3_10_351_34', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (783, N'41c623a0-707f-4e34-b84f-651a5d70c2b8', N'Peter_5_2_11_350_35', N'湖南省_5_2_11_350_35', N'湖南达到_5_2_11_350_35', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (784, N'64d72582-8335-4aee-bfee-30163b96432e', N'Jimmy_6_1_12_349_36', N'江西省广昌县塘方向天要存_6_1_12_349_36', N'小地方_6_1_12_349_36', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (785, N'2063e710-af68-404e-a48b-97489a9fc664', N'Jimmy_6_13_348_37', N'江西省广昌县塘方向天要存_6_13_348_37', N'小地方_6_13_348_37', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (786, N'758e184a-0217-4e40-ae22-35c2f17c38f0', N'Peter_5_14_347_38', N'湖南省_5_14_347_38', N'湖南达到_5_14_347_38', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (787, N'39bdfc4a-53bd-467f-8cba-8d45a0b7bb49', N'Tom_4_15_346_39', N'USA_4_15_346_39', N'USA_4_15_346_39', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (788, N'6e216e88-cfa5-4148-be68-a261f9cc604d', N'Jimmy_0_3_16_345_40', N'江西省广昌县塘方向天要存_3_16_345_40', N'小地方_3_16_345_40', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (789, N'b9ff2db2-8a64-42c5-8f2e-0c30bcf5e4bd', N'Peter_0_2_17_344_41', N'湖南省_2_17_344_41', N'湖南达到_2_17_344_41', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (790, N'edcb46ee-e71a-4da6-9cbd-81e8ee7f7f09', N'Tom_0_1_18_343_42', N'USA_1_18_343_42', N'USA_1_18_343_42', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (791, N'2f4b50ae-9867-474c-9c13-31317fa80266', N'Tom_0_19_342_43', N'USA_19_342_43', N'USA_19_342_43', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (792, N'ff2ac25e-c508-4b80-8569-674523709d71', N'Peter_0_20_341_44', N'湖南省_20_341_44', N'湖南达到_20_341_44', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (793, N'30c71a4d-811f-4194-952d-e1d45795a177', N'Jimmy_0_21_340_45', N'江西省广昌县塘方向天要存_21_340_45', N'小地方_21_340_45', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (794, N'f84ee076-3851-4282-9e4a-79bc59032872', N'Tom_22_339_46', N'USA_22_339_46', N'USA_22_339_46', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (795, N'8cbe72cf-3720-4f27-9fd0-5082ac56d5ab', N'Peter_23_338_47', N'湖南省_23_338_47', N'湖南达到_23_338_47', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (796, N'b65ed912-f7a0-485d-afc4-bc4570ebb4fd', N'Jimmy_24_337_48', N'江西省广昌县塘方向天要存_24_337_48', N'小地方_24_337_48', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (797, N'53f7451c-087f-411c-8a0f-7dd6cf91ef49', N'Jimmy_24_1_336_49', N'江西省广昌县塘方向天要存_24_1_336_49', N'小地方_24_1_336_49', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (798, N'66e320e2-c027-4bd8-8c51-c7129d7a87e6', N'Peter_23_2_335_50', N'湖南省_23_2_335_50', N'湖南达到_23_2_335_50', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (799, N'3497ce60-ad2e-4308-9dfe-9299830a1993', N'Tom_22_3_334_51', N'USA_22_3_334_51', N'USA_22_3_334_51', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (800, N'fddeedcb-7ffa-4a9b-9d19-46bcd44e4a63', N'Jimmy_0_21_4_333_52', N'江西省广昌县塘方向天要存_21_4_333_52', N'小地方_21_4_333_52', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (801, N'ae0f45dc-72d4-4736-bf02-12dadcfadb98', N'Peter_0_20_5_332_53', N'湖南省_20_5_332_53', N'湖南达到_20_5_332_53', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (802, N'16a08d66-3a86-4cea-a03e-affa1f5f828f', N'Tom_0_19_6_331_54', N'USA_19_6_331_54', N'USA_19_6_331_54', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (803, N'3283c134-19eb-4969-a110-80bb07914e83', N'Tom_0_1_18_7_330_55', N'USA_1_18_7_330_55', N'USA_1_18_7_330_55', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (804, N'77115dec-b4ef-451d-8310-53cca36be24f', N'Peter_0_2_17_8_329_56', N'湖南省_2_17_8_329_56', N'湖南达到_2_17_8_329_56', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (805, N'60a97970-7c14-4687-a730-48b5bb285a40', N'Jimmy_0_3_16_9_328_57', N'江西省广昌县塘方向天要存_3_16_9_328_57', N'小地方_3_16_9_328_57', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (806, N'44a83520-61a9-4d7b-8732-fc8f0461cb66', N'Tom_4_15_10_327_58', N'USA_4_15_10_327_58', N'USA_4_15_10_327_58', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (807, N'fbd76839-58ac-479f-9122-7824fc3b0870', N'Peter_5_14_11_326_59', N'湖南省_5_14_11_326_59', N'湖南达到_5_14_11_326_59', 0, CAST(0x0000A3C100E760A8 AS DateTime))
GO
print 'Processed 800 total records'
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (808, N'76d66c82-c4f0-4970-a69b-bd6f1ce3b5ad', N'Jimmy_6_13_12_325_60', N'江西省广昌县塘方向天要存_6_13_12_325_60', N'小地方_6_13_12_325_60', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (809, N'eab3c129-f631-4c5b-b2b3-80fc99c5565d', N'Jimmy_6_1_12_13_324_61', N'江西省广昌县塘方向天要存_6_1_12_13_324_61', N'小地方_6_1_12_13_324_61', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (810, N'39f28c85-4338-471b-804f-ae1c9c5bd165', N'Peter_5_2_11_14_323_62', N'湖南省_5_2_11_14_323_62', N'湖南达到_5_2_11_14_323_62', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (811, N'5686228f-365f-46b2-a7d0-ceb941a4ab8e', N'Tom_4_3_10_15_322_63', N'USA_4_3_10_15_322_63', N'USA_4_3_10_15_322_63', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (812, N'7a9c7c7a-7c68-4ce9-9e2b-aea68d5f327d', N'Jimmy_0_3_4_9_16_321_64', N'江西省广昌县塘方向天要存_3_4_9_16_321_64', N'小地方_3_4_9_16_321_64', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (813, N'a56d58d9-8a46-427d-9567-b5c4e1fca9e6', N'Peter_0_2_5_8_17_320_65', N'湖南省_2_5_8_17_320_65', N'湖南达到_2_5_8_17_320_65', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (814, N'302ce1b6-3c06-4fa4-a14a-554e10d142ce', N'Tom_0_1_6_7_18_319_66', N'USA_1_6_7_18_319_66', N'USA_1_6_7_18_319_66', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (815, N'02472cf8-f626-4416-b978-8156bf43f7d2', N'Tom_0_7_6_19_318_67', N'USA_7_6_19_318_67', N'USA_7_6_19_318_67', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (816, N'145af53a-9f2d-4f06-9362-d5778595a968', N'Peter_0_8_5_20_317_68', N'湖南省_8_5_20_317_68', N'湖南达到_8_5_20_317_68', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (817, N'c774df4b-0e72-4ded-aed0-1e8b98583fb1', N'Jimmy_0_9_4_21_316_69', N'江西省广昌县塘方向天要存_9_4_21_316_69', N'小地方_9_4_21_316_69', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (818, N'd3b71a8d-4c8b-4a05-b6fa-cab69c521fae', N'Tom_10_3_22_315_70', N'USA_10_3_22_315_70', N'USA_10_3_22_315_70', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (819, N'd9829443-4d1e-4721-a742-c40f0d8ea085', N'Peter_11_2_23_314_71', N'湖南省_11_2_23_314_71', N'湖南达到_11_2_23_314_71', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (820, N'6b091328-fa16-492a-99ce-af3cdfe26e2c', N'Jimmy_12_1_24_313_72', N'江西省广昌县塘方向天要存_12_1_24_313_72', N'小地方_12_1_24_313_72', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (821, N'519ae8a6-e3cc-47e9-9720-3eaeb026ac67', N'Jimmy_12_25_312_73', N'江西省广昌县塘方向天要存_12_25_312_73', N'小地方_12_25_312_73', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (822, N'50b096ba-6cc9-4491-9550-ceaad270cd0e', N'Peter_11_26_311_74', N'湖南省_11_26_311_74', N'湖南达到_11_26_311_74', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (823, N'04ffe853-7a6a-404f-99f3-358ceb3f222b', N'Tom_10_27_310_75', N'USA_10_27_310_75', N'USA_10_27_310_75', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (824, N'2abb40a3-8676-4fda-8050-8758523204b0', N'Jimmy_0_9_28_309_76', N'江西省广昌县塘方向天要存_9_28_309_76', N'小地方_9_28_309_76', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (825, N'38b7ba14-a98b-4676-ba8e-632e609b3a4a', N'Peter_0_8_29_308_77', N'湖南省_8_29_308_77', N'湖南达到_8_29_308_77', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (826, N'15972e7d-9c66-4d5e-ab7c-257502e6f3bd', N'Tom_0_7_30_307_78', N'USA_7_30_307_78', N'USA_7_30_307_78', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (827, N'34bb9221-81a0-4ffa-ab22-9e267d66319f', N'Tom_0_1_6_31_306_79', N'USA_1_6_31_306_79', N'USA_1_6_31_306_79', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (828, N'cc4238f8-8f46-4679-9a06-bc7a85e6138f', N'Peter_0_2_5_32_305_80', N'湖南省_2_5_32_305_80', N'湖南达到_2_5_32_305_80', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (829, N'84adbf66-4ddc-48d5-83c0-e5c360e16ea4', N'Jimmy_0_3_4_33_304_81', N'江西省广昌县塘方向天要存_3_4_33_304_81', N'小地方_3_4_33_304_81', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (830, N'61dd8c82-1ca4-46cc-b5ff-d4b5a66af23c', N'Tom_4_3_34_303_82', N'USA_4_3_34_303_82', N'USA_4_3_34_303_82', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (831, N'b72fcd29-82b1-4e94-be26-6c6545dabdf5', N'Peter_5_2_35_302_83', N'湖南省_5_2_35_302_83', N'湖南达到_5_2_35_302_83', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (832, N'27743653-0793-4732-a4ab-51693e917ea8', N'Jimmy_6_1_36_301_84', N'江西省广昌县塘方向天要存_6_1_36_301_84', N'小地方_6_1_36_301_84', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (833, N'bc998a76-6eb2-4af1-a0bb-5c972adbec2c', N'Jimmy_6_37_300_85', N'江西省广昌县塘方向天要存_6_37_300_85', N'小地方_6_37_300_85', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (834, N'adecc84c-efc1-48d1-84dd-59a447a5e74f', N'Peter_5_38_299_86', N'湖南省_5_38_299_86', N'湖南达到_5_38_299_86', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (835, N'e38d3d8a-5176-42ea-9bd3-e5d93d8bccbe', N'Tom_4_39_298_87', N'USA_4_39_298_87', N'USA_4_39_298_87', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (836, N'1cf78ebf-9961-4847-9e53-4fd1a4b4a6c4', N'Jimmy_0_3_40_297_88', N'江西省广昌县塘方向天要存_3_40_297_88', N'小地方_3_40_297_88', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (837, N'930a5be4-53d0-4d2a-b491-76788f3f4b3a', N'Peter_0_2_41_296_89', N'湖南省_2_41_296_89', N'湖南达到_2_41_296_89', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (838, N'1200c0e8-230c-4d78-a164-594be2c868c9', N'Tom_0_1_42_295_90', N'USA_1_42_295_90', N'USA_1_42_295_90', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (839, N'a65c0fea-998d-4573-b3d4-076fe0680d06', N'Tom_0_43_294_91', N'USA_43_294_91', N'USA_43_294_91', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (840, N'1ed570ee-1928-417c-a47f-105aebaa987f', N'Peter_0_44_293_92', N'湖南省_44_293_92', N'湖南达到_44_293_92', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (841, N'3510fdd8-e95d-4679-94f4-6d5a14f2db12', N'Jimmy_0_45_292_93', N'江西省广昌县塘方向天要存_45_292_93', N'小地方_45_292_93', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (842, N'c4a42ba8-20ed-4334-b282-6b2398015206', N'Tom_46_291_94', N'USA_46_291_94', N'USA_46_291_94', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (843, N'55efd761-c17a-49fd-9249-ba8c1db74975', N'Peter_47_290_95', N'湖南省_47_290_95', N'湖南达到_47_290_95', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (844, N'f59509f4-2d6b-48ad-a358-34a3d5e41414', N'Jimmy_48_289_96', N'江西省广昌县塘方向天要存_48_289_96', N'小地方_48_289_96', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (845, N'b19fd70a-6830-4630-a1a2-8c14a8f4956c', N'Jimmy_48_1_288_97', N'江西省广昌县塘方向天要存_48_1_288_97', N'小地方_48_1_288_97', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (846, N'32d8dfa7-dd79-42fc-a185-14b2865c58f2', N'Peter_47_2_287_98', N'湖南省_47_2_287_98', N'湖南达到_47_2_287_98', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (847, N'3cc32ffe-bd1d-426a-a213-b26eca6a2754', N'Tom_46_3_286_99', N'USA_46_3_286_99', N'USA_46_3_286_99', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (848, N'128b2889-468f-4035-8ea4-e09b290d1af2', N'Jimmy_0_45_4_285_100', N'江西省广昌县塘方向天要存_45_4_285_100', N'小地方_45_4_285_100', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (849, N'cfbb792a-9f73-4485-b081-8a5c8ad9a241', N'Peter_0_44_5_284_101', N'湖南省_44_5_284_101', N'湖南达到_44_5_284_101', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (850, N'42e792e9-50b4-4acf-a567-0b90c2565423', N'Tom_0_43_6_283_102', N'USA_43_6_283_102', N'USA_43_6_283_102', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (851, N'a8075b77-149f-417f-bc49-80943592fd9a', N'Tom_0_1_42_7_282_103', N'USA_1_42_7_282_103', N'USA_1_42_7_282_103', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (852, N'f4130d54-e694-4166-af9c-d5c76b4e5713', N'Peter_0_2_41_8_281_104', N'湖南省_2_41_8_281_104', N'湖南达到_2_41_8_281_104', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (853, N'a5eac59f-98c5-4e74-81a1-6c2f59e89b30', N'Jimmy_0_3_40_9_280_105', N'江西省广昌县塘方向天要存_3_40_9_280_105', N'小地方_3_40_9_280_105', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (854, N'a0c1fb6c-cfa5-464d-ad27-5c361a1381be', N'Tom_4_39_10_279_106', N'USA_4_39_10_279_106', N'USA_4_39_10_279_106', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (855, N'60b831be-6fde-49c4-8bc6-12dd8f741c08', N'Peter_5_38_11_278_107', N'湖南省_5_38_11_278_107', N'湖南达到_5_38_11_278_107', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (856, N'8bc93646-ecc9-49af-b342-96089a302270', N'Jimmy_6_37_12_277_108', N'江西省广昌县塘方向天要存_6_37_12_277_108', N'小地方_6_37_12_277_108', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (857, N'debbfc7e-0dc6-46b9-bccd-14d7ef34926c', N'Jimmy_6_1_36_13_276_109', N'江西省广昌县塘方向天要存_6_1_36_13_276_109', N'小地方_6_1_36_13_276_109', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (858, N'c2c768e4-0a4e-4d7c-b78d-221d551a9227', N'Peter_5_2_35_14_275_110', N'湖南省_5_2_35_14_275_110', N'湖南达到_5_2_35_14_275_110', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (859, N'82824b75-8d1e-414f-a02a-fe6ef4697e15', N'Tom_4_3_34_15_274_111', N'USA_4_3_34_15_274_111', N'USA_4_3_34_15_274_111', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (860, N'8e4e007a-9416-4e58-b76f-0d3226793aee', N'Jimmy_0_3_4_33_16_273_112', N'江西省广昌县塘方向天要存_3_4_33_16_273_112', N'小地方_3_4_33_16_273_112', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (861, N'aea4586a-5486-4b41-a3e3-e76ee257bef1', N'Peter_0_2_5_32_17_272_113', N'湖南省_2_5_32_17_272_113', N'湖南达到_2_5_32_17_272_113', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (862, N'cd411628-1e11-4d63-8778-85b7d51981ff', N'Tom_0_1_6_31_18_271_114', N'USA_1_6_31_18_271_114', N'USA_1_6_31_18_271_114', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (863, N'b9d2bd59-d349-4e03-a8ac-ea5d9ca095e8', N'Tom_0_7_30_19_270_115', N'USA_7_30_19_270_115', N'USA_7_30_19_270_115', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (864, N'967f4008-3dde-49a3-b63e-73382fdc4da8', N'Peter_0_8_29_20_269_116', N'湖南省_8_29_20_269_116', N'湖南达到_8_29_20_269_116', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (865, N'bbd56812-8abd-49b8-a790-5f52a0c7edf9', N'Jimmy_0_9_28_21_268_117', N'江西省广昌县塘方向天要存_9_28_21_268_117', N'小地方_9_28_21_268_117', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (866, N'994a3236-2f61-45a3-9aaa-bd7c9b940e60', N'Tom_10_27_22_267_118', N'USA_10_27_22_267_118', N'USA_10_27_22_267_118', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (867, N'4048fb19-5b55-4fdb-9ed6-d584c7498e0d', N'Peter_11_26_23_266_119', N'湖南省_11_26_23_266_119', N'湖南达到_11_26_23_266_119', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (868, N'a3e458f2-17fe-4669-b0fb-c3909759ba17', N'Jimmy_12_25_24_265_120', N'江西省广昌县塘方向天要存_12_25_24_265_120', N'小地方_12_25_24_265_120', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (869, N'428c53a7-1db7-4cd3-9a15-dd4202ef7e4b', N'Jimmy_12_1_24_25_264_121', N'江西省广昌县塘方向天要存_12_1_24_25_264_121', N'小地方_12_1_24_25_264_121', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (870, N'ce79f843-1a91-45f5-ac91-b5b3a436ab05', N'Peter_11_2_23_26_263_122', N'湖南省_11_2_23_26_263_122', N'湖南达到_11_2_23_26_263_122', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (871, N'0e06bfa3-2485-44b2-897e-8ad3460a5d07', N'Tom_10_3_22_27_262_123', N'USA_10_3_22_27_262_123', N'USA_10_3_22_27_262_123', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (872, N'253d13b3-4f35-4d12-8e03-0bf24047bd58', N'Jimmy_0_9_4_21_28_261_124', N'江西省广昌县塘方向天要存_9_4_21_28_261_124', N'小地方_9_4_21_28_261_124', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (873, N'43b9e4c4-fb2f-4fc5-8fb6-1234cb41e0f0', N'Peter_0_8_5_20_29_260_125', N'湖南省_8_5_20_29_260_125', N'湖南达到_8_5_20_29_260_125', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (874, N'fdba1f65-ea63-4454-97fb-44792adae112', N'Tom_0_7_6_19_30_259_126', N'USA_7_6_19_30_259_126', N'USA_7_6_19_30_259_126', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (875, N'e99ab6c2-23fc-4422-8066-c77de45c79f2', N'Tom_0_1_6_7_18_31_258_127', N'USA_1_6_7_18_31_258_127', N'USA_1_6_7_18_31_258_127', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (876, N'aad157d2-e8f5-43ae-b435-9481b9347ca5', N'Peter_0_2_5_8_17_32_257_128', N'湖南省_2_5_8_17_32_257_128', N'湖南达到_2_5_8_17_32_257_128', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (877, N'04dad8d2-c6c3-42ec-9538-21730c6314b3', N'Jimmy_0_3_4_9_16_33_256_129', N'江西省广昌县塘方向天要存_3_4_9_16_33_256_129', N'小地方_3_4_9_16_33_256_129', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (878, N'a30c49db-797d-4498-9b7a-6a59ab31ea8e', N'Tom_4_3_10_15_34_255_130', N'USA_4_3_10_15_34_255_130', N'USA_4_3_10_15_34_255_130', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (879, N'e04a0e50-166b-42a7-8645-ea00b1ccf943', N'Peter_5_2_11_14_35_254_131', N'湖南省_5_2_11_14_35_254_131', N'湖南达到_5_2_11_14_35_254_131', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (880, N'db4b10b5-64e3-49ea-a361-3f668b5b4c89', N'Jimmy_6_1_12_13_36_253_132', N'江西省广昌县塘方向天要存_6_1_12_13_36_253_132', N'小地方_6_1_12_13_36_253_132', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (881, N'4af8085c-a851-48d4-b694-7f19d3762cf0', N'Jimmy_6_13_12_37_252_133', N'江西省广昌县塘方向天要存_6_13_12_37_252_133', N'小地方_6_13_12_37_252_133', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (882, N'76b77f64-e71d-44a2-9eca-46f1e9f78f96', N'Peter_5_14_11_38_251_134', N'湖南省_5_14_11_38_251_134', N'湖南达到_5_14_11_38_251_134', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (883, N'ee317fb8-1e83-4385-86a8-40a5fda8e908', N'Tom_4_15_10_39_250_135', N'USA_4_15_10_39_250_135', N'USA_4_15_10_39_250_135', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (884, N'0895a4b5-9adb-4c38-ad6c-ef72ffcba3d0', N'Jimmy_0_3_16_9_40_249_136', N'江西省广昌县塘方向天要存_3_16_9_40_249_136', N'小地方_3_16_9_40_249_136', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (885, N'c5e9d1db-d0cc-4ff2-9996-40db24505589', N'Peter_0_2_17_8_41_248_137', N'湖南省_2_17_8_41_248_137', N'湖南达到_2_17_8_41_248_137', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (886, N'979bf4e9-caac-4ae4-aab9-4b6496a0becf', N'Tom_0_1_18_7_42_247_138', N'USA_1_18_7_42_247_138', N'USA_1_18_7_42_247_138', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (887, N'283793d5-0d44-42b3-b228-65ed96fb53b3', N'Tom_0_19_6_43_246_139', N'USA_19_6_43_246_139', N'USA_19_6_43_246_139', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (888, N'6d1d2bd2-5337-4c0d-a316-e9efc984821d', N'Peter_0_20_5_44_245_140', N'湖南省_20_5_44_245_140', N'湖南达到_20_5_44_245_140', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (889, N'212d374a-c697-4b78-8271-53f981ed0cab', N'Jimmy_0_21_4_45_244_141', N'江西省广昌县塘方向天要存_21_4_45_244_141', N'小地方_21_4_45_244_141', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (890, N'be72e15f-7765-4f0d-a314-56c7ce3650da', N'Tom_22_3_46_243_142', N'USA_22_3_46_243_142', N'USA_22_3_46_243_142', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (891, N'd7adf835-7a06-4023-b1ed-16f1f334addb', N'Peter_23_2_47_242_143', N'湖南省_23_2_47_242_143', N'湖南达到_23_2_47_242_143', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (892, N'6404115b-13f9-4f6d-b720-0fef0a2a1319', N'Jimmy_24_1_48_241_144', N'江西省广昌县塘方向天要存_24_1_48_241_144', N'小地方_24_1_48_241_144', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (893, N'1eec75a7-d015-4601-80de-58cf58315173', N'Jimmy_24_49_240_145', N'江西省广昌县塘方向天要存_24_49_240_145', N'小地方_24_49_240_145', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (894, N'8be988af-8da7-4c7f-8c15-1936b52bf3cd', N'Peter_23_50_239_146', N'湖南省_23_50_239_146', N'湖南达到_23_50_239_146', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (895, N'4ec9ff5f-4e0e-4230-b41a-732f44103cc0', N'Tom_22_51_238_147', N'USA_22_51_238_147', N'USA_22_51_238_147', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (896, N'1cad2e5d-d17a-4ba4-9b7f-890d40e055cb', N'Jimmy_0_21_52_237_148', N'江西省广昌县塘方向天要存_21_52_237_148', N'小地方_21_52_237_148', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (897, N'a23790b7-2522-474c-ae31-421bd90d76cf', N'Peter_0_20_53_236_149', N'湖南省_20_53_236_149', N'湖南达到_20_53_236_149', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (898, N'6c2ddc74-999b-4bf3-b7f2-c1f361c30461', N'Tom_0_19_54_235_150', N'USA_19_54_235_150', N'USA_19_54_235_150', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (899, N'aeb578b5-185f-43f6-8bbd-4622853d6b63', N'Tom_0_1_18_55_234_151', N'USA_1_18_55_234_151', N'USA_1_18_55_234_151', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (900, N'231ca2c1-01c5-4378-a852-bd5966b64b9e', N'Peter_0_2_17_56_233_152', N'湖南省_2_17_56_233_152', N'湖南达到_2_17_56_233_152', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (901, N'624a3a15-d2d4-47ec-a36d-d5c992501189', N'Jimmy_0_3_16_57_232_153', N'江西省广昌县塘方向天要存_3_16_57_232_153', N'小地方_3_16_57_232_153', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (902, N'ddab9689-9a0d-4c1e-852d-7336ff8d5857', N'Tom_4_15_58_231_154', N'USA_4_15_58_231_154', N'USA_4_15_58_231_154', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (903, N'c9d68241-6b32-41b4-92ba-b2a109a4cdb8', N'Peter_5_14_59_230_155', N'湖南省_5_14_59_230_155', N'湖南达到_5_14_59_230_155', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (904, N'441b404c-c846-4e9a-9dc5-60b98fe8ea6e', N'Jimmy_6_13_60_229_156', N'江西省广昌县塘方向天要存_6_13_60_229_156', N'小地方_6_13_60_229_156', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (905, N'02297639-2b4c-4d8a-a2a1-5e1a2c58bc61', N'Jimmy_6_1_12_61_228_157', N'江西省广昌县塘方向天要存_6_1_12_61_228_157', N'小地方_6_1_12_61_228_157', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (906, N'51690901-f7c3-4653-94ec-c1288406b0ac', N'Peter_5_2_11_62_227_158', N'湖南省_5_2_11_62_227_158', N'湖南达到_5_2_11_62_227_158', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (907, N'483d6393-2684-4489-a2d9-4b50566df214', N'Tom_4_3_10_63_226_159', N'USA_4_3_10_63_226_159', N'USA_4_3_10_63_226_159', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (908, N'dc4b132b-7b7e-420a-8ceb-0ee67a312b7a', N'Jimmy_0_3_4_9_64_225_160', N'江西省广昌县塘方向天要存_3_4_9_64_225_160', N'小地方_3_4_9_64_225_160', 0, CAST(0x0000A3C100E760A8 AS DateTime))
GO
print 'Processed 900 total records'
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (909, N'2f4f3185-5cee-43f8-9cbe-636b2d5a0f73', N'Peter_0_2_5_8_65_224_161', N'湖南省_2_5_8_65_224_161', N'湖南达到_2_5_8_65_224_161', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (910, N'e5ce27e5-d94d-4dd0-bac2-0fb75f927ccf', N'Tom_0_1_6_7_66_223_162', N'USA_1_6_7_66_223_162', N'USA_1_6_7_66_223_162', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (911, N'dad9eeae-f500-45f1-aae5-5ff6b5ed493a', N'Tom_0_7_6_67_222_163', N'USA_7_6_67_222_163', N'USA_7_6_67_222_163', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (912, N'c55083c5-3ec3-4607-8d2b-58a895e7e8ae', N'Peter_0_8_5_68_221_164', N'湖南省_8_5_68_221_164', N'湖南达到_8_5_68_221_164', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (913, N'bfb42ae8-5a07-4e6e-b273-554f26a46611', N'Jimmy_0_9_4_69_220_165', N'江西省广昌县塘方向天要存_9_4_69_220_165', N'小地方_9_4_69_220_165', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (914, N'e155647a-7e53-4707-b58f-fd8a488c01c8', N'Tom_10_3_70_219_166', N'USA_10_3_70_219_166', N'USA_10_3_70_219_166', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (915, N'39674bf2-90c3-4a70-ab27-8d091e26518b', N'Peter_11_2_71_218_167', N'湖南省_11_2_71_218_167', N'湖南达到_11_2_71_218_167', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (916, N'0ec3817b-918a-4de7-9dfe-098e5dc79d8e', N'Jimmy_12_1_72_217_168', N'江西省广昌县塘方向天要存_12_1_72_217_168', N'小地方_12_1_72_217_168', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (917, N'8e4cc7b6-3d8b-49e4-a367-c176de4126b6', N'Jimmy_12_73_216_169', N'江西省广昌县塘方向天要存_12_73_216_169', N'小地方_12_73_216_169', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (918, N'1b024878-a5fa-4bf4-ba64-1d765eec0179', N'Peter_11_74_215_170', N'湖南省_11_74_215_170', N'湖南达到_11_74_215_170', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (919, N'ee4e6afa-96e4-4dd7-880e-77a4b351f59b', N'Tom_10_75_214_171', N'USA_10_75_214_171', N'USA_10_75_214_171', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (920, N'64d00535-8e28-4c66-aba8-523fa8eb54f2', N'Jimmy_0_9_76_213_172', N'江西省广昌县塘方向天要存_9_76_213_172', N'小地方_9_76_213_172', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (921, N'6c5a1cf8-d74c-413a-9903-728c0d426275', N'Peter_0_8_77_212_173', N'湖南省_8_77_212_173', N'湖南达到_8_77_212_173', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (922, N'ba60e796-ffa9-46d8-9270-f5fc455d21e5', N'Tom_0_7_78_211_174', N'USA_7_78_211_174', N'USA_7_78_211_174', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (923, N'80025356-42a4-4b8d-8acf-dd001ccaaf2d', N'Tom_0_1_6_79_210_175', N'USA_1_6_79_210_175', N'USA_1_6_79_210_175', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (924, N'42fc521a-4fac-4ef8-bb15-74197c84f9f8', N'Peter_0_2_5_80_209_176', N'湖南省_2_5_80_209_176', N'湖南达到_2_5_80_209_176', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (925, N'a9441b3e-3ae8-4d48-b83a-ac542cdd3adc', N'Jimmy_0_3_4_81_208_177', N'江西省广昌县塘方向天要存_3_4_81_208_177', N'小地方_3_4_81_208_177', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (926, N'df1fb363-90c2-4e60-b60f-5d44252afcd2', N'Tom_4_3_82_207_178', N'USA_4_3_82_207_178', N'USA_4_3_82_207_178', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (927, N'091c65e6-b7cb-46ac-9ddc-1f276a9bc8c0', N'Peter_5_2_83_206_179', N'湖南省_5_2_83_206_179', N'湖南达到_5_2_83_206_179', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (928, N'e4ea2dfb-127f-4848-827b-84c3c462f42e', N'Jimmy_6_1_84_205_180', N'江西省广昌县塘方向天要存_6_1_84_205_180', N'小地方_6_1_84_205_180', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (929, N'26adcdf3-0478-4080-8940-f488d662a084', N'Jimmy_6_85_204_181', N'江西省广昌县塘方向天要存_6_85_204_181', N'小地方_6_85_204_181', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (930, N'b3980d97-286e-4135-9249-52c86b94c983', N'Peter_5_86_203_182', N'湖南省_5_86_203_182', N'湖南达到_5_86_203_182', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (931, N'5e77ee11-4c65-4012-b963-a85a000e7e34', N'Tom_4_87_202_183', N'USA_4_87_202_183', N'USA_4_87_202_183', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (932, N'9130fd57-2992-43c2-acfe-1fce09cb25f8', N'Jimmy_0_3_88_201_184', N'江西省广昌县塘方向天要存_3_88_201_184', N'小地方_3_88_201_184', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (933, N'adaffa45-627f-4e89-9e4c-fa3f550de574', N'Peter_0_2_89_200_185', N'湖南省_2_89_200_185', N'湖南达到_2_89_200_185', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (934, N'df0754da-688f-4256-bab6-af8aa8704f33', N'Tom_0_1_90_199_186', N'USA_1_90_199_186', N'USA_1_90_199_186', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (935, N'fdee57c7-1230-4b64-bee5-0cc87f89bb16', N'Tom_0_91_198_187', N'USA_91_198_187', N'USA_91_198_187', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (936, N'c31a49df-c55f-4eef-bfa5-5573f564002f', N'Peter_0_92_197_188', N'湖南省_92_197_188', N'湖南达到_92_197_188', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (937, N'a2e26c70-c2b2-4636-ac29-db3146dcd9b3', N'Jimmy_0_93_196_189', N'江西省广昌县塘方向天要存_93_196_189', N'小地方_93_196_189', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (938, N'c2b56f27-120d-45fa-81f7-2d8481619473', N'Tom_94_195_190', N'USA_94_195_190', N'USA_94_195_190', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (939, N'24e9357d-e822-4ff2-8b46-c4f7c00f2e44', N'Peter_95_194_191', N'湖南省_95_194_191', N'湖南达到_95_194_191', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (940, N'36712bc5-b358-4b97-a7f4-043a6ab6df6c', N'Jimmy_96_193_192', N'江西省广昌县塘方向天要存_96_193_192', N'小地方_96_193_192', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (941, N'7d6fa3e4-9ba8-4dbb-8af7-08440756183d', N'Jimmy_96_1_192_193', N'江西省广昌县塘方向天要存_96_1_192_193', N'小地方_96_1_192_193', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (942, N'71b2c3bb-9219-4e17-af56-d8e93ca1ed42', N'Peter_95_2_191_194', N'湖南省_95_2_191_194', N'湖南达到_95_2_191_194', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (943, N'42f90ce8-ae65-4787-aa96-7a3927f73587', N'Tom_94_3_190_195', N'USA_94_3_190_195', N'USA_94_3_190_195', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (944, N'990886be-21a7-44ce-a0c7-6aa1384c3e96', N'Jimmy_0_93_4_189_196', N'江西省广昌县塘方向天要存_93_4_189_196', N'小地方_93_4_189_196', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (945, N'de8abcf6-0f8e-4ea7-8e1e-d17528c6186b', N'Peter_0_92_5_188_197', N'湖南省_92_5_188_197', N'湖南达到_92_5_188_197', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (946, N'4513120b-9a5f-4870-a18e-3b287244622e', N'Tom_0_91_6_187_198', N'USA_91_6_187_198', N'USA_91_6_187_198', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (947, N'aede93fb-ad82-4204-b503-c5e8de0022c1', N'Tom_0_1_90_7_186_199', N'USA_1_90_7_186_199', N'USA_1_90_7_186_199', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (948, N'e56280de-8d5d-49a7-9dda-8159a31acbd1', N'Peter_0_2_89_8_185_200', N'湖南省_2_89_8_185_200', N'湖南达到_2_89_8_185_200', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (949, N'4d21637c-8b76-4ea1-8287-27cec14205af', N'Jimmy_0_3_88_9_184_201', N'江西省广昌县塘方向天要存_3_88_9_184_201', N'小地方_3_88_9_184_201', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (950, N'10a2cc6a-079b-4b01-89c6-93b776364299', N'Tom_4_87_10_183_202', N'USA_4_87_10_183_202', N'USA_4_87_10_183_202', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (951, N'8e400e5b-f1f6-4c0a-a353-11821c62ef67', N'Peter_5_86_11_182_203', N'湖南省_5_86_11_182_203', N'湖南达到_5_86_11_182_203', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (952, N'9b0d35ae-b55b-4ba8-9583-6c3937079f56', N'Jimmy_6_85_12_181_204', N'江西省广昌县塘方向天要存_6_85_12_181_204', N'小地方_6_85_12_181_204', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (953, N'4852a41a-3602-4dd5-bea4-29b4cc09129b', N'Jimmy_6_1_84_13_180_205', N'江西省广昌县塘方向天要存_6_1_84_13_180_205', N'小地方_6_1_84_13_180_205', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (954, N'aaf84f8f-4f93-4b07-a9bb-30689ba4cadf', N'Peter_5_2_83_14_179_206', N'湖南省_5_2_83_14_179_206', N'湖南达到_5_2_83_14_179_206', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (955, N'8752f276-4c8f-4001-bfd4-a3364868b51d', N'Tom_4_3_82_15_178_207', N'USA_4_3_82_15_178_207', N'USA_4_3_82_15_178_207', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (956, N'2e789f95-c640-4d7c-ac50-7f79bdc5d3e7', N'Jimmy_0_3_4_81_16_177_208', N'江西省广昌县塘方向天要存_3_4_81_16_177_208', N'小地方_3_4_81_16_177_208', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (957, N'6e8815d4-4a48-4827-b066-7e6d78cae559', N'Peter_0_2_5_80_17_176_209', N'湖南省_2_5_80_17_176_209', N'湖南达到_2_5_80_17_176_209', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (958, N'fc0a8083-683d-4889-b9c0-4dce3eb8be5c', N'Tom_0_1_6_79_18_175_210', N'USA_1_6_79_18_175_210', N'USA_1_6_79_18_175_210', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (959, N'b48c490d-beb9-4ad4-8cd0-31186430b30a', N'Tom_0_7_78_19_174_211', N'USA_7_78_19_174_211', N'USA_7_78_19_174_211', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (960, N'3d5f1219-32e1-447a-8615-162a1ace44ef', N'Peter_0_8_77_20_173_212', N'湖南省_8_77_20_173_212', N'湖南达到_8_77_20_173_212', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (961, N'28b23696-4762-4b3f-bc18-06d46c7a16df', N'Jimmy_0_9_76_21_172_213', N'江西省广昌县塘方向天要存_9_76_21_172_213', N'小地方_9_76_21_172_213', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (962, N'cafac12d-1a49-4ed8-a7b7-6fe39ea38717', N'Tom_10_75_22_171_214', N'USA_10_75_22_171_214', N'USA_10_75_22_171_214', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (963, N'dda9f475-0aad-4f38-aae5-cf60ad8136e5', N'Peter_11_74_23_170_215', N'湖南省_11_74_23_170_215', N'湖南达到_11_74_23_170_215', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (964, N'eb96b52f-e68c-4ff8-b337-1f1892e2ea2b', N'Jimmy_12_73_24_169_216', N'江西省广昌县塘方向天要存_12_73_24_169_216', N'小地方_12_73_24_169_216', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (965, N'c2a03d6e-8c31-4315-a464-4266d672e416', N'Jimmy_12_1_72_25_168_217', N'江西省广昌县塘方向天要存_12_1_72_25_168_217', N'小地方_12_1_72_25_168_217', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (966, N'f0634c51-56c1-478f-90f1-bfcf4656d367', N'Peter_11_2_71_26_167_218', N'湖南省_11_2_71_26_167_218', N'湖南达到_11_2_71_26_167_218', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (967, N'97b0c7e6-6ae8-43e0-b366-e56e8db5c243', N'Tom_10_3_70_27_166_219', N'USA_10_3_70_27_166_219', N'USA_10_3_70_27_166_219', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (968, N'7727d9b1-01bc-41bb-9fcb-f6fa0aaed793', N'Jimmy_0_9_4_69_28_165_220', N'江西省广昌县塘方向天要存_9_4_69_28_165_220', N'小地方_9_4_69_28_165_220', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (969, N'8f5a61d0-40b7-48e8-9f94-d56f1432f070', N'Peter_0_8_5_68_29_164_221', N'湖南省_8_5_68_29_164_221', N'湖南达到_8_5_68_29_164_221', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (970, N'e154ad42-8b1c-4f9a-b531-0229c7bed1f3', N'Tom_0_7_6_67_30_163_222', N'USA_7_6_67_30_163_222', N'USA_7_6_67_30_163_222', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (971, N'962be98a-1a01-4622-8300-cf9029bcbc04', N'Tom_0_1_6_7_66_31_162_223', N'USA_1_6_7_66_31_162_223', N'USA_1_6_7_66_31_162_223', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (972, N'76e791b6-0e89-47a8-8212-161af7cc22ad', N'Peter_0_2_5_8_65_32_161_224', N'湖南省_2_5_8_65_32_161_224', N'湖南达到_2_5_8_65_32_161_224', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (973, N'2188d8d6-bf9c-405d-ace0-21db49341625', N'Jimmy_0_3_4_9_64_33_160_225', N'江西省广昌县塘方向天要存_3_4_9_64_33_160_225', N'小地方_3_4_9_64_33_160_225', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (974, N'50e4bb08-1f22-4b02-bf27-bd997900da0b', N'Tom_4_3_10_63_34_159_226', N'USA_4_3_10_63_34_159_226', N'USA_4_3_10_63_34_159_226', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (975, N'597e3568-9d7c-4d42-b1ab-496659ecb06c', N'Peter_5_2_11_62_35_158_227', N'湖南省_5_2_11_62_35_158_227', N'湖南达到_5_2_11_62_35_158_227', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (976, N'b03df15f-fd60-4b1e-ae0c-14b1903c254c', N'Jimmy_6_1_12_61_36_157_228', N'江西省广昌县塘方向天要存_6_1_12_61_36_157_228', N'小地方_6_1_12_61_36_157_228', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (977, N'5e1c4eab-269f-438d-9f8b-deb97102c011', N'Jimmy_6_13_60_37_156_229', N'江西省广昌县塘方向天要存_6_13_60_37_156_229', N'小地方_6_13_60_37_156_229', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (978, N'b92b8772-99d5-43b9-bc2c-e0470c07313c', N'Peter_5_14_59_38_155_230', N'湖南省_5_14_59_38_155_230', N'湖南达到_5_14_59_38_155_230', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (979, N'f0cba7ea-de07-40ce-9b86-7477900f4ba2', N'Tom_4_15_58_39_154_231', N'USA_4_15_58_39_154_231', N'USA_4_15_58_39_154_231', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (980, N'61bac2d9-0b17-4a29-8895-4b2bd25e8ea8', N'Jimmy_0_3_16_57_40_153_232', N'江西省广昌县塘方向天要存_3_16_57_40_153_232', N'小地方_3_16_57_40_153_232', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (981, N'1e6e2b86-6991-492f-8dc5-84aa1110c8bf', N'Peter_0_2_17_56_41_152_233', N'湖南省_2_17_56_41_152_233', N'湖南达到_2_17_56_41_152_233', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (982, N'83a67e0d-9201-44ef-8f72-30140466c134', N'Tom_0_1_18_55_42_151_234', N'USA_1_18_55_42_151_234', N'USA_1_18_55_42_151_234', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (983, N'cb4b83be-f150-49c9-9bb8-1074afd066c1', N'Tom_0_19_54_43_150_235', N'USA_19_54_43_150_235', N'USA_19_54_43_150_235', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (984, N'46c1fbd2-d0f8-4e02-891b-1891e40f299d', N'Peter_0_20_53_44_149_236', N'湖南省_20_53_44_149_236', N'湖南达到_20_53_44_149_236', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (985, N'82cfdf3f-32f3-4b92-ab86-5d639cf4224a', N'Jimmy_0_21_52_45_148_237', N'江西省广昌县塘方向天要存_21_52_45_148_237', N'小地方_21_52_45_148_237', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (986, N'19c409a9-d113-4069-8b7f-49594995d13b', N'Tom_22_51_46_147_238', N'USA_22_51_46_147_238', N'USA_22_51_46_147_238', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (987, N'6de1435d-4aae-4548-bc22-37c95788cf7d', N'Peter_23_50_47_146_239', N'湖南省_23_50_47_146_239', N'湖南达到_23_50_47_146_239', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (988, N'4895d663-3377-40b7-9e22-785cc79ef40e', N'Jimmy_24_49_48_145_240', N'江西省广昌县塘方向天要存_24_49_48_145_240', N'小地方_24_49_48_145_240', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (989, N'8ce6f074-38ea-47eb-9819-3f4008ac35e3', N'Jimmy_24_1_48_49_144_241', N'江西省广昌县塘方向天要存_24_1_48_49_144_241', N'小地方_24_1_48_49_144_241', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (990, N'da652c23-164b-48d0-8222-d520f9144f53', N'Peter_23_2_47_50_143_242', N'湖南省_23_2_47_50_143_242', N'湖南达到_23_2_47_50_143_242', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (991, N'9245f145-b801-4160-aa0d-82e56de7d00a', N'Tom_22_3_46_51_142_243', N'USA_22_3_46_51_142_243', N'USA_22_3_46_51_142_243', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (992, N'e4649fed-976c-43e0-ad8a-3f25ab2ce2e8', N'Jimmy_0_21_4_45_52_141_244', N'江西省广昌县塘方向天要存_21_4_45_52_141_244', N'小地方_21_4_45_52_141_244', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (993, N'f77eb3c7-adbd-449c-acce-00bd8315da3e', N'Peter_0_20_5_44_53_140_245', N'湖南省_20_5_44_53_140_245', N'湖南达到_20_5_44_53_140_245', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (994, N'72aafc80-d45b-4218-bfe2-53a6fe1e6110', N'Tom_0_19_6_43_54_139_246', N'USA_19_6_43_54_139_246', N'USA_19_6_43_54_139_246', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (995, N'bedc5d12-5580-4763-8366-48551d844e92', N'Tom_0_1_18_7_42_55_138_247', N'USA_1_18_7_42_55_138_247', N'USA_1_18_7_42_55_138_247', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (996, N'07216bb8-7062-496b-aada-f416181e3ac8', N'Peter_0_2_17_8_41_56_137_248', N'湖南省_2_17_8_41_56_137_248', N'湖南达到_2_17_8_41_56_137_248', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (997, N'3feee79b-5785-4945-bf5f-9c402b1c59b0', N'Jimmy_0_3_16_9_40_57_136_249', N'江西省广昌县塘方向天要存_3_16_9_40_57_136_249', N'小地方_3_16_9_40_57_136_249', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (998, N'3023eb48-58c0-451e-bda2-2f1148b2f75a', N'Tom_4_15_10_39_58_135_250', N'USA_4_15_10_39_58_135_250', N'USA_4_15_10_39_58_135_250', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (999, N'657a3a04-431a-42dd-a352-a898a4d0e21d', N'Peter_5_14_11_38_59_134_251', N'湖南省_5_14_11_38_59_134_251', N'湖南达到_5_14_11_38_59_134_251', 0, CAST(0x0000A3C100E760A8 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (1000, N'8a204b5f-8b84-47b3-afb2-2ea416395129', N'Jimmy_6_13_12_37_60_133_252', N'江西省广昌县塘方向天要存_6_13_12_37_60_133_252', N'小地方_6_13_12_37_60_133_252', 0, CAST(0x0000A3C100E760A8 AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Table [dbo].[TranLog]    Script Date: 04/12/2015 21:53:42 ******/
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
/****** Object:  Table [dbo].[TranConfig]    Script Date: 04/12/2015 21:53:42 ******/
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
	[Import] [int] NULL,
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
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [LastStamp], [Direct], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [Import], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (1, N'58ea51c1-ce07-4cd7-bb5b-fcac7d87f33e', N'配置数据（不能删除）', N'PZSJ', -1, 20, 0, 0, N'if object_id(''tempdb..#temp_TranConfig'') is not null drop table #temp_TranConfig;select top 0 [Guid]      ,[Name]      ,[Code]      ,[Sort]      ,[MaxCount]      ,[Direct]      ,[HeaderSql]      ,[DetailSql]      ,[FooterSql]      ,[Remark]      ,[Status]      ,[CreatedTime]      ,[CreatedBy]      ,[ModifiedTime]      ,[ModifiedBy] into #temp_TranConfig from TranConfig(nolock);', N'select top $rowCount$ ''insert #temp_TranConfig select ''+ dbo.bims_f_var_to_string(Guid)+'',''+dbo.bims_f_var_to_string(Name)+'',''+dbo.bims_f_var_to_string(Code)  +'',''+dbo.bims_f_var_to_string(Sort)+'',''+dbo.bims_f_var_to_string(MaxCount)+'',''+dbo.bims_f_var_to_string(Direct) +'',''+dbo.bims_f_var_to_string(HeaderSql)+'',''+dbo.bims_f_var_to_string(DetailSql)+'',''+dbo.bims_f_var_to_string(FooterSql)+'',''+dbo.bims_f_var_to_string(Remark)+'',''+dbo.bims_f_var_to_string(Status)+'',''+dbo.bims_f_var_to_string(CreatedTime)+'',''+dbo.bims_f_var_to_string(CreatedBy)+'',''+dbo.bims_f_var_to_string(ModifiedTime)+'',''+dbo.bims_f_var_to_string(ModifiedBy) from TranConfig where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) Order by [TimeStamp];', N'Update b set b.name = a.name,b.code = a.code ,b.sort = a.sort ,b.MaxCount = a.MaxCount,b.Direct = a.Direct ,b.HeaderSql = a.HeaderSql,b.DetailSql = a.DetailSql,b.FooterSql = a.FooterSql,b.remark = a.remark,b.Status = a.Status,b.CreatedBy = a.CreatedBy,b.CreatedTime = a.CreatedTime ,b.ModifiedBy = a.ModifiedBy,b.ModifiedTime = a.ModifiedTime from #temp_TranConfig a,TranConfig b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into TranConfig([Guid]      ,[Name]      ,[Code]      ,[Sort]      ,[MaxCount]      ,[Direct]      ,[HeaderSql]      ,[DetailSql]      ,[FooterSql]      ,[Remark]      ,[Status]      ,[CreatedTime]      ,[CreatedBy]      ,[ModifiedTime])  select[Guid]      ,[Name]      ,[Code]      ,[Sort]      ,[MaxCount]      ,[Direct]      ,[HeaderSql]      ,[DetailSql]      ,[FooterSql]      ,[Remark]      ,[Status]      ,[CreatedTime]      ,[CreatedBy]      ,[ModifiedTime]  from #temp_TranConfig a   where a.Guid not in (Select [GUID] From TranConfig);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', N'', 0, 2, CAST(0x0000A3BF014A788A AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [LastStamp], [Direct], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [Import], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (2, N'02d3160d-da23-4890-b546-bab377842671', N'客户资料传门店', N'KHZL2C', 2, 20, 0, 0, N'if object_id(''tempdb..#temp_User'') is not null drop table #temp_User;select top 0 [GUID]      ,[Name]     ,[Address],[Remark]      ,[State]      ,[CreatedTime]  into #temp_User from [User](nolock);', N'select top $rowCount$ ''insert #temp_User([GUID],[Name],[Address],[Remark],[State],[CreatedTime]) select ''+dbo.bims_f_var_to_string(Guid)+'',''+dbo.bims_f_var_to_string(Name)+'',''+dbo.bims_f_var_to_string(Address)+'',''+dbo.bims_f_var_to_string(Remark)+'',''+dbo.bims_f_var_to_string(State)+'',''+dbo.bims_f_var_to_string(CreatedTime) from [User] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) Order by [TimeStamp];', N'Update b set b.name = a.name,b.Address = a.Address ,b.State = a.State,b.Remark = a.Remark,b.CreatedTime = a.CreatedTime from #temp_User a,[User] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [User]([GUID],[Name],[Address],[Remark],[State],[CreatedTime]) select [GUID],[Name],[Address],[Remark],[State],[CreatedTime] from #temp_User a   where a.Guid not in (Select [GUID] From [User]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', NULL, 0, 0, CAST(0x0000A3C100E5B2E0 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [LastStamp], [Direct], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [Import], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (3, N'158af478-2bb2-4690-aaab-801a38e25503', N'客户端数据', N'KHD', 1, 20, 0, 0, N'if object_id(''tempdb..#temp_Client'') is not null drop table #temp_Client;select top 0 [GUID]      ,[Code]      ,[Name]      ,[Type]      ,[Address]      ,[Status]      ,[CreatedBy]      ,[CreatedTime]      ,[ModifiedBy]      ,[ModifiedTime] into #temp_Client from Client(nolock);', N'select top $rowCount$ ''insert #temp_Client([GUID]      ,[Name]  ,[Code]    ,[Type]      ,[Address]      ,[Status]      ,[CreatedBy]      ,[CreatedTime]      ,[ModifiedBy]      ,[ModifiedTime]) select   ''+dbo.bims_f_var_to_string(Guid)+'',''+dbo.bims_f_var_to_string(Name)+'',''+dbo.bims_f_var_to_string(Code)+'',''+dbo.bims_f_var_to_string(Type)+'',''+dbo.bims_f_var_to_string(Address)+'',''+dbo.bims_f_var_to_string(Status)+'',''+dbo.bims_f_var_to_string(CreatedTime)+'',''+dbo.bims_f_var_to_string(CreatedBy)+'',''+dbo.bims_f_var_to_string(ModifiedTime)+'',''+dbo.bims_f_var_to_string(ModifiedBy) from Client where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) Order by [TimeStamp];', N'Update b set b.name = a.name,b.code = a.code, b.Type = a.Type,b.Address = a.Address ,b.Status = a.Status,b.CreatedBy = a.CreatedBy,b.CreatedTime = a.CreatedTime ,b.ModifiedBy = a.ModifiedBy,b.ModifiedTime = a.ModifiedTime from #temp_Client a,Client b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into Client([GUID]      ,[Code]      ,[Name]      ,[Type]      ,[Address]      ,[Status]      ,[CreatedBy]      ,[CreatedTime]      ,[ModifiedBy]      ,[ModifiedTime]) select [GUID]      ,[Code]      ,[Name]      ,[Type]      ,[Address]      ,[Status]      ,[CreatedBy]      ,[CreatedTime]      ,[ModifiedBy]      ,[ModifiedTime]  from #temp_Client a   where a.Guid not in (Select [GUID] From Client);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', NULL, 0, 0, CAST(0x0000A3BF015D31D7 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [LastStamp], [Direct], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [Import], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (4, N'02d3160d-da23-4890-b546-bab377842670', N'客户资料', N'KHZL', 2, 20, 0, 1, N'if object_id(''tempdb..#temp_User'') is not null drop table #temp_User;select top 0 [GUID]      ,[Name]     ,[Address],[Remark]      ,[State]      ,[CreatedTime]  into #temp_User from [User](nolock);', N'select top $rowCount$ ''insert #temp_User([GUID],[Name],[Address],[Remark],[State],[CreatedTime]) select ''+dbo.bims_f_var_to_string(Guid)+'',''+dbo.bims_f_var_to_string(Name)+'',''+dbo.bims_f_var_to_string(Address)+'',''+dbo.bims_f_var_to_string(Remark)+'',''+dbo.bims_f_var_to_string(State)+'',''+dbo.bims_f_var_to_string(CreatedTime) from [User] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) Order by [TimeStamp];', N'Update b set b.name = a.name,b.Address = a.Address ,b.State = a.State,b.Remark = a.Remark,b.CreatedTime = a.CreatedTime from #temp_User a,[User] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [User]([GUID],[Name],[Address],[Remark],[State],[CreatedTime]) select [GUID],[Name],[Address],[Remark],[State],[CreatedTime] from #temp_User a   where a.Guid not in (Select [GUID] From [User]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', NULL, 0, 0, CAST(0x0000A3C100E5B2E0 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [LastStamp], [Direct], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [Import], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (6, N'0b2de912-abbf-4f2b-9ba3-69d34e68b8c8', N'下拉资料', N'DDDW', 3, 30, NULL, 0, N'if object_id(''tempdb..#temp_sys_dddw'') is not null drop table #temp_sys_dddw;select top 0 [dddwno]      ,[funcname]  ,[dddwlist]      ,[descr]      ,[notes]      ,[isdefault] into #temp_sys_dddw from sys_dddw(nolock);', N'select top $rowCount$ ''insert #temp_sys_dddw([dddwno]      ,[funcname]  ,[dddwlist]      ,[descr]      ,[notes]      ,[isdefault]) select   ''+dbo.bims_f_var_to_string(dddwno)+'',''+dbo.bims_f_var_to_string(funcname)+'',''+dbo.bims_f_var_to_string(dddwlist)+'',''+dbo.bims_f_var_to_string(descr)+'',''+dbo.bims_f_var_to_string(notes)+'',''+dbo.bims_f_var_to_string(isdefault)from sys_dddw where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) Order by [timeStamp];', N'insert into [sys_dddw]([dddwno],[funcname],[dddwlist],[descr],[notes],[isdefault]) select [dddwno],[funcname],[dddwlist],[descr],[notes],[isdefault]  from #temp_[sys_dddw] a  ;if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', NULL, 0, 0, CAST(0x0000A3CB0161BEA0 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [LastStamp], [Direct], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [Import], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (7, N'29b15f62-eb46-4d55-b477-dacf0ef4e52a', N'元数据表', N'Meta_KV_T_C', 0, 20, NULL, 0, N'if object_id(''tempdb..#temp_Meta_KeyValue'') is not null drop table #temp_Meta_KeyValue;select top 0 [TableName],[ColName],[Value],[Text] into #temp_Meta_KeyValue from [Meta_KeyValue](nolock);', N'select top $rowCount$ ''insert #temp_Meta_KeyValue([TableName],[ColName],[Value],[Text]) select ''+dbo.bims_f_var_to_string(TableName)+'',''+dbo.bims_f_var_to_string(ColName)+'',''+dbo.bims_f_var_to_string(Value)+'',''+dbo.bims_f_var_to_string(Text) from [Meta_KeyValue] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) Order by [TimeStamp];', N'Update b set b.TableName = a.TableName,b.ColName = a.ColName,b.Value = a.Value,b.Text = a.Text from #temp_Meta_KeyValue a,[Meta_KeyValue] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [Meta_KeyValue]([TableName],[ColName],[Value],[Text]) select [TableName],[ColName],[Value],[Text] from #temp_Meta_KeyValue a   where a.Guid not in (Select [GUID] From [Meta_KeyValue]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', N'元数据表传输到客户端', 0, 2, CAST(0x0000A47801190A44 AS DateTime), N'abc@live.cn', NULL, NULL)
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [LastStamp], [Direct], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [Import], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (8, N'9d460fd2-fa16-4671-b258-120955c91da9', N'北京店', N'DDDW1', 200, 30, NULL, 0, N'if object_id(''tempdb..#temp_MidTransfer'') is not null drop table #temp_MidTransfer;select top 0 [Guid],[ConfigGuid],[ConfigName],[Target],[Source],[HeaderSql],[DetailSql],[FooterSql],[TranTime] into #temp_MidTransfer from [MidTransfer](nolock);', N'select top $rowCount$ ''insert #temp_MidTransfer([Guid],[ConfigGuid],[ConfigName],[Target],[Source],[HeaderSql],[DetailSql],[FooterSql],[TranTime]) select ''+dbo.bims_f_var_to_string(Guid)+'',''+dbo.bims_f_var_to_string(ConfigGuid)+'',''+dbo.bims_f_var_to_string(ConfigName)+'',''+dbo.bims_f_var_to_string(Target)+'',''+dbo.bims_f_var_to_string(Source)+'',''+dbo.bims_f_var_to_string(HeaderSql)+'',''+dbo.bims_f_var_to_string(DetailSql)+'',''+dbo.bims_f_var_to_string(FooterSql)+'',''+dbo.bims_f_var_to_string(TranTime) from [MidTransfer] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) Order by [TimeStamp];', N'Update b set b.Guid = a.Guid,b.ConfigGuid = a.ConfigGuid,b.ConfigName = a.ConfigName,b.Target = a.Target,b.Source = a.Source,b.HeaderSql = a.HeaderSql,b.DetailSql = a.DetailSql,b.FooterSql = a.FooterSql,b.TranTime = a.TranTime from #temp_MidTransfer a,[MidTransfer] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [MidTransfer]([Guid],[ConfigGuid],[ConfigName],[Target],[Source],[HeaderSql],[DetailSql],[FooterSql],[TranTime]) select [Guid],[ConfigGuid],[ConfigName],[Target],[Source],[HeaderSql],[DetailSql],[FooterSql],[TranTime] from #temp_MidTransfer a   where a.Guid not in (Select [GUID] From [MidTransfer]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', NULL, 1, 0, CAST(0x0000A4780121DD14 AS DateTime), N'abc@live.cn', CAST(0x0000A47801607D62 AS DateTime), N'abc@live.cn')
SET IDENTITY_INSERT [dbo].[TranConfig] OFF
/****** Object:  Table [dbo].[MidTransfer]    Script Date: 04/12/2015 21:53:42 ******/
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
/****** Object:  Table [dbo].[Meta_KeyValue]    Script Date: 04/12/2015 21:53:42 ******/
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
/****** Object:  Table [dbo].[LoginUser]    Script Date: 04/12/2015 21:53:42 ******/
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
/****** Object:  Table [dbo].[Client]    Script Date: 04/12/2015 21:53:42 ******/
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
SET IDENTITY_INSERT [dbo].[Client] OFF
/****** Object:  UserDefinedFunction [dbo].[bims_f_var_to_string]    Script Date: 04/12/2015 21:53:43 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 04/12/2015 21:53:43 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 04/12/2015 21:53:43 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 04/12/2015 21:53:43 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 04/12/2015 21:53:43 ******/
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
/****** Object:  Default [DF_User_Guid]    Script Date: 04/12/2015 21:53:42 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Guid]  DEFAULT (newid()) FOR [Guid]
GO
/****** Object:  Default [DF_User_CreatedTime]    Script Date: 04/12/2015 21:53:42 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
/****** Object:  Default [DF_TranLog_TranTime]    Script Date: 04/12/2015 21:53:42 ******/
ALTER TABLE [dbo].[TranLog] ADD  CONSTRAINT [DF_TranLog_TranTime]  DEFAULT (getdate()) FOR [TranTime]
GO
/****** Object:  Default [DF_Table_1_GUID]    Script Date: 04/12/2015 21:53:42 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_Table_1_GUID]  DEFAULT (newid()) FOR [Guid]
GO
/****** Object:  Default [DF_TranConfig_Sort]    Script Date: 04/12/2015 21:53:42 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Sort]  DEFAULT ((0)) FOR [Sort]
GO
/****** Object:  Default [DF_TranConfig_MaxCount]    Script Date: 04/12/2015 21:53:42 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_MaxCount]  DEFAULT ((20)) FOR [MaxCount]
GO
/****** Object:  Default [DF_TranConfig_Direct]    Script Date: 04/12/2015 21:53:42 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Direct]  DEFAULT ((0)) FOR [Direct]
GO
/****** Object:  Default [DF_TranConfig_Status]    Script Date: 04/12/2015 21:53:42 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_TranConfig_Import]    Script Date: 04/12/2015 21:53:42 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Import]  DEFAULT ((0)) FOR [Import]
GO
/****** Object:  Default [DF_TranConfig_CreatedTime]    Script Date: 04/12/2015 21:53:42 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
/****** Object:  Default [DF_MidTransfer_Guid]    Script Date: 04/12/2015 21:53:42 ******/
ALTER TABLE [dbo].[MidTransfer] ADD  CONSTRAINT [DF_MidTransfer_Guid]  DEFAULT (newid()) FOR [Guid]
GO
/****** Object:  Default [DF_Client_GUID]    Script Date: 04/12/2015 21:53:42 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_GUID]  DEFAULT (newid()) FOR [GUID]
GO
/****** Object:  Default [DF_Client_IsCurrent]    Script Date: 04/12/2015 21:53:42 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_IsCurrent]  DEFAULT ((0)) FOR [IsCurrent]
GO
/****** Object:  Default [DF_Client_Type]    Script Date: 04/12/2015 21:53:42 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_Type]  DEFAULT ((1)) FOR [Type]
GO
/****** Object:  Default [DF_Client_Status]    Script Date: 04/12/2015 21:53:42 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 04/12/2015 21:53:43 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 04/12/2015 21:53:43 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 04/12/2015 21:53:43 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]    Script Date: 04/12/2015 21:53:43 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
