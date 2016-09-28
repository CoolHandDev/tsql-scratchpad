create table mytable1
(
	uniq_id uniqueidentifier,
	description varchar(400)
)

create index idx1 on mytable1(uniq_id)

declare @recordnum int
set @recordnum = 10000
declare  @i int = 0
while 1 = 1
begin
	set @i+= 1
	insert into mytable1(uniq_id, description)
	select newid(), 'I am record number ' + convert(varchar(10), @i)
	if 	@i = @recordnum
		break
end

select * from mytable1

declare @recordnum int
set @recordnum = 10000
declare  @i int = 0
declare @uniq_id uniqueidentifier
declare @description varchar(max)
while 1 = 1
begin
	set @i+= 1
	set @uniq_id = newid()
	set @description = 'I am record number ' + convert(varchar(10), @i)
	waitfor delay '00:00:00.100'
	insert into mytable1(uniq_id, description)
	values (@uniq_id, @description)
	if 	@i = @recordnum
		break
end

declare @recordnum int
set @recordnum = 10000
declare  @i int = 0
while 1 = 1
begin
	set @i+= 1
	waitfor delay '00:00:00.100'
	insert into mytable1(uniq_id, description)
	select newid(), 'I am record number ' + convert(varchar(10), @i)
	if 	@i = @recordnum
		break
end
