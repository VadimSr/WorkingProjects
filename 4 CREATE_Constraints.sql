SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO
---------------------------------------------------------------------------------
----DROP Keys
--DECLARE @SQL NVARCHAR(MAX) 
--SET     @SQL = ''

--SELECT @SQL = @SQL + 'ALTER TABLE ' + s.name+'.'+t.name + ' DROP CONSTRAINT [' + RTRIM(f.name) +'];' + CHAR(13)
--FROM   sys.Tables AS t WITH(NOLOCK)
--JOIN   sys.foreign_keys AS f WITH(NOLOCK)
--  ON   f.parent_object_id = t.object_id
--JOIN   sys.schemas AS s WITH(NOLOCK) 
--  ON   s.schema_id = f.schema_id

----SELECT @SQL
--EXECUTE (@SQL)

--GO
-----------------------------------------------------------------------------------
----TABLES
-----------------------------------------------------------------------------------
--IF OBJECT_ID('Users')                    IS NOT NULL DROP TABLE Users
--IF OBJECT_ID('Clients')                  IS NOT NULL DROP TABLE Clients
--IF OBJECT_ID('Stores')                   IS NOT NULL DROP TABLE Stores
--IF OBJECT_ID('Currencies')               IS NOT NULL DROP TABLE Currencies
--IF OBJECT_ID('Products')                 IS NOT NULL DROP TABLE Products
--IF OBJECT_ID('BusinessProcesses')        IS NOT NULL DROP TABLE BusinessProcesses
--IF OBJECT_ID('BusinessProcessesTypes')   IS NOT NULL DROP TABLE BusinessProcessesTypes
--IF OBJECT_ID('ClientStickers')           IS NOT NULL DROP TABLE ClientStickers
--IF OBJECT_ID('Cls_BPStatuses')           IS NOT NULL DROP TABLE Cls_BPStatuses
--IF OBJECT_ID('Cls_ProductCategories')    IS NOT NULL DROP TABLE Cls_ProductCategories
--IF OBJECT_ID('Cls_ProductSubCategories') IS NOT NULL DROP TABLE Cls_ProductSubCategories
--IF OBJECT_ID('Cls_UserStatuses')         IS NOT NULL DROP TABLE Cls_UserStatuses
--IF OBJECT_ID('Cls_ClientStatuses')       IS NOT NULL DROP TABLE Cls_ClientStatuses
--IF OBJECT_ID('Cls_ClientCategories')     IS NOT NULL DROP TABLE Cls_ClientCategories

