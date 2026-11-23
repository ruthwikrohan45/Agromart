
use AgroMarketDB;



insert into Farm (FarmName, Region, OwnerName)
values ('Test Farm', 'Chennai', 'Test Owner');

insert into Farm (FarmID, FarmName, Region, OwnerName)
values (2, 'Duplicate Farm', 'Chennai', 'Test Owner');


-- 2. produce check constraint

insert into Produce
(FarmID, CropName, QuantityKg, PricePerKg, HarvestDate, BestBeforeDate)
values (1, 'Test Tomato', 0, 20, '2026-11-20', '2026-11-30');

insert into Produce
(FarmID, CropName, QuantityKg, PricePerKg, HarvestDate, BestBeforeDate)
values (1, 'Invalid Tomato', -5, 20, '2026-11-20', '2026-11-30');


-- 3. orderitem check constraint

insert into OrderItem (OrderID, ProduceID, QuantityKg)
values (1, 1, 1);

insert into OrderItem (OrderID, ProduceID, QuantityKg)
values (1, 1, 0);


-- 4. default constraint

insert into `Order` (BuyerID, OrderDate, TotalAmount)
values (1, '2026-11-22', 1000);

select OrderID, BuyerID, Status
from `Order`
order by OrderID desc
limit 1;


-- 5. produce foreign key

insert into Produce
(FarmID, CropName, QuantityKg, PricePerKg, HarvestDate, BestBeforeDate)
values (1, 'Test Onion', 100, 25, '2026-11-22', '2026-12-10');

insert into Produce
(FarmID, CropName, QuantityKg, PricePerKg, HarvestDate, BestBeforeDate)
values (999, 'Invalid Onion', 100, 25, '2026-11-22', '2026-12-10');


-- 6. order foreign key

insert into `Order` (BuyerID, OrderDate, TotalAmount)
values (1, '2026-11-22', 500);

insert into `Order` (BuyerID, OrderDate, TotalAmount)
values (999, '2026-11-22', 500);


-- 7. orderitem order foreign key

insert into OrderItem (OrderID, ProduceID, QuantityKg)
values (1, 1, 2);

insert into OrderItem (OrderID, ProduceID, QuantityKg)
values (999, 1, 2);


-- 8. orderitem produce foreign key

insert into OrderItem (OrderID, ProduceID, QuantityKg)
values (1, 1, 3);

insert into OrderItem (OrderID, ProduceID, QuantityKg)
values (1, 999, 3);


-- 9. deliveryroute farm foreign key

insert into DeliveryRoute
(FarmID, BuyerID, DistanceKm, EstimatedHours)
values (1, 1, 25, 1);

insert into DeliveryRoute
(FarmID, BuyerID, DistanceKm, EstimatedHours)
values (999, 1, 25, 1);


-- 10. deliveryroute buyer foreign key

insert into DeliveryRoute
(FarmID, BuyerID, DistanceKm, EstimatedHours)
values (1, 1, 30, 1.5);

insert into DeliveryRoute
(FarmID, BuyerID, DistanceKm, EstimatedHours)
values (1, 999, 30, 1.5);


-- 11. verify foreign keys

select table_name, column_name, constraint_name,
referenced_table_name, referenced_column_name
from information_schema.key_column_usage
where table_schema = 'AgroMarketDB'
and referenced_table_name is not null;
