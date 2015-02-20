use netinmlf_netint
go

create table RegisterClient(
RegisterClientID int unique identity(1,1) not null,
ClientId int null,
ClientNo varchar(15)null,
Email varchar(100)null,
Passwords varchar(50) null,
Approved bit null,
)go

Create Table Visitors (
VisitorsID int unique identity(1,1) not null,
ClientId int null,
ClientNo varchar(15) null,
VisitorNo varchar(15) null,
ModifiedDate datetime null,
SendReceived bit null,
)go