create or alter view dbo.vw_SKUPrice (ID, Code, Name, Price)
AS
SELECT ID, Code, Name, dbo.udf_GetSKUPrice(ID)
FROM dbo.SKU
