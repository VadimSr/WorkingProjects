---------------------------------------------------------------------------------
/*
GO
IF OBJECT_ID('[dbo].[Users_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Users_InsUpd]
IF OBJECT_ID('[dbo].[Users_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Users_Del]
IF OBJECT_ID('[dbo].[Users_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Users_SelAll]
IF OBJECT_ID('[dbo].[Users_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Users_Sel_Id]
IF OBJECT_ID('[dbo].[Users_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Users_Search]
GO
IF OBJECT_ID('[dbo].[Clients_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Clients_InsUpd]
IF OBJECT_ID('[dbo].[Clients_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Clients_Del]
IF OBJECT_ID('[dbo].[Clients_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Clients_SelAll]
IF OBJECT_ID('[dbo].[Clients_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Clients_Sel_Id]
IF OBJECT_ID('[dbo].[Clients_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Clients_Search]
GO
IF OBJECT_ID('[dbo].[Stores_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Stores_InsUpd]
IF OBJECT_ID('[dbo].[Stores_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Stores_Del]
IF OBJECT_ID('[dbo].[Stores_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Stores_SelAll]
IF OBJECT_ID('[dbo].[Stores_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Stores_Sel_Id]
IF OBJECT_ID('[dbo].[Stores_Search]')     IS NOT NULL DROP PROCEDURE [dbo].[Stores_Search]
GO
IF OBJECT_ID('[dbo].[Currencies_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Currencies_InsUpd]
IF OBJECT_ID('[dbo].[Currencies_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Currencies_Del]
IF OBJECT_ID('[dbo].[Currencies_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Currencies_SelAll]
IF OBJECT_ID('[dbo].[Currencies_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Currencies_Sel_Id]
IF OBJECT_ID('[dbo].[Currencies_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Currencies_Search]
GO
IF OBJECT_ID('[dbo].[Products_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Products_InsUpd]
IF OBJECT_ID('[dbo].[Products_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Products_Del]
IF OBJECT_ID('[dbo].[Products_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Products_SelAll]
IF OBJECT_ID('[dbo].[Products_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Products_Sel_Id]
IF OBJECT_ID('[dbo].[Products_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Products_Search]
GO
IF OBJECT_ID('[dbo].[BPClientRelation_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[BPClientRelation_InsUpd]
IF OBJECT_ID('[dbo].[BPClientRelation_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[BPClientRelation_Del]
IF OBJECT_ID('[dbo].[BPClientRelation_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[BPClientRelation_SelAll]
IF OBJECT_ID('[dbo].[BPClientRelation_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[BPClientRelation_Sel_Id]
IF OBJECT_ID('[dbo].[BPClientRelation_Search]') IS NOT NULL DROP PROCEDURE [dbo].[BPClientRelation_Search]
GO
IF OBJECT_ID('[dbo].[BusinessProcesses_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcesses_InsUpd]
IF OBJECT_ID('[dbo].[BusinessProcesses_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcesses_Del]
IF OBJECT_ID('[dbo].[BusinessProcesses_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcesses_SelAll]
IF OBJECT_ID('[dbo].[BusinessProcesses_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcesses_Sel_Id]
IF OBJECT_ID('[dbo].[BusinessProcesses_Search]') IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcesses_Search]
GO
IF OBJECT_ID('[dbo].[BusinessProcessesTypes_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcessesTypes_InsUpd]
IF OBJECT_ID('[dbo].[BusinessProcessesTypes_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcessesTypes_Del]
IF OBJECT_ID('[dbo].[BusinessProcessesTypes_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcessesTypes_SelAll]
IF OBJECT_ID('[dbo].[BusinessProcessesTypes_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcessesTypes_Sel_Id]
IF OBJECT_ID('[dbo].[BusinessProcessesTypes_Search]') IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcessesTypes_Search]
GO
IF OBJECT_ID('[dbo].[ClientStickers_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[ClientStickers_InsUpd]
IF OBJECT_ID('[dbo].[ClientStickers_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[ClientStickers_Del]
IF OBJECT_ID('[dbo].[ClientStickers_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[ClientStickers_SelAll]
IF OBJECT_ID('[dbo].[ClientStickers_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[ClientStickers_Sel_Id]
IF OBJECT_ID('[dbo].[ClientStickers_Search]') IS NOT NULL DROP PROCEDURE [dbo].[ClientStickers_Search]
GO
IF OBJECT_ID('[dbo].[Cls_BPStatuses_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_BPStatuses_InsUpd]
IF OBJECT_ID('[dbo].[Cls_BPStatuses_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Cls_BPStatuses_Del]
IF OBJECT_ID('[dbo].[Cls_BPStatuses_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_BPStatuses_SelAll]
IF OBJECT_ID('[dbo].[Cls_BPStatuses_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_BPStatuses_Sel_Id]
IF OBJECT_ID('[dbo].[Cls_BPStatuses_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_BPStatuses_Search]
GO
IF OBJECT_ID('[dbo].[Cls_ProductSubCategories_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductSubCategories_InsUpd]
IF OBJECT_ID('[dbo].[Cls_ProductSubCategories_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductSubCategories_Del]
IF OBJECT_ID('[dbo].[Cls_ProductSubCategories_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductSubCategories_SelAll]
IF OBJECT_ID('[dbo].[Cls_ProductSubCategories_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductSubCategories_Sel_Id]
IF OBJECT_ID('[dbo].[Cls_ProductSubCategories_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductSubCategories_Search]
GO
IF OBJECT_ID('[dbo].[Cls_ProductCategories_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductCategories_InsUpd]
IF OBJECT_ID('[dbo].[Cls_ProductCategories_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductCategories_Del]
IF OBJECT_ID('[dbo].[Cls_ProductCategories_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductCategories_SelAll]
IF OBJECT_ID('[dbo].[Cls_ProductCategories_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductCategories_Sel_Id]
IF OBJECT_ID('[dbo].[Cls_ProductCategories_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductCategories_Search]
GO
IF OBJECT_ID('[dbo].[Cls_UserStatuses_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_UserStatuses_InsUpd]
IF OBJECT_ID('[dbo].[Cls_UserStatuses_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Cls_UserStatuses_Del]
IF OBJECT_ID('[dbo].[Cls_UserStatuses_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_UserStatuses_SelAll]
IF OBJECT_ID('[dbo].[Cls_UserStatuses_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_UserStatuses_Sel_Id]
IF OBJECT_ID('[dbo].[Cls_UserStatuses_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_UserStatuses_Search]
GO
IF OBJECT_ID('[dbo].[Cls_ClientStatuses_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientStatuses_InsUpd]
IF OBJECT_ID('[dbo].[Cls_ClientStatuses_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientStatuses_Del]
IF OBJECT_ID('[dbo].[Cls_ClientStatuses_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientStatuses_SelAll]
IF OBJECT_ID('[dbo].[Cls_ClientStatuses_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientStatuses_Sel_Id]
IF OBJECT_ID('[dbo].[Cls_ClientStatuses_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientStatuses_Search]
GO
IF OBJECT_ID('[dbo].[Cls_ClientCategories_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientCategories_InsUpd]
IF OBJECT_ID('[dbo].[Cls_ClientCategories_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientCategories_Del]
IF OBJECT_ID('[dbo].[Cls_ClientCategories_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientCategories_SelAll]
IF OBJECT_ID('[dbo].[Cls_ClientCategories_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientCategories_Sel_Id]
IF OBJECT_ID('[dbo].[Cls_ClientCategories_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientCategories_Search]
GO
*/
---------------------------------------------------------------------------------
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
---------------------------------------------------------------------------------
GO--CRUD_Users
---------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[Users_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Users_InsUpd]
IF OBJECT_ID('[dbo].[Users_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Users_Del]
IF OBJECT_ID('[dbo].[Users_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Users_SelAll]
IF OBJECT_ID('[dbo].[Users_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Users_Sel_Id]
IF OBJECT_ID('[dbo].[Users_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Users_Search]
-----------------------------------------------------------------------------------------------------------------
GO--Users_InsUpd
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Users_InsUpd]
	             @UserId      INT, 
	             @Login       VARCHAR(30), 
	             @NameLocal   NVARCHAR(50), 
	             @NameEng     VARCHAR(50),
	             @StoreId     INT, 
	             @EnableDate  DATETIME, 
	             @DisableDate DATETIME, 
	             @StatusId    INT, 
	             @CreatorId   INT = 0, 
	             @Created     DATETIME = NULL, 
	             @IsActive    BIT,
	             @ClientId    BIGINT
 
AS

SET NOCOUNT ON

BEGIN TRY
IF EXISTS(SELECT 1 FROM [dbo].[Users] WHERE [UserId] = @UserId)
BEGIN
	UPDATE [dbo].[Users] WITH(ROWLOCK) 
	SET    [Login]       = @Login, 
			[NameLocal]   = @NameLocal, 
			[NameEng]     = @NameEng, 
			[StoreId]     = @StoreId, 
			[EnableDate]  = @EnableDate, 
			[DisableDate] = @DisableDate, 
			[StatusId]    = @StatusId, 
			[CreatorId]   = @CreatorId, 
			[Created]     = @Created, 
			[IsActive]    = @IsActive,
			[ClientId]    = @ClientId
	WHERE  [UserId]      = @UserId
END
   	
ELSE
   		
BEGIN
	INSERT INTO [dbo].[Users] 
				([Login], 
					[NameLocal], 
					[NameEng],
					[StoreId], 
					[EnableDate], 
					[DisableDate], 
					[StatusId], 
					[CreatorId], 
					[Created], 
					[IsActive],
					[ClientId]) 
		VALUES (@Login, 
				@NameLocal, 
				@NameEng, 
				@StoreId, 
				@EnableDate, 
				@DisableDate, 
				@StatusId, 
				@CreatorId, 
				@Created, 
				@IsActive,
				@ClientId)
END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '')
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	                  
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Users_Del
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Users_Del] @UserId int   
AS

SET NOCOUNT ON

BEGIN TRY
    DELETE FROM [dbo].[Users]
    WHERE  [UserId] = @UserId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
   	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Users_SelAll
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Users_SelAll] @where_clause NVARCHAR(2000) = NULL

