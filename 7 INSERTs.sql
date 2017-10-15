DECLARE @cDate DATETIME,
        @ConfirmingUserId INT
SET     @cDate = dbo.f_sys_GetActualDate()
SET     @ConfirmingUserId = dbo.f_sys_GetCurrentUser()
---------------------------------------------------------------------------------
EXEC [dbo].[BusinessProcesses_InsUpd] @BPId = NULL, @ClientId = 3, @BPTypeCode = 'BUY_ITEM', @BPStatusId = 0, @StoreId = 1, @ProductId = 1, @OrderingAccount = '123', @BeneficiaryAccount = '321', 
                                      @Amount = 1428.57, @Currency = 'UAH', @BPDate = NULL, @Description = '�������� ��������� ����� � �������� �� 12:00.', @ConfirmingUserId = NULL

EXEC [dbo].[BusinessProcesses_InsUpd] @BPId = 1, @BPTypeCode = 'BUY_ITEM', @BPStatusId = 1, @StoreId = 1, @ProductId = 1, @OrderingAccount = '123', @BeneficiaryAccount = '321', 
                                      @Amount = 1428.57, @Currency = 'UAH', @BPDate = @cDate, @Description = '�������� ��������� ����� � �������� �� 12:00.', @ConfirmingUserId = NULL
                                      
EXEC [dbo].[BusinessProcesses_InsUpd] @BPId = 1, @BPTypeCode = 'BUY_ITEM', @BPStatusId = 3, @StoreId = 1, @ProductId = 1, @OrderingAccount = '123', @BeneficiaryAccount = '321', 
                                      @Amount = 1428.57, @Currency = 'UAH', @BPDate = @cDate, @Description = '�������� ��������� ����� � �������� �� 12:00.', @ConfirmingUserId = NULL
---------------------------------------------------------------------------------
EXEC [dbo].[BusinessProcesses_InsUpd] @BPId = NULL, @BPTypeCode = 'SELL_ITEM', @BPStatusId = 0, @StoreId = 1, @ProductId = 43, @OrderingAccount = '123', @BeneficiaryAccount = '321', 
                                      @Amount = 142857.00, @Currency = 'UAH', @BPDate = NULL, @Description = '�������� �������� ����������� ����.', @ConfirmingUserId = NULL

EXEC [dbo].[BusinessProcesses_InsUpd] @BPId = 2, @BPTypeCode = 'SELL_ITEM', @BPStatusId = 1, @StoreId = 1, @ProductId = 43, @OrderingAccount = '123', @BeneficiaryAccount = '321', 
                                      @Amount = 145857.00, @Currency = 'UAH', @BPDate = @cDate, @Description = '�������� �������� ����������� ����.', @ConfirmingUserId = NULL
                                                                            
EXEC [dbo].[BusinessProcesses_InsUpd] @BPId = 2, @BPTypeCode = 'SELL_ITEM', @BPStatusId = 2, @StoreId = 3, @ProductId = 43, @OrderingAccount = '123', @BeneficiaryAccount = '321', 
                                      @Amount = 145857.00, @Currency = 'UAH', @BPDate = @cDate, @Description = '�������� �������� ����������� ����.', @ConfirmingUserId = NULL
                                     
EXEC [dbo].[BusinessProcesses_InsUpd] @BPId = 2,  @ClientId = 5, @BPTypeCode = 'SELL_ITEM', @BPStatusId = 4, @StoreId = 3, @ProductId = 43, @OrderingAccount = '123', @BeneficiaryAccount = '321', 
                                      @Amount = 145857.00, @Currency = 'UAH', @BPDate = @cDate, @Description = '�������� �������� ����������� ����.', @ConfirmingUserId = @ConfirmingUserId  
---------------------------------------------------------------------------------
EXEC [dbo].[BusinessProcesses_InsUpd] @BPId = NULL, @BPTypeCode = 'WHOLESALE_BUY_ITEM', @BPStatusId = 0, @StoreId = 2, @ProductId = 15, @OrderingAccount = '', @BeneficiaryAccount = '', 
                                      @Amount = 42.8571, @Currency = 'USD', @BPDate = NULL, @Description = '���������� ���� ���������.', @ConfirmingUserId = NULL

--EXEC [dbo].[BusinessProcesses_Del] 3--History FK doesn't give you to delete BusinessProcesses
---------------------------------------------------------------------------------
EXEC Cls_ProductCategories_InsUpd @ProductCategoryId = null, @DescrLocal = '�����',   @DescrEng = 'Books',    @IsActive = 1
EXEC Cls_ProductCategories_InsUpd @ProductCategoryId = null, @DescrLocal = '�������', @DescrEng = 'Toys',     @IsActive = 1
EXEC Cls_ProductCategories_InsUpd @ProductCategoryId = null, @DescrLocal = '����',    @DescrEng = 'Clothes',  @IsActive = 1
---------------------------------------------------------------------------------
DECLARE @books INT
SET     @books = (SELECT TOP 1 ProductCategoryId
                  FROM   Cls_ProductCategories WITH(NOLOCK) 
                  WHERE  IsActive = 1
                          AND DescrEng = 'Books')
                          
EXEC Cls_ProductSubCategories_InsUpd @ProductSubCategoryId = null, @DescrLocal = '������� ����������', @DescrEng = 'Sci-Fi', @ProductCategory = @books, @IsActive = 1


