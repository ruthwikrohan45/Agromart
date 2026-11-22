use AgroMarketDB;

insert into Farm (FarmName, Region, OwnerName) values
('Green Farm', 'Chennai', 'Arun'),
('Sun Farm', 'Madurai', 'Ravi'),
('Fresh Farm', 'Coimbatore', 'Kumar'),
('Nature Farm', 'Salem', 'Suresh'),
('Organic Farm', 'Trichy', 'Manoj'),
('Happy Farm', 'Erode', 'Vijay'),
('Royal Farm', 'Thanjavur', 'Raj'),
('Green Valley', 'Vellore', 'Bala'),
('Smart Farm', 'Dindigul', 'Ajay'),
('Agro Farm', 'Tirunelveli', 'Karthik');

insert into Buyer (BusinessName, ContactEmail, City) values
('Fresh Mart', 'fresh@gmail.com', 'Chennai'),
('City Traders', 'city@gmail.com', 'Madurai'),
('Green Stores', 'green@gmail.com', 'Coimbatore'),
('Daily Needs', 'daily@gmail.com', 'Salem'),
('Food World', 'food@gmail.com', 'Trichy'),
('Market Hub', 'market@gmail.com', 'Erode'),
('Agro Buyers', 'agro@gmail.com', 'Vellore'),
('Super Mart', 'super@gmail.com', 'Dindigul'),
('Fresh Buyers', 'buyers@gmail.com', 'Thanjavur'),
('Wholesale Hub', 'wholesale@gmail.com', 'Chennai');

insert into Produce
(FarmID, CropName, QuantityKg, PricePerKg, HarvestDate, BestBeforeDate)
values
(1, 'Tomato', 500, 20, '2026-11-15', '2026-11-30'),
(2, 'Onion', 800, 30, '2026-11-15', '2026-12-20'),
(3, 'Potato', 600, 25, '2026-11-15', '2026-12-15'),
(4, 'Carrot', 400, 35, '2026-11-15', '2026-11-28'),
(5, 'Beans', 300, 40, '2026-11-15', '2026-11-29'),
(6, 'Cabbage', 450, 22, '2026-11-15', '2026-11-30'),
(7, 'Brinjal', 350, 28, '2026-11-15', '2026-11-28'),
(8, 'Beetroot', 250, 32, '2026-11-15', '2026-12-01'),
(9, 'Pumpkin', 700, 18, '2026-11-15', '2026-12-20'),
(10, 'Radish', 200, 24, '2026-11-15', '2026-11-29');

insert into `Order`
(BuyerID, OrderDate, TotalAmount)
values
(1, '2026-11-20', 1000),
(2, '2026-11-20', 1500),
(3, '2026-11-20', 2000),
(4, '2026-11-20', 2500),
(5, '2026-11-20', 3000),
(6, '2026-11-20', 3500),
(7, '2026-11-20', 4000),
(8, '2026-11-20', 4500),
(9, '2026-11-20', 5000),
(10, '2026-11-20', 5500);

insert into OrderItem (OrderID, ProduceID, QuantityKg)
select o.OrderID, p.ProduceID, 1.00
from `Order` o
cross join Produce p
cross join (
    select 1 as copy_no
    union all
    select 2
) copies;

insert into DeliveryRoute
(FarmID, BuyerID, DistanceKm, EstimatedHours)
values
(1, 1, 25, 1.00),
(2, 2, 40, 1.50),
(3, 3, 50, 2.00),
(4, 4, 30, 1.25),
(5, 5, 60, 2.50),
(6, 6, 35, 1.50),
(7, 7, 45, 2.00),
(8, 8, 55, 2.25),
(9, 9, 20, 0.75),
(10, 10, 70, 3.00);

select 'Farm' as TableName, count(*) as TotalRecords from Farm
union all
select 'Buyer', count(*) from Buyer
union all
select 'Produce', count(*) from Produce
union all
select 'Order', count(*) from `Order`
union all
select 'OrderItem', count(*) from OrderItem
union all
select 'DeliveryRoute', count(*) from DeliveryRoute;