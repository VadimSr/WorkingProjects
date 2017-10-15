SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
---------------------------------------------------------------------------------
--DROP Keys
DECLARE @SQL NVARCHAR(MAX) 
SET     @SQL = ''

SELECT @SQL = @SQL + 'ALTER TABLE ' + s.name+'.'+t.name + ' DROP CONSTRAINT [' + RTRIM(f.name) +'];' + CHAR(13)
FROM   sys.Tables AS t WITH(NOLOCK)
JOIN   sys.foreign_keys AS f WITH(NOLOCK)
  ON   f.parent_object_id = t.object_id
JOIN   sys.schemas AS s WITH(NOLOCK) 
  ON   s.schema_id = f.schema_id

--SELECT @SQL
EXECUTE (@SQL)

GO
---------------------------------------------------------------------------------
--TABLES
---------------------------------------------------------------------------------
IF OBJECT_ID('Users')                    IS NOT NULL DROP TABLE Users
IF OBJECT_ID('Clients')                  IS NOT NULL DROP TABLE Clients
IF OBJECT_ID('Stores')                   IS NOT NULL DROP TABLE Stores
IF OBJECT_ID('Currencies')               IS NOT NULL DROP TABLE Currencies
IF OBJECT_ID('Products')                 IS NOT NULL DROP TABLE Products
IF OBJECT_ID('BusinessProcesses')        IS NOT NULL DROP TABLE BusinessProcesses
IF OBJECT_ID('BPClientRelation')         IS NOT NULL DROP TABLE BPClientRelation
IF OBJECT_ID('BusinessProcessesTypes')   IS NOT NULL DROP TABLE BusinessProcessesTypes
IF OBJECT_ID('ClientStickers')           IS NOT NULL DROP TABLE ClientStickers
IF OBJECT_ID('Cls_BPStatuses')           IS NOT NULL DROP TABLE Cls_BPStatuses
IF OBJECT_ID('Cls_ProductCategories')    IS NOT NULL DROP TABLE Cls_ProductCategories
IF OBJECT_ID('Cls_ProductSubCategories') IS NOT NULL DROP TABLE Cls_ProductSubCategories
IF OBJECT_ID('Cls_UserStatuses')         IS NOT NULL DROP TABLE Cls_UserStatuses
IF OBJECT_ID('Cls_ClientStatuses')       IS NOT NULL DROP TABLE Cls_ClientStatuses
IF OBJECT_ID('Cls_ClientCategories')     IS NOT NULL DROP TABLE Cls_ClientCategories