--IF OBJECT_ID('BusinessProcessesHistory') IS NOT NULL DROP TABLE BusinessProcessesHistory
--IF OBJECT_ID('ClientsHistory')           IS NOT NULL DROP TABLE ClientsHistory
--IF OBJECT_ID('ClientStickersHistory')    IS NOT NULL DROP TABLE ClientStickersHistory
--IF OBJECT_ID('UsersHistory')             IS NOT NULL DROP TABLE UsersHistory
---------------------------------------------------------------------------------
--Users
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [RUsersStoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([StoreId])
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [RUsersStoreId]
GO

ALTER TABLE [dbo].[Users]  WITH NOCHECK ADD  CONSTRAINT [RUsersClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ClientId])
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [RUsersClientId]
GO

ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [RUsersCreatorId] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([UserId])
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [RUsersCreatorId]
GO

ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [RUsersStatusId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Cls_UserStatuses] ([StatusId])
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [RUsersStatusId]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DUsersCreatorId]  DEFAULT ((0)) FOR [CreatorId]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DUsersCreated]  DEFAULT (GETDATE()) FOR [Created]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DUsersIsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DUsersClientId]  DEFAULT ((0)) FOR [ClientId]
GO
---------------------------------------------------------------------------------
--Clients
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [RClientsAdvisorId] FOREIGN KEY([AdvisorId])
REFERENCES [dbo].[Users] ([UserId])
GO

ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [RClientsAdvisorId]
GO

ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [RClientsStoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([StoreId])
GO

ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [RClientsStoreId]
GO

ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [RClientsClientStatusId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Cls_ClientStatuses] ([ClientStatusId])
GO

ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [RClientsClientStatusId]
GO

ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [RClientsClientCategoryId] FOREIGN KEY([ClientCategoryId])
REFERENCES [dbo].[Cls_ClientCategories] ([ClientCategoryId])
GO

ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [RClientsClientCategoryId]
GO

ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [RClientsCreatorId] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([UserId])
GO

ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [RClientsCreatorId]
GO

ALTER TABLE [dbo].[Clients] ADD  CONSTRAINT [DF_Clients_AdvisorId]  DEFAULT ((0)) FOR [AdvisorId]
GO

ALTER TABLE [dbo].[Clients] ADD  CONSTRAINT [DClientsCreated]  DEFAULT (getdate()) FOR [Created]
GO

ALTER TABLE [dbo].[Clients] ADD  CONSTRAINT [DClientsCreatorId]  DEFAULT ((0)) FOR [CreatorId]
GO

ALTER TABLE [dbo].[Clients] ADD  DEFAULT ('FALSE') FOR [IsVIP]
GO
---------------------------------------------------------------------------------
--Stores
ALTER TABLE [dbo].[Stores]  WITH CHECK ADD  CONSTRAINT [RStoresCreatorId] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([UserId])
GO

ALTER TABLE [dbo].[Stores] CHECK CONSTRAINT [RStoresCreatorId]
GO

ALTER TABLE [dbo].[Stores] ADD  CONSTRAINT [DF_Stores_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[Stores] ADD  CONSTRAINT [DF_Stores_CreatorId]  DEFAULT ((0)) FOR [CreatorId]
GO

ALTER TABLE [dbo].[Stores] ADD  CONSTRAINT [DF_Stores_Created]  DEFAULT (GETDATE()) FOR [Created]
GO
---------------------------------------------------------------------------------
--Currencies
ALTER TABLE [dbo].[Currencies]  WITH CHECK ADD  CONSTRAINT [RCurrenciesCreatorId] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([UserId])
GO

ALTER TABLE [dbo].[Currencies] CHECK CONSTRAINT [RCurrenciesCreatorId]
GO

ALTER TABLE [dbo].[Currencies] ADD  CONSTRAINT [DCurrenciesCreated]  DEFAULT (GETDATE()) FOR [Created]
GO

ALTER TABLE [dbo].[Currencies] ADD  CONSTRAINT [DCurrenciesCreatorId]  DEFAULT ((0)) FOR [CreatorId]
GO
---------------------------------------------------------------------------------
--Products
ALTER TABLE [dbo].[Products] WITH CHECK ADD CONSTRAINT [RProductSubCategoryId] FOREIGN KEY([ProductSubCategory])
REFERENCES [dbo].[Cls_ProductSubCategories] ([ProductSubCategoryId])
GO

ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [P_DescrLoc]  DEFAULT ('DEFAULT') FOR [DescrLocal]
GO

ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [P_DescrEng]  DEFAULT ('DEFAULT') FOR [DescrEng]
GO

ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [P_Price]  DEFAULT (1000000000) FOR [Price]
GO

ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [P_PriceGreaterThan_0] CHECK (Price > 0)
GO

ALTER TABLE [dbo].[Products] WITH CHECK ADD CONSTRAINT [RProductsCurrency] FOREIGN KEY([Currency])
REFERENCES [dbo].[Currencies] ([ISO])
GO

ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [P_Currency]  DEFAULT ('UAH') FOR [Currency]
GO

ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_ProductSubCategory]  DEFAULT ((0)) FOR [ProductSubCategory]
GO

ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
---------------------------------------------------------------------------------
--BusinessProcesses
ALTER TABLE [dbo].[BusinessProcesses]  WITH CHECK ADD  CONSTRAINT [RBusinessProcessesBPStatusId] FOREIGN KEY([BPStatusId])
REFERENCES [dbo].[Cls_BPStatuses] ([BPStatusId])
GO

ALTER TABLE [dbo].[BusinessProcesses] CHECK CONSTRAINT [RBusinessProcessesBPStatusId]
GO

ALTER TABLE [dbo].[BusinessProcesses]  WITH CHECK ADD  CONSTRAINT [RBusinessProcessesProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProdPTypeId])
GO

ALTER TABLE [dbo].[BusinessProcesses] CHECK CONSTRAINT [RBusinessProcessesBPStatusId]
GO

ALTER TABLE [dbo].[BusinessProcesses]  WITH CHECK ADD  CONSTRAINT [RBusinessProcessesCreatorId] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([UserId])
GO

ALTER TABLE [dbo].[BusinessProcesses] CHECK CONSTRAINT [RBusinessProcessesCreatorId]
GO

ALTER TABLE [dbo].[BusinessProcesses] ADD  CONSTRAINT [DBusinessProcessesCreatorId]  DEFAULT ((0)) FOR [CreatorId]
GO

ALTER TABLE [dbo].[BusinessProcesses] ADD  CONSTRAINT [DBusinessProcessesCreated]  DEFAULT (getdate()) FOR [Created]
GO
---------------------------------------------------------------------------------
--BPClientRelation
ALTER TABLE [dbo].[BPClientRelation] WITH CHECK ADD CONSTRAINT [RBPRelation] FOREIGN KEY([BPId])
REFERENCES [dbo].[BusinessProcesses] ([BPId])
GO

