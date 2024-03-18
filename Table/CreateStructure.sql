if object_id('dbo.SKU', 'U') is not null
begin
	exec('drop table dbo.SKU')
end

begin
	create table dbo.SKU (
		ID int not null identity,
		Code as N's' + cast(ID as varchar) persisted unique not null,
		Name varchar(255) not null,
		MDT_ID_PrincipalCreatedBy int not null,
        MDT_DateCreate datetime not null,
		constraint PK_SKU primary key clustered (ID)
	)
end

if object_id('dbo.Family', 'U') is not null
begin
	exec('drop table dbo.Family')
end

begin
	create table dbo.Family (
		ID int not null identity,
		SurName varchar(255) not null,
		BudgetValue int not null,
		MDT_ID_PrincipalCreatedBy int not null,
        MDT_DateCreate datetime not null,
		constraint PK_Family primary key clustered (ID)
	)
end

if object_id('dbo.Basket', 'U') is not NULL
begin
	exec('drop table dbo.Basket')
end

begin
	create table dbo.Basket (
		ID int not null identity,
		ID_SKU int not null,
		ID_Family int not null,
		Quantity int not null,
		Value decimal(18, 2) not null,
		PurchaseDate date default getdate(),
		DiscountValue decimal(18, 2) default 0,
		MDT_ID_PrincipalCreatedBy int not null,
        MDT_DateCreate datetime not null,
		constraint CK_Basket_Quantity check(Quantity > 0),
		constraint CK_Basket_Value check(Value > 0),
		constraint FK_Basket_SKU foreign key (ID_SKU) references dbo.SKU (ID),
		constraint FK_Basket_Family foreign key (ID_Family) references dbo.Family (ID)
	)
end
