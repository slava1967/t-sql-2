create or alter function dbo.udf_GetSKUPrice (
	@ID_SKU int
)
returns decimal(18, 2)
as
begin
	declare @ret decimal(18, 2)
	select @ret = sum(b.Value) / sum(b.Quantity)
	from dbo.Basket as b
	where b.ID_SKU = @ID_SKU
	return @ret
end