IF OBJECT_ID('BusinessProcessesHistory') IS NOT NULL DROP TABLE BusinessProcessesHistory
IF OBJECT_ID('ClientsHistory')           IS NOT NULL DROP TABLE ClientsHistory
IF OBJECT_ID('ClientStickersHistory')    IS NOT NULL DROP TABLE ClientStickersHistory
IF OBJECT_ID('UsersHistory')             IS NOT NULL DROP TABLE UsersHistory
GO                  
---------------------------------------------------------------------------------
--Users
CREATE TABLE [dbo].[Users]
            ([UserId]      [int] IDENTITY(0,1) NOT FOR REPLICATION NOT NULL,
             [Login]       [varchar](30)   NOT NULL,
             [NameLocal]   [nvarchar](50)  NOT NULL,
             [NameEng]     [varchar](50)       NULL,
             [StoreId]     [int]           NOT NULL,
             [EnableDate]  [datetime]          NULL,
             [DisableDate] [datetime]          NULL,
             [StatusId]    [int]           NOT NULL,
             [CreatorId]   [int]           NOT NULL,
             [Created]     [datetime]      NOT NULL,
             [IsActive]    [bit]           NOT NULL,
             [ClientId]    [bigint]        NOT NULL
	
 CONSTRAINT [IUsersId] PRIMARY KEY CLUSTERED 
 ([UserId] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
                  ON [PRIMARY], CONSTRAINT [IUsersLogin] UNIQUE NONCLUSTERED 
 ([Login] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) 
                 ON [PRIMARY]) ON [PRIMARY]
GO
---------------------------------------------------------------------------------
--Clients
CREATE TABLE [dbo].[Clients]
             ([ClientId]         [bigint] IDENTITY(0,1) NOT FOR REPLICATION NOT NULL,
	          [StoreId]          [int]           NOT NULL,
	          [FullnameLocal]    [nvarchar](255) NOT NULL,
	          [FullnameEng]      [varchar](255)  NOT NULL,
	          [AdvisorId]        [int]               NULL,
	          [StatusId]         [int]           NOT NULL,
	          [Created]          [datetime]      NOT NULL,
	          [CreatorId]        [int]           NOT NULL,
	          [IsVIP]            [bit]           NOT NULL,
	          [ClientCategoryId] [int]               NULL,
CONSTRAINT [IClientsClientId] PRIMARY KEY CLUSTERED 
([ClientId] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
                   ON [PRIMARY]) ON [PRIMARY]
GO
---------------------------------------------------------------------------------
--Stores
CREATE TABLE [dbo].[Stores]
             ([StoreId]      [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		      [NameLocal]    [nvarchar](50)   NOT NULL,
			  [NameEng]      [varchar](50)    NOT NULL,
			  [CityLocal]    [nvarchar](50)   NOT NULL,
			  [CityEng]      [varchar](50)    NOT NULL,
			  [AddressLocal] [nvarchar](1000) NOT NULL,
			  [AddressEng]   [varchar](1000)  NOT NULL,
			  [Phone]        [varchar](20)    NOT NULL,
			  [IsActive]     [bit]            NOT NULL,
			  [CreatorId]    [int]                NULL,
			  [Created]      [datetime]           NULL
CONSTRAINT [IStoresStoreId] PRIMARY KEY CLUSTERED 
([StoreId] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
                  ON [PRIMARY]) ON [PRIMARY]
GO                  
---------------------------------------------------------------------------------
--Currencies
CREATE TABLE [dbo].[Currencies]
             ([ISO]        [char](3)      NOT NULL,
	          [ISONum]     [int]          NOT NULL,
			  [DescrLocal] [nvarchar](30) NOT NULL,
			  [DescrEng]   [varchar](30)  NOT NULL,
			  [IsActive]   [bit]          NOT NULL,
			  [Created]    [datetime]         NULL,
			  [CreatorId]  [int]              NULL,
CONSTRAINT [ICurrenciesISO] PRIMARY KEY CLUSTERED 
([ISO] ASC)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
             ON [PRIMARY]) ON [PRIMARY]
---------------------------------------------------------------------------------
--Products
CREATE TABLE [dbo].[Products]
             ([ProdPTypeId]        [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	          [DescrLocal]         [nvarchar](255) NOT NULL,
	          [DescrEng]           [nvarchar](255) NOT NULL,
	          [Price]              [money]         NOT NULL,
	          [Currency]           [char](3)       NOT NULL,
	          [ProductSubCategory] [int]           NOT NULL,
	          [IsActive]           [bit]           NOT NULL,
 CONSTRAINT [IProdPTypeId] PRIMARY KEY CLUSTERED 
([ProdPTypeId] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
                      ON [PRIMARY]) ON [PRIMARY]
GO  
---------------------------------------------------------------------------------
--BusinessProcesses
CREATE TABLE [dbo].[BusinessProcesses]
             ([BPId]               [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	          [BPTypeCode]         [varchar](30)    NOT NULL,
	          [BPStatusId]         [int]            NOT NULL,
	          [StoreId]            [int]            NOT NULL,
			  [ProductId]          [int]            NOT NULL,
	          [OrderingAccount]    [varchar](35)    NOT NULL,
	          [BeneficiaryAccount] [varchar](35)    NOT NULL,
	          [Amount]             [money]              NULL,
	          [Currency]           [char](3)            NULL,
	          [BPDate]             [smalldatetime]      NULL,
	          [Description]        [nvarchar](4000) NOT NULL,
	          [ConfirmingUserId]   [int]                NULL,
	          [CreatorId]          [int]            NOT NULL,
	          [Created]            [datetime]       NOT NULL,
CONSTRAINT [IBPContentId] PRIMARY KEY CLUSTERED 
([BPId] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
               ON [PRIMARY]) ON [PRIMARY]               
GO   
---------------------------------------------------------------------------------
--BPClientRelation
CREATE TABLE [dbo].[BPClientRelation]
             ([RelationId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
              [BPId]       [int]    NOT NULL,
              [ClientId]   [bigint] NOT NULL,    
	          [IsActive]   [bit]    NOT NULL,
 CONSTRAINT [IRelationId] PRIMARY KEY CLUSTERED 
([RelationId] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
                     ON [PRIMARY]) ON [PRIMARY]
GO
---------------------------------------------------------------------------------
--BusinessProcessesTypes
CREATE TABLE [dbo].[BusinessProcessesTypes]
             ([BPTypeCode] [varchar](50)   NOT NULL,
	          [DescrLocal] [nvarchar](100) NOT NULL,
	          [DescrEng]   [varchar](100)  NOT NULL,
	          [IsActive]   [bit]           NOT NULL
 CONSTRAINT [IBusinessProcessesId] PRIMARY KEY CLUSTERED 
([BPTypeCode] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
                     ON [PRIMARY]) ON [PRIMARY]
GO                             
---------------------------------------------------------------------------------
--ClientStickers
CREATE TABLE [dbo].[ClientStickers]
             ([ClientStickerId]     [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	          [ClientId]            [bigint]         NOT NULL,
	          [Comment]             [nvarchar](1000) NOT NULL,
	          [DateApplied]         [smalldatetime]      NULL,
	          [ValidTill]           [datetime]           NULL,
	          [IsActive]            [bit]            NOT NULL,
	          [Created]             [datetime]       NOT NULL,
	          [CreatorId]           [int]            NOT NULL,
	          [BPId]                [int]                NULL,
CONSTRAINT [IClientStickers_] PRIMARY KEY CLUSTERED 
([ClientStickerId] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
                          ON [PRIMARY]) ON [PRIMARY]
GO 
---------------------------------------------------------------------------------
--Cls_BPStatuses
CREATE TABLE [dbo].[Cls_BPStatuses]
             ([BPStatusId] [int]          NOT NULL,
	          [DescrLocal] [nvarchar](50) NOT NULL,
	          [DescrEng]   [varchar](50)  NOT NULL,
	          [IsActive]   [bit]          NOT NULL,
 CONSTRAINT [PK_Cls_BPStatuses] PRIMARY KEY CLUSTERED 
([BPStatusId] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
                     ON [PRIMARY]) ON [PRIMARY]
GO 
---------------------------------------------------------------------------------
--Cls_ProductCategories
CREATE TABLE [dbo].[Cls_ProductCategories]
             ([ProductCategoryId] [int] IDENTITY(0,1) NOT FOR REPLICATION NOT NULL,
	          [DescrLocal]        [nvarchar](255) NOT NULL,
	          [DescrEng]          [nvarchar](255) NOT NULL,
	          [IsActive]          [bit]           NOT NULL,
 CONSTRAINT [ICls_ProductCategoriesId] PRIMARY KEY CLUSTERED 
([ProductCategoryId] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
                      ON [PRIMARY]) ON [PRIMARY]
GO
---------------------------------------------------------------------------------
--Cls_ProductSubCategories
CREATE TABLE [dbo].[Cls_ProductSubCategories]
             ([ProductSubCategoryId] [int] IDENTITY(0,1) NOT FOR REPLICATION NOT NULL,
	          [DescrLocal]           [nvarchar](255) NOT NULL,
	          [DescrEng]             [nvarchar](255) NOT NULL,
	          [ProductCategory]      [int]           NOT NULL,
	          [IsActive]             [bit]           NOT NULL,
 CONSTRAINT [ICls_ProductSubCategoriesId] PRIMARY KEY CLUSTERED 
([ProductSubCategoryId] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
                      ON [PRIMARY]) ON [PRIMARY]
GO
---------------------------------------------------------------------------------
--Cls_UserStatuses
CREATE TABLE [dbo].[Cls_UserStatuses]
             ([StatusId]   [int]          NOT NULL,
	          [DescrLocal] [nvarchar](50) NOT NULL,
	          [DescrEng]   [varchar](50)  NOT NULL,
	          [IsActive]   [bit]          NOT NULL,
 CONSTRAINT [ICls_UserStatusesId] PRIMARY KEY CLUSTERED 
([StatusId] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
                   ON [PRIMARY]) ON [PRIMARY]
GO 
---------------------------------------------------------------------------------
--Cls_ClientStatuses
CREATE TABLE [dbo].[Cls_ClientStatuses]
             ([ClientStatusId] [int]           NOT NULL,
	          [DescrLocal]     [nvarchar](255) NOT NULL,
	          [DescrEng]       [varchar](255)  NOT NULL,
	          [IsActive]       [bit]           NOT NULL,
CONSTRAINT [ICls_ClientStatusesStatusId] PRIMARY KEY CLUSTERED 
([ClientStatusId] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
                         ON [PRIMARY]) ON [PRIMARY]
GO                         
---------------------------------------------------------------------------------
--Cls_ClientCategories
CREATE TABLE [dbo].[Cls_ClientCategories]
             ([ClientCategoryId]    [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	          [DescrLocal]          [nvarchar](255) NOT NULL,
	          [DescrEng]            [varchar](255)  NOT NULL,
	          [IsActive]            [bit]           NOT NULL,
CONSTRAINT [ICls_ClientCategories_] PRIMARY KEY CLUSTERED 
([ClientCategoryId] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
                              ON [PRIMARY]) ON [PRIMARY]
GO  
---------------------------------------------------------------------------------
--BusinessProcessesHistory
CREATE TABLE [dbo].[BusinessProcessesHistory]
             ([Id]                 [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	          [BPId]               [int]            NOT NULL,
   	          [BPTypeCode]         [varchar](30)        NULL,
	          [BPStatusId]         [int]                NULL,
	          [StoreId]            [int]                NULL,
	          [ProductId]          [int]                NULL,
	          [OrderingAccount]    [varchar](35)        NULL,
	          [BeneficiaryAccount] [varchar](35)        NULL,
	          [Amount]             [money]              NULL,
	          [Currency]           [char](3)            NULL,
	          [BPDate]             [smalldatetime]      NULL,
	          [Description]        [nvarchar](4000)     NULL,
	          [ConfirmingUserId]   [int]                NULL,
	          [ChangerId]          [int]            NOT NULL,
	          [Changed]            [datetime]       NOT NULL,
CONSTRAINT [IBusinessProcessesHistoryId] PRIMARY KEY CLUSTERED 
([Id] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
             ON [PRIMARY]) ON [PRIMARY]   
GO
---------------------------------------------------------------------------------
--ClientsHistory
CREATE TABLE [dbo].[ClientsHistory]
             ([Id]                  [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	          [ClientId]            [bigint]        NOT NULL,
	          [ChangerId]           [int]           NOT NULL,
	          [Changed]             [datetime]      NOT NULL,
	          [StoreId]             [int]               NULL,
	          [FullnameLocal]       [nvarchar](255)     NULL,
	          [FullnameEng]         [varchar](255)      NULL,
	          [AdvisorId]           [int]               NULL,
	          [StatusId]            [int]               NULL,
	          [IsVIP]               [bit]               NULL,
	          [ClientCategoryId]    [int]               NULL,
CONSTRAINT [IClientsHistoryId] PRIMARY KEY NONCLUSTERED 
([Id] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 60) 
             ON [PRIMARY]) ON [PRIMARY]
GO      
---------------------------------------------------------------------------------
--ClientStickersHistory
CREATE TABLE [dbo].[ClientStickersHistory]
             ([ID]                  [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	          [ClientStickerId]     [int]            NULL,
	          [ClientId]            [bigint]         NULL,
	          [Comment]             [nvarchar](1000) NULL,
	          [ValidTill]           [datetime]       NULL,
	          [IsActive]            [bit]            NULL,
	          [Changed]             [datetime]       NULL,
	          [ChangerId]           [int]            NULL,
	          [BPId]                [int]            NULL,
	          [DateApplied]         [datetime]       NULL,
CONSTRAINT [IClientStickersHistory_] PRIMARY KEY CLUSTERED 
([ID] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
             ON [PRIMARY]) ON [PRIMARY]       
---------------------------------------------------------------------------------
--UsersHistor
CREATE TABLE [dbo].[UsersHistory]
             ([Id]          [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
              [UserId]      [int]         NOT NULL,
              [ChangerId]   [int]         NOT NULL,
              [Changed]     [datetime]    NOT NULL,
              [NameLocal]   [nvarchar](50)    NULL,
              [NameEng]     [varchar](50)     NULL,
              [StoreId]     [int]             NULL,
              [ClientId]    [bigint]          NULL,
              [EnableDate]  [datetime]        NULL,
              [DisableDate] [datetime]        NULL,
              [StatusId]    [int]             NULL,
              [IsActive]    [bit]             NULL,
              [Login]       [varchar](30)     NULL,
CONSTRAINT [IUsersHistoryId] PRIMARY KEY CLUSTERED 
([Id] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
             ON [PRIMARY]) ON [PRIMARY]        
---------------------------------------------------------------------------------
                            