AS

DECLARE @SQL NVARCHAR(4000)

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	   IF @where_clause IS NULL
	   BEGIN
		    SELECT [UserId],
			       [Login],
			       [NameLocal],
			       [NameEng],
			       [StoreId],
			       [EnableDate],
			       [DisableDate],
			       [StatusId],
			       [CreatorId],
			       [Created],
			       [IsActive],
			       [ClientId]
		    FROM   [dbo].[Users]
	   END
   	
	   ELSE
   		
	   BEGIN
		    SET @SQL = 'SELECT [UserId],
							    [Login],
								[NameLocal],
								[NameEng],
								[StoreId],
								[EnableDate],
								[DisableDate],
								[StatusId],
								[CreatorId],
								[Created],
								[IsActive],
								[ClientId]
					    FROM   [dbo].[Users]
						WHERE  ' + @where_clause + '
					    ORDER  BY [UserId]'

		    EXEC sp_executesql @SQL
	   END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Users_Sel_Id
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Users_Sel_Id] @UserId INT   
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [UserId],
		   [Login],
		   [NameLocal],
		   [NameEng],
		   [StoreId],
		   [EnableDate],
		   [DisableDate],
		   [StatusId],
		   [CreatorId],
		   [Created],
		   [IsActive],
		   [ClientId]
	FROM   [dbo].[Users]
	WHERE  [UserId] = @UserId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') + 'LN: ' 
	              + CAST(ERROR_LINE() AS NVARCHAR(20)) + N', ' 
	               + CHAR(13) + ERROR_MESSAGE()
	               
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Users_Search
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Users_Search]
                 @UserId      INT          = NULL, 
	             @Login       VARCHAR(30)  = NULL, 
	             @NameLocal   NVARCHAR(50) = NULL, 
	             @NameEng     VARCHAR(50)  = NULL,
	             @StoreId     INT          = NULL, 
	             @EnableDate  DATETIME     = NULL, 
	             @DisableDate DATETIME     = NULL, 
	             @StatusId    INT          = NULL,
	             @IsActive    BIT          = NULL,
	             @ClientId    BIGINT       = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [UserId],
		   [Login], 
		   [NameLocal], 
		   [NameEng] 
		   [StoreId], 
		   [EnableDate], 
		   [DisableDate], 
		   [StatusId], 
		   [CreatorId], 
		   [Created], 
		   [IsActive],
		   [ClientId]
	FROM   [dbo].[Users]
	WHERE  (@UserId IS NULL OR @UserId = [UserId])
		    AND (@Login IS NULL OR @Login = [Login])
		     AND (@NameLocal IS NULL OR @NameLocal = [NameLocal])
		      AND (@NameEng IS NULL OR @NameEng = [NameEng])
		       AND (@StoreId IS NULL OR @StoreId = [StoreId])
		        AND (@EnableDate IS NULL OR @EnableDate = [EnableDate])
		         AND (@DisableDate IS NULL OR @DisableDate = [DisableDate])
		          AND (@StatusId IS NULL OR @StatusId = [StatusId])
		           AND (@IsActive IS NULL OR @IsActive = [IsActive])
		            AND (@ClientId IS NULL OR @ClientId = [ClientId])
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '')
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20))
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH
---------------------------------------------------------------------------------
GO--CRUD_Clients
---------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[Clients_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Clients_InsUpd]
IF OBJECT_ID('[dbo].[Clients_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Clients_Del]
IF OBJECT_ID('[dbo].[Clients_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Clients_SelAll]
IF OBJECT_ID('[dbo].[Clients_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Clients_Sel_Id]
IF OBJECT_ID('[dbo].[Clients_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Clients_Search]
-----------------------------------------------------------------------------------------------------------------
GO--Clients_InsUpd
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Clients_InsUpd]
	             @ClientId         BIGINT,
	             @StoreId          INT, 
	             @FullnameLocal    NVARCHAR(255), 
	             @FullnameEng      VARCHAR(255), 
	             @AdvisorId        INT, 
	             @StatusId         INT, 
	             @Created          DATETIME = NULL OUTPUT, 
	             @CreatorId        INT      = 0    OUTPUT, 
	             @IsVIP            BIT, 
	             @ClientCategoryId INT
AS

SET NOCOUNT ON

BEGIN TRY
IF EXISTS(SELECT 1 FROM [dbo].[Clients] WHERE [ClientId] = @ClientId  )
BEGIN
	UPDATE [dbo].[Clients] WITH (ROWLOCK) 
	SET    [StoreId]          = @StoreId,
		    [FullnameLocal]    = @FullnameLocal,
		    [FullnameEng]      = @FullnameEng,
		    [AdvisorId]        = @AdvisorId,
		    [StatusId]         = @StatusId,
		    [IsVIP]            = @IsVIP,
			[ClientCategoryId] = @ClientCategoryId
	WHERE  [ClientId] = @ClientId
END
   	
ELSE
   		
BEGIN
IF (ISNULL(@CreatorId,0) <= 0)
			SET @CreatorId = dbo.f_sys_GetCurrentUser()	
			     	
IF (@Created IS NULL OR @Created <= 0)
SET @Created = GETDATE()

INSERT INTO [dbo].[Clients] 
		    ([StoreId],
			[FullnameLocal],
			[FullnameEng],
			[AdvisorId],
			[StatusId],
			[Created],
			[CreatorId],
			[IsVIP],
			[ClientCategoryId])
VALUES (@StoreId,
		@FullnameLocal,
		@FullnameEng,
		@AdvisorId,
		@StatusId,
		@Created,
		@CreatorId,
		@IsVIP,
		@ClientCategoryId)
END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Clients_Del
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Clients_Del] @ClientId BIGINT    
AS

SET NOCOUNT ON

BEGIN TRY
    DELETE FROM [dbo].[Clients]
	WHERE  [ClientId] = @ClientId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Clients_SelAll
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Clients_SelAll] @where_clause NVARCHAR(2000) = NULL 

AS

DECLARE @SQL NVARCHAR(4000)

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

BEGIN TRY
    IF @where_clause IS NULL
	   BEGIN
		      SELECT [ClientId],
			         [StoreId],
					 [FullnameLocal],
					 [FullnameEng],
					 [AdvisorId],
					 [StatusId],
					 [Created],
					 [CreatorId],
					 [IsVIP],
					 [ClientCategoryId]
		      FROM   [dbo].[Clients]
	   END
   	
	   ELSE
   		
	   BEGIN
		    SET @SQL = 'SELECT [ClientId],
                        [StoreId],
                        [FullnameLocal],
                        [FullnameEng],
                        [AdvisorId],
                        [StatusId],
                        [Created],
                        [CreatorId],
                        [IsVIP],
                        [ClientCategoryId]
		                FROM   [dbo].[Clients]
		                WHERE  ' + @where_clause + '
		                ORDER  BY [ClientId]'

		    EXEC sp_executesql @SQL
	   END
END TRY

BEGIN CATCH
	   DECLARE @Error NVARCHAR(4000)
	   SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                     + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                      + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	   IF @@TRANCOUNT > 0 ROLLBACK TRAN
	       RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Clients_Sel_Id
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Clients_Sel_Id]	@ClientId BIGINT  
 
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

BEGIN TRY
	   SELECT [ClientId],
			  [StoreId],
			  [FullnameLocal],
			  [FullnameEng],
			  [AdvisorId],
			  [StatusId],
			  [Created],
			  [CreatorId],
			  [IsVIP],
			  [ClientCategoryId]
	   FROM   [dbo].[Clients]
	   WHERE  [ClientId] = @ClientId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Clients_Search
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Clients_Search]
	             @ClientId         BIGINT        = NULL, 
	             @StoreId          INT           = NULL, 
	             @FullnameLocal    NVARCHAR(255) = NULL, 
	             @FullnameEng      VARCHAR(255)  = NULL, 
	             @AdvisorId        INT           = NULL,
	             @StatusId         INT           = NULL, 
	             @IsVIP            BIT           = NULL, 
	             @ClientCategoryId INT           = NULL    
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

BEGIN TRY
	SELECT [ClientId],
            [StoreId],
            [FullnameLocal],
            [FullnameEng],
            [AdvisorId],
            [StatusId],
            [Created],
            [CreatorId],
            [IsVIP],
            [ClientCategoryId]
	FROM   [dbo].[Clients]
	WHERE  (@ClientId IS NULL OR @ClientId = [ClientId])
		    AND (@StoreId IS NULL OR @StoreId = [StoreId])
		     AND (@FullnameLocal IS NULL OR @FullnameLocal = [FullnameLocal])
		      AND (@FullnameEng IS NULL OR @FullnameEng = [FullnameEng])
		       AND (@AdvisorId IS NULL OR @AdvisorId = [AdvisorId])
		        AND (@StatusId IS NULL OR @StatusId = [StatusId])
		         AND (@IsVIP IS NULL OR @IsVIP = [IsVIP])
		          AND (@ClientCategoryId IS NULL OR @ClientCategoryId = [ClientCategoryId])
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH
---------------------------------------------------------------------------------
GO--CRUD_Stores
---------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[Stores_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Stores_InsUpd]
IF OBJECT_ID('[dbo].[Stores_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Stores_Del]
IF OBJECT_ID('[dbo].[Stores_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Stores_SelAll]
IF OBJECT_ID('[dbo].[Stores_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Stores_Sel_Id]
IF OBJECT_ID('[dbo].[Stores_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Stores_Search]
-----------------------------------------------------------------------------------------------------------------
GO--Stores_InsUpd
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Stores_InsUpd]
	             @StoreId      INT, 
	             @NameLocal    NVARCHAR(50),
	             @NameEng      VARCHAR(50), 
	             @CityLocal    NVARCHAR(50),
	             @CityEng      VARCHAR(50),
	             @AddressLocal NVARCHAR(1000), 
	             @AddressEng   VARCHAR(1000), 
	             @Phone        VARCHAR(20), 
	             @IsActive     BIT, 
	             @CreatorId    INT      = 0, 
	             @Created      DATETIME = NULL
AS

SET NOCOUNT ON

BEGIN TRY
	IF EXISTS(SELECT 1 FROM [dbo].[Stores] WHERE [StoreId] = @StoreId  )
	BEGIN
		UPDATE [dbo].[Stores] WITH(ROWLOCK) 
		SET    [NameLocal]    = @NameLocal,
				[NameEng]      = @NameEng, 
				[CityLocal]    = @CityLocal,
				[CityEng]      = @CityEng,
				[AddressLocal] = @AddressLocal, 
				[AddressEng]   = @AddressEng, 
				[Phone]        = @Phone, 
				[IsActive]     = @IsActive
		WHERE   [StoreId]      = @StoreId
	END
   	
	ELSE
   		
	BEGIN
		INSERT INTO [dbo].[Stores] 
					([NameLocal],
					[NameEng], 
					[CityLocal],
					[CityEng],
					[AddressLocal], 
					[AddressEng], 
					[Phone], 
					[IsActive]) 
		VALUES (@NameLocal,
				@NameEng, 
				@CityLocal,
				@CityEng,
				@AddressLocal, 
				@AddressEng, 
				@Phone, 
				@IsActive)
	END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '')
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20))
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	                  
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Stores_Del
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Stores_Del] @StoreId INT    
AS

