-- 1. COMBINE THE MENU_ITEMS AND ORDER_DETAILS TABLES INTO A SINGLE TABEL
select*from menu_items;
select*from order_details;
select*
from order_details left join menu_items
on order_details.item_id = menu_items.menu_item_id;

-- 2. WHAT WERE THE LEAST AND MOST ORDERED ITEMS? WHAT CATEGORIES WERE THEY IN?
select item_name, count(order_details_id) as nr_purchases
from order_details left join menu_items
on order_details.item_id = menu_items.menu_item_id
group by item_name
order by nr_purchases desc;

-- 3. WHAT WERE THE TOP 5 ORDERS THAT SPENT THE MOST MONEY
select order_id, sum(price) as total
from order_details left join menu_items
on order_details.item_id = menu_items.menu_item_id
group by order_id
order by total
desc
limit 5;

-- 4. WHAT WERE THE TOP 5 ORDERS THAT SPENT THE MOST MONEY
select category, count(item_id) as nr_items
from order_details left join menu_items
on order_details.item_id = menu_items.menu_item_id
where order_id=440
group by category