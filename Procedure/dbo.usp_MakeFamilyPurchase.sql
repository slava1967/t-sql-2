create or alter procedure dbo.usp_MakeFamilyPurchase (
	@FamilySurName varchar(255)
)
as
set nocount on
begin
	declare @ErrorMessage varchar(255)

	if not exists (
		select 1
		from dbo.Family as f
		where f.SurName = @FamilySurName
	)

	begin
		set @ErrorMessage = 'Такой семьи нет, проверьте корректность данных'
		raiserror (
			@ErrorMessage
			,3
			,1
		)

		return
	end

	update f
	set BudgetValue = BudgetValue - v
	from dbo.Family as f
	inner join (
		select ID_Family, sum(Value) as v
		from dbo.Basket
		group by ID_Family
	) as b
	on f.ID = b.ID_Family
	where f.SurName = @FamilySurName
end
