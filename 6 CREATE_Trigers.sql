SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
---------------------------------------------------------------------------------
IF OBJECT_ID('dbo.trg_BusinessProcessesInsUpd')         IS NOT NULL DROP TRIGGER trg_BusinessProcessesInsUpd 
IF OBJECT_ID('dbo.trg_BusinessProcessesHistoryModify')  IS NOT NULL DROP TRIGGER trg_BusinessProcessesHistoryModify 
IF OBJECT_ID('dbo.trg_BusinessProcessesTypesInsUpdDel') IS NOT NULL DROP TRIGGER trg_BusinessProcessesTypesInsUpdDel
IF OBJECT_ID('dbo.trg_ClientsHistoryModify')            IS NOT NULL DROP TRIGGER trg_ClientsHistoryModify
IF OBJECT_ID('dbo.trg_ClientsInsUpd')                   IS NOT NULL DROP TRIGGER trg_ClientsInsUpd
IF OBJECT_ID('dbo.trg_ClientSticker_Ins_Upd')           IS NOT NULL DROP TRIGGER trg_ClientSticker_Ins_Upd
IF OBJECT_ID('dbo.trg_ClientStickersHistory')           IS NOT NULL DROP TRIGGER trg_ClientStickersHistory
IF OBJECT_ID('dbo.trg_Cls_BPStatusesInsUpdDel')         IS NOT NULL DROP TRIGGER trg_Cls_BPStatusesInsUpdDel
IF OBJECT_ID('dbo.trg_Cls_ClientStatusesInsUpdDel')     IS NOT NULL DROP TRIGGER trg_Cls_ClientStatusesInsUpdDel
IF OBJECT_ID('dbo.trg_UsersHistoryModify')              IS NOT NULL DROP TRIGGER trg_UsersHistoryModify
IF OBJECT_ID('dbo.trg_UsersInsUpd')                     IS NOT NULL DROP TRIGGER trg_UsersInsUpd
---------------------------------------------------------------------------------
GO--trg_BusinessProcessesInsUpd
---------------------------------------------------------------------------------
CREATE TRIGGER [dbo].[trg_BusinessProcessesInsUpd] ON [dbo].[BusinessProcesses]

FOR INSERT, UPDATE
AS
SET	NOCOUNT		ON
SET	ROWCOUNT	0

DECLARE @BPId               INT,
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
	    @ConfirmingUserId   INT,
       		
	    @CreatorId		    INT,
	    @Created		    DATETIME, 
	    @ChangerId		    INT,
	    @Changed		    DATETIME,	

	    @UserId		        INT,

	    @Error			    NVARCHAR(1000),

	    @UpdateCount	    INT

SELECT @UserId = dbo.f_sys_GetCurrentUser()

IF @UserId = -1
    BEGIN
    	SET @Error = 'User ID not defined'
	    RAISERROR( @Error, 16, 1)
	       
IF	@@TRANCOUNT > 0
		ROLLBACK	TRANSACTION
RETURN
END

SELECT	@UpdateCount	= COUNT(*)
FROM	DELETED


-- INSERT
IF @UpdateCount = 0 
BEGIN
	IF EXISTS (SELECT 1 FROM INSERTED i
			   JOIN   dbo.BusinessProcessesTypes AS bpt WITH(NOLOCK)
			     ON   bpt.BPTypeCode = i.BPTypeCode
			   WHERE  bpt.IsActive = 0)
		BEGIN
			SET @Error = 'Inactive BPTypeCode'
	      	   
			RAISERROR (@Error, 16, 1)
			IF	@@TRANCOUNT > 0
					ROLLBACK	TRANSACTION
			RETURN
		END              	
	
			UPDATE	BusinessProcesses
			SET	   CreatorId	       = @UserId,
				Created		        = GETDATE()
			WHERE	 BPId	IN (SELECT BPId	
								FROM   Inserted)
				                   
	INSERT	INTO BusinessProcessesHistory
				 (BPId,
				  BPTypeCode,
				  BPStatusId,
				  StoreId,
				  ProductId,
				  OrderingAccount,
				  BeneficiaryAccount,
				  Amount,
			  	  Currency,
				  BPDate,
				  [Description],
				  ConfirmingUserId,
      		
				  ChangerId,
				  Changed)
      	
	SELECT BPId,
		   BPTypeCode,
		   BPStatusId,
		   StoreId,
		   ProductId,
		   OrderingAccount,
		   BeneficiaryAccount,
		   Amount,
		   Currency,
		   BPDate,
		   [Description],
		   ConfirmingUserId,
		   @UserId,
		   GETDATE()	
	FROM   INSERTED
