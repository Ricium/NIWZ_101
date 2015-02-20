use netinmlf_netint
go

create table Teams(
TeamsId int unique identity(1,1) not null,
Name varchar(50),
Age varchar(10),
Ranks varchar(1),
ClientId int,
)
go

Create table fixtures(
FixturesId int unique identity(1,1) not null,
TeamIdA int,
TeamIdB int,
StartTime datetime,
FieldsId int,
ClientId int,
)
go

create table Results(
ResultsId int unique identity(1,1) not null,
FixtureId int,
PointsA varchar(20) null,
PointsB varchar(20) null,
TimeInMatch varchar(20),
Comentry varchar(200),
ClientId int,
)
go