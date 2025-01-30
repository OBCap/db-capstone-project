select 
	c.CustomerID,
	c.Name as FullName,
	o.OrderID,
	o.TotalCost as Cost,
	m.Name as MenuName,
	i.CourseName
from customerdetails c
inner join orders o on c.CustomerID = o.CustomerID
inner join menus m on o.MenuItemID = m.MenuItemsID
inner join menuitems i on o.MenuItemID = i.MenuItemsID
where o.TotalCost >= 150
order by o.TotalCost