END	

ELSE
--	UPDATE
BEGIN
    IF EXISTS (SELECT 1
	           FROM	  INSERTED	i
		       JOIN	  DELETED		d
		         ON	  d.BPId = i.BPId
               WHERE  dbo.f_int_IsDiff(I.CreatorId, D.CreatorId) = 1
		                     OR dbo.f_int_IsDiff(I.Created, D.Created) = 1)
        BEGIN
            	SET @Error = 'The value of the field is not subject to change'
	            RAISERROR (@Error, 16, 1)

	            IF	@@TRANCOUNT > 0
		                ROLLBACK	TRANSACTION
	            RETURN
        END

    UPDATE Bp
    SET   CreatorID = @UserId
    FROM  Businessprocesses AS BP WITH(NOLOCK)
    JOIN  Inserted I 
	  ON  BP.BPId = I.BPId 
    JOIN  Deleted d
	  ON  BP.BPId = d.BPId 
    WHERE d.BPStatusId = i.BPStatusId
           AND i.bpstatusid != 4

    UPDATE Bp
    SET    ConfirmingUserId = @UserId
    FROM   Businessprocesses AS BP WITH(NOLOCK)
    JOIN   Inserted AS I 
	  ON   BP.BPId = I.BPId 
    JOIN   Deleted AS d
	  ON   BP.BPId = d.BPId
    WHERE  d.bpStatusID != i.bpStatusID

    INSERT INTO BusinessProcessesHistory
	            (BPId,
                 BPTypeCode,
                 BPStatusId,
                 StoreId,
                 ProductId,
                 OrderingAccount,
                 BeneficiaryAccount,
                 Amount,
                 Currency,
                 BPDate,
                 [Description],
                 ConfirmingUserId,
   		
                 ChangerId,
                 Changed)
    SELECT i.BPId,
    	   CASE WHEN dbo.f_int_IsDiff(i.BPTypeCode, d.BPTypeCode) = 1                 THEN i.BPTypeCode         ELSE NULL END,
		   CASE WHEN dbo.f_int_IsDiff(i.BPStatusId, d.BPStatusId) = 1                 THEN i.BPStatusId         ELSE NULL END,
		   CASE WHEN dbo.f_int_IsDiff(i.StoreId, d.StoreId) = 1                       THEN i.StoreId            ELSE NULL END,
		   CASE WHEN dbo.f_int_IsDiff(i.ProductId, d.ProductId) = 1                   THEN i.ProductId          ELSE NULL END,
		   CASE WHEN dbo.f_int_IsDiff(i.OrderingAccount, d.OrderingAccount) = 1       THEN i.OrderingAccount    ELSE NULL END,
		   CASE WHEN dbo.f_int_IsDiff(i.BeneficiaryAccount, d.BeneficiaryAccount) = 1 THEN i.BeneficiaryAccount ELSE NULL END,
		   CASE WHEN dbo.f_int_IsDiff(i.Amount, d.Amount) = 1                         THEN i.Amount             ELSE NULL END,
		   CASE WHEN dbo.f_int_IsDiff(i.Currency, d.Currency) = 1                     THEN i.Currency           ELSE NULL END,
		   CASE WHEN dbo.f_int_IsDiff(i.BPDate, d.BPDate) = 1                         THEN i.BPDate             ELSE NULL END,
		   CASE WHEN dbo.f_int_IsDiff(i.[Description], d.[Description]) = 1           THEN i.Description        ELSE NULL END,
		   CASE WHEN dbo.f_int_IsDiff(i.ConfirmingUserId, d.ConfirmingUserId) = 1     THEN i.ConfirmingUserId   ELSE NULL END,

		   @UserId,		
		   GETDATE()	

    FROM   INSERTED	i
    JOIN   DELETED		d
	  ON   d.BPId = i.BPId

    WHERE  dbo.f_int_IsDiff(i.BPId, d.BPId) = 1	
			OR dbo.f_int_IsDiff(i.BPTypeCode, d.BPTypeCode) = 1 
			 OR dbo.f_int_IsDiff(i.BPStatusId, d.BPStatusId) = 1 
			  OR dbo.f_int_IsDiff(i.StoreId, d.StoreId) = 1 
			   OR dbo.f_int_IsDiff(i.ProductId, d.ProductId) = 1 
			    OR dbo.f_int_IsDiff(i.OrderingAccount, d.OrderingAccount) = 1 
				 OR dbo.f_int_IsDiff(i.BeneficiaryAccount, d.BeneficiaryAccount) = 1
				  OR dbo.f_int_IsDiff(i.Amount, d.Amount) = 1 
				   OR dbo.f_int_IsDiff(i.Currency, d.Currency) = 1 
				    OR dbo.f_int_IsDiff(i.BPDate, d.BPDate) = 1 
					 OR dbo.f_int_IsDiff(i.[Description], d.[Description]) = 1 
					  OR dbo.f_int_IsDiff(i.ConfirmingUserId, d.ConfirmingUserId) = 1