SET NOCOUNT ON

BEGIN TRY
    DELETE FROM [dbo].[Stores]
    WHERE  [StoreId] = @StoreId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Stores_SelAll
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Stores_SelAll] @where_clause NVARCHAR(2000) = NULL
AS

DECLARE @SQL NVARCHAR(4000)

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY

	IF @where_clause IS NULL
	BEGIN
		SELECT [StoreId],
				[NameLocal],
				[NameEng],
				[CityLocal],
				[CityEng],
				[AddressLocal],
				[AddressEng],
				[Phone],
				[IsActive]
		FROM   [dbo].[Stores]
	END
   	
	ELSE
   		
	BEGIN
		SET @SQL = 'SELECT [StoreId],
							[NameLocal],
							[NameEng],
							[CityLocal],
							[CityEng],
							[AddressLocal],
							[AddressEng],
							[Phone],
                            [IsActive]
		            FROM   [dbo].[Stores]
		            WHERE  ' + @where_clause + '
		            ORDER  BY [StoreId]'

		EXEC sp_executesql @SQL
	END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
   	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Stores_Sel_Id
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Stores_Sel_Id] @StoreId INT     
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [StoreId],
           [NameLocal],
           [NameEng],
           [CityLocal],
           [CityEng],
           [AddressLocal],
           [AddressEng],
           [Phone],
           [IsActive]
	FROM   [dbo].[Stores]
	WHERE  [StoreId] = @StoreId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Stores_Search
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Stores_Search]
	             @StoreId      INT            = NULL, 
	             @NameLocal    NVARCHAR(50)   = NULL,
	             @NameEng      VARCHAR(50)    = NULL, 
	             @CityLocal    NVARCHAR(50)   = NULL,
	             @CityEng      VARCHAR(50)    = NULL,
	             @AddressLocal NVARCHAR(1000) = NULL, 
	             @AddressEng   VARCHAR(1000)  = NULL, 
	             @Phone        VARCHAR(20)    = NULL, 
	             @IsActive     BIT            = NULL  
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT  [StoreId],
            [NameLocal],
            [NameEng],
            [CityLocal],
            [CityEng],
			[AddressLocal],
			[AddressEng],
			[Phone],
			[IsActive] 
	FROM    [dbo].[Stores]
	WHERE (@StoreId IS NULL OR @StoreId = [StoreId])
	       AND (@NameLocal IS NULL OR @NameLocal = [NameLocal])
		    AND (@NameEng IS NULL OR @NameEng = [NameEng])
		     AND (@CityLocal IS NULL OR @CityLocal = [CityLocal])
		      AND (@CityEng IS NULL OR @CityEng = [CityEng])
		       AND (@AddressLocal IS NULL OR @AddressLocal = [AddressLocal])
		        AND (@AddressEng IS NULL OR @AddressEng = [AddressEng])
      		     AND (@Phone IS NULL OR @Phone = [Phone])
		          AND (@IsActive IS NULL OR @IsActive = [IsActive])
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH
---------------------------------------------------------------------------------
GO--CRUD_Currencies
---------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[Currencies_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Currencies_InsUpd]
IF OBJECT_ID('[dbo].[Currencies_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Currencies_Del]
IF OBJECT_ID('[dbo].[Currencies_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Currencies_SelAll]
IF OBJECT_ID('[dbo].[Currencies_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Currencies_Sel_Id]
IF OBJECT_ID('[dbo].[Currencies_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Currencies_Search]
-----------------------------------------------------------------------------------------------------------------
GO--Currencies_InsUpd
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Currencies_InsUpd]
	             @ISO        CHAR(3), 
	             @ISONum     INT,
	             @DescrLocal NVARCHAR(30), 
	             @DescrEng   VARCHAR(30),
	             @IsActive   BIT, 
	             @Created    DATETIME = NULL, 
	             @CreatorId  INT      = 0    
AS

SET NOCOUNT ON

BEGIN TRY
    IF EXISTS(SELECT 1 FROM [dbo].[Currencies] WHERE [ISO] = @ISO  )
	BEGIN
		    UPDATE [dbo].[Currencies] WITH(ROWLOCK) 
		    SET    [ISONum]     = @ISONum,
			        [DescrLocal] = @DescrLocal,
			        [DescrEng]   = @DescrEng,
			        [IsActive]   = @IsActive
		    WHERE  [ISO]        = @ISO
	END
	       
    ELSE
    	
    BEGIN
        INSERT INTO [dbo].[Currencies] 
                    ([ISO],
                     [ISONum],
                     [DescrLocal],
                     [DescrEng],
                     [IsActive]) 
        VALUES (@ISO,
                @ISONum,
                @DescrLocal,
                @DescrEng,
                @IsActive)

   	END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	                  
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Currencies_Del
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Currencies_Del] @ISO char(3)   
AS

SET NOCOUNT ON

BEGIN TRY
    DELETE FROM [dbo].[Currencies]
    WHERE  [ISO] = @ISO
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
   	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Currencies_SelAll
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Currencies_SelAll] @where_clause NVARCHAR(2000) = NULL 

AS

DECLARE @SQL NVARCHAR(4000)

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY

	IF @where_clause IS NULL
	BEGIN
		SELECT [ISO],
			    [ISONum],
			    [DescrLocal],
			    [DescrEng],
			    [IsActive],
			    [Created],
			    [CreatorId]
		FROM   [dbo].[Currencies]
	END
	
	ELSE
		
	BEGIN
		SET @SQL = 'SELECT [ISO],
			                [ISONum],
			                [DescrLocal],
			                [DescrEng],
			                [IsActive],
			                [Created],
			                [CreatorId]
		            FROM   [dbo].[Currencies]
		            WHERE  ' + @where_clause + '
		            ORDER  BY [ISO]'

		EXEC sp_executesql @SQL
	END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Currencies_Sel_Id
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Currencies_Sel_Id]	@ISO CHAR(3)   
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [ISO],
		    [ISONum],
		    [DescrLocal],
		    [DescrEng],
		    [IsActive],
		    [Created],
		    [CreatorId]
	FROM   [dbo].[Currencies]
	WHERE  [ISO] = @ISO

END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Currencies_Search
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Currencies_Search]
	             @ISO        CHAR(3)      = NULL, 
	             @ISONum     INT          = NULL, 
	             @DescrLocal NVARCHAR(30) = NULL, 
	             @DescrEng   VARCHAR(30)  = NULL,
	             @IsActive   BIT          = NULL   
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [ISO],
		    [ISONum],
		    [DescrLocal],
		    [DescrEng],
		    [IsActive],
		    [Created],
		    [CreatorId]
	FROM   [dbo].[Currencies]
	WHERE  (@ISO IS NULL OR @ISO = [ISO])
		     AND (@ISONum IS NULL OR @ISONum = [ISONum])
		      AND [DescrLocal] LIKE '%'+ISNULL( @DescrLocal ,'' )+'%'
		       AND [DescrEng] LIKE '%'+ISNULL( @DescrEng ,'' )+'%'
       	        AND (@IsActive IS NULL OR @IsActive = [IsActive])
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20))
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH
---------------------------------------------------------------------------------
GO--CRUD_Products
---------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[Products_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Products_InsUpd]
IF OBJECT_ID('[dbo].[Products_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Products_Del]
IF OBJECT_ID('[dbo].[Products_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Products_SelAll]
IF OBJECT_ID('[dbo].[Products_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Products_Sel_Id]
IF OBJECT_ID('[dbo].[Products_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Products_Search]
GO
-----------------------------------------------------------------------------------------------------------------
GO--Products_InsUpd
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Products_InsUpd]
	             @ProdPTypeId        INT,
				 @DescrLocal         NVARCHAR(255),
				 @DescrEng           NVARCHAR(255),
				 @Price              MONEY,
				 @Currency           CHAR(3),
				 @ProductSubCategory INT,
				 @IsActive           BIT 
AS

SET NOCOUNT ON

BEGIN TRY
    IF EXISTS(SELECT 1 FROM [dbo].[Products] WHERE [ProdPTypeId] = @ProdPTypeId)
	BEGIN
		UPDATE [dbo].[Products] WITH(ROWLOCK) 
		SET    [DescrLocal]         = @DescrLocal,
				[DescrEng]           = @DescrEng,
				[Price]              = @Price,
				[Currency]           = @Currency,
				[ProductSubCategory] = @ProductSubCategory,
				[IsActive]           = @IsActive  
		WHERE  [ProdPTypeId] = @ProdPTypeId
	END
	   
	ELSE
	   
	BEGIN
		INSERT INTO [dbo].[Products] 
		            ([DescrLocal],
					[DescrEng],
					[Price],
					[Currency],
					[ProductSubCategory],
					[IsActive]) 
		VALUES (@DescrLocal,
				@DescrEng,
				@Price,
				@Currency,
				@ProductSubCategory,
				@IsActive)
	END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	                  
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Products_Del
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Products_Del] @ProdPTypeId INT 
AS

SET NOCOUNT ON
BEGIN TRY
    DELETE FROM [dbo].[Products]
    WHERE  [ProdPTypeId] = @ProdPTypeId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Products_SelAll
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Products_SelAll] @where_clause NVARCHAR(2000) = NULL
AS

DECLARE @SQL NVARCHAR(4000)

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
   IF @where_clause IS NULL
	BEGIN
		SELECT [ProdPTypeId],
		       [DescrLocal],
			   [DescrEng],
			   [Price],
			   [Currency],
			   [ProductSubCategory],
			   [IsActive]
		FROM   [dbo].[Products]
	END
	      
	ELSE
		
	BEGIN
		SET @SQL = 'SELECT [ProdPTypeId],
							[DescrLocal],
							[DescrEng],
							[Price],
							[Currency],
							[ProductSubCategory],
							[IsActive]
		            FROM   [dbo].[Products]
		            WHERE  ' + @where_clause + '
		            ORDER  BY [ProdPTypeId]'

		EXEC sp_executesql @SQL
	END
	
END TRY
BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	                  
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Products_Sel_Id
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Products_Sel_Id] @ProdPTypeId INT  
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [ProdPTypeId],
		    [DescrLocal],
			[DescrEng],
			[Price],
			[Currency],
			[ProductSubCategory],
			[IsActive]
	FROM   [dbo].[Products]
	WHERE  [ProdPTypeId] = @ProdPTypeId

