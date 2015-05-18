USE [master]
GO
/****** Object:  Database [ES.Client]    Script Date: 05/18/2015 17:01:43 ******/
CREATE DATABASE [ES.Client] ON  PRIMARY 
( NAME = N'ES.Client', FILENAME = N'E:\DB\MSSQL\ES.Client.mdf' , SIZE = 110592KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ES.Client_log', FILENAME = N'E:\DB\MSSQL\ES.Client_log.ldf' , SIZE = 102144KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ES.Client] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ES.Client].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ES.Client] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ES.Client] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ES.Client] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ES.Client] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ES.Client] SET ARITHABORT OFF
GO
ALTER DATABASE [ES.Client] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ES.Client] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ES.Client] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ES.Client] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ES.Client] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ES.Client] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ES.Client] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ES.Client] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ES.Client] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ES.Client] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ES.Client] SET  DISABLE_BROKER
GO
ALTER DATABASE [ES.Client] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ES.Client] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ES.Client] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ES.Client] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ES.Client] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ES.Client] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ES.Client] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ES.Client] SET  READ_WRITE
GO
ALTER DATABASE [ES.Client] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ES.Client] SET  MULTI_USER
GO
ALTER DATABASE [ES.Client] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ES.Client] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'ES.Client', N'ON'
GO
USE [ES.Client]
GO
/****** Object:  Table [dbo].[User]    Script Date: 05/18/2015 17:01:44 ******/
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
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (1, N'6cf39e0d-32da-419f-a6fa-165d1a37e91a', N'Peter_0_8_29_116_77', N'湖南省_8_29_116_77', N'湖南达到_8_29_116_77', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (2, N'f7e13f2b-9b96-4b92-9270-78c87481397a', N'Tom_0_7_30_115_78', N'USA_7_30_115_78', N'USA_7_30_115_78', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (3, N'570cb7c2-c945-44e6-a0d8-122783c08a9e', N'Tom_0_1_6_31_114_79', N'USA_1_6_31_114_79', N'USA_1_6_31_114_79', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (4, N'03215836-78af-42b4-8966-ce87353c73c9', N'Peter_0_2_5_32_113_80', N'湖南省_2_5_32_113_80', N'湖南达到_2_5_32_113_80', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (5, N'59db5520-beb9-4048-8fe8-f11564a72c63', N'Jimmy_0_3_4_33_112_81', N'江西省广昌县塘方向天要存_3_4_33_112_81', N'小地方_3_4_33_112_81', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (6, N'061bda2d-6560-4c61-8d8e-8af0b9c6fb0e', N'Tom_4_3_34_111_82', N'USA_4_3_34_111_82', N'USA_4_3_34_111_82', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (7, N'cd46d86a-d5d3-4547-bbd1-3daa7d2c7171', N'Peter_5_2_35_110_83', N'湖南省_5_2_35_110_83', N'湖南达到_5_2_35_110_83', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (8, N'b66d0448-5ed1-4385-a5c4-db905a719e4c', N'Jimmy_6_1_36_109_84', N'江西省广昌县塘方向天要存_6_1_36_109_84', N'小地方_6_1_36_109_84', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (9, N'37f16f69-31fe-47f4-b345-1730779dc373', N'Jimmy_6_37_108_85', N'江西省广昌县塘方向天要存_6_37_108_85', N'小地方_6_37_108_85', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (10, N'3a85105e-7a0e-4bd9-af26-c6a2caf15f6f', N'Peter_5_38_107_86', N'湖南省_5_38_107_86', N'湖南达到_5_38_107_86', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (11, N'0a8d5275-f14f-470f-ace3-43e7dc62f4f3', N'Tom_4_39_106_87', N'USA_4_39_106_87', N'USA_4_39_106_87', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (12, N'39ad8bac-9704-40dd-ae2f-fde480c1a360', N'Jimmy_0_3_40_105_88', N'江西省广昌县塘方向天要存_3_40_105_88', N'小地方_3_40_105_88', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (13, N'750e078e-a04f-45de-9e0c-58209811ff37', N'Peter_0_2_41_104_89', N'湖南省_2_41_104_89', N'湖南达到_2_41_104_89', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (14, N'9a4daa52-0b71-46d5-b94a-824cfe885d93', N'Tom_0_1_42_103_90', N'USA_1_42_103_90', N'USA_1_42_103_90', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (15, N'4d518af9-607b-4b7a-98c9-05b9b495effa', N'Tom_0_43_102_91', N'USA_43_102_91', N'USA_43_102_91', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (16, N'1e72d0d6-0ae0-4ec4-b1db-7d44c1eddd85', N'Peter_0_44_101_92', N'湖南省_44_101_92', N'湖南达到_44_101_92', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (17, N'dd9f246f-4c3e-48e0-98ac-80ff086a721c', N'Jimmy_0_45_100_93', N'江西省广昌县塘方向天要存_45_100_93', N'小地方_45_100_93', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (18, N'90896635-063f-48af-b9d3-5ceeec20aebb', N'Tom_46_99_94', N'USA_46_99_94', N'USA_46_99_94', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (19, N'7e379c55-e10a-4975-9c26-40b005f97fd9', N'Peter_47_98_95', N'湖南省_47_98_95', N'湖南达到_47_98_95', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (20, N'589f43d2-6b79-4a81-8b2d-8c873e4d582b', N'Jimmy_48_97_96', N'江西省广昌县塘方向天要存_48_97_96', N'小地方_48_97_96', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (21, N'a6c4e6e6-fff7-4178-b801-2824d18813c8', N'Jimmy_48_1_96_97', N'江西省广昌县塘方向天要存_48_1_96_97', N'小地方_48_1_96_97', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (22, N'7efc415d-1cf6-405d-bfef-1b803c5f14b0', N'Peter_47_2_95_98', N'湖南省_47_2_95_98', N'湖南达到_47_2_95_98', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (23, N'0ff8de0b-a345-4433-8adc-772e679e7393', N'Tom_46_3_94_99', N'USA_46_3_94_99', N'USA_46_3_94_99', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (24, N'31879ec8-ff0c-4f10-98fb-5a95992c5762', N'Jimmy_0_45_4_93_100', N'江西省广昌县塘方向天要存_45_4_93_100', N'小地方_45_4_93_100', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (25, N'291cfd28-9f91-47e9-8d3e-62a31123d260', N'Peter_0_44_5_92_101', N'湖南省_44_5_92_101', N'湖南达到_44_5_92_101', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (26, N'5047732e-2f24-4b21-bd1c-f3ef1e21981c', N'Tom_0_43_6_91_102', N'USA_43_6_91_102', N'USA_43_6_91_102', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (27, N'ff9568bc-ee7a-49be-b09f-0854214c771b', N'Tom_0_1_42_7_90_103', N'USA_1_42_7_90_103', N'USA_1_42_7_90_103', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (28, N'56d6548c-7a0f-4f5b-9704-40fad95906bb', N'Peter_0_2_41_8_89_104', N'湖南省_2_41_8_89_104', N'湖南达到_2_41_8_89_104', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (29, N'5187d45d-402b-4b50-b5bc-f753b6a130fd', N'Jimmy_0_3_40_9_88_105', N'江西省广昌县塘方向天要存_3_40_9_88_105', N'小地方_3_40_9_88_105', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (30, N'e90d3472-516a-458a-8b6a-5fd967533503', N'Tom_4_39_10_87_106', N'USA_4_39_10_87_106', N'USA_4_39_10_87_106', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (31, N'533473f6-97e1-4d3a-af1e-9cc46f2b3270', N'Peter_5_38_11_86_107', N'湖南省_5_38_11_86_107', N'湖南达到_5_38_11_86_107', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (32, N'6afb3fe7-f61f-4dfc-996d-7c93d1e02c33', N'Jimmy_6_37_12_85_108', N'江西省广昌县塘方向天要存_6_37_12_85_108', N'小地方_6_37_12_85_108', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (33, N'8a849493-1385-4d51-83d3-059269db5806', N'Jimmy_6_1_36_13_84_109', N'江西省广昌县塘方向天要存_6_1_36_13_84_109', N'小地方_6_1_36_13_84_109', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (34, N'a1f5b493-dbd5-49ea-987e-c8f5d5736a96', N'Peter_5_2_35_14_83_110', N'湖南省_5_2_35_14_83_110', N'湖南达到_5_2_35_14_83_110', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (35, N'c42e9c04-3543-476a-9c03-efadbb9ff3d6', N'Tom_4_3_34_15_82_111', N'USA_4_3_34_15_82_111', N'USA_4_3_34_15_82_111', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (36, N'cf3c2d0a-9425-48f2-a4b7-5cb39495663c', N'Jimmy_0_3_4_33_16_81_112', N'江西省广昌县塘方向天要存_3_4_33_16_81_112', N'小地方_3_4_33_16_81_112', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (37, N'0b008503-0d12-434b-8189-420ff4e55698', N'Peter_0_2_5_32_17_80_113', N'湖南省_2_5_32_17_80_113', N'湖南达到_2_5_32_17_80_113', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (38, N'b5ee3827-f70c-449f-8d87-c377d60e40ae', N'Tom_0_1_6_31_18_79_114', N'USA_1_6_31_18_79_114', N'USA_1_6_31_18_79_114', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (39, N'a6c76255-4b82-46ae-84e3-20553debb9ca', N'Tom_0_7_30_19_78_115', N'USA_7_30_19_78_115', N'USA_7_30_19_78_115', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (40, N'66f16877-5933-4dfa-84d3-c834919d2a20', N'Peter_0_8_29_20_77_116', N'湖南省_8_29_20_77_116', N'湖南达到_8_29_20_77_116', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (41, N'd31ba586-c2fd-4c8f-a0cb-851b7e50690b', N'Jimmy_0_9_28_21_76_117', N'江西省广昌县塘方向天要存_9_28_21_76_117', N'小地方_9_28_21_76_117', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (42, N'2e54f8c1-f780-4773-9c2b-50dfe01a71e8', N'Tom_10_27_22_75_118', N'USA_10_27_22_75_118', N'USA_10_27_22_75_118', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (43, N'bd20fce2-ae6f-438d-9f1c-3da37c41e47c', N'Peter_11_26_23_74_119', N'湖南省_11_26_23_74_119', N'湖南达到_11_26_23_74_119', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (44, N'86d1c982-5eb1-4387-980e-a7735c40f63d', N'Jimmy_12_25_24_73_120', N'江西省广昌县塘方向天要存_12_25_24_73_120', N'小地方_12_25_24_73_120', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (45, N'020108cf-3858-406c-a174-610b513935f7', N'Jimmy_12_1_24_25_72_121', N'江西省广昌县塘方向天要存_12_1_24_25_72_121', N'小地方_12_1_24_25_72_121', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (46, N'91af9d08-f21d-4341-b57f-e11509b0d0be', N'Peter_11_2_23_26_71_122', N'湖南省_11_2_23_26_71_122', N'湖南达到_11_2_23_26_71_122', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (47, N'90271e9d-68b5-4619-8ba4-dccdc7e942a0', N'Tom_10_3_22_27_70_123', N'USA_10_3_22_27_70_123', N'USA_10_3_22_27_70_123', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (48, N'71390247-c3ca-4387-b8a9-7f6a8e171a3d', N'Jimmy_0_9_4_21_28_69_124', N'江西省广昌县塘方向天要存_9_4_21_28_69_124', N'小地方_9_4_21_28_69_124', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (49, N'e144ba72-f6cf-46ea-bbca-691ec1b1cdc1', N'Peter_0_8_5_20_29_68_125', N'湖南省_8_5_20_29_68_125', N'湖南达到_8_5_20_29_68_125', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (50, N'999dd1e5-f57c-419d-90d3-82b5c12ea14b', N'Tom_0_7_6_19_30_67_126', N'USA_7_6_19_30_67_126', N'USA_7_6_19_30_67_126', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (51, N'c86b4bd1-5203-4b9f-9e10-af41887cdab4', N'Tom_0_1_6_7_18_31_66_127', N'USA_1_6_7_18_31_66_127', N'USA_1_6_7_18_31_66_127', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (52, N'f18962ad-3bdd-4ffc-83eb-8af82f5a9e80', N'Peter_0_2_5_8_17_32_65_128', N'湖南省_2_5_8_17_32_65_128', N'湖南达到_2_5_8_17_32_65_128', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (53, N'd21c35e1-a630-452f-a9b3-3c9cbe3680bd', N'Jimmy_0_3_4_9_16_33_64_129', N'江西省广昌县塘方向天要存_3_4_9_16_33_64_129', N'小地方_3_4_9_16_33_64_129', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (54, N'a8ffb436-6540-459e-8c00-ca9d693e0c81', N'Tom_4_3_10_15_34_63_130', N'USA_4_3_10_15_34_63_130', N'USA_4_3_10_15_34_63_130', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (55, N'91c9d07a-9db6-478a-a2ba-4ce0c69cad1e', N'Peter_5_2_11_14_35_62_131', N'湖南省_5_2_11_14_35_62_131', N'湖南达到_5_2_11_14_35_62_131', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (56, N'975e1cc9-0afc-439e-a0b5-2c78852c4e06', N'Jimmy_6_1_12_13_36_61_132', N'江西省广昌县塘方向天要存_6_1_12_13_36_61_132', N'小地方_6_1_12_13_36_61_132', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (57, N'2ba8c41b-ea45-451f-9905-0c54e544b432', N'Jimmy_6_13_12_37_60_133', N'江西省广昌县塘方向天要存_6_13_12_37_60_133', N'小地方_6_13_12_37_60_133', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (58, N'9868d558-22e4-48a2-93e6-2a6fa79bf42e', N'Peter_5_14_11_38_59_134', N'湖南省_5_14_11_38_59_134', N'湖南达到_5_14_11_38_59_134', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (59, N'd7aebb10-3b1e-4d45-ad8e-bce11a6df2e5', N'Tom_4_15_10_39_58_135', N'USA_4_15_10_39_58_135', N'USA_4_15_10_39_58_135', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (60, N'76eb3a39-1690-4894-a5c6-1f433a133ebe', N'Jimmy_0_3_16_9_40_57_136', N'江西省广昌县塘方向天要存_3_16_9_40_57_136', N'小地方_3_16_9_40_57_136', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (61, N'd10b2e8b-0a17-4630-ab86-2d97aab1b60d', N'Peter_0_2_17_8_41_56_137', N'湖南省_2_17_8_41_56_137', N'湖南达到_2_17_8_41_56_137', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (62, N'fd2a3453-9a34-4783-83f1-cf0042088cb4', N'Tom_0_1_18_7_42_55_138', N'USA_1_18_7_42_55_138', N'USA_1_18_7_42_55_138', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (63, N'555dda7e-3e0f-46bd-a564-5408bf144b6d', N'Tom_0_19_6_43_54_139', N'USA_19_6_43_54_139', N'USA_19_6_43_54_139', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (64, N'1dc9b787-ab2f-4d66-a01b-3c6420101d55', N'Peter_0_20_5_44_53_140', N'湖南省_20_5_44_53_140', N'湖南达到_20_5_44_53_140', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (65, N'3675aac6-3db5-40ea-8aac-f68689e95680', N'Jimmy_0_21_4_45_52_141', N'江西省广昌县塘方向天要存_21_4_45_52_141', N'小地方_21_4_45_52_141', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (66, N'ac2a8d47-de05-4687-b931-9d2688264cda', N'Tom_22_3_46_51_142', N'USA_22_3_46_51_142', N'USA_22_3_46_51_142', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (67, N'c06a3cd6-a17a-4846-86bc-19544bcef368', N'Peter_23_2_47_50_143', N'湖南省_23_2_47_50_143', N'湖南达到_23_2_47_50_143', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (68, N'f5a6b124-4e29-4a64-8f34-643bf66d245c', N'Jimmy_24_1_48_49_144', N'江西省广昌县塘方向天要存_24_1_48_49_144', N'小地方_24_1_48_49_144', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (69, N'8046ee30-e806-46e0-9676-5ca6901db85e', N'Jimmy_24_49_48_145', N'江西省广昌县塘方向天要存_24_49_48_145', N'小地方_24_49_48_145', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (70, N'334faffc-8709-418b-a449-cae1a98badb7', N'Peter_23_50_47_146', N'湖南省_23_50_47_146', N'湖南达到_23_50_47_146', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (71, N'19749a40-2888-40c0-be45-69dab43cb5fb', N'Tom_22_51_46_147', N'USA_22_51_46_147', N'USA_22_51_46_147', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (72, N'e0f4b972-07db-4131-bd31-3cae4e60fed9', N'Jimmy_0_21_52_45_148', N'江西省广昌县塘方向天要存_21_52_45_148', N'小地方_21_52_45_148', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (73, N'ec180537-f63b-4483-a187-14526c4b16f8', N'Peter_0_20_53_44_149', N'湖南省_20_53_44_149', N'湖南达到_20_53_44_149', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (74, N'e820c45c-a522-4dff-826e-9fd7ded9b76b', N'Tom_0_19_54_43_150', N'USA_19_54_43_150', N'USA_19_54_43_150', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (75, N'ad92b2a3-8561-4e5a-9bc8-a6e58cb4a033', N'Tom_0_1_18_55_42_151', N'USA_1_18_55_42_151', N'USA_1_18_55_42_151', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (76, N'e5cda00e-d383-4b35-93c3-b0277d1b48bd', N'Peter_0_2_17_56_41_152', N'湖南省_2_17_56_41_152', N'湖南达到_2_17_56_41_152', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (77, N'87016ede-b7d4-4526-ae5e-8e53f8801ed6', N'Jimmy_0_3_16_57_40_153', N'江西省广昌县塘方向天要存_3_16_57_40_153', N'小地方_3_16_57_40_153', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (78, N'b73a7f8e-471d-4bfa-8ab6-955f2270efdc', N'Tom_4_15_58_39_154', N'USA_4_15_58_39_154', N'USA_4_15_58_39_154', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (79, N'51e713fa-4393-4e07-b8f1-44555d993899', N'Peter_5_14_59_38_155', N'湖南省_5_14_59_38_155', N'湖南达到_5_14_59_38_155', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (80, N'556c5628-db61-4924-ad4c-7e05131cb998', N'Jimmy_6_13_60_37_156', N'江西省广昌县塘方向天要存_6_13_60_37_156', N'小地方_6_13_60_37_156', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (81, N'bacf40f8-36a9-4929-a828-77b3b9eaea80', N'Jimmy_6_1_12_61_36_157', N'江西省广昌县塘方向天要存_6_1_12_61_36_157', N'小地方_6_1_12_61_36_157', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (82, N'e9f668df-023d-4f2c-b888-33913dce14fb', N'Peter_5_2_11_62_35_158', N'湖南省_5_2_11_62_35_158', N'湖南达到_5_2_11_62_35_158', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (83, N'b80715e6-b100-421c-aba5-beb934149050', N'Tom_4_3_10_63_34_159', N'USA_4_3_10_63_34_159', N'USA_4_3_10_63_34_159', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (84, N'78f8ac4a-82e0-4484-86c3-6cf710b043e5', N'Jimmy_0_3_4_9_64_33_160', N'江西省广昌县塘方向天要存_3_4_9_64_33_160', N'小地方_3_4_9_64_33_160', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (85, N'ab4c7000-25e9-41e9-993a-19c34346362c', N'Peter_0_2_5_8_65_32_161', N'湖南省_2_5_8_65_32_161', N'湖南达到_2_5_8_65_32_161', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (86, N'97f51a52-498e-4abe-a8b5-3194d1719af8', N'Tom_0_1_6_7_66_31_162', N'USA_1_6_7_66_31_162', N'USA_1_6_7_66_31_162', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (87, N'454ce2b2-bca6-4c1b-b561-1d7acaae248c', N'Tom_0_7_6_67_30_163', N'USA_7_6_67_30_163', N'USA_7_6_67_30_163', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (88, N'b6050f54-1042-4a63-abb5-e08c040c2a69', N'Peter_0_8_5_68_29_164', N'湖南省_8_5_68_29_164', N'湖南达到_8_5_68_29_164', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (89, N'a98a2855-ac83-4cc0-a838-dc2946f63e04', N'Jimmy_0_9_4_69_28_165', N'江西省广昌县塘方向天要存_9_4_69_28_165', N'小地方_9_4_69_28_165', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (90, N'0cb9c272-5bca-4a25-8383-59a2709f075f', N'Tom_10_3_70_27_166', N'USA_10_3_70_27_166', N'USA_10_3_70_27_166', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (91, N'005efe57-4b95-40f1-baeb-ce86da6014ac', N'Peter_11_2_71_26_167', N'湖南省_11_2_71_26_167', N'湖南达到_11_2_71_26_167', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (92, N'5b17763f-28bc-46aa-ac84-85d663cbfb53', N'Jimmy_12_1_72_25_168', N'江西省广昌县塘方向天要存_12_1_72_25_168', N'小地方_12_1_72_25_168', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (93, N'2522f4aa-00fe-46af-ab37-2ef2b5d41a57', N'Jimmy_12_73_24_169', N'江西省广昌县塘方向天要存_12_73_24_169', N'小地方_12_73_24_169', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (94, N'd059d22e-7b11-41ff-b036-3a950057012c', N'Peter_11_74_23_170', N'湖南省_11_74_23_170', N'湖南达到_11_74_23_170', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (95, N'8c2a07ae-69be-4fe5-a19f-cec6baec41a7', N'Tom_10_75_22_171', N'USA_10_75_22_171', N'USA_10_75_22_171', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (96, N'a52a192f-4f1e-4536-b413-2298c8866b9a', N'Jimmy_0_9_76_21_172', N'江西省广昌县塘方向天要存_9_76_21_172', N'小地方_9_76_21_172', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (97, N'ca9752fb-fa8d-4473-9bd2-dcc545a31456', N'Peter_0_8_77_20_173', N'湖南省_8_77_20_173', N'湖南达到_8_77_20_173', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (98, N'a1aeb31f-b99d-4307-81d6-11538b4597e4', N'Tom_0_7_78_19_174', N'USA_7_78_19_174', N'USA_7_78_19_174', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (99, N'3f3298ec-a065-40e0-8172-4aa3d66659d0', N'Tom_0_1_6_79_18_175', N'USA_1_6_79_18_175', N'USA_1_6_79_18_175', 0, CAST(0x0000A3C100E75F17 AS DateTime))
INSERT [dbo].[User] ([ID], [Guid], [Name], [Address], [Remark], [State], [CreatedTime]) VALUES (100, N'8b6d09e6-9d2a-4ba7-a5eb-5ed5a2d8f6fc', N'Peter_0_2_5_80_17_176', N'湖南省_2_5_80_17_176', N'湖南达到_2_5_80_17_176', 0, CAST(0x0000A3C100E75F17 AS DateTime))
GO
print 'Processed 100 total records'
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Table [dbo].[TranLog]    Script Date: 05/18/2015 17:01:44 ******/
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
/****** Object:  Table [dbo].[TranConfig]    Script Date: 05/18/2015 17:01:44 ******/
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
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [Cstamp], [Sstamp], [Direct], [Import], [SourceTableName], [TargetTableName], [BlobColumn], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (3, N'58ea51c1-ce07-4cd7-bb5b-fcac7d87f33e', N'配置数据（不能删除）', N'PZSJ', -1, 20, 0, 0, 0, 0, N'TranConfig', N'TranConfig', NULL, N'if object_id(''tempdb..#temp_TranConfig'') is not null drop table #temp_TranConfig;select top 0 [Guid],[Name],[Code],[Sort],[MaxCount],[Cstamp],[Sstamp],[Direct],[Import],[SourceTableName],[TargetTableName],[BlobColumn],[HeaderSql],[DetailSql],[FooterSql],[Remark],[Status],[CreatedTime],[CreatedBy],[ModifiedTime],[ModifiedBy] into #temp_TranConfig from [TranConfig](nolock);', N'select top $rowCount$ ''insert #temp_TranConfig([Guid],[Name],[Code],[Sort],[MaxCount],[Cstamp],[Sstamp],[Direct],[Import],[SourceTableName],[TargetTableName],[BlobColumn],[HeaderSql],[DetailSql],[FooterSql],[Remark],[Status],[CreatedTime],[CreatedBy],[ModifiedTime],[ModifiedBy]) select ''+dbo.bims_f_var_to_string(Guid)+'',''+dbo.bims_f_var_to_string(Name)+'',''+dbo.bims_f_var_to_string(Code)+'',''+dbo.bims_f_var_to_string(Sort)+'',''+dbo.bims_f_var_to_string(MaxCount)+'',''+dbo.bims_f_var_to_string(Cstamp)+'',''+dbo.bims_f_var_to_string(Sstamp)+'',''+dbo.bims_f_var_to_string(Direct)+'',''+dbo.bims_f_var_to_string(Import)+'',''+dbo.bims_f_var_to_string(SourceTableName)+'',''+dbo.bims_f_var_to_string(TargetTableName)+'',''+dbo.bims_f_var_to_string(BlobColumn)+'',''+dbo.bims_f_var_to_string(HeaderSql)+'',''+dbo.bims_f_var_to_string(DetailSql)+'',''+dbo.bims_f_var_to_string(FooterSql)+'',''+dbo.bims_f_var_to_string(Remark)+'',''+dbo.bims_f_var_to_string(Status)+'',''+dbo.bims_f_var_to_string(CreatedTime)+'',''+dbo.bims_f_var_to_string(CreatedBy)+'',''+dbo.bims_f_var_to_string(ModifiedTime)+'',''+dbo.bims_f_var_to_string(ModifiedBy) as sql,cast(timestamp as bigint) as stamp,[Guid] as Guid from [TranConfig] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) {templog: And [Guid] not in (Select [guid] from tranferTempLog where TransferNo = ''$tranferNo$'' and ConfigCode = ''$configCode$'') :templog} Order by [TimeStamp];', N'Update b set b.Guid = a.Guid,b.Name = a.Name,b.Code = a.Code,b.Sort = a.Sort,b.MaxCount = a.MaxCount,b.Cstamp = a.Cstamp,b.Sstamp = a.Sstamp,b.Direct = a.Direct,b.Import = a.Import,b.SourceTableName = a.SourceTableName,b.TargetTableName = a.TargetTableName,b.BlobColumn = a.BlobColumn,b.HeaderSql = a.HeaderSql,b.DetailSql = a.DetailSql,b.FooterSql = a.FooterSql,b.Remark = a.Remark,b.Status = a.Status,b.CreatedTime = a.CreatedTime,b.CreatedBy = a.CreatedBy,b.ModifiedTime = a.ModifiedTime,b.ModifiedBy = a.ModifiedBy from #temp_TranConfig a,[TranConfig] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [TranConfig]([Guid],[Name],[Code],[Sort],[MaxCount],[Cstamp],[Sstamp],[Direct],[Import],[SourceTableName],[TargetTableName],[BlobColumn],[HeaderSql],[DetailSql],[FooterSql],[Remark],[Status],[CreatedTime],[CreatedBy],[ModifiedTime],[ModifiedBy]) select [Guid],[Name],[Code],[Sort],[MaxCount],[Cstamp],[Sstamp],[Direct],[Import],[SourceTableName],[TargetTableName],[BlobColumn],[HeaderSql],[DetailSql],[FooterSql],[Remark],[Status],[CreatedTime],[CreatedBy],[ModifiedTime],[ModifiedBy] from #temp_TranConfig a   where a.Guid not in (Select [GUID] From [TranConfig]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', NULL, 0, CAST(0x0000A3BF014A788A AS DateTime), NULL, CAST(0x0000A4950109629A AS DateTime), N'abc@live.cn')
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [Cstamp], [Sstamp], [Direct], [Import], [SourceTableName], [TargetTableName], [BlobColumn], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (9, N'02d3160d-da23-4890-b546-bab377842671', N'客户资料传门店', N'KHZL2C', 2, 50, 0, 0, 2, 0, N'User', N'User', NULL, N'if object_id(''tempdb..#temp_User'') is not null drop table #temp_User;select top 0 [Guid],[Name],[Address],[Remark],[State],[CreatedTime] into #temp_User from [User](nolock);', N'select top $rowCount$ ''insert #temp_User([Guid],[Name],[Address],[Remark],[State],[CreatedTime]) select ''+dbo.bims_f_var_to_string(Guid)+'',''+dbo.bims_f_var_to_string(Name)+'',''+dbo.bims_f_var_to_string(Address)+'',''+dbo.bims_f_var_to_string(Remark)+'',''+dbo.bims_f_var_to_string(State)+'',''+dbo.bims_f_var_to_string(CreatedTime) as sql,cast(timestamp as bigint) as stamp,[Guid] as Guid from [User] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) {templog: And [Guid] not in (Select [guid] from tranferTempLog where TransferNo = ''$tranferNo$'' and ConfigCode = ''$configCode$'') :templog} Order by [TimeStamp];', N'Update b set b.Guid = a.Guid,b.Name = a.Name,b.Address = a.Address,b.Remark = a.Remark,b.State = a.State,b.CreatedTime = a.CreatedTime from #temp_User a,[User] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [User]([Guid],[Name],[Address],[Remark],[State],[CreatedTime]) select [Guid],[Name],[Address],[Remark],[State],[CreatedTime] from #temp_User a   where a.Guid not in (Select [GUID] From [User]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', NULL, 0, CAST(0x0000A3C100E5B2E0 AS DateTime), NULL, CAST(0x0000A495010973BD AS DateTime), N'abc@live.cn')
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [Cstamp], [Sstamp], [Direct], [Import], [SourceTableName], [TargetTableName], [BlobColumn], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (10, N'158af478-2bb2-4690-aaab-801a38e25503', N'客户端数据', N'KHD', 1, 20, 0, 0, 2, 0, N'LoginUser', N'LoginUser', NULL, N'if object_id(''tempdb..#temp_LoginUser'') is not null drop table #temp_LoginUser;select top 0 [Name],[Pwd],[RName],[Role],[LastLogin],[CreateTime],[ModifiedTime] into #temp_LoginUser from [LoginUser](nolock);', N'select top $rowCount$ ''insert #temp_LoginUser([Name],[Pwd],[RName],[Role],[LastLogin],[CreateTime],[ModifiedTime]) select ''+dbo.bims_f_var_to_string(Name)+'',''+dbo.bims_f_var_to_string(Pwd)+'',''+dbo.bims_f_var_to_string(RName)+'',''+dbo.bims_f_var_to_string(Role)+'',''+dbo.bims_f_var_to_string(LastLogin)+'',''+dbo.bims_f_var_to_string(CreateTime)+'',''+dbo.bims_f_var_to_string(ModifiedTime) as sql,cast(timestamp as bigint) as stamp,[Guid] as Guid from [LoginUser] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) {templog: And [Guid] not in (Select [guid] from tranferTempLog where TransferNo = ''$tranferNo$'' and ConfigCode = ''$configCode$'') :templog} Order by [TimeStamp];', N'Update b set b.Name = a.Name,b.Pwd = a.Pwd,b.RName = a.RName,b.Role = a.Role,b.LastLogin = a.LastLogin,b.CreateTime = a.CreateTime,b.ModifiedTime = a.ModifiedTime from #temp_LoginUser a,[LoginUser] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [LoginUser]([Name],[Pwd],[RName],[Role],[LastLogin],[CreateTime],[ModifiedTime]) select [Name],[Pwd],[RName],[Role],[LastLogin],[CreateTime],[ModifiedTime] from #temp_LoginUser a   where a.Guid not in (Select [GUID] From [LoginUser]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', NULL, 1, CAST(0x0000A3BF015D31D7 AS DateTime), NULL, CAST(0x0000A49501098A34 AS DateTime), N'abc@live.cn')
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [Cstamp], [Sstamp], [Direct], [Import], [SourceTableName], [TargetTableName], [BlobColumn], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (11, N'29b15f62-eb46-4d55-b477-dacf0ef4e52a', N'元数据表', N'Meta_KV_T_C', 0, 20, NULL, NULL, 0, 0, N'Meta_KeyValue', NULL, NULL, N'if object_id(''tempdb..#temp_Meta_KeyValue'') is not null drop table #temp_Meta_KeyValue;select top 0 [TableName],[ColName],[Value],[Text] into #temp_Meta_KeyValue from [Meta_KeyValue](nolock);', N'select top $rowCount$ ''insert #temp_Meta_KeyValue([TableName],[ColName],[Value],[Text]) select ''+dbo.bims_f_var_to_string(TableName)+'',''+dbo.bims_f_var_to_string(ColName)+'',''+dbo.bims_f_var_to_string(Value)+'',''+dbo.bims_f_var_to_string(Text) as sql,cast(timestamp as bigint) as stamp,[Guid] as Guid from [Meta_KeyValue] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) {templog: And [Guid] not in (Select [guid] from tranferTempLog where TransferNo = ''$tranferNo$'' and ConfigCode = ''$configCode$'') :templog} Order by [TimeStamp];', N'Update b set b.TableName = a.TableName,b.ColName = a.ColName,b.Value = a.Value,b.Text = a.Text from #temp_Meta_KeyValue a,[Meta_KeyValue] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [Meta_KeyValue]([TableName],[ColName],[Value],[Text]) select [TableName],[ColName],[Value],[Text] from #temp_Meta_KeyValue a   where a.Guid not in (Select [GUID] From [Meta_KeyValue]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', N'元数据表传输到客户端', 1, CAST(0x0000A47801190A44 AS DateTime), N'abc@live.cn', CAST(0x0000A48800D3F5BB AS DateTime), N'abc@live.cn')
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [Cstamp], [Sstamp], [Direct], [Import], [SourceTableName], [TargetTableName], [BlobColumn], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (12, N'9d460fd2-fa16-4671-b258-120955c91da9', N'北京店', N'DDDW1', 200, 30, NULL, NULL, 2, 0, N'Client', NULL, NULL, N'if object_id(''tempdb..#temp_Client'') is not null drop table #temp_Client;select top 0 [GUID],[Code],[Name],[IsCurrent],[Type],[Address],[Status],[CreatedBy],[CreatedTime],[ModifiedBy],[ModifiedTime] into #temp_Client from [Client](nolock);', N'select top $rowCount$ ''insert #temp_Client([GUID],[Code],[Name],[IsCurrent],[Type],[Address],[Status],[CreatedBy],[CreatedTime],[ModifiedBy],[ModifiedTime]) select ''+dbo.bims_f_var_to_string(GUID)+'',''+dbo.bims_f_var_to_string(Code)+'',''+dbo.bims_f_var_to_string(Name)+'',''+dbo.bims_f_var_to_string(IsCurrent)+'',''+dbo.bims_f_var_to_string(Type)+'',''+dbo.bims_f_var_to_string(Address)+'',''+dbo.bims_f_var_to_string(Status)+'',''+dbo.bims_f_var_to_string(CreatedBy)+'',''+dbo.bims_f_var_to_string(CreatedTime)+'',''+dbo.bims_f_var_to_string(ModifiedBy)+'',''+dbo.bims_f_var_to_string(ModifiedTime) as sql,cast(timestamp as bigint) as stamp,[Guid] as Guid from [Client] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) {templog: And [Guid] not in (Select [guid] from tranferTempLog where TransferNo = ''$tranferNo$'' and ConfigCode = ''$configCode$'') :templog} Order by [TimeStamp];', N'Update b set b.GUID = a.GUID,b.Code = a.Code,b.Name = a.Name,b.IsCurrent = a.IsCurrent,b.Type = a.Type,b.Address = a.Address,b.Status = a.Status,b.CreatedBy = a.CreatedBy,b.CreatedTime = a.CreatedTime,b.ModifiedBy = a.ModifiedBy,b.ModifiedTime = a.ModifiedTime from #temp_Client a,[Client] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [Client]([GUID],[Code],[Name],[IsCurrent],[Type],[Address],[Status],[CreatedBy],[CreatedTime],[ModifiedBy],[ModifiedTime]) select [GUID],[Code],[Name],[IsCurrent],[Type],[Address],[Status],[CreatedBy],[CreatedTime],[ModifiedBy],[ModifiedTime] from #temp_Client a   where a.Guid not in (Select [GUID] From [Client]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', NULL, 1, CAST(0x0000A4780121DD14 AS DateTime), N'abc@live.cn', CAST(0x0000A4840107CAE3 AS DateTime), N'abc@live.cn')
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [Cstamp], [Sstamp], [Direct], [Import], [SourceTableName], [TargetTableName], [BlobColumn], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (13, N'4bea9f29-e97b-4e6d-988f-245f4e63a837', N'二进制文件传输测试', N'BD_T_C', 10, 10, 0, 0, 2, 0, N'DataTest', N'DataTest', N'Data', N'if object_id(''tempdb..#temp_DataTest'') is not null drop table #temp_DataTest;select top 0 [Guid],[Name],[Data] into #temp_DataTest from [DataTest](nolock);', N'select top $rowCount$ ''insert #temp_DataTest([Guid],[Name],[Data]) select ''+dbo.bims_f_var_to_string(Guid)+'',''+dbo.bims_f_var_to_string(Name)+'',0xFF'' as sql,cast(timestamp as bigint) as stamp,[Guid] as Guid,[Data] as Blob from [DataTest] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) {templog: And [Guid] not in (Select [guid] from tranferTempLog where TransferNo = ''$tranferNo$'' and ConfigCode = ''$configCode$'') :templog} Order by [TimeStamp];', N'Update b set b.Guid = a.Guid,b.Name = a.Name,b.Data = a.Data from #temp_DataTest a,[DataTest] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [DataTest]([Guid],[Name],[Data]) select [Guid],[Name],[Data] from #temp_DataTest a   where a.Guid not in (Select [GUID] From [DataTest]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', N'更新', 0, CAST(0x0000A47900FD9064 AS DateTime), N'abc@live.cn', CAST(0x0000A495012379D7 AS DateTime), N'abc@live.cn')
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [Cstamp], [Sstamp], [Direct], [Import], [SourceTableName], [TargetTableName], [BlobColumn], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (14, N'02d3160d-da23-4890-b546-bab377842670', N'客户资料', N'KHZL', 2, 20, 0, 0, 1, 0, N'User', NULL, NULL, N'if object_id(''tempdb..#temp_User'') is not null drop table #temp_User;select top 0 [GUID]      ,[Name]     ,[Address],[Remark]      ,[State]      ,[CreatedTime]  into #temp_User from [User](nolock);', N'select top $rowCount$ ''insert #temp_User([GUID],[Name],[Address],[Remark],[State],[CreatedTime]) select ''+dbo.bims_f_var_to_string(Guid)+'',''+dbo.bims_f_var_to_string(Name)+'',''+dbo.bims_f_var_to_string(Address)+'',''+dbo.bims_f_var_to_string(Remark)+'',''+dbo.bims_f_var_to_string(State)+'',''+dbo.bims_f_var_to_string(CreatedTime) from [User] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) Order by [TimeStamp];', N'Update b set b.name = a.name,b.Address = a.Address ,b.State = a.State,b.Remark = a.Remark,b.CreatedTime = a.CreatedTime from #temp_User a,[User] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [User]([GUID],[Name],[Address],[Remark],[State],[CreatedTime]) select [GUID],[Name],[Address],[Remark],[State],[CreatedTime] from #temp_User a   where a.Guid not in (Select [GUID] From [User]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', NULL, 255, CAST(0x0000A3C100E5B2E0 AS DateTime), NULL, CAST(0x0000A48401078A24 AS DateTime), N'abc@live.cn')
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [Cstamp], [Sstamp], [Direct], [Import], [SourceTableName], [TargetTableName], [BlobColumn], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (15, N'0b2de912-abbf-4f2b-9ba3-69d34e68b8c8', N'下拉资料', N'DDDW', 3, 30, NULL, 0, 0, 0, N'Client', NULL, NULL, N'if object_id(''tempdb..#temp_sys_dddw'') is not null drop table #temp_sys_dddw;select top 0 [dddwno]      ,[funcname]  ,[dddwlist]      ,[descr]      ,[notes]      ,[isdefault] into #temp_sys_dddw from sys_dddw(nolock);', N'select top $rowCount$ ''insert #temp_sys_dddw([dddwno]      ,[funcname]  ,[dddwlist]      ,[descr]      ,[notes]      ,[isdefault]) select   ''+dbo.bims_f_var_to_string(dddwno)+'',''+dbo.bims_f_var_to_string(funcname)+'',''+dbo.bims_f_var_to_string(dddwlist)+'',''+dbo.bims_f_var_to_string(descr)+'',''+dbo.bims_f_var_to_string(notes)+'',''+dbo.bims_f_var_to_string(isdefault)from sys_dddw where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) Order by [timeStamp];', N'insert into [sys_dddw]([dddwno],[funcname],[dddwlist],[descr],[notes],[isdefault]) select [dddwno],[funcname],[dddwlist],[descr],[notes],[isdefault]  from #temp_[sys_dddw] a  ;if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', NULL, 255, CAST(0x0000A3CB0161BEA0 AS DateTime), NULL, CAST(0x0000A48401079C63 AS DateTime), N'abc@live.cn')
INSERT [dbo].[TranConfig] ([ID], [Guid], [Name], [Code], [Sort], [MaxCount], [Cstamp], [Sstamp], [Direct], [Import], [SourceTableName], [TargetTableName], [BlobColumn], [HeaderSql], [DetailSql], [FooterSql], [Remark], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (16, N'e9371547-9393-463f-93ed-2baefec5f8aa', N'日志资料的上传', N'Log2Server', 100, 20, NULL, NULL, 1, 1, N'TranLog', N'TranLog', NULL, N'if object_id(''tempdb..#temp_TranLog'') is not null drop table #temp_TranLog;select top 0 [Client],[Target],[Sort],[ConfigCode],[ConfigName],[TransferNo],[IsSuccess],[Direct],[Header],[Detail],[Footer],[Count],[Result],[Remark],[TranTime] into #temp_TranLog from [TranLog](nolock);', N'select top $rowCount$ ''insert #temp_TranLog([Client],[Target],[Sort],[ConfigCode],[ConfigName],[TransferNo],[IsSuccess],[Direct],[Header],[Detail],[Footer],[Count],[Result],[Remark],[TranTime]) select ''+dbo.bims_f_var_to_string(Client)+'',''+dbo.bims_f_var_to_string(Target)+'',''+dbo.bims_f_var_to_string(Sort)+'',''+dbo.bims_f_var_to_string(ConfigCode)+'',''+dbo.bims_f_var_to_string(ConfigName)+'',''+dbo.bims_f_var_to_string(TransferNo)+'',''+dbo.bims_f_var_to_string(IsSuccess)+'',''+dbo.bims_f_var_to_string(Direct)+'',''+dbo.bims_f_var_to_string(Header)+'',''+dbo.bims_f_var_to_string(Detail)+'',''+dbo.bims_f_var_to_string(Footer)+'',''+dbo.bims_f_var_to_string(Count)+'',''+dbo.bims_f_var_to_string(Result)+'',''+dbo.bims_f_var_to_string(Remark)+'',''+dbo.bims_f_var_to_string(TranTime) as sql,cast(timestamp as bigint) as stamp,[Guid] as Guid from [TranLog] where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) {templog: And [Guid] not in (Select [guid] from tranferTempLog where TransferNo = ''$tranferNo$'' and ConfigCode = ''$configCode$'') :templog} Order by [TimeStamp];', N'Update b set b.Client = a.Client,b.Target = a.Target,b.Sort = a.Sort,b.ConfigCode = a.ConfigCode,b.ConfigName = a.ConfigName,b.TransferNo = a.TransferNo,b.IsSuccess = a.IsSuccess,b.Direct = a.Direct,b.Header = a.Header,b.Detail = a.Detail,b.Footer = a.Footer,b.Count = a.Count,b.Result = a.Result,b.Remark = a.Remark,b.TranTime = a.TranTime from #temp_TranLog a,[TranLog] b  where a.Guid = b.Guid;if @@error <> 0 begin raiserror 20001 ''更新配置出错'';  rollback return end;insert into [TranLog]([Client],[Target],[Sort],[ConfigCode],[ConfigName],[TransferNo],[IsSuccess],[Direct],[Header],[Detail],[Footer],[Count],[Result],[Remark],[TranTime]) select [Client],[Target],[Sort],[ConfigCode],[ConfigName],[TransferNo],[IsSuccess],[Direct],[Header],[Detail],[Footer],[Count],[Result],[Remark],[TranTime] from #temp_TranLog a   where a.Guid not in (Select [GUID] From [TranLog]);if @@error <> 0 begin raiserror 20002 ''更新配置出错'';rollback return end;', N'日志资料同步到公司总部', 0, CAST(0x0000A49501221CF5 AS DateTime), N'abc@live.cn', NULL, NULL)
SET IDENTITY_INSERT [dbo].[TranConfig] OFF
/****** Object:  Table [dbo].[DataTest]    Script Date: 05/18/2015 17:01:44 ******/
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
/****** Object:  Table [dbo].[Client]    Script Date: 05/18/2015 17:01:44 ******/
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
INSERT [dbo].[Client] ([ID], [GUID], [Code], [Name], [IsCurrent], [Type], [Address], [Status], [CreatedBy], [CreatedTime], [ModifiedBy], [ModifiedTime]) VALUES (1, N'35c246cd-503e-41ce-aefb-99c0c1deaf4c', N'C1', N'客户端1', 1, 1, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Client] ([ID], [GUID], [Code], [Name], [IsCurrent], [Type], [Address], [Status], [CreatedBy], [CreatedTime], [ModifiedBy], [ModifiedTime]) VALUES (2, N'4b5d693c-5a5b-4953-925d-87df2b5ac3b2', N'S1', N'服务器1', NULL, 0, N'', 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
/****** Object:  UserDefinedFunction [dbo].[bims_f_var_to_string]    Script Date: 05/18/2015 17:01:45 ******/
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
/****** Object:  Default [DF_User_Guid]    Script Date: 05/18/2015 17:01:44 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Guid]  DEFAULT (newid()) FOR [Guid]
GO
/****** Object:  Default [DF_User_CreatedTime]    Script Date: 05/18/2015 17:01:44 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
/****** Object:  Default [DF_TranLog_IsSuccess]    Script Date: 05/18/2015 17:01:44 ******/
ALTER TABLE [dbo].[TranLog] ADD  CONSTRAINT [DF_TranLog_IsSuccess]  DEFAULT ((0)) FOR [IsSuccess]
GO
/****** Object:  Default [DF_TranLog_TranTime]    Script Date: 05/18/2015 17:01:44 ******/
ALTER TABLE [dbo].[TranLog] ADD  CONSTRAINT [DF_TranLog_TranTime]  DEFAULT (getdate()) FOR [TranTime]
GO
/****** Object:  Default [DF_Table_1_GUID]    Script Date: 05/18/2015 17:01:44 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_Table_1_GUID]  DEFAULT (newid()) FOR [Guid]
GO
/****** Object:  Default [DF_TranConfig_Sort]    Script Date: 05/18/2015 17:01:44 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Sort]  DEFAULT ((0)) FOR [Sort]
GO
/****** Object:  Default [DF_TranConfig_MaxCount]    Script Date: 05/18/2015 17:01:44 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_MaxCount]  DEFAULT ((20)) FOR [MaxCount]
GO
/****** Object:  Default [DF_TranConfig_Direct]    Script Date: 05/18/2015 17:01:44 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Direct]  DEFAULT ((0)) FOR [Direct]
GO
/****** Object:  Default [DF_TranConfig_Import]    Script Date: 05/18/2015 17:01:44 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Import]  DEFAULT ((1)) FOR [Import]
GO
/****** Object:  Default [DF_TranConfig_Status]    Script Date: 05/18/2015 17:01:44 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_TranConfig_CreatedTime]    Script Date: 05/18/2015 17:01:44 ******/
ALTER TABLE [dbo].[TranConfig] ADD  CONSTRAINT [DF_TranConfig_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
/****** Object:  Default [DF_DataTest_Guid]    Script Date: 05/18/2015 17:01:44 ******/
ALTER TABLE [dbo].[DataTest] ADD  CONSTRAINT [DF_DataTest_Guid]  DEFAULT (newid()) FOR [Guid]
GO
/****** Object:  Default [DF_Client_GUID]    Script Date: 05/18/2015 17:01:44 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_GUID]  DEFAULT (newid()) FOR [GUID]
GO
/****** Object:  Default [DF_Client_Name]    Script Date: 05/18/2015 17:01:44 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_Name]  DEFAULT ((0)) FOR [Name]
GO
/****** Object:  Default [DF_Client_Type]    Script Date: 05/18/2015 17:01:44 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_Type]  DEFAULT ((1)) FOR [Type]
GO
/****** Object:  Default [DF_Client_Status]    Script Date: 05/18/2015 17:01:44 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_Status]  DEFAULT ((0)) FOR [Status]
GO
