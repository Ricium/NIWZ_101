use master
go
create database Spar_Database
go

use Spar_Database
GO

Create table l_Budget
(
BudgetID int identity(1,1) primary key not null,
BudgetDate datetime,
Amount decimal
)
go

Create table l_Permission
(
PermissionID int identity(1,1) primary key not null,
Permission varchar(50)
)

Create table t_UserTypePermission
(
UserTypePermissionID int identity(1,1) primary key not null,
PermissionID int,
UserTypeID int
)

Create table l_UserType
(
UserTypeID int identity(1,1) primary key not null,
UserType varchar(50)
)

Create table t_User
(
UserID int identity(1,1) primary key not null,
UserName varchar(50),
UserSurname varchar(50),
ID varchar(50),
UserCell varchar(20),
UserEmail varchar(50),
UserTypeID int
)

Create table t_SupplierType
(
SupplierTypeID int identity(1,1) primary key not null,
SupplierType varchar(50)
)

Create table t_Supplier
(
SupplierID int identity(1,1) primary key not null,
Supplier varchar(50),
StockCondition varchar(50),
Term varchar(50),
SupplierTypeID int,
ProductID int
)

Create table t_Product
(
ProductID int identity(1,1) primary key not null,
Product varchar(50),
ProductDescription varchar(50),
Price decimal,
Quantity int,
Total int,
BTW decimal
)

Create table l_CommentType
(
CommentTypeID int identity(1,1) primary key not null,
CommentType varchar(50)
)

Create table t_Comment
(
CommentID int identity(1,1) primary key not null,
Comment varchar(100),
CommentTypeID int
)

Create table t_Order
(
OrderID int identity(1,1) primary key not null,
OrderDate datetime,
ExspectedDeliveryDate date,
Amount decimal,
SupplierID int,
SupplierTypeID int,
EmployeeTypeID int,
EmployeeID int,
CommentID int
)

Create table t_ProofOfPayment
(
ProofOfPaymentID int identity(1,1) primary key not null,
ActualDate datetime,
ModifiedDate datetime,
PaymentDescription varchar(50),
SupplierID int,
SupplierTypeID int
)

Create table t_CashReconcilation
(
CashReconcilationID int identity(1,1) primary key not null,
ActualDate datetime,
ModifiedDate datetime,
ReconcilationTypeID int,
EmployeeID int,
EmployeeTypeID int
)


Create table l_ReconcilationType
(
CashReconcilationTypeID int identity(1,1) primary key not null,
ActualDate datetime,
ModifiedDate datetime,
ReconcilationTypeID int,
EmployeeID int,
EmployeeTypeID int
)

Create table t_KwikPay
(
KwikPayID int identity(1,1) primary key not null,
ActualDate datetime,
ModifiedDate datetime,
Amount decimal,
KwikPayTypeID int,
EmployeeID int,
EmployeeTypeID int
)

Create table l_KwikPayType
(
KwikPayTypeID int identity(1,1) primary key not null,
KwikPayType varchar(50)
)

Create table t_InstantMoney
(
InstantMoneyID int identity(1,1) primary key not null,
ActualDate datetime,
ModifiedDate datetime,
Amount decimal,
InstantMoneyTypeID int,
EmployeeID int,
EmployeeTypeID int
)

Create table l_InstantMoneyType
(
InstantMoneyTypeID int identity(1,1) primary key not null,
InstantMoneyType varchar(50)
)

Create table t_FNB
(
FNBID int identity(1,1) primary key not null,
ActualDate datetime,
ModifiedDate datetime,
Amount decimal,
FNBTypeID int,
EmployeeID int,
EmployeeTypeID int
)

Create table l_FNBType
(
FNBTypeID int identity(1,1) primary key not null,
FNBType varchar(50)
)

Create table t_ElectronicFund
(
ElectronicFundID int identity(1,1) primary key not null,
ElectronicFund varchar(50),
Total decimal,
ElectronicTypeID int,
EmployeeID int,
EmployeeTypeID int 
)

Create table l_ElectronicType 
(
ElectronicTypeID int identity(1,1) primary key not null,
ElectronicType varchar(50),
ElectronicTypeDescription varchar(50)
)

Create table l_MoneyUnit
(
MoneyUnitID int identity(1,1) primary key not null,
MoneyUnit varchar(50)
)

Create table l_MovementType
(
MovementTypeID int identity(1,1) primary key not null,
MovementType varchar(50)
)

Create table t_CoinMovement
(
CoinMovementID int identity(1,1) primary key not null,
ActualDate datetime,
ModifiedDate datetime,
Amount decimal,
MovementTypeID int,
MoneyUnitID int,
EmployeeID int,
EmployeeTypeID int
)

Create table t_CashBox
(
CashBoxID int identity(1,1) primary key not null,
ActualDate datetime,
ModifiedDate datetime,
Amount decimal,
MovementTypeID int
)

Create table l_CashType
(
CashTypeID int identity(1,1) primary key not null,
CashType varchar(50)
)

Create table t_PickUp
(
PickUpID int identity(1,1) primary key not null,
ActualDate datetime,
ModifiedDate datetime,
Amount decimal,
CashTypeID int,
EmployeeID int,
EmployeeTypeID int
)

Create table t_CashMovement  
(
CashMovementID int identity(1,1) primary key not null,
ActualDate datetime,
ModifiedDate datetime,
Amount decimal,
CashTypeID int,
MoneyUnitID int,
EmployeeID int,
EmployeeTypeID int
)

Create table l_Transit
(
TransitID int identity(1,1) primary key not null,
ActualDate datetime,
ModifiedDate datetime,
Amount decimal
)

Create table l_GRVType
(
GRVTypeID int identity(1,1) primary key not null,
GRVType varchar(50)
)
go

Create table t_GRVList 
(
GRVListID int identity(1,1) primary key not null,
InvoiceNumber varchar(50),
StateDate datetime,
Number varchar(50),
PayDate datetime,
PinkSlipNumber varchar(10),
GRVDate datetime,
InvoiceDate datetime,
ExcludingVat decimal,
IncludingVat decimal,
GRVTypeID int,
SupplierID int,
SupplierTypeID int
)

