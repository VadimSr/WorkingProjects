---------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[f_sys_GetCurrentUser]') IS NOT NULL DROP FUNCTION [dbo].[f_sys_GetCurrentUser]
IF OBJECT_ID('[dbo].[f_sys_GetActualDate]')  IS NOT NULL DROP FUNCTION [dbo].[f_sys_GetActualDate]
IF OBJECT_ID('[dbo].[f_int_IsDiff]')         IS NOT NULL DROP FUNCTION [dbo].[f_int_IsDiff]
---------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
CREATE FUNCTION [dbo].[f_sys_GetCurrentUser] ()
                                                                                                                                                                                                                       
RETURNS INT with execute as caller                                                                                                                                                                                                                                                   
 AS
                                                                                                                                                                                                                                                            
 BEGIN
                                                                                                                                                                                                                                                         
 DECLARE @UserId INT
 DECLARE @Login VARCHAR(100)

 SET @Login = substring(suser_sname(),charindex('\',suser_sname())+1,len(suser_sname() ))                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                                            
 SELECT @UserId = UserId
 FROM   dbo.Users 
 WHERE  [Login] = @Login
         AND IsActive = 1--True
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
 SELECT @UserId = ISNULL(@UserId,-1)		
                                                                                                                                                                                                                         
 RETURN @UserId
                                                                                                                                                                                                                                                
 END
---------------------------------------------------------------------------------
GO 
---------------------------------------------------------------------------------
CREATE FUNCTION  [dbo].[f_sys_GetActualDate] ()
RETURNS SMALLDATETIME 
AS  
BEGIN 
	DECLARE @ActualDate SMALLDATETIME 

	SELECT @ActualDate = CAST(GETDATE() AS DATE)

	RETURN @ActualDate

END
---------------------------------------------------------------------------------
GO 
---------------------------------------------------------------------------------
CREATE FUNCTION [dbo].[f_int_IsDiff] (@x as sql_variant, @y as sql_variant)
RETURNS BIT
WITH SCHEMABINDING
AS
/*	Returns: 0 - when @x = @y
			 1 - otherwise
	This finction is useful when one(or both) input parameters can be NULL.  
*/
BEGIN
	RETURN  CASE WHEN @x = @y  or ( @x is NULL and @y is NULL)	THEN 0
				 ELSE 1
			END  
END
---------------------------------------------------------------------------------
