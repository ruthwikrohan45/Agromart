
create database AgroMarketDB;

use AgroMarketDB;

-- 1. Farm table
create table Farm (
    FarmID int primary key auto_increment,
    FarmName varchar(100),
    Region varchar(50),
    OwnerName varchar(100)
);

-- 2. Buyer table
create table Buyer (
    BuyerID int primary key auto_increment,
    BusinessName varchar(100),
    ContactEmail varchar(100),
    City varchar(50)
);

-- 3. Produce table
create table Produce (
    ProduceID int primary key auto_increment,
    FarmID int,
    CropName varchar(80),
    QuantityKg decimal(10,2),
    PricePerKg decimal(10,2),
    HarvestDate date,
    BestBeforeDate date,
    constraint chk_produce_quantity
        check (QuantityKg >= 0),
    foreign key (FarmID) references Farm(FarmID)
);

-- 4. Order table
create table `Order` (
    OrderID int primary key auto_increment,
    BuyerID int,
    OrderDate date,
    Status varchar(20) default 'Placed',
    TotalAmount decimal(10,2),
    foreign key (BuyerID) references Buyer(BuyerID)
);

-- 5. OrderItem table
create table OrderItem (
    OrderItemID int primary key auto_increment,
    OrderID int,
    ProduceID int,
    QuantityKg decimal(10,2),
    constraint chk_orderitem_quantity
        check (QuantityKg > 0),
    foreign key (OrderID) references `Order`(OrderID),
    foreign key (ProduceID) references Produce(ProduceID)
);

-- 6. DeliveryRoute table
create table DeliveryRoute (
    RouteID int primary key auto_increment,
    FarmID int,
    BuyerID int,
    DistanceKm decimal(8,2),
    EstimatedHours decimal(5,2),
    foreign key (FarmID) references Farm(FarmID),
    foreign key (BuyerID) references Buyer(BuyerID)
);

