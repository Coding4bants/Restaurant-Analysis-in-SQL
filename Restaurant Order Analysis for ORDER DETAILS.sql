USE restaurant_db;
-- 1. VIEW THE ORDER_DETAILS TABLE.
select * from order_details;

-- 2. WHAT IS THE DATE RANGE OF THE TABLE.
select min(order_date), max(order_date) from order_details;

-- 3. HOW MANY ORDERS WERE MADE WITHIN THIS DATE RANGE
select count(DISTINCT order_id) from order_details;

-- 4. HOW MANY ITEMS WERE ORDERED WITHIN THIS DATE RANGE?
select COUNT(*) from order_details;

-- 5. WHICH ORDERS HAD THE MOST NUMBER OF ITEMS?
select order_id, count(order_id) as number_orders
from order_details
group by order_id
order by number_orders
desc;

-- 6. HOW MANY ORDERS HAD MORE THAN 12 ITEMS?
select count(*)from

(select order_id, count(order_id) as num_items
from order_details
group by order_id
having num_items > 12) as num_orders;