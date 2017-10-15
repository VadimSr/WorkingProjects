INSERT INTO Users([Login], NameLocal, NameEng, StoreId, EnableDate, DisableDate, StatusId, CreatorId, Created, IsActive, ClientId)
SELECT '', '', '', 1, dbo.f_sys_GetActualDate(), DATEADD(YEAR, 1, dbo.f_sys_GetActualDate()), 1, 0, GETDATE(), 1, 0
UNION
SELECT 'empl_1_@work.work', '����������_1', 'Employee_1', 1, dbo.f_sys_GetActualDate(), DATEADD(YEAR, 1, dbo.f_sys_GetActualDate()), 1, 0, GETDATE(), 1, 0
UNION
SELECT 'empl_2_@work.work', '����������_2', 'Employee_2', 1, dbo.f_sys_GetActualDate(), DATEADD(YEAR, 1, dbo.f_sys_GetActualDate()), 1, 0, GETDATE(), 1, 0
UNION
SELECT 'empl_3_@work.work', '����������_3', 'Employee_3', 1, dbo.f_sys_GetActualDate(), DATEADD(YEAR, 1, dbo.f_sys_GetActualDate()), 1, 0, GETDATE(), 1, 0
UNION
SELECT substring(suser_sname(),charindex('\',suser_sname())+1,len(suser_sname())), '����', 'Admin', 1, dbo.f_sys_GetActualDate(), DATEADD(YEAR, 1, dbo.f_sys_GetActualDate()), 1, 0, GETDATE(), 1, 0
---------------------------------------------------------------------------------
DECLARE @INTs TABLE (INTs INT)
INSERT  INTO @INTs VALUES (1)
INSERT  INTO @INTs VALUES (2)
INSERT  INTO @INTs VALUES (3)
INSERT  INTO @INTs VALUES (4)
INSERT  INTO @INTs VALUES (5)
INSERT  INTO @INTs VALUES (6)
INSERT  INTO @INTs VALUES (7)

DECLARE @Names TABLE (INTs INT, NLocal NVARCHAR(100), NEng VARCHAR(100))
INSERT INTO @Names
SELECT i.INTs, '�볺��_' + CAST(i.INTs AS VARCHAR(10)), 'Client_' + CAST(i.INTs AS VARCHAR(10))
FROM   @INTs AS i

INSERT INTO Clients(StoreId, FullnameLocal, FullnameEng, AdvisorId, StatusId, Created, CreatorId, IsVIP, ClientCategoryId)

SELECT 1, '', '', 0, 1, GETDATE(), 0, 0, 1
UNION
SELECT n.*, ISNULL(dbo.f_sys_GetCurrentUser(), 0), 1, GETDATE(), ISNULL(dbo.f_sys_GetCurrentUser(), 0), 
       CASE 
           WHEN n.INTs % 2 = 0 THEN 0
           ELSE 1
       END,
       1
FROM   @Names AS n
---------------------------------------------------------------------------------
INSERT INTO Stores(NameLocal, NameEng, CityLocal, CityEng, AddressLocal, AddressEng, Phone, IsActive, CreatorId, Created)
SELECT a.a + '_' + CAST(i.INTs AS VARCHAR(10)), a.b + '_' + CAST(i.INTs AS VARCHAR(10)), 
       a.a, a.b, 
       '������, �.' + a.a + ', ���. ...', 'Ukraine, c.' + a.b + ', str. ...',
       a.c, a.d, a.e, a.f
FROM   @INTs AS i
CROSS 
JOIN   (SELECT '���' AS a, 'Kiev' AS b, '+380971234567' AS c, 1 AS d, ISNULL(dbo.f_sys_GetCurrentUser(),0) AS e, GETDATE() AS f UNION
		SELECT '�����',     'Odessa',    '+380961234567',      1,      ISNULL(dbo.f_sys_GetCurrentUser(),0),      GETDATE()      UNION
		SELECT '�������',   'Poltava',   '+380951234567',      1,      ISNULL(dbo.f_sys_GetCurrentUser(),0),      GETDATE()      UNION
		SELECT '�����',    'Dnipro',    '+380941234567',      1,      ISNULL(dbo.f_sys_GetCurrentUser(),0),      GETDATE()      UNION 
		SELECT '����',     'Lviv',      '+380931234567',      1,      ISNULL(dbo.f_sys_GetCurrentUser(),0),      GETDATE()      UNION
		SELECT '�����',    'Zhashkiv',  '+380921234567',      1,      ISNULL(dbo.f_sys_GetCurrentUser(),0),      GETDATE()      UNION 
		SELECT '��������', 'Ternopil',  '+380911234567',      1,      ISNULL(dbo.f_sys_GetCurrentUser(),0),      GETDATE()
        ) AS a
WHERE  i.INTs = 1
ORDER  BY a.c DESC
---------------------------------------------------------------------------------
INSERT INTO Currencies(ISO, ISONum, DescrLocal, DescrEng, IsActive) VALUES ('EUR', 978, '����',           'Euro',             1)
INSERT INTO Currencies(ISO, ISONum, DescrLocal, DescrEng, IsActive) VALUES ('UAH', 980, '������ ������', 'Ukrainian Hryvna', 1)
INSERT INTO Currencies(ISO, ISONum, DescrLocal, DescrEng, IsActive) VALUES ('USD', 840, '����� ���',      'US Dollar',        1)
---------------------------------------------------------------------------------
INSERT INTO Cls_ProductSubCategories VALUES ('',                   '',              0, 1)
INSERT INTO Cls_ProductSubCategories VALUES ('³��������',         'VideoCard',     1, 1)
INSERT INTO Cls_ProductSubCategories VALUES ('���������',          'CPUs',          1, 1)
INSERT INTO Cls_ProductSubCategories VALUES ('������ ��������', 'Light Cars',    2, 1)
INSERT INTO Cls_ProductSubCategories VALUES ('���������',         'Trucks',        2, 1)
INSERT INTO Cls_ProductSubCategories VALUES ('������ ��������',  'Mobile Phones', 3, 1)

INSERT INTO Cls_ProductCategories VALUES ('',                    '',               1)
INSERT INTO Cls_ProductCategories VALUES ('����''����� �����', 'Computer parts', 1)
INSERT INTO Cls_ProductCategories VALUES ('��������',          'Cars',           1)
INSERT INTO Cls_ProductCategories VALUES ('�������',             'Gadgets',        1)
---------------------------------------------------------------------------------
INSERT INTO Products (DescrLocal, DescrEng, Price, Currency, ProductSubCategory, IsActive)
SELECT a.a + '_' + CAST(i.INTs AS VARCHAR(10)), a.b + '_' + CAST(i.INTs AS VARCHAR(10)), a.c * (i.INTs * 1.00 / 7), a.d, a.e, a.f 
FROM   @INTs AS i
CROSS 
JOIN   (SELECT 'Nvidia' AS a, 'Nvidia' AS b, 500 AS c, 'USD' AS d, 1 AS e, 1 AS f  UNION
        SELECT 'Intel',       'Intel',       300,      'USD',      2,      1       UNION
		SELECT 'Audi',        'Audi',        300000,   'UAH',      3,      1       UNION
		SELECT 'Testa',       'Testa',       1000000,  'UAH',      3,      1       UNION
		SELECT 'Man',         'Man',         100500,   'EUR',      4,      1       UNION
		SELECT 'Sony',        'Sony',        500,      'EUR',      5,      1       UNION
		SELECT 'AMD',         'AMD',         10000,    'UAH',      1,      1
        ) AS a
---------------------------------------------------------------------------------
INSERT INTO BusinessProcessesTypes (BPTypeCode, DescrLocal, DescrEng, IsActive)
SELECT * FROM (SELECT 'BUY_ITEM'  AS a,         '������ ������' AS b,        'Purchase of goods' AS c,            1 AS d UNION
			   SELECT 'SELL_ITEM',              '������� ������',             'Sale of goods',                     1      UNION
			   SELECT 'WHOLESALE_BUY_ITEM',     '������ ������ ������',      'Wholesale purchase of goods',       1      UNION
			   SELECT 'WHOLESALE_SELL_ITEM',    '������ ������� ������',      'Wholesale of goods',                1      UNION
			   SELECT 'CLIENT_STICKER_ATTACH',  '��������� ����� �볺���',  'Attach the sticker to the Client',  1      UNION
			   SELECT 'CLIENT_STICKER_ADETACH', '³������� ����� �볺���',  'Unblock the sticker to the Client', 1      UNION
			   SELECT 'CALL_CENTR_ACTION',      'ĳ� ����������',             'CallCenter Action',                 1 
               ) AS a
---------------------------------------------------------------------------------
INSERT INTO Cls_BPStatuses VALUES(0, '�����',	      'New',	   1)
INSERT INTO Cls_BPStatuses VALUES(1, '���������',	  'Checked',   1)
INSERT INTO Cls_BPStatuses VALUES(2, '³����������',  'Sent',	   1)
INSERT INTO Cls_BPStatuses VALUES(3, '������������',  'Discarded', 1)
INSERT INTO Cls_BPStatuses VALUES(4, 'ϳ�����������', 'Approved',  1)
---------------------------------------------------------------------------------
INSERT INTO Cls_UserStatuses VALUES (0,  '�����',            'New',             1)
INSERT INTO Cls_UserStatuses VALUES (1,  '� �����',         'In work',         1)
INSERT INTO Cls_UserStatuses VALUES (2,  '�� �����������', 'On confirmation', 1)
INSERT INTO Cls_UserStatuses VALUES (3,  'ϳ�����������',    'Confirmed',       1)
INSERT INTO Cls_UserStatuses VALUES (9,  '������������',     'Rejected',        1)
INSERT INTO Cls_UserStatuses VALUES (10, '���������',        'Executed',        1)
---------------------------------------------------------------------------------
INSERT INTO Cls_ClientStatuses VALUES (0, '�����',      'New',     1)
INSERT INTO Cls_ClientStatuses VALUES (1, '��������',   'Active',  1)
INSERT INTO Cls_ClientStatuses VALUES (3, '����������', 'Blocked', 1)
---------------------------------------------------------------------------------
INSERT INTO Cls_ClientCategories VALUES ('����������',     'Employee',        1)
INSERT INTO Cls_ClientCategories VALUES ('������� ��������', 'Private buyer',   1)
INSERT INTO Cls_ClientCategories VALUES ('������� ��������', 'Wholesale buyer', 1)
INSERT INTO Cls_ClientCategories VALUES ('����˳��',         'StopList',        1)
---------------------------------------------------------------------------------