END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	               
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH
-----------------------------------------------------------------------------------------------------------------
GO--Products_Search
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Products_Search]
	             @ProdPTypeId        INT,
				 @DescrLocal         NVARCHAR(255),
				 @DescrEng           NVARCHAR(255),
				 @Price              MONEY,
				 @Currency           CHAR(3),
				 @ProductSubCategory INT,
				 @IsActive           BIT  
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [ProdPTypeId],
		    [DescrLocal],
			[DescrEng],
			[Price],
			[Currency],
			[ProductSubCategory],
			[IsActive]
	FROM   [dbo].[Products]
	WHERE  (@ProdPTypeId IS NULL OR @ProdPTypeId = [ProdPTypeId])
	       	AND [DescrLocal] LIKE '%'+ISNULL(@DescrLocal ,'')+'%'
		     AND [DescrEng] LIKE '%'+ISNULL(@DescrEng ,'')+'%'
		      AND (@Price IS NULL OR @Price = [Price])
		       AND [Currency] LIKE '%'+ISNULL(@Currency ,'')+'%'
		        AND (@ProductSubCategory IS NULL OR @ProductSubCategory = [ProductSubCategory])
		         AND (@IsActive IS NULL OR @IsActive = [IsActive])
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH
---------------------------------------------------------------------------------
GO--CRUD_BPClientRelation
---------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[BPClientRelation_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[BPClientRelation_InsUpd]
IF OBJECT_ID('[dbo].[BPClientRelation_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[BPClientRelation_Del]
IF OBJECT_ID('[dbo].[BPClientRelation_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[BPClientRelation_SelAll]
IF OBJECT_ID('[dbo].[BPClientRelation_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[BPClientRelation_Sel_Id]
IF OBJECT_ID('[dbo].[BPClientRelation_Search]') IS NOT NULL DROP PROCEDURE [dbo].[BPClientRelation_Search]
GO
-----------------------------------------------------------------------------------------------------------------
GO--BPClientRelation_InsUpd
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[BPClientRelation_InsUpd]
	             @RelationId INT,
				 @BPId       INT,
				 @ClientId   BIGINT,   
				 @IsActive   BIT 
AS

SET NOCOUNT ON

BEGIN TRY
    IF EXISTS(SELECT 1 FROM [dbo].[BPClientRelation] WHERE [RelationId] = @RelationId)
	BEGIN
		UPDATE [dbo].[BPClientRelation] WITH(ROWLOCK) 
		SET    [BPId]       = @BPId,
               [ClientId]   = @ClientId,
			   [IsActive]   = @IsActive
		WHERE  [RelationId] = @RelationId
	END
	   
	ELSE
	   
	BEGIN
		INSERT INTO [dbo].[BPClientRelation] 
		            ([BPId],
				     [ClientId],
				     [IsActive]) 
		VALUES (@BPId,
				@ClientId,
				@IsActive)
	END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	                  
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--BPClientRelation_Del
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[BPClientRelation_Del] @RelationId INT 
AS

SET NOCOUNT ON
BEGIN TRY
    DELETE FROM [dbo].[BPClientRelation]
    WHERE  [RelationId] = @RelationId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--BPClientRelation_SelAll
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[BPClientRelation_SelAll] @where_clause NVARCHAR(2000) = NULL
AS

DECLARE @SQL NVARCHAR(4000)

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
   IF @where_clause IS NULL
	BEGIN
		SELECT [RelationId],
		       [BPId],
			   [ClientId],
			   [IsActive]
		FROM   [dbo].[BPClientRelation]
	END
	      
	ELSE
		
	BEGIN
		SET @SQL = 'SELECT [RelationId],
						   [BPId],
						   [ClientId],
						   [IsActive]
					FROM   [dbo].[BPClientRelation]
		            WHERE  ' + @where_clause + '
		            ORDER  BY [RelationId]'

		EXEC sp_executesql @SQL
	END
	
END TRY
BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	                  
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--BPClientRelation_Sel_Id
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[BPClientRelation_Sel_Id] @RelationId INT  
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [RelationId],
		    [BPId],
			[ClientId],
			[IsActive]
	FROM   [dbo].[BPClientRelation]
	WHERE  [RelationId] = @RelationId

END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	               
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH
-----------------------------------------------------------------------------------------------------------------
GO--BPClientRelation_Search
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[BPClientRelation_Search]
	             @RelationId INT,
				 @BPId       INT,
				 @ClientId   INT,
				 @IsActive   BIT  
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [RelationId],
		    [BPId],
			[ClientId],
			[IsActive]
	FROM   [dbo].[BPClientRelation]
	WHERE  (@RelationId IS NULL OR @RelationId = [RelationId])
	        AND (@BPId IS NULL OR @BPId = [BPId])
	         AND (@ClientId IS NULL OR @ClientId = [ClientId])
              AND (@IsActive IS NULL OR @IsActive = [IsActive])
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH
---------------------------------------------------------------------------------
GO--CRUD_BusinessProcesses
---------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[BusinessProcesses_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcesses_InsUpd]
IF OBJECT_ID('[dbo].[BusinessProcesses_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcesses_Del]
IF OBJECT_ID('[dbo].[BusinessProcesses_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcesses_SelAll]
IF OBJECT_ID('[dbo].[BusinessProcesses_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcesses_Sel_Id]
IF OBJECT_ID('[dbo].[BusinessProcesses_Search]') IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcesses_Search]
---------------------------------------------------------------------------------
GO--BusinessProcesses_InsUpd
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[BusinessProcesses_InsUpd]
                 @BPId               INT,
                 @ClientId           BIGINT = NULL,
	             @BPTypeCode         VARCHAR(30),
	             @BPStatusId         INT,
	             @StoreId            INT,
	             @ProductId          INT,
	             @OrderingAccount    VARCHAR(35),
	             @BeneficiaryAccount VARCHAR(35),
	             @Amount             MONEY,
	             @Currency           CHAR(3),
	             @BPDate             SMALLDATETIME,
	             @Description        NVARCHAR(4000),
	             @ConfirmingUserId   INT
AS

SET NOCOUNT ON

BEGIN TRY
	SET @BPDate =CONVERT(CHAR(8), @BPDate, 112)


	IF EXISTS(SELECT 1 FROM [dbo].[BusinessProcesses] WHERE [BPId] = @BPId  )
	BEGIN
		UPDATE [dbo].[BusinessProcesses] WITH (ROWLOCK) 
		SET    [BPTypeCode]          = @BPTypeCode,
			    [BPStatusId]         = @BPStatusId,
			    [StoreId]            = @StoreId,
			    [ProductId]          = @ProductId,
			    [OrderingAccount]    = @OrderingAccount,
			    [BeneficiaryAccount] = @BeneficiaryAccount,
			    [Amount]             = @Amount,
			    [Currency]           = @Currency,
			    [Description]        = @Description,
			    [ConfirmingUserId]   = @ConfirmingUserId
		WHERE  [BPId] = @BPId	
		
		DECLARE @RelationId INT
		SET     @RelationId = (SELECT TOP 1 bpcr.RelationId
							   FROM   BPClientRelation AS bpcr WITH(NOLOCK)
							   WHERE  bpcr.BPId = @BPId
								       AND bpcr.ClientId = @ClientId
									    AND bpcr.IsActive = 1)
		IF @RelationId IS NOT NULL
		BEGIN
			EXEC BPClientRelation_InsUpd @RelationId = @RelationId,
										 @BPId       = @BPId,
										 @ClientId   = @ClientId,
										 @IsActive   = 1
	   END	
	   							 
       ELSE
       	
       IF @ClientId IS NOT NULL
	   BEGIN
		   EXEC BPClientRelation_InsUpd @RelationId = NULL,
										@BPId       = @BPId,
										@ClientId   = @ClientId,
										@IsActive   = 1
	   END	
	END
   	
	ELSE
   		
	BEGIN
		INSERT INTO [dbo].[BusinessProcesses] 
		            ([BPTypeCode],
			        [BPStatusId],
			        [StoreId],
			        [ProductId],
			        [OrderingAccount],
			        [BeneficiaryAccount],
			        [Amount],
			        [Currency],
			        [Description],
			        [BPDate],
			        [ConfirmingUserId]) 
		VALUES (@BPTypeCode,
	            @BPStatusId,
	            @StoreId,
	            @ProductId,
	            @OrderingAccount,
	            @BeneficiaryAccount,
	            @Amount,
	            @Currency,
	            @Description,
	            @BPDate,
	            @ConfirmingUserId)
      		
		SET @BPId = SCOPE_IDENTITY() 
		
		IF @ClientId IS NOT NULL
		BEGIN
			EXEC BPClientRelation_InsUpd @RelationId = NULL,
										 @BPId       = @BPId,
										 @ClientId   = @ClientId,
										 @IsActive   = 1
		END
	END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
   	               
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	RAISERROR(@ErroR, 16, 1)
END CATCH
---------------------------------------------------------------------------------
GO--BusinessProcesses_Del
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[BusinessProcesses_Del] @BPId INT   
AS

SET NOCOUNT ON
BEGIN TRY
	DELETE FROM [dbo].[BusinessProcesses]
	WHERE  [BPId] = @BPId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	RAISERROR(@Error, 16, 1)
	
END CATCH
---------------------------------------------------------------------------------
GO--BusinessProcesses_SelAll
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[BusinessProcesses_SelAll] @where_clause NVARCHAR(2000) = NULL

AS

DECLARE @SQL NVARCHAR(4000)

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
    IF @where_clause IS NULL
	BEGIN
		SELECT [BPId],
				[BPTypeCode],
				[BPStatusId],
				[StoreId],
				[ProductId],
				[OrderingAccount],
				[BeneficiaryAccount],
				[Amount],
				[Currency],
				[BPDate],
				[Description],
				[ConfirmingUserId],
				[CreatorId],
				[Created]
		FROM   [dbo].[BusinessProcesses]
	END
   	       
	ELSE
   		
	BEGIN
		SET @SQL = 'SELECT [BPId],
							[BPTypeCode],
							[BPStatusId],
							[StoreId],
							[ProductId],
							[OrderingAccount],
							[BeneficiaryAccount],
							[Amount],
							[Currency],
							[BPDate],
							[Description],
							[ConfirmingUserId],
							[CreatorId],
							[Created]
					FROM   [dbo].[BusinessProcesses]
					WHERE  ' + @where_clause + '
					ORDER  BY [BPId]'
      		            
		EXEC sp_executesql @SQL
	END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') + 'LN: ' 
	              + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
   	
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	RAISERROR(@Error, 16, 1)
END CATCH
---------------------------------------------------------------------------------
GO--BusinessProcesses_Sel_Id
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[BusinessProcesses_Sel_Id] @BPId int   
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [BPId],
			[BPTypeCode],
			[BPStatusId],
			[StoreId],
			[ProductId],
			[OrderingAccount],
			[BeneficiaryAccount],
			[Amount],
			[Currency],
			[BPDate],
			[Description],
			[ConfirmingUserId],
			[CreatorId],
			[Created]
	FROM   [dbo].[BusinessProcesses]
	WHERE  [BPId] = @BPId
END TRY
BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	RAISERROR(@Error, 16, 1)
END CATCH
---------------------------------------------------------------------------------
GO--BusinessProcesses_Search
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[BusinessProcesses_Search]
				@BPId               INT            = NULL,
				@BPTypeCode         VARCHAR(30)    = NULL,
				@BPStatusId         INT            = NULL,
				@StoreId            INT            = NULL,
				@ProductId          INT            = NULL,
				@OrderingAccount    VARCHAR(35)    = NULL,
				@BeneficiaryAccount VARCHAR(35)    = NULL,
				@Amount             MONEY          = NULL,
				@Currency           CHAR(3)        = NULL,
				@BPDate             SMALLDATETIME  = NULL,
				@Description        NVARCHAR(4000) = NULL,
				@ConfirmingUserId   INT            = NULL,
				@CreatorId          INT            = NULL,
				@Created            DATETIME       = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [BPId],
		   [BPTypeCode],
		   [BPStatusId],
		   [StoreId],
		   [ProductId],
		   [OrderingAccount],
		   [BeneficiaryAccount],
		   [Amount],
		   [Currency],
		   [BPDate],
		   [Description],
		   [ConfirmingUserId],
		   [CreatorId],
		   [Created]
		FROM   [dbo].[BusinessProcesses]
		WHERE  (@BPId IS NULL OR @BPId = [BPId])
				   AND (@BPTypeCode IS NULL OR @BPTypeCode = [BPTypeCode])
	        		AND (@BPStatusId IS NULL OR @BPStatusId = [BPStatusId])
					 AND (@StoreId IS NULL OR @StoreId = [StoreId])
					  AND (@ProductId IS NULL OR @ProductId = [ProductId])
					   AND (@OrderingAccount IS NULL OR @OrderingAccount = [OrderingAccount])
					    AND (@BeneficiaryAccount IS NULL OR @BeneficiaryAccount = [BeneficiaryAccount])
						 AND (@Amount IS NULL OR @Amount = [Amount])
						  AND (@Currency IS NULL OR @Currency = [Currency])
						   AND (@BPDate IS NULL OR @BPDate = [BPDate])
						    AND (@Description IS NULL OR @Description = [Description])
							 AND (@ConfirmingUserId IS NULL OR @ConfirmingUserId = [ConfirmingUserId])
							  AND (@CreatorId IS NULL OR @CreatorId = [CreatorId])
							   AND (@Created IS NULL OR @Created = [Created])

END TRY
BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
   	
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH
---------------------------------------------------------------------------------
GO--CRUD_BusinessProcessesTypes
---------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[BusinessProcessesTypes_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcessesTypes_InsUpd]
IF OBJECT_ID('[dbo].[BusinessProcessesTypes_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcessesTypes_Del]
IF OBJECT_ID('[dbo].[BusinessProcessesTypes_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcessesTypes_SelAll]
IF OBJECT_ID('[dbo].[BusinessProcessesTypes_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcessesTypes_Sel_Id]
IF OBJECT_ID('[dbo].[BusinessProcessesTypes_Search]') IS NOT NULL DROP PROCEDURE [dbo].[BusinessProcessesTypes_Search]
GO
-----------------------------------------------------------------------------------------------------------------
GO--BusinessProcessesTypes_InsUpd
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[BusinessProcessesTypes_InsUpd]
	             @BPTypeCode VARCHAR(30), 
	             @DescrLocal NVARCHAR(100), 
	             @DescrEng   NVARCHAR(100), 
	             @IsActive   BIT
AS

SET NOCOUNT ON

BEGIN TRY
    IF EXISTS(SELECT 1 FROM [dbo].[BusinessProcessesTypes] WHERE [BPTypeCode] = @BPTypeCode)
	   BEGIN
		   UPDATE [dbo].[BusinessProcessesTypes] WITH(ROWLOCK) 
		   SET    [DescrLocal] = @DescrLocal,
			      [DescrEng]   = @DescrEng,
			      [IsActive]   = @IsActive
		   WHERE  [BPTypeCode] = @BPTypeCode
	   END
	   
	   ELSE
	   
	   BEGIN
		    INSERT INTO [dbo].[BusinessProcessesTypes] 
		                ([BPTypeCode],
			            [DescrLocal],
			            [DescrEng],
			            [IsActive]) 
			VALUES (@BPTypeCode,
			        @DescrLocal,
			        @DescrEng,
			        @IsActive)
	   END

END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	                  
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--BusinessProcessesTypes_Del
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[BusinessProcessesTypes_Del] @BPTypeCode VARCHAR(30)   
AS

SET NOCOUNT ON
BEGIN TRY
    DELETE FROM [dbo].[BusinessProcessesTypes]
    WHERE  [BPTypeCode] = @BPTypeCode
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--BusinessProcessesTypes_SelAll
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[BusinessProcessesTypes_SelAll] @where_clause NVARCHAR(2000) = NULL
AS

DECLARE @SQL NVARCHAR(4000)

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
   IF @where_clause IS NULL
	BEGIN
		    SELECT [BPTypeCode],
			    [DescrLocal],
			    [DescrEng],
			    [IsActive]
		    FROM   [dbo].[BusinessProcessesTypes]
	END
	      
	ELSE
		
	BEGIN
		SET @SQL = 'SELECT [BPTypeCode],
			                [DescrLocal],
			                [DescrEng],
			                [IsActive]
		            FROM   [dbo].[BusinessProcessesTypes]
		            WHERE  ' + @where_clause + '
		            ORDER  BY [BPTypeCode]'

		EXEC sp_executesql @SQL
	END
	
END TRY
BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	                  
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--BusinessProcessesTypes_Sel_Id
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[BusinessProcessesTypes_Sel_Id] @BPTypeCode VARCHAR(30)   
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [BPTypeCode],
		    [DescrLocal],
		    [DescrEng],
		    [IsActive]
	FROM   [dbo].[BusinessProcessesTypes]
	WHERE  [BPTypeCode] = @BPTypeCode

END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	               
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--BusinessProcessesTypes_Search
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[BusinessProcessesTypes_Search]
	                @BPTypeCode VARCHAR(30)   = NULL, 
	                @DescrLocal NVARCHAR(100) = NULL, 
	                @DescrEng   NVARCHAR(100) = NULL, 
	                @IsActive   BIT           = NULL   
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [BPTypeCode],
		    [DescrLocal],
		    [DescrEng],
		    [IsActive]
	FROM   [dbo].[BusinessProcessesTypes]
	WHERE  (@BPTypeCode IS NULL OR @BPTypeCode = [BPTypeCode])
	       	AND [DescrLocal] LIKE '%'+ISNULL(@DescrLocal ,'')+'%'
		     AND [DescrEng] LIKE '%'+ISNULL(@DescrEng ,'')+'%'
		      AND (@IsActive IS NULL OR @IsActive = [IsActive])
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH
---------------------------------------------------------------------------------
GO--CRUD_ClientStickers
---------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[ClientStickers_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[ClientStickers_InsUpd]
IF OBJECT_ID('[dbo].[ClientStickers_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[ClientStickers_Del]
IF OBJECT_ID('[dbo].[ClientStickers_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[ClientStickers_SelAll]
IF OBJECT_ID('[dbo].[ClientStickers_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[ClientStickers_Sel_Id]
IF OBJECT_ID('[dbo].[ClientStickers_Search]') IS NOT NULL DROP PROCEDURE [dbo].[ClientStickers_Search]
-----------------------------------------------------------------------------------------------------------------
GO--ClientStickers_InsUpd
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[ClientStickers_InsUpd]
	             @ClientStickerId INT OUTPUT, 
	             @ClientId        BIGINT, 
	             @Comment         NVARCHAR(1000), 
	             @DateApplied     SMALLDATETIME, 
	             @ValidTill       DATETIME, 
	             @IsActive        BIT, 
	             @Created         DATETIME = NULL, 
	             @CreatorId       INT      = 0, 
	             @BPId            INT 
AS

SET NOCOUNT ON

BEGIN TRY
	IF EXISTS(SELECT 1 FROM [dbo].[ClientStickers] WHERE [ClientStickerId] = @ClientStickerId  )
		BEGIN
			UPDATE [dbo].[ClientStickers] WITH(ROWLOCK) 
			SET    [ClientId]    = @ClientId,
					[Comment]     = @Comment,
					[DateApplied] = @DateApplied,
					[ValidTill]   = @ValidTill,
					[IsActive]    = @IsActive,
					[BPId]        = @BPId
			WHERE  [ClientStickerId] = @ClientStickerId
		END
   	
		ELSE
   		
		BEGIN
			INSERT INTO [dbo].[ClientStickers] 
						([ClientId],
						[Comment],
						[DateApplied],
						[ValidTill],
						[IsActive],
						[BPId]) 
			VALUES (@ClientId,
					@Comment,
					@DateApplied,
					@ValidTill,
					@IsActive,
					@BPId)
      		
			SET @ClientStickerId = SCOPE_IDENTITY() 
		END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
   	
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--ClientStickers_Del
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[ClientStickers_Del] @ClientStickerId int   
AS

SET NOCOUNT ON

BEGIN TRY
	   DELETE FROM [dbo].[ClientStickers]
	   WHERE  [ClientStickerId] = @ClientStickerId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
   	
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--ClientStickers_SelAll
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[ClientStickers_SelAll] @where_clause NVARCHAR(2000) = NULL

AS

DECLARE @SQL NVARCHAR(4000)

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
    IF @where_clause IS NULL
	   BEGIN
		    SELECT [ClientStickerId],
			        [ClientId],
			        [Comment],
			        [DateApplied],
			        [ValidTill],
			        [IsActive],
			        [Created],
			        [CreatorId],
			        [BPId]
		    FROM   [dbo].[ClientStickers]
	   END
   	
	   ELSE
   		
	   BEGIN
		    SET @SQL = 'SELECT [ClientStickerId],
			                    [ClientId],
			                    [Comment],
			                    [DateApplied],
			                    [ValidTill],
			                    [IsActive],
			                    [Created],
			                    [CreatorId],
			                    [BPId]
		                FROM   [dbo].[ClientStickers]
		                WHERE  ' + @where_clause + '
		                ORDER  BY [ClientStickerId]'

		    EXEC sp_executesql @SQL
	   END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
   	
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--ClientStickers_Sel_Id
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[ClientStickers_Sel_Id] @ClientStickerId INT   
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [ClientStickerId],
		    [ClientId],
		    [Comment],
		    [DateApplied],
		    [ValidTill],
		    [IsActive],
		    [Created],
		    [CreatorId],
		    [BPId]
	FROM   [dbo].[ClientStickers]
	WHERE  [ClientStickerId] = @ClientStickerId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
   	
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--ClientStickers_Search
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[ClientStickers_Search]
	             @ClientStickerId INT            = NULL,
	             @ClientId        BIGINT         = NULL, 
	             @Comment         NVARCHAR(1000) = NULL, 
	             @DateApplied     SMALLDATETIME  = NULL, 
	             @ValidTill       DATETIME       = NULL, 
	             @IsActive        BIT            = NULL, 
	             @BPId            INT            = NULL    
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [ClientStickerId],
		    [ClientId],
	        [Comment],
	        [DateApplied],
	        [ValidTill],
	        [IsActive],
	        [Created],
	        [CreatorId],
	        [BPId]
	FROM   [dbo].[ClientStickers]
	WHERE  (@ClientStickerId IS NULL OR @ClientStickerId = [ClientStickerId])
		    AND (@ClientId IS NULL OR @ClientId = [ClientId])
		     AND (@Comment IS NULL OR @Comment = [Comment])
		      AND (@DateApplied IS NULL OR @DateApplied = [DateApplied])
		       AND (@ValidTill IS NULL OR @ValidTill = [ValidTill])
		        AND (@IsActive IS NULL OR @IsActive = [IsActive])
		         AND (@BPId IS NULL OR @BPId = [BPId])
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
   	
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH
---------------------------------------------------------------------------------
GO--CRUD_Cls_BPStatuses
---------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[Cls_BPStatuses_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_BPStatuses_InsUpd]
IF OBJECT_ID('[dbo].[Cls_BPStatuses_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Cls_BPStatuses_Del]
IF OBJECT_ID('[dbo].[Cls_BPStatuses_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_BPStatuses_SelAll]
IF OBJECT_ID('[dbo].[Cls_BPStatuses_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_BPStatuses_Sel_Id]
IF OBJECT_ID('[dbo].[Cls_BPStatuses_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_BPStatuses_Search]
-----------------------------------------------------------------------------------------------------------------
GO--Cls_BPStatuses_InsUpd
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_BPStatuses_InsUpd]
	             @BPStatusId INT, 
	             @DescrLocal NVARCHAR(50), 
	             @DescrEng   VARCHAR(50), 
	             @IsActive   BIT   
AS

SET NOCOUNT ON

BEGIN TRY
    IF EXISTS(SELECT 1 FROM [dbo].[Cls_BPStatuses] WHERE [BPStatusId] = @BPStatusId)
	   BEGIN
		      UPDATE [dbo].[Cls_BPStatuses] WITH(ROWLOCK) 
		      SET    [DescrLocal] = @DescrLocal,
			         [DescrEng]   = @DescrEng,
			         [IsActive]   = @IsActive
		      WHERE  [BPStatusId] = @BPStatusId	
	   END
	   
	   ELSE
	   	
	   BEGIN
		    INSERT INTO [dbo].[Cls_BPStatuses] 
		                ([BPStatusId],
			            [DescrLocal],
			            [DescrEng],
			            [IsActive]) 
			    VALUES (@BPStatusId,
			            @DescrLocal,
			            @DescrEng,
			            @IsActive)
	   END

END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_BPStatuses_Del
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_BPStatuses_Del] @BPStatusId int   
AS

SET NOCOUNT ON

BEGIN TRY
    DELETE FROM [dbo].[Cls_BPStatuses]
    WHERE  [BPStatusId] = @BPStatusId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_BPStatuses_SelAll
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_BPStatuses_SelAll] @where_clause NVARCHAR(2000) = null

AS

DECLARE @SQL NVARCHAR(4000)

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	   IF @where_clause IS NULL
	   BEGIN
		    SELECT [BPStatusId],
			        [DescrLocal],
			        [DescrEng],
			        [IsActive]
		    FROM   [dbo].[Cls_BPStatuses]
	   END
	   
	   ELSE
	   	
	   BEGIN
		    SET @SQL = 'SELECT [BPStatusId],
			                    [DescrLocal],
			                    [DescrEng],
			                    [IsActive]
		                FROM   [dbo].[Cls_BPStatuses]
		                WHERE  ' + @where_clause + '
		                ORDER  BY [BPStatusId]'

		    EXEC sp_executesql @SQL
	   END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                  
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_BPStatuses_Sel_Id
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_BPStatuses_Sel_Id] @BPStatusId int   
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [BPStatusId],
		    [DescrLocal],
		    [DescrEng],
		    [IsActive]
	FROM   [dbo].[Cls_BPStatuses]
	WHERE  [BPStatusId] = @BPStatusId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20))
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	                  
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_BPStatuses_Search
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_BPStatuses_Search]
	             @BPStatusId INT          = NULL, 
	             @DescrLocal NVARCHAR(50) = NULL, 
	             @DescrEng   VARCHAR(50)  = NULL, 
	             @IsActive   BIT          = NULL    
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [BPStatusId],
		    [DescrLocal],
		    [DescrEng],
		    [IsActive]
	FROM   [dbo].[Cls_BPStatuses]
	WHERE  (@BPStatusId IS NULL OR @BPStatusId = [BPStatusId])
		    AND [DescrLocal] LIKE '%'+ISNULL( @DescrLocal ,'' )+'%'
		     AND [DescrEng] LIKE '%'+ISNULL( @DescrEng ,'' )+'%'
		      AND (@IsActive IS NULL OR @IsActive = [IsActive])
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH
---------------------------------------------------------------------------------
GO--CRUD_Products
---------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[Cls_ProductSubCategories_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductSubCategories_InsUpd]
IF OBJECT_ID('[dbo].[Cls_ProductSubCategories_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductSubCategories_Del]
IF OBJECT_ID('[dbo].[Cls_ProductSubCategories_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductSubCategories_SelAll]
IF OBJECT_ID('[dbo].[Cls_ProductSubCategories_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductSubCategories_Sel_Id]
IF OBJECT_ID('[dbo].[Cls_ProductSubCategories_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductSubCategories_Search]
GO
-----------------------------------------------------------------------------------------------------------------
GO--Cls_ProductSubCategories_InsUpd
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ProductSubCategories_InsUpd]
	             @ProductSubCategoryId INT,
				 @DescrLocal           NVARCHAR(255),
				 @DescrEng             NVARCHAR(255),
				 @ProductCategory      INT,
				 @IsActive             BIT 
AS

SET NOCOUNT ON

BEGIN TRY
    IF EXISTS(SELECT 1 FROM [dbo].[Cls_ProductSubCategories] WHERE [ProductSubCategoryId] = @ProductSubCategoryId)
	   BEGIN
		    UPDATE [dbo].[Cls_ProductSubCategories] WITH(ROWLOCK) 
		    SET    [DescrLocal]            = @DescrLocal,
			 	   [DescrEng]              = @DescrEng,
			  	   [ProductCategory]       = @ProductCategory,
				   [IsActive]              = @IsActive  
		    WHERE  [ProductSubCategoryId]  = @ProductSubCategoryId
	   END
	   
	   ELSE
	   
	   BEGIN
			INSERT INTO [dbo].[Cls_ProductSubCategories] 
						([DescrLocal],
						[DescrEng],
						[ProductCategory],
						[IsActive]) 
			VALUES (@DescrLocal,
					@DescrEng,
					@ProductCategory,
					@IsActive)
	   END

END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	                  
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_ProductSubCategories_Del
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ProductSubCategories_Del] @ProductSubCategoryId INT
AS

SET NOCOUNT ON
BEGIN TRY
    DELETE FROM [dbo].[Cls_ProductSubCategories]
    WHERE  [ProductSubCategoryId] = @ProductSubCategoryId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_ProductSubCategories_SelAll
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ProductSubCategories_SelAll] @where_clause NVARCHAR(2000) = NULL
AS

DECLARE @SQL NVARCHAR(4000)

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
   IF @where_clause IS NULL
	    BEGIN
			SELECT [ProductSubCategoryId],
					[DescrLocal],
					[DescrEng],
					[ProductCategory],
					[IsActive]
			FROM   [dbo].[Cls_ProductSubCategories]
	    END
	      
	ELSE
		
	BEGIN
		SET @SQL = 'SELECT [ProductSubCategoryId],
							[DescrLocal],
							[DescrEng],
							[ProductCategory],
							[IsActive]
		            FROM   [dbo].[Cls_ProductSubCategories]
		            WHERE  ' + @where_clause + '
		            ORDER  BY [ProductSubCategoryId]'

		EXEC sp_executesql @SQL
	END
	
END TRY
BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	                  
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_ProductSubCategories_Sel_Id
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ProductSubCategories_Sel_Id] @ProductSubCategoryId INT   
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [ProductSubCategoryId],
		    [DescrLocal],
			[DescrEng],
			[ProductCategory],
			[IsActive]
	FROM   [dbo].[Cls_ProductSubCategories]
	WHERE  [ProductSubCategoryId] = @ProductSubCategoryId

END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	               
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_ProductSubCategories_Search
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ProductSubCategories_Search]
	             @ProductSubCategoryId  INT,
				 @DescrLocal         NVARCHAR(255),
				 @DescrEng           NVARCHAR(255),
				 @ProductCategory INT,
				 @IsActive           BIT  
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [ProductSubCategoryId],
		    [DescrLocal],
			[DescrEng],
			[ProductCategory],
			[IsActive]
	FROM   [dbo].[Cls_ProductSubCategories]
	WHERE  (@ProductSubCategoryId IS NULL OR @ProductSubCategoryId = [ProductSubCategoryId])
	       	AND [DescrLocal] LIKE '%'+ISNULL(@DescrLocal ,'')+'%'
		     AND [DescrEng] LIKE '%'+ISNULL(@DescrEng ,'')+'%'
		      AND (@ProductCategory IS NULL OR @ProductCategory = [ProductCategory])
		       AND (@IsActive IS NULL OR @IsActive = [IsActive])
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH
---------------------------------------------------------------------------------
GO--CRUD_Products
---------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[Cls_ProductCategories_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductCategories_InsUpd]
IF OBJECT_ID('[dbo].[Cls_ProductCategories_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductCategories_Del]
IF OBJECT_ID('[dbo].[Cls_ProductCategories_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductCategories_SelAll]
IF OBJECT_ID('[dbo].[Cls_ProductCategories_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductCategories_Sel_Id]
IF OBJECT_ID('[dbo].[Cls_ProductCategories_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ProductCategories_Search]
GO
-----------------------------------------------------------------------------------------------------------------
GO--Cls_ProductCategories_InsUpd
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ProductCategories_InsUpd]
	             @ProductCategoryId INT,
				 @DescrLocal           NVARCHAR(255),
				 @DescrEng             NVARCHAR(255),
				 @IsActive             BIT 
AS

SET NOCOUNT ON

BEGIN TRY
    IF EXISTS(SELECT 1 FROM [dbo].[Cls_ProductCategories] WHERE [ProductCategoryId] = @ProductCategoryId)
	   BEGIN
		    UPDATE [dbo].[Cls_ProductCategories] WITH(ROWLOCK) 
		    SET    [DescrLocal]            = @DescrLocal,
			 	   [DescrEng]              = @DescrEng,
				   [IsActive]              = @IsActive  
		    WHERE  [ProductCategoryId]  = @ProductCategoryId
	   END
	   
	   ELSE
	   
	   BEGIN
			INSERT INTO [dbo].[Cls_ProductCategories] 
						([DescrLocal],
						[DescrEng],
						[IsActive]) 
			VALUES (@DescrLocal,
					@DescrEng,
					@IsActive)
	   END

END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	                  
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_ProductCategories_Del
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ProductCategories_Del] @ProductCategoryId INT
AS

SET NOCOUNT ON
BEGIN TRY
    DELETE FROM [dbo].[Cls_ProductCategories]
    WHERE  [ProductCategoryId] = @ProductCategoryId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_ProductCategories_SelAll
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ProductCategories_SelAll] @where_clause NVARCHAR(2000) = NULL
AS

DECLARE @SQL NVARCHAR(4000)

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
   IF @where_clause IS NULL
	BEGIN
		SELECT [ProductCategoryId],
				[DescrLocal],
				[DescrEng],
				[IsActive]
		FROM   [dbo].[Cls_ProductCategories]
	END
	      
	ELSE
		
	BEGIN
		SET @SQL = 'SELECT [ProductCategoryId],
							[DescrLocal],
							[DescrEng],
							[IsActive]
		            FROM   [dbo].[Cls_ProductCategories]
		            WHERE  ' + @where_clause + '
		            ORDER  BY [ProductCategoryId]'

		EXEC sp_executesql @SQL
	END
	
END TRY
BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	                  
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_ProductCategories_Sel_Id
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ProductCategories_Sel_Id] @ProductCategoryId INT   
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	   SELECT [ProductCategoryId],
		      [DescrLocal],
			  [DescrEng],
			  [IsActive]
	   FROM   [dbo].[Cls_ProductCategories]
	   WHERE  [ProductCategoryId] = @ProductCategoryId

END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	              + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	               + N', ' + CHAR(13) + ERROR_MESSAGE()
	               
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_ProductCategories_Search
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ProductCategories_Search]
	             @ProductCategoryId INT,
				 @DescrLocal          NVARCHAR(255),
				 @DescrEng            NVARCHAR(255),
				 @IsActive            BIT  
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [ProductCategoryId],
		    [DescrLocal],
			[DescrEng],
			[IsActive]
	FROM   [dbo].[Cls_ProductCategories]
	WHERE  (@ProductCategoryId IS NULL OR @ProductCategoryId = [ProductCategoryId])
	       	AND [DescrLocal] LIKE '%'+ISNULL(@DescrLocal ,'')+'%'
		     AND [DescrEng] LIKE '%'+ISNULL(@DescrEng ,'')+'%'
		      AND (@IsActive IS NULL OR @IsActive = [IsActive])
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH
---------------------------------------------------------------------------------
GO--CRUD_Cls_UserStatuses
---------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[Cls_UserStatuses_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_UserStatuses_InsUpd]
IF OBJECT_ID('[dbo].[Cls_UserStatuses_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Cls_UserStatuses_Del]
IF OBJECT_ID('[dbo].[Cls_UserStatuses_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_UserStatuses_SelAll]
IF OBJECT_ID('[dbo].[Cls_UserStatuses_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_UserStatuses_Sel_Id]
IF OBJECT_ID('[dbo].[Cls_UserStatuses_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_UserStatuses_Search]
-----------------------------------------------------------------------------------------------------------------
GO--Cls_UserStatuses_InsUpd
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_UserStatuses_InsUpd]
	             @StatusId   INT, 
	             @DescrLocal NVARCHAR(50), 
	             @DescrEng   VARCHAR(50), 
	             @IsActive   BIT   
AS

SET NOCOUNT ON

BEGIN TRY
    IF EXISTS(SELECT 1 FROM [dbo].[Cls_UserStatuses] WHERE [StatusId] = @StatusId)
	BEGIN
		UPDATE [dbo].[Cls_UserStatuses] WITH(ROWLOCK) 
		SET    [DescrLocal] = @DescrLocal,
			    [DescrEng]   = @DescrEng,
			    [IsActive]   = @IsActive
		WHERE  [StatusId]   = @StatusId		
	END
	   
	ELSE
	   	
	BEGIN
		INSERT INTO [dbo].[Cls_UserStatuses] 
		            ([StatusId],
			        [DescrLocal],
			        [DescrEng],
			        [IsActive])
			VALUES (@StatusId,
			        @DescrLocal,
			        @DescrEng,
			        @IsActive)
	END

END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_UserStatuses_Del
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_UserStatuses_Del] @StatusId int   
AS

SET NOCOUNT ON
BEGIN TRY
    DELETE FROM [dbo].[Cls_UserStatuses]
	WHERE  [StatusId] = @StatusId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
   	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_UserStatuses_SelAll
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_UserStatuses_SelAll] @where_clause NVARCHAR(2000) = NULL 
AS

DECLARE @SQL NVARCHAR(4000)

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	IF @where_clause IS NULL
	BEGIN
		SELECT [StatusId],
			    [DescrLocal],
			    [DescrEng],
			    [IsActive]
		FROM   [dbo].[Cls_UserStatuses]
	END
	   
	ELSE
	   	
	BEGIN
		SET @SQL = 'SELECT [StatusId],
			                [DescrLocal],
			                [DescrEng],
			                [IsActive]
		            FROM   [dbo].[Cls_UserStatuses]
		            WHERE  ' + @where_clause + '
		            ORDER  BY [StatusId]'

		EXEC sp_executesql @SQL
	END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_UserStatuses_Sel_Id
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_UserStatuses_Sel_Id] @StatusId INT 
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	   SELECT [StatusId],
		      [DescrLocal],
		      [DescrEng],
		      [IsActive]
	   FROM   [dbo].[Cls_UserStatuses]
	   WHERE  [StatusId] = @StatusId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
   	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_UserStatuses_Search
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_UserStatuses_Search]
	             @StatusId   INT          = NULL, 
	             @DescrLocal NVARCHAR(50) = NULL, 
	             @DescrEng   VARCHAR(50)  = NULL, 
	             @IsActive   BIT          = NULL    
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [StatusId],
		    [DescrLocal],
		    [DescrEng],
		    [IsActive]
	FROM   [dbo].[Cls_UserStatuses]
	WHERE  (@StatusId IS NULL OR @StatusId = [StatusId])
		    AND [DescrLocal] LIKE '%'+ISNULL( @DescrLocal ,'' )+'%'
		     AND [DescrEng] LIKE '%'+ISNULL( @DescrEng ,'' )+'%'
		      AND (@IsActive IS NULL OR @IsActive = [IsActive])
END TRY
BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '')
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH
---------------------------------------------------------------------------------
GO--CRUD_Cls_ClientStatuses
---------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[Cls_ClientStatuses_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientStatuses_InsUpd]
IF OBJECT_ID('[dbo].[Cls_ClientStatuses_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientStatuses_Del]
IF OBJECT_ID('[dbo].[Cls_ClientStatuses_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientStatuses_SelAll]
IF OBJECT_ID('[dbo].[Cls_ClientStatuses_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientStatuses_Sel_Id]
IF OBJECT_ID('[dbo].[Cls_ClientStatuses_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientStatuses_Search]
-----------------------------------------------------------------------------------------------------------------
GO--Cls_ClientStatuses_InsUpd
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ClientStatuses_InsUpd]
	             @ClientStatusId INT, 
	             @DescrLocal     NVARCHAR(255), 
	             @DescrEng       VARCHAR(255), 
	             @IsActive       BIT 
AS

SET NOCOUNT ON

BEGIN TRY
	IF EXISTS(SELECT 1 FROM [dbo].[Cls_ClientStatuses] WHERE [ClientStatusId] = @ClientStatusId  )
	BEGIN
		UPDATE [dbo].[Cls_ClientStatuses] WITH(ROWLOCK) 
		SET    [DescrLocal]     = @DescrLocal,
			    [DescrEng]       = @DescrEng,
			    [IsActive]       = @IsActive
		WHERE  [ClientStatusId] = @ClientStatusId
	END
   	
	ELSE
   		
	BEGIN
		INSERT INTO [dbo].[Cls_ClientStatuses] 
		            ([ClientStatusId],
			        [DescrLocal],
			        [DescrEng],
			        [IsActive]) 
			VALUES (@ClientStatusId,
			        @DescrLocal,
			        @DescrEng,
			        @IsActive)
	END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_ClientStatuses_Del
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ClientStatuses_Del] @ClientStatusId INT    
AS

SET NOCOUNT ON

BEGIN TRY
    DELETE FROM [dbo].[Cls_ClientStatuses]
    WHERE  [ClientStatusId] = @ClientStatusId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_ClientStatuses_SelAll
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ClientStatuses_SelAll] @where_clause NVARCHAR(2000) = NULL

AS

DECLARE @SQL NVARCHAR(4000)

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	IF @where_clause IS NULL
	BEGIN
		    SELECT [ClientStatusId],
			        [DescrLocal],
			        [DescrEng],
			        [IsActive]
		    FROM [dbo].[Cls_ClientStatuses]
	END
   	
	ELSE
   		
	BEGIN
		    SET @SQL = 'SELECT [ClientStatusId],
			                    [DescrLocal],
			                    [DescrEng],
			                    [IsActive]
		                FROM   [dbo].[Cls_ClientStatuses]
		                WHERE  ' + @where_clause + '
		                ORDER  BY [ClientStatusId]'

		    EXEC sp_executesql @SQL
	END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_ClientStatuses_Sel_Id
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ClientStatuses_Sel_Id]	@ClientStatusId INT   
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	   SELECT [ClientStatusId],
		      [DescrLocal],
		      [DescrEng],
		      [IsActive]
	   FROM   [dbo].[Cls_ClientStatuses]
	   WHERE  [ClientStatusId] = @ClientStatusId

END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
   	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_ClientStatuses_Search
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ClientStatuses_Search]
	                @ClientStatusId INT           = NULL, 
	                @DescrLocal     NVARCHAR(255) = NULL, 
	                @DescrEng       VARCHAR(255)  = NULL, 
	                @IsActive       BIT           = NULL    
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [ClientStatusId],
		    [DescrLocal],
		    [DescrEng],
		    [IsActive]
	FROM   [dbo].[Cls_ClientStatuses]
	WHERE  (@ClientStatusId IS NULL OR @ClientStatusId = [ClientStatusId])
		     AND [DescrLocal] LIKE '%'+ISNULL( @DescrLocal ,'' )+'%'
		      AND [DescrEng] LIKE '%'+ISNULL( @DescrEng ,'' )+'%'
		       AND (@IsActive IS NULL OR @IsActive = [IsActive])

END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                      
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH
---------------------------------------------------------------------------------
GO--CRUD_Cls_ClientCategories
---------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[Cls_ClientCategories_InsUpd]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientCategories_InsUpd]
IF OBJECT_ID('[dbo].[Cls_ClientCategories_Del]')    IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientCategories_Del]
IF OBJECT_ID('[dbo].[Cls_ClientCategories_SelAll]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientCategories_SelAll]
IF OBJECT_ID('[dbo].[Cls_ClientCategories_Sel_Id]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientCategories_Sel_Id]
IF OBJECT_ID('[dbo].[Cls_ClientCategories_Search]') IS NOT NULL DROP PROCEDURE [dbo].[Cls_ClientCategories_Search]
-----------------------------------------------------------------------------------------------------------------
GO--Cls_ClientCategories_InsUpd
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ClientCategories_InsUpd]
	             @ClientCategoryId INT,
	             @DescrLocal       NVARCHAR(50), 
	             @DescrEng         VARCHAR(50), 
	             @IsActive         BIT
AS

SET NOCOUNT ON

BEGIN TRY
IF EXISTS(SELECT 1 FROM [dbo].[Cls_ClientCategories] WHERE [ClientCategoryId] = @ClientCategoryId)
	BEGIN
		UPDATE [dbo].[Cls_ClientCategories] WITH(ROWLOCK) 
		SET    [DescrLocal]       = @DescrLocal,
			    [DescrEng]         = @DescrEng,
			    [IsActive]         = @IsActive
		WHERE  [ClientCategoryId] = @ClientCategoryId
	END
	   
	ELSE
	   	
	BEGIN
    INSERT INTO [dbo].[Cls_ClientCategories] 
                ([DescrLocal],
			     [DescrEng],
                 [IsActive]) 
			    VALUES (@DescrLocal,
			            @DescrEng,
			            @IsActive)
	END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_ClientCategories_Del
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ClientCategories_Del] @ClientCategoryId INT 

AS

SET NOCOUNT ON

BEGIN TRY
	   DELETE FROM [dbo].[Cls_ClientCategories]
	   WHERE  ClientCategoryId = @ClientCategoryId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
   	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_ClientCategories_SelAll
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ClientCategories_SelAll] @where_clause NVARCHAR(2000) = NULL 

AS

DECLARE @SQL NVARCHAR(4000)

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	IF @where_clause IS NULL
	BEGIN
		SELECT [ClientCategoryId],
			    [DescrLocal],
			    [DescrEng],
			    [IsActive]
		FROM   [dbo].[Cls_ClientCategories]
	END
   	
	ELSE
   		
	BEGIN
		SET @SQL = 'SELECT [ClientCategoryId],
			                [DescrLocal],
			                [DescrEng],
			                [IsActive]
		            FROM   [dbo].[Cls_ClientCategories]
		            WHERE  ' + @where_clause + '
		            ORDER  BY [ClientCategoryId]'

		EXEC sp_executesql @SQL
	END
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
   	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_ClientCategories_Sel_Id
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ClientCategories_Sel_Id] @ClientCategoryId INT 

AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [ClientCategoryId]
		    [DescrLocal],
		    [DescrEng],
			[IsActive]
	FROM   [dbo].[Cls_ClientCategories]
	WHERE  [ClientCategoryId] = @ClientCategoryId
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                  + N', ' + CHAR(13) + ERROR_MESSAGE()
   	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH

-----------------------------------------------------------------------------------------------------------------
GO--Cls_ClientCategories_Search
-----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Cls_ClientCategories_Search]
	             @ClientCategoryId INT          = NULL,
	             @DescrLocal       NVARCHAR(50) = NULL, 
	             @DescrEng         VARCHAR(50)  = NULL, 
	             @IsActive         BIT          = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRY
	SELECT [ClientCategoryId],
		    [DescrLocal],
		    [DescrEng],
		    [IsActive]
	FROM   [dbo].[Cls_ClientCategories]
	WHERE  (@ClientCategoryId IS NULL OR @ClientCategoryId = [ClientCategoryId])
	       	AND [DescrLocal] LIKE '%'+ISNULL( @DescrLocal ,'' )+'%'
		     AND [DescrEng] LIKE '%'+ISNULL( @DescrEng ,'' )+'%'
		      AND (@IsActive IS NULL OR @IsActive = [IsActive])
END TRY

BEGIN CATCH
	DECLARE @Error NVARCHAR(4000)
	SET     @Error = ISNULL(N'SP: ' + OBJECT_NAME(@@PROCID) + N', ', '') 
	                  + 'LN: ' + CAST(ERROR_LINE() AS NVARCHAR(20)) 
	                   + N', ' + CHAR(13) + ERROR_MESSAGE()
   	                   
	IF @@TRANCOUNT > 0 ROLLBACK TRAN
	    RAISERROR(@Error, 16, 1)
END CATCH
---------------------------------------------------------------------------------
