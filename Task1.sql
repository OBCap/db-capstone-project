create view OrdersView as 
select
	OrderID,
    Quantity,
    TotalCost as Cost
from orders
where Quantity > 2