END
---------------------------------------------------------------------------------
GO--trg_BusinessProcessesHistoryModify
---------------------------------------------------------------------------------
CREATE TRIGGER [dbo].[trg_BusinessProcessesHistoryModify]  ON [dbo].[BusinessProcessesHistory]
INSTEAD OF UPDATE, DELETE NOT FOR REPLICATION AS 

SET	NOCOUNT		ON
SET	ROWCOUNT	0

DECLARE @ERROR VARCHAR(1000)

SELECT @ERROR = 'The data in this table can not be changed or deleted'
RAISERROR(@ERROR, 16, 1)
	IF	@@TRANCOUNT > 0
		   ROLLBACK	TRANSACTION
	RETURN
---------------------------------------------------------------------------------
GO--trg_BusinessProcessesTypesInsUpdDel
---------------------------------------------------------------------------------
CREATE TRIGGER [dbo].[trg_BusinessProcessesTypesInsUpdDel] ON [dbo].[BusinessProcessesTypes]
FOR INSERT, UPDATE, DELETE NOT FOR REPLICATION AS 

SET	NOCOUNT		ON
SET	ROWCOUNT	0

DECLARE @CreatorId INT,
        @Created   DATETIME,
        @UserId	   INT, 
        @Error     NVARCHAR(1000)


--GET USER ID AND TERMINAL  FOR THIS USER
SELECT @Error = dbo.f_sys_GetCurrentUser()

IF @UserId = -1
BEGIN
	   SELECT @Error = 'User ID not defined'
	   RAISERROR(@Error, 16, 1)
   	
    IF	@@TRANCOUNT > 0
		      ROLLBACK	TRANSACTION
	   RETURN
END
---------------------------------------------------------------------------------
GO--trg_ClientsHistoryModify
---------------------------------------------------------------------------------
CREATE TRIGGER [dbo].[trg_ClientsHistoryModify] ON [dbo].[ClientsHistory]
INSTEAD OF UPDATE, DELETE NOT FOR REPLICATION AS 

SET	NOCOUNT		ON
SET	ROWCOUNT	0

DECLARE @Error	NVARCHAR(500)
SET     @Error= 'The data in this table is not subject to change or deletion' 
RAISERROR(@Error, 16, 1)

IF	@@TRANCOUNT > 0
	ROLLBACK	TRANSACTION
	
RETURN
---------------------------------------------------------------------------------
GO--trg_ClientsInsUpd
---------------------------------------------------------------------------------
CREATE TRIGGER  [dbo].[trg_ClientsInsUpd] ON [dbo].[Clients]
FOR INSERT, UPDATE 

AS 

SET	NOCOUNT		ON
SET	ROWCOUNT	0

DECLARE @ClientId         BIGINT,
        @StoreId          INT,
        @FullnameLocal    NVARCHAR(255),
        @FullnameEng      VARCHAR(255),
        @AdvisorId        INT,
        @StatusId         INT,
        @Created          DATETIME,
        @CreatorId        INT,
        @IsVIP            BIT,
        @ClientCategoryId INT, 
        
        @ChangerId		  INT,
	    @Changed		  DATETIME,	

	    @UserId		      INT,

	    @Error			  NVARCHAR(500),

	    @UpdateCount	  INT 		

SET @UserId = dbo.f_sys_GetCurrentUser()

IF @UserId = -1
BEGIN
	   SET @Error = 'User ID is not defined'
	   RAISERROR(@Error, 16, 1)
   	
	   IF	@@TRANCOUNT > 0
	   ROLLBACK	TRANSACTION
   	
	   RETURN
END