ALTER TABLE [dbo].[BPClientRelation] WITH CHECK ADD CONSTRAINT [RClientRelation] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ClientId])
GO

ALTER TABLE [dbo].[BPClientRelation] ADD  CONSTRAINT [DF_BPClientRelation_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
---------------------------------------------------------------------------------
--BusinessProcessesTypes
ALTER TABLE [dbo].[BusinessProcessesTypes] ADD  CONSTRAINT [BP_DescrLoc]  DEFAULT ('DEFAULT') FOR [DescrLocal]
GO

ALTER TABLE [dbo].[BusinessProcessesTypes] ADD  CONSTRAINT [BP_DescrEng]  DEFAULT ('DEFAULT') FOR [DescrEng]
GO

ALTER TABLE [dbo].[BusinessProcessesTypes] ADD  CONSTRAINT [DF_BusinessProcessesTypes_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
---------------------------------------------------------------------------------
--ClientStickers
ALTER TABLE [dbo].[ClientStickers]  WITH NOCHECK ADD  CONSTRAINT [RClientStickersBPId] FOREIGN KEY([BPId])
REFERENCES [dbo].[BusinessProcesses] ([BPId])
GO

ALTER TABLE [dbo].[ClientStickers] CHECK CONSTRAINT [RClientStickersBPId]
GO

ALTER TABLE [dbo].[ClientStickers]  WITH NOCHECK ADD  CONSTRAINT [RClientStickersClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ClientId])
GO

ALTER TABLE [dbo].[ClientStickers] CHECK CONSTRAINT [RClientStickersClientId]
GO

ALTER TABLE [dbo].[ClientStickers]  WITH NOCHECK ADD  CONSTRAINT [RClientStickersCreatorId] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([UserId])
GO

ALTER TABLE [dbo].[ClientStickers] CHECK CONSTRAINT [RClientStickersCreatorId]
GO

ALTER TABLE [dbo].[ClientStickers] ADD  CONSTRAINT [DClientStickersCreated]  DEFAULT (getdate()) FOR [Created]
GO

ALTER TABLE [dbo].[ClientStickers] ADD  CONSTRAINT [DClientStickersCreatorId]  DEFAULT ([dbo].[f_sys_GetCurrentUser]()) FOR [CreatorId]
GO
---------------------------------------------------------------------------------
--Cls_BPStatuses
ALTER TABLE [dbo].[Cls_BPStatuses] ADD  CONSTRAINT [DCls_BPStatusesIsActive]  DEFAULT ((1)) FOR [IsActive]
GO
---------------------------------------------------------------------------------
--Cls_ProductSubCategories
ALTER TABLE [dbo].[Cls_ProductCategories] ADD  CONSTRAINT [PC_DescrLoc]  DEFAULT ('DEFAULT') FOR [DescrLocal]
GO

ALTER TABLE [dbo].[Cls_ProductCategories] ADD  CONSTRAINT [PC_DescrEng]  DEFAULT ('DEFAULT') FOR [DescrEng]
GO

ALTER TABLE [dbo].[Cls_ProductCategories] ADD  CONSTRAINT [DF_ProductCategories_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
---------------------------------------------------------------------------------
--Cls_ProductSubCategories
ALTER TABLE [dbo].[Cls_ProductSubCategories] WITH CHECK ADD CONSTRAINT [RProductCategoryId] FOREIGN KEY([ProductCategory])
REFERENCES [dbo].[Cls_ProductCategories] ([ProductCategoryId])
GO

ALTER TABLE [dbo].[Cls_ProductSubCategories] ADD  CONSTRAINT [PSC_DescrLoc]  DEFAULT ('DEFAULT') FOR [DescrLocal]
GO

ALTER TABLE [dbo].[Cls_ProductSubCategories] ADD  CONSTRAINT [PSC_DescrEng]  DEFAULT ('DEFAULT') FOR [DescrEng]
GO

ALTER TABLE [dbo].[Cls_ProductSubCategories] ADD  CONSTRAINT [DF_ProductCategory]  DEFAULT ((0)) FOR [ProductCategory]
GO

ALTER TABLE [dbo].[Cls_ProductSubCategories] ADD  CONSTRAINT [DF_ProductSubCategories_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
---------------------------------------------------------------------------------
--Cls_UserStatuses
ALTER TABLE [dbo].[Cls_UserStatuses] ADD  CONSTRAINT [Cls_UserStatusesIsActive]  DEFAULT ((1)) FOR [IsActive]
GO
---------------------------------------------------------------------------------
--Cls_ClientStatuses
ALTER TABLE [dbo].[Cls_ClientStatuses] ADD  CONSTRAINT [DCls_ClientStatusesIsActive]  DEFAULT ((1)) FOR [IsActive]
GO
---------------------------------------------------------------------------------
--Cls_ClientCategories
ALTER TABLE [dbo].[Cls_ClientCategories] ADD  CONSTRAINT [DCls_ClientCategoriesIsActive]  DEFAULT ((1)) FOR [IsActive]
GO
---------------------------------------------------------------------------------
--BusinessProcessesHistory
ALTER TABLE [dbo].[BusinessProcessesHistory]  WITH NOCHECK ADD  CONSTRAINT [RBusinessProcessesHistoryBPId] FOREIGN KEY([BPId])
REFERENCES [dbo].[BusinessProcesses] ([BPId])
GO

ALTER TABLE [dbo].[BusinessProcessesHistory] CHECK CONSTRAINT [RBusinessProcessesHistoryBPId]
GO

ALTER TABLE [dbo].[BusinessProcessesHistory] ADD  CONSTRAINT [DBusinessProcessesHistoryChangerId] DEFAULT ((0)) FOR [ChangerId]
GO

ALTER TABLE [dbo].[BusinessProcessesHistory] ADD  CONSTRAINT [DBusinessProcessesHistoryChanged] DEFAULT (getdate()) FOR [Changed]
GO
---------------------------------------------------------------------------------
--ClientsHistory
ALTER TABLE [dbo].[ClientsHistory]  WITH NOCHECK ADD  CONSTRAINT [RClientsHistoryClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ClientId])
GO

ALTER TABLE [dbo].[ClientsHistory] CHECK CONSTRAINT [RClientsHistoryClientId]
GO

ALTER TABLE [dbo].[ClientsHistory] ADD  CONSTRAINT [DClientsHistoryChangerId] DEFAULT ((0)) FOR [ChangerId]
GO

ALTER TABLE [dbo].[ClientsHistory] ADD  CONSTRAINT [DClientsHistoryChanged] DEFAULT (getdate()) FOR [Changed]
GO

ALTER TABLE [dbo].[ClientsHistory] ADD  DEFAULT ('FALSE') FOR [IsVIP]
GO

ALTER TABLE [dbo].[ClientsHistory] ADD  DEFAULT ((0)) FOR [ClientCategoryId]
GO
---------------------------------------------------------------------------------
--ClientStickersHistory
ALTER TABLE [dbo].[ClientStickersHistory]  WITH NOCHECK ADD  CONSTRAINT [RClientStickersHistoryBPId] FOREIGN KEY([BPId])
REFERENCES [dbo].[BusinessProcesses] ([BPId])
GO

ALTER TABLE [dbo].[ClientStickersHistory] CHECK CONSTRAINT [RClientStickersHistoryBPId]
GO

ALTER TABLE [dbo].[ClientStickersHistory]  WITH NOCHECK ADD  CONSTRAINT [RClientStickersHistoryChangerId] FOREIGN KEY([ChangerId])
REFERENCES [dbo].[Users] ([UserId])
GO

ALTER TABLE [dbo].[ClientStickersHistory] CHECK CONSTRAINT [RClientStickersHistoryChangerId]
GO

ALTER TABLE [dbo].[ClientStickersHistory]  WITH NOCHECK ADD  CONSTRAINT [RClientStickersHistoryClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ClientId])
GO

ALTER TABLE [dbo].[ClientStickersHistory] CHECK CONSTRAINT [RClientStickersHistoryClientId]
GO

ALTER TABLE [dbo].[ClientStickersHistory] ADD  DEFAULT (dbo.f_sys_GetActualDate()) FOR [DateApplied]
GO
---------------------------------------------------------------------------------
--UsersHistory
ALTER TABLE [dbo].[UsersHistory]  WITH CHECK ADD  CONSTRAINT [RUsersHistoryUserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO

ALTER TABLE [dbo].[UsersHistory] CHECK CONSTRAINT [RUsersHistoryUserId]
GO

ALTER TABLE [dbo].[UsersHistory] ADD  CONSTRAINT [DUsersHistoryChangerId]  DEFAULT ((0)) FOR [ChangerId]
GO

ALTER TABLE [dbo].[UsersHistory] ADD  CONSTRAINT [DUsersHistoryChanged]  DEFAULT (getdate()) FOR [Changed]
GO

ALTER TABLE [dbo].[UsersHistory] ADD  DEFAULT (NULL) FOR [Login]
GO
---------------------------------------------------------------------------------
