create or alter trigger dbo.tr_Basket_insert_update on dbo.Basket
after insert
as
begin
	update dbo.Basket
	set DiscountValue = Value * 5 / 100
	where dbo.Basket.ID_SKU in (
		select ID_SKU
		from (
			select ID_SKU as s, count(*) as c
			from inserted group by ID_SKU
			) as i
		inner join (select ID_SKU from dbo.Basket) as b
		on i.s = b.ID_SKU
		where i.c > 1
	)
end