-- DELETE
SELECT	@UpdateCount = COUNT(*)
FROM	DELETED

-- INSERT
IF @UpdateCount = 0 
BEGIN
	UPDATE	Clients
	SET	    CreatorId = @UserId,
			Created	  = GETDATE()	
	WHERE	ClientId IN (SELECT ClientId	
						 FROM   Inserted)

	INSERT	INTO ClientsHistory
				 (ClientId,
				  ChangerId,
				  Changed,
				  StoreId,
				  FullnameLocal,
				  FullnameEng,
				  AdvisorId,
				  StatusId,
				  IsVIP,
				  ClientCategoryId)
   	
	SELECT i.ClientId,
		   @UserId,
		   GETDATE(),
		   i.StoreId,
		   i.FullnameLocal,
		   i.FullnameEng,
		   i.AdvisorId,
		   i.StatusId,
		   i.IsVIP,
		   i.ClientCategoryId
	FROM   INSERTED	i
END	

ELSE
--	UPDATE
BEGIN
    IF EXISTS (SELECT 1
	           FROM	  INSERTED	AS i
		       JOIN	  DELETED	AS d
		         ON	  d.ClientId = i.ClientId
               WHERE  dbo.f_int_IsDiff(I.CreatorId, D.CreatorId) = 1
		               OR dbo.f_int_IsDiff(I.Created, D.Created) = 1
		                OR dbo.f_int_IsDiff(I.ClientId, D.ClientId) = 1)
		                        
    BEGIN
    	SET @Error= 'The value of the field is not subject to change'
	    RAISERROR (@Error, 16, 1)
        	
	    IF	@@TRANCOUNT > 0
		ROLLBACK TRANSACTION
		
	    RETURN
    END

    INSERT INTO ClientsHistory
	            (ClientId,
                 ChangerId,
                 Changed,
                 StoreId,
                 FullnameLocal,
                 FullnameEng,
                 AdvisorId,
                 StatusId,
                 IsVIP,
                 ClientCategoryId)

    SELECT i.ClientId,
           @UserId,
           GETDATE(),
           CASE WHEN dbo.f_int_IsDiff(i.StoreId, d.StoreId) = 1                   THEN d.StoreId          ELSE NULL END,
           CASE WHEN dbo.f_int_IsDiff(i.FullnameLocal, d.FullnameLocal) = 1       THEN d.FullnameLocal    ELSE NULL END,
           CASE WHEN dbo.f_int_IsDiff(i.FullnameEng, d.FullnameEng) = 1           THEN d.FullnameEng      ELSE NULL END,
           CASE WHEN dbo.f_int_IsDiff(i.AdvisorId, d.AdvisorId) = 1               THEN d.AdvisorId        ELSE NULL END,
           CASE WHEN dbo.f_int_IsDiff(i.StatusId, d.StatusId) = 1                 THEN d.StatusId         ELSE NULL END,
           CASE WHEN dbo.f_int_IsDiff(i.IsVIP, d.IsVIP) = 1                       THEN d.IsVIP            ELSE NULL END,
           CASE WHEN dbo.f_int_IsDiff(i.ClientCategoryId, d.ClientCategoryId) = 1 THEN d.ClientCategoryId ELSE NULL END

    FROM  INSERTED AS i

    JOIN  DELETED AS d
	  ON d.ClientId = i.ClientId

    WHERE dbo.f_int_IsDiff(i.StoreId, d.StoreId) = 1 
           OR dbo.f_int_IsDiff(i.FullnameLocal, d.FullnameLocal) = 1 
            OR dbo.f_int_IsDiff(i.FullnameEng, d.FullnameEng) = 1
             OR dbo.f_int_IsDiff(i.AdvisorId, d.AdvisorId) = 1
              OR dbo.f_int_IsDiff(i.StatusId, d.StatusId) = 1
               OR dbo.f_int_IsDiff(i.IsVIP, d.IsVIP) = 1
                OR dbo.f_int_IsDiff(i.ClientCategoryId, d.ClientCategoryId) = 1
END
---------------------------------------------------------------------------------
GO--trg_ClientSticker_Ins_Upd
---------------------------------------------------------------------------------
CREATE TRIGGER [dbo].[trg_ClientSticker_Ins_Upd] ON [dbo].[ClientStickers]
FOR INSERT, UPDATE 

AS 

SET	NOCOUNT		ON
SET	ROWCOUNT	0

