create function HelloWorld()
returns varchar(50)
As
begin
return 'Hello'
end

select dbo.HelloWorld()

------------------------------------------------------------------------------------------

Alter function Name(@Name varchar(50))
returns varchar(50)
As
begin
return 'Hai  ' + @Name
end

select dbo.Name('Hindhujha')

---------------------------------------------------------------------------------------------

create function fn_Sum(@a bigint,@b bigint,@c bigint)
returns bigint
As
begin
return @a + @b + @c
end

select dbo.fn_Sum(10,5,5)

----------------------------------------------------------------------------------

create function fn_Multiply(@a bigint,@b bigint,@c bigint)
returns bigint
As
begin
return @a * @b * @c
end

select dbo.fn_Multiply(10,1,9)