EXEC Cls_ProductSubCategories_InsUpd @ProductSubCategoryId = null, @DescrLocal = '������� ���������', @DescrEng = 'Technical literature', @ProductCategory = @books, @IsActive = 1
---------------------------------------------------------------------------------
DECLARE @Toys INT
SET     @Toys = (SELECT TOP 1 ProductCategoryId
                  FROM   Cls_ProductCategories WITH(NOLOCK) 
                  WHERE  IsActive = 1
                          AND DescrEng = 'Toys')
                          
EXEC Cls_ProductSubCategories_InsUpd @ProductSubCategoryId = null, @DescrLocal = '������ �������',  @DescrEng = 'Children''s toys', @ProductCategory = @Toys, @IsActive = 1
---------------------------------------------------------------------------------
DECLARE @Clothes INT
SET     @Clothes = (SELECT TOP 1 ProductCategoryId
					  FROM   Cls_ProductCategories WITH(NOLOCK) 
					  WHERE  IsActive = 1
							  AND DescrEng = 'Clothes')
                          
EXEC Cls_ProductSubCategories_InsUpd @ProductSubCategoryId = null, @DescrLocal = '³������',  @DescrEng = 'Jackets', @ProductCategory = @Clothes, @IsActive = 1
---------------------------------------------------------------------------------
DECLARE @SciBooks INT
SET     @SciBooks = (SELECT TOP 1 cpsc.ProductSubCategoryId
                       FROM   Cls_ProductCategories AS cpc WITH(NOLOCK)
                       JOIN   Cls_ProductSubCategories AS cpsc WITH(NOLOCK)
                         ON   cpsc.ProductCategory = cpc.ProductCategoryId
                               AND cpsc.DescrEng = 'Sci-Fi'
                       WHERE  cpc.DescrEng = 'Books')

EXEC Products_InsUpd @ProdPTypeId = null, @DescrLocal = '������� �������', @DescrEng = 'The Lord of the Rings', @Price = 10, @Currency = 'USD', @ProductSubCategory = @SciBooks, @IsActive = 1
EXEC Products_InsUpd @ProdPTypeId = null, @DescrLocal = '����� 2033', @DescrEng = 'METRO 2033', @Price = 20, @Currency = 'USD', @ProductSubCategory = @SciBooks, @IsActive = 1

SET     @SciBooks = (SELECT TOP 1 cpsc.ProductSubCategoryId
                       FROM   Cls_ProductCategories AS cpc WITH(NOLOCK)
                       JOIN   Cls_ProductSubCategories AS cpsc WITH(NOLOCK)
                         ON   cpsc.ProductCategory = cpc.ProductCategoryId
                               AND cpsc.DescrEng = 'Technical literature'
                       WHERE  cpc.DescrEng = 'Books')
EXEC Products_InsUpd @ProdPTypeId = null, @DescrLocal = '��������-��������������� ��������', @DescrEng = 'Object-Oriented Thought Process', @Price = 450, @Currency = 'UAH', @ProductSubCategory = @SciBooks, @IsActive = 1
---------------------------------------------------------------------------------
DECLARE @ToyTrain INT
SET     @ToyTrain = (SELECT TOP 1 cpsc.ProductSubCategoryId
                       FROM   Cls_ProductCategories AS cpc WITH(NOLOCK)
                       JOIN   Cls_ProductSubCategories AS cpsc WITH(NOLOCK)
                         ON   cpsc.ProductCategory = cpc.ProductCategoryId
                               AND cpsc.DescrEng = 'Children''s toys'
                       WHERE  cpc.DescrEng = 'Toys')

EXEC Products_InsUpd @ProdPTypeId = null, @DescrLocal = '���������� �����', @DescrEng = 'Toy Train', @Price = 15, @Currency = 'USD', @ProductSubCategory = @ToyTrain, @IsActive = 1
---------------------------------------------------------------------------------
DECLARE @Jacket INT
SET     @Jacket = (SELECT TOP 1 cpsc.ProductSubCategoryId
                    FROM   Cls_ProductSubCategories AS cpsc WITH(NOLOCK)
                    JOIN   Cls_ProductCategories AS cpc WITH(NOLOCK)
                      ON   cpsc.ProductCategory = cpc.ProductCategoryId 
                            AND cpc.DescrEng = 'Clothes'
                    WHERE  cpsc.DescrEng = 'Jackets')

EXEC Products_InsUpd @ProdPTypeId = null, @DescrLocal = '������ ������', @DescrEng = 'Leather jacket', @Price = 115, @Currency = 'USD', @ProductSubCategory = @Jacket, @IsActive = 1
---------------------------------------------------------------------------------
DECLARE @ProdPTypeId INT, 
        @DescrLocal VARCHAR(255), 
        @DescrEng NVARCHAR(255), 
        @Price MONEY, 
        @Currency CHAR(3),
        @ProductSubCategory INT, 
        @IsActive BIT

SELECT TOP 1 @ProdPTypeId        = p.ProdPTypeId, 
             @DescrLocal         = p.DescrLocal, 
             @DescrEng           = p.DescrEng, 
             @Price              = 25,--Cnage Price 
             @Currency           = 'EUR', --Cnage Currency
             @ProductSubCategory = p.ProductSubCategory, 
             @IsActive           = p.IsActive
--SELECT *
FROM   Products AS p WITH(NOLOCK)
WHERE  p.DescrEng = 'METRO 2033' 
        AND p.IsActive = 1

EXEC Products_InsUpd @ProdPTypeId = @ProdPTypeId, @DescrLocal = @DescrLocal, @DescrEng = @DescrEng, @Price = @Price, @Currency = @Currency, @ProductSubCategory = @ProductSubCategory, @IsActive = @IsActive
---------------------------------------------------------------------------------
