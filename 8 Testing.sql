---------------------------------------------------------------------------------
--BusinessProcesses with regular clients. If Client NULL then this is new client.
SELECT c.FullnameEng AS Client, bp.* 
FROM   BusinessProcesses AS bp WITH(NOLOCK)
LEFT
JOIN   BPClientRelation AS br WITH(NOLOCK)
  ON   br.BPId = bp.BPId
LEFT  
JOIN   Clients AS c WITH(NOLOCK)
  ON   c.ClientId = br.ClientId
ORDER  BY c.ClientId
---------------------------------------------------------------------------------
--BusinessProcesses and history that writing via trigers. When table updating its data, old values saved in history. 
--"ChangerId" - user that changed data, "Changed" - date and time of change. 
--NULLs in history it is fields that not changing in that moment.
SELECT bph.Id, bph.BPId, bph.BPTypeCode, bph.BPStatusId, bph.StoreId,
       bph.ProductId, bph.OrderingAccount, bph.BeneficiaryAccount, bph.Amount,
       bph.Currency, bph.BPDate, bph.[Description], bph.ConfirmingUserId,
       bph.ChangerId, --User who update something in BP.
       bph.Changed    --When update has occurred
FROM   BusinessProcesses AS BP WITH(NOLOCK)
JOIN   BusinessProcessesHistory AS bph WITH(NOLOCK)--Every new information in BusinessProcesses table saves of old information in Business Process History(information that's not updated will be NULL in History)
  ON   bp.BPId = bph.BPId
ORDER  BY bph.BPId, bph.Id
---------------------------------------------------------------------------------
--SELECT FROM BusinessProcesses and showing price change from history table in PriceDifference column
SELECT bp.BPId, cb.DescrLocal AS BPStatus, bpt.DescrLocal AS BPType, p.DescrLocal AS Product, 
       CAST(bp.Amount AS VARCHAR(10)) + ' ' + bp.Currency AS ReservedPrice,
       CAST(p.Price AS VARCHAR(10)) + ' ' + p.Currency AS ActualPrice,
       
       'Price was changed after BPStatus ' 
        + (SELECT TOP 1 '"' + cb1.DescrEng + '"'
           FROM   Cls_BPStatuses AS cb1 WITH(NOLOCK)
           WHERE  bph.BPStatusId = cb1.BPStatusId) 
         + ' from ' + CAST(bp.Amount AS VARCHAR(10)) + ' ' + bp.Currency
          + ' to ' + CAST(p.Price AS VARCHAR(10)) + ' ' + p.Currency
           + ' by ' + (SELECT TOP 1 u.NameEng
					   FROM   Users AS u WITH(NOLOCK)
					   WHERE  u.UserId = bph.ChangerId
					   )
            + ' (' + CONVERT(VARCHAR(19), bph.Changed, 120) + ')'
           AS PriceDifference
           
FROM   BusinessProcesses AS bp WITH(NOLOCK)
LEFT
JOIN   BusinessProcessesHistory AS bph WITH(NOLOCK)
  ON   bph.BPId = bp.BPId
        AND bph.Amount != bp.Amount--We try to find price change in history
JOIN   Cls_BPStatuses AS cb WITH(NOLOCK)
  ON   cb.BPStatusId = bp.BPStatusId
JOIN   BusinessProcessesTypes AS bpt WITH(NOLOCK)
  ON   bpt.BPTypeCode = bp.BPTypeCode
JOIN   Products AS p WITH(NOLOCK)
  ON   p.ProdPTypeId = bp.ProductId
---------------------------------------------------------------------------------
--Stored procedure that end with "_Search" give ability to search information by every column. If parameter NULL then column ignored.
EXEC Users_Search @UserId = null, @Login = null, @NameLocal = 'Адмін', @NameEng = null, @StoreId = null, @EnableDate = null, @DisableDate = null, @StatusId = null, @IsActive = null, @ClientId = NULL

EXEC Cls_BPStatuses_Search @BPStatusId = 4, @DescrLocal = null, @DescrEng = null, @IsActive = null
---------------------------------------------------------------------------------
--Stored procedure that end with "_SellAll" can have dynamically changing queries. It takes "VARCHAR" parameter thats representing everything that comes after "WHERE" clause.
EXEC Stores_SelAll @where_clause = 'CityLocal = ''Київ'' OR Phone LIKE ''+38096%'' OR StoreId = 3'
---------------------------------------------------------------------------------
DECLARE @Prods NVARCHAR(MAX)
SET     @Prods = ''

SELECT @Prods = @Prods + CAST(p.ProdPTypeId AS VARCHAR(10)) + ','
FROM   Cls_ProductCategories AS cpc WITH(NOLOCK)
JOIN   Cls_ProductSubCategories AS cpsc WITH(NOLOCK)
  ON   cpsc.ProductCategory = cpc.ProductCategoryId
        AND cpsc.IsActive = 1
JOIN   Products AS p WITH(NOLOCK)
  ON   p.ProductSubCategory = cpsc.ProductSubCategoryId
        AND p.IsActive = 1
WHERE  cpc.DescrEng IN ('Books', 'Toys', 'Clothes')
        AND cpc.IsActive = 1

IF RIGHT(@Prods,1) = ','
SET @Prods = LEFT(@Prods, LEN(@Prods) - 1)

SET @Prods = 'ProdPTypeId IN (' + @Prods + ')'--ProdPTypeId IN ( INT numbers divided by commas )
--SELECT @Prods

EXEC Products_SelAll @where_clause = @Prods--Works like "WHERE ProdPTypeId IN ( INT numbers divided by commas )"
---------------------------------------------------------------------------------
--If "_SellAll" has no input parameter it return whole table.
EXEC Currencies_SelAll
---------------------------------------------------------------------------------
--This part for deleting product 50 = Book "The Lord of the Rings"
EXEC Products_Del 50--Deleting unrelated product
EXEC Products_SelAll @where_clause = @Prods
---------------------------------------------------------------------------------
--Adding product with 0 and 1 price
--Uncomment to add 0 price
--EXEC Products_InsUpd @ProdPTypeId = null, @DescrLocal = 'Дублянка', @DescrEng = 'Sheepskin coat', @Price = 0, @Currency = 'USD', @ProductSubCategory = 9, @IsActive = 1
EXEC Products_InsUpd @ProdPTypeId = null, @DescrLocal = 'Дублянка', @DescrEng = 'Sheepskin coat', @Price = 1, @Currency = 'USD', @ProductSubCategory = 9, @IsActive = 1
					 			 
EXEC Products_SelAll 'Price BETWEEN 0 AND 1'--Price = 1 added				 
---------------------------------------------------------------------------------
--Stored procedure that end with "_Sel_Id" give ability search information by primary key only. It's usually "INT" value but in this case it's "VARCHAR".
EXEC BusinessProcessesTypes_Sel_Id @BPTypeCode = 'SELL_ITEM'
---------------------------------------------------------------------------------
EXEC Cls_ProductCategories_SelAll

EXEC Cls_ProductSubCategories_SelAll

EXEC Cls_UserStatuses_SelAll

EXEC Cls_ClientStatuses_SelAll

EXEC Cls_ClientCategories_SelAll

EXEC ClientStickers_SelAll

EXEC Clients_SelAll
---------------------------------------------------------------------------------