USE [ES.Server]
GO

/****** Object:  Table [dbo].[tranferTempLog]    Script Date: 04/17/2015 00:10:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tranferTempLog](
	[tableName] [nvarchar](128) NOT NULL,
	[transferCode] [uniqueidentifier] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO


