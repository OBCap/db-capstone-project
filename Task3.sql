SELECT Name AS MenuName
FROM menus
WHERE MenuItemsID = ANY (SELECT m.MenuItemsID
					FROM orders o
					INNER JOIN menuitems m
						ON o.MenuItemID = m.MenuItemsID
					WHERE o.Quantity > 2)