DECLARE @Id              INT,
        @ClientStickerId INT,
        @IsActive        BIT,
        @ClientId	     BIGINT,
        @ChangerId		 INT,
        @Changed		 DATETIME,
        @Comment         NVARCHAR(1000),
        @BpID		     INT,
        @ValidTill       DATETIME,
        @DateApplied     DATETIME,
        
        @Error			 NVARCHAR(500),
        @UserID          INT,
	       
	    @UpdateCount     INT 

SET     @UserId = dbo.f_sys_GetCurrentUser()

IF @UserId = -1
BEGIN
	SET @Error = 'User ID is not defined'
	RAISERROR(@Error, 16, 1)
	   
	IF	@@TRANCOUNT > 0
		ROLLBACK	TRANSACTION
	RETURN
END

--DELETE
SELECT	@UpdateCount = COUNT(*)
FROM	DELETED

--INSERT
IF @UpdateCount = 0 
BEGIN
	UPDATE ClientStickers
	SET	   CreatorId = @UserId,
		   Created	 = GETDATE()		
	WHERE  ClientStickerId IN (SELECT ClientStickerId	
				               FROM   Inserted)

	INSERT INTO dbo.ClientStickersHistory(ClientStickerId,  ClientId,  Comment, ValidTill, IsActive,Changed, ChangerId, BPId, DateApplied)		
	SELECT i.ClientStickerId, i.ClientId, i.Comment, i.ValidTill, i.IsActive, GETDATE(), @UserID, i.BPId, i.DateApplied	
	FROM   INSERTED	AS i
END	
	
ELSE
	
--	UPDATE
BEGIN
    IF EXISTS (SELECT 1
		       FROM	  INSERTED AS i
			   JOIN   DELETED AS d
			     ON   d.ClientStickerId = i.ClientStickerId
               WHERE  dbo.f_int_IsDiff(I.CreatorId, D.CreatorId) = 1
			           OR dbo.f_int_IsDiff(I.Created, D.Created) = 1)
    BEGIN 
	    SET @Error = 'The value of the field is not subject to change'
	    RAISERROR (@Error, 16, 1)
        	
	    IF	@@TRANCOUNT > 0
		    ROLLBACK	TRANSACTION
	    RETURN
    END

	INSERT INTO ClientStickersHistory(ClientStickerId, ClientId, Comment, ValidTill, IsActive, Changed, ChangerId, BPId, DateApplied)		
   	
	SELECT i.ClientStickerId,
		   CASE WHEN dbo.f_int_IsDiff(i.ClientId, d.ClientId) = 1       THEN d.ClientId    ELSE NULL END,
	       CASE WHEN dbo.f_int_IsDiff(i.Comment, d.Comment) = 1         THEN d.Comment     ELSE NULL END,
		   CASE WHEN dbo.f_int_IsDiff(i.ValidTill, d.ValidTill) = 1     THEN d.ValidTill   ELSE NULL END,
		   CASE WHEN dbo.f_int_IsDiff(i.IsActive, d.IsActive) = 1       THEN d.IsActive    ELSE NULL END,		
		   GETDATE(),
		   @UserId,			
		   CASE WHEN dbo.f_int_IsDiff(i.BPId, d.BPId) = 1               THEN d.BPId        ELSE NULL END,
		   CASE WHEN dbo.f_int_IsDiff(i.DateApplied, d.DateApplied) = 1 THEN d.DateApplied ELSE NULL END		        
	FROM   INSERTED	AS i

	JOIN   DELETED	AS d
	  ON   d.ClientStickerId = i.ClientStickerId

	WHERE  dbo.f_int_IsDiff(i.ClientId, d.ClientId) = 1 
		    OR dbo.f_int_IsDiff(i.Comment, d.Comment) = 1 
		     OR dbo.f_int_IsDiff(i.ValidTill, d.ValidTill) = 1 
		      OR dbo.f_int_IsDiff(i.IsActive, d.IsActive) = 1 
		       OR dbo.f_int_IsDiff(i.BPId, d.BPId) = 1 
		        OR dbo.f_int_IsDiff(i.DateApplied, d.DateApplied) = 1 
END
---------------------------------------------------------------------------------
GO--trg_ClientStickersHistory
---------------------------------------------------------------------------------
CREATE TRIGGER [dbo].[trg_ClientStickersHistory] ON [dbo].[ClientStickersHistory]
INSTEAD OF UPDATE, DELETE NOT FOR REPLICATION AS 

SET	NOCOUNT		ON
SET	ROWCOUNT	0

DECLARE @Error	NVARCHAR(500)
SET     @Error= 'The data in this table is not subject to change or deletion' 
RAISERROR(@Error, 16, 1)

IF	@@TRANCOUNT > 0
	ROLLBACK	TRANSACTION
	
RETURN
---------------------------------------------------------------------------------
GO--trg_Cls_BPStatusesInsUpdDel
---------------------------------------------------------------------------------
CREATE TRIGGER [dbo].[trg_Cls_BPStatusesInsUpdDel] ON [dbo].[Cls_BPStatuses]
FOR INSERT, UPDATE, DELETE NOT FOR REPLICATION AS 

SET	NOCOUNT		ON
SET	ROWCOUNT	0

DECLARE @BPStatusId INT,
        @DescrLocal NVARCHAR(50),
        @DescrEng   VARCHAR(50),
        @IsActive   BIT,
        
        @CreatorId  INT,
        @Created    DATETIME,
        
        @UserId     INT,
        
        @Error      VARCHAR(1000)	

SELECT @UserId = dbo.f_sys_GetCurrentUser()

IF @UserId = -1
BEGIN
	SELECT @Error = 'User ID not defined'
	RAISERROR( @Error, 16, 1)
	       
	IF	@@TRANCOUNT > 0
	ROLLBACK TRANSACTION
		
	RETURN
END
---------------------------------------------------------------------------------
GO--trg_Cls_ClientStatusesInsUpdDel
---------------------------------------------------------------------------------
CREATE TRIGGER [dbo].[trg_Cls_ClientStatusesInsUpdDel] ON [dbo].[Cls_ClientStatuses]
FOR INSERT, UPDATE, DELETE NOT FOR REPLICATION AS 

SET	NOCOUNT		ON
SET	ROWCOUNT	0

DECLARE @ClientStatusId INT,
        @DescrLocal     NVARCHAR(255),
	    @DescrEng       VARCHAR(255),
	    @IsActive       BIT,
       		
	    @CreatorId      INT,
	    @Created        DATETIME,
	    @ChangerId      INT,
	    @Changed        DATETIME,

	    @UserId         INT,

	    @Error          NVARCHAR(500),

	    @UpdateCount	INT

SELECT @UserId = dbo.f_sys_GetCurrentUser()

IF @UserId = -1
BEGIN
	SET @Error = 'User ID is not defined'
	RAISERROR(@Error, 16, 1)
	   
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION
	
	RETURN
END
---------------------------------------------------------------------------------
GO--trg_UsersHistoryModify
---------------------------------------------------------------------------------
CREATE TRIGGER  [dbo].[trg_UsersHistoryModify] ON [dbo].[UsersHistory]
INSTEAD OF UPDATE, DELETE NOT FOR REPLICATION AS 

SET	NOCOUNT		ON
SET	ROWCOUNT	0

DECLARE @Error	VARCHAR(100),
        @UserId	INT 

SET     @Error = 'The data in this table can not be changed or deleted'       
SET     @UserId = dbo.f_sys_GetCurrentUser()

BEGIN
	RAISERROR(@Error, 16, 1)

	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION

	RETURN
END
---------------------------------------------------------------------------------
GO--trg_UsersInsUpd
---------------------------------------------------------------------------------
CREATE TRIGGER [dbo].[trg_UsersInsUpd] ON [dbo].[Users]
FOR INSERT, UPDATE 

AS 

SET	NOCOUNT		ON
SET	ROWCOUNT	0

DECLARE @Login       VARCHAR(30),
	    @NameLocal   NVARCHAR(50),
	    @NameEng     VARCHAR(50),
	    @StoreId     INT,
	    @IsActive    BIT,
	    @EnableDate  DATETIME,
	    @DisableDate DATETIME,
	    @StatusId    INT,
	    @ClientId    INT,
      	 
	    @CreatorId	 INT,
	    @Created     DATETIME,
	    @ChangerId   INT,
	    @Changed     DATETIME,
      	 
	    @UserId      INT,
      	 
	    @Error       NVARCHAR(500),
      	 
	    @UpdateCount INT 		

SELECT @UserId = dbo.f_sys_GetCurrentUser()

IF @UserId = -1
BEGIN
	SET @Error = 'User ID is not defined'
      
	RAISERROR(@Error, 16, 1)
  	   
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION
  		     
	RETURN
END
	
SELECT @UpdateCount	= COUNT(*)
FROM   DELETED

-- INSERT
IF @UpdateCount = 0 
BEGIN
	UPDATE Users
	SET	   CreatorId	= @UserId,
	       Created		= GETDATE()	
	WHERE  UserId IN (SELECT UserId FROM Inserted)

    INSERT INTO UsersHistory (UserId,
	                          [Login],
	                          NameLocal,
	                          NameEng,
	                          StoreId,
	                          IsActive,
	                          EnableDate,
	                          DisableDate,
	                          StatusId,
	                          ClientId,
	                          ChangerId,
	                          Changed)
    SELECT i.UserId,
           i.[Login],
           i.NameLocal,
           i.NameEng,
           i.StoreId,
           i.IsActive,
           i.EnableDate,
           i.DisableDate,
           i.StatusId,
           i.ClientId,
           @UserId,
           GETDATE() 
    FROM   INSERTED AS i
END	
   
ELSE
--	UPDATE
BEGIN
    IF EXISTS  (SELECT 1 
                FROM   INSERTED AS i
			    JOIN   DELETED AS d
				  ON   d.UserId = i.UserId
                WHERE  dbo.f_int_IsDiff(I.CreatorId, D.CreatorId) = 1
						OR dbo.f_int_IsDiff(I.Created, D.Created) = 1
						 OR dbo.f_int_IsDiff(I.Login, D.Login) = 1)
    BEGIN
		SET @Error = 'The value of the field is not subject to change'
	      
		RAISERROR (@Error, 16, 1)
	      
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
		
		RETURN
    END

    INSERT INTO UsersHistory (UserId,
	                          [Login],
	                          NameLocal,
	                          NameEng,
	                          StoreId,
	                          IsActive,
	                          EnableDate,
	                          DisableDate,
	                          StatusId,
	                          ClientId,
	                          ChangerId,
	                          Changed)

    SELECT i.UserId,
           CASE WHEN dbo.f_int_IsDiff(i.[Login], d.[Login]) = 1  THEN d.[Login] ELSE NULL END,
           CASE WHEN dbo.f_int_IsDiff(i.NameLocal, d.NameLocal) = 1  THEN d.NameLocal ELSE NULL END,
           CASE WHEN dbo.f_int_IsDiff(i.NameEng, d.NameEng) = 1  THEN d.NameEng ELSE NULL END,
           CASE WHEN dbo.f_int_IsDiff(i.StoreId, d.StoreId) = 1  THEN d.StoreId ELSE NULL END,
           CASE WHEN dbo.f_int_IsDiff(i.IsActive, d.IsActive) = 1  THEN d.IsActive ELSE NULL END,
           CASE WHEN dbo.f_int_IsDiff(i.EnableDate, d.EnableDate) = 1  THEN d.EnableDate ELSE NULL END,
           CASE WHEN dbo.f_int_IsDiff(i.DisableDate, d.DisableDate) = 1  THEN d.DisableDate ELSE NULL END,
           CASE WHEN dbo.f_int_IsDiff(i.StatusId, d.StatusId) = 1  THEN d.StatusId ELSE NULL END,
           CASE WHEN dbo.f_int_IsDiff(i.ClientId, d.ClientId) = 1  THEN d.ClientId ELSE NULL END,
           @UserId,
           GETDATE()
   FROM	   INSERTED AS i

   JOIN   DELETED AS d
     ON   d.UserId = i.UserId

   WHERE  dbo.f_int_IsDiff(i.[Login], d.[Login]) = 1
	       OR dbo.f_int_IsDiff(i.NameLocal, d.NameLocal) = 1 
	        OR dbo.f_int_IsDiff(i.NameEng, d.NameEng) = 1 
	         OR dbo.f_int_IsDiff(i.StoreId, d.StoreId) = 1 
	          OR dbo.f_int_IsDiff(i.IsActive, d.IsActive) = 1 
	           OR dbo.f_int_IsDiff(i.EnableDate, d.EnableDate) = 1 
	            OR dbo.f_int_IsDiff(i.DisableDate, d.DisableDate) = 1 
	             OR dbo.f_int_IsDiff(i.StatusId, d.StatusId) = 1 
	              OR dbo.f_int_IsDiff(i.ClientId, d.ClientId ) = 1
END
---------------------------------------------------------------------------------
