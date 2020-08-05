-- 1
select book_name from books,inventory where books.book_id = inventory.book_id AND books.book_name = 'Lolita';

-- 2
select first_name,last_name,mobilephone,landLinePhone,address,city_name,country_name,join_date 
from customer,address,city,country order by join_date asc limit 1;

-- 3
select book_name,insert_date,sell_price as store_price,buy_price,book_condition,insert_date
 from inventory,books order by insert_date limit 1;
-- 4
select order_id as order_number,first_name as customer_Fname,last_name as customer_Lname,date_ordered,payment_method,total_price as price,order_status 
from orders 
join customer 
on orders.customer_id=customer.customer_id 
where date_fulfilled is null 
order by date_ordered asc;

-- 5
SELECT count(ordered_books.inventory_id) as amount
FROM ordered_books
JOIN orders 
join inventory
join books
ON ordered_books.order_id = orders.order_id 
and inventory.inventory_id = ordered_books.inventory_id
and books.book_id = inventory.book_id
where orders.order_status = 'success'
and  book_name = 'To the Lighthouse';


-- 6
-- select *
-- from author join orders on 
-- orders.order_status = 'success';
select author.first_name,author.last_name
from author
join books
on books.author_id=author.author_id 
where books.book_id=(select inventory.book_id 
					from inventory
					where inventory.inventory_id =(select max(ordered_books.inventory_id)
													from orders 
													join ordered_books
													on orders.order_id=ordered_books.order_id
													where orders.date_ordered>='2019-01-01' 
													and orders.date_ordered<='2020-03-01'
													and orders.order_status='success'));


select * from orders join shipments join shipping_company on shipments.order_id = orders.order_id and shipments.company_id = shipping_company.company_id;
select * from orders;
-- 7
select first_name,last_name,count(ordered_books.inventory_id) as amount
from customer 
join orders
join ordered_books
on customer.customer_id = orders.customer_id 
and ordered_books.order_id = orders.order_id
group by customer.first_name  
order by count(orders.order_id) desc limit 3;

-- 8 we need to add field to books
select book_name,count(book_translations.book_id) as amount
from books 
join book_translations 
on books.book_id = book_translations.book_id 
group by book_translations.book_id
limit 1;

-- 9
select book_name,date_ordered,sell_price as price
from ordered_books 
join orders 
join customer
join inventory
join books
on ordered_books.order_id = orders.order_id
and orders.customer_id = customer.customer_id
and inventory.inventory_id = ordered_books.order_id
and inventory.book_id = books.book_id
where orders.order_status = 'success'
and customer.first_name = 'tiger'
and customer.last_name = 'woods'
order by date_ordered 
;
-- 10 

select first_name,last_name,book_name,publisher,date_ordered,date_fulfilled,payment_method,total_price,order_status
 from customer 
 join orders 
 join ordered_books
 join inventory
 join books
 join publisher
 on orders.customer_id = customer.customer_id
 and orders.order_id=ordered_books.order_id
 and inventory.inventory_id = ordered_books.inventory_id
 and books.book_id = inventory.book_id
 and publisher.publisher_id =books.publisher_id
 where customer.first_name = 'andi'
 and customer.last_name = 'ram'
 order by date_ordered desc;

-- 11 -----> in c++
select orders.order_id,weight,shipping_method from books 
join inventory 
join ordered_books 
join orders 
join shipments
join shipping_company
on inventory.book_id = books.book_id
and ordered_books.inventory_id = inventory.inventory_id
and ordered_books.order_id = orders.order_id
and shipments.order_id = orders.order_id
and shipping_company.company_id = shipments.company_id
where orders.order_id = 1
group by orders.order_id;

-- 12 3 querys!! (loop in c++ with first query, and check for each of the, the second query, and execute third query if need to)

select orders.order_id,orders.date_ordered,orders.date_fulfilled,orders.order_status,orders.total_price,orders.payment_method
from orders 
join customer 
join shipments
on orders.customer_id = customer.customer_id 
and shipments.order_id = orders.order_id
where customer.first_name = 'andi' 
and customer.last_name = 'ram'
group by orders.order_id
having count(shipments.shipment_id) > 1;

select *
from orders 
join customer 
join shipments
on orders.customer_id = customer.customer_id 
and shipments.order_id = orders.order_id
where customer.first_name = 'andi' 
and customer.last_name = 'ram'
group by orders.order_id
having count(shipments.shipment_id) > 1;

-- 13 
select order_status from orders where order_id=1; -- should it be shipments status instead?

-- 14
select sum(total_price) from orders join shipments join shipping_company
on orders.order_id = shipments.order_id 
and shipments.company_id = shipping_company.company_id
where orders.order_status = 'success'
and company_name = 'Xpress'
and month(orders.date_ordered)=8
and year(orders.date_ordered)=2019;

-- 15
select sum(total_price) 
from orders 
where payment_method = 'bit' 
and month(orders.date_ordered) ='' 
and year(orders.date_ordered) =''
and order_status = 'success';
select * from orders;


-- 16
select orders.order_id,orders.date_ordered,orders.payment_method,orders.total_price 
from orders join ordered_books 
join inventory
on inventory.inventory_id = ordered_books.inventory_id 
and ordered_books.order_id = orders.order_id 
where (sell_price-buy_price)	>		
		(
			SELECT avg(sell_price-buy_price) FROM orders join inventory join ordered_books
			on inventory.inventory_id = ordered_books.inventory_id 
			and ordered_books.order_id = orders.order_id
			where DATEDIFF(curdate(), date_ordered) <= 365
		);
-- 17

select company_name,count(shipments.shipment_id) as amount 
from orders join shipments join shipping_company
on orders.order_id = shipments.order_id 
and shipments.company_id = shipping_company.company_id
where DATEDIFF(curdate(), date_ordered) <= 365
group by company_name;

-- 18
select *
from orders 
join ordered_books join inventory join books join customer
on inventory.book_id = books.book_id 
and inventory.inventory_id = ordered_books.inventory_id
and ordered_books.order_id = orders.order_id
and customer.customer_id = orders.customer_id
group by customer.customer_id;
select * from publisher
join books 
on books.publisher_id = publisher.publisher_id;
 having count(book_name) = 1;
 and count(books.publisher_id) > 1;

-- 19
select customer. from customer 
join orders 
on orders.customer_id = customer.customer_id 
where customer.customer_id 
in 
	(
		select customer.customer_id
		from orders 
		join customer
		on customer.customer_id = orders.customer_id
		where order_status = 'success' 
		and DATEDIFF(curdate(), date_fulfilled) >= 730
	) 
and DATEDIFF(curdate(), date_fulfilled) <= 730;
select * from inventory;

-- 21 
(select count(inventory_id)
from inventory 
where 
date(insert_date) < date(curdate()) 
group by)

select year(insert_date),MONTH(insert_date),count(inventory_id)+
from inventory 
group by year(insert_date),MONTH(insert_date);


-- 22
select count(inventory_id) as amount ,sum(buy_price) as total_price 
from inventory 
where insert_date >= '2013-01-01' 
and insert_date <= '2020-01-01';

-- 23 (only april 2020 works!)
select
(select sum(total_price) from orders where month(date_ordered)='4' and year(date_ordered) = '2020')
-
(select sum(buy_price) from inventory where month(insert_date)='4' and year(insert_date) = '2020')
 as earnings; 

-- 24 (23)

-- 25 
select salarys.n_hours * salarys.per_hour as salary 
from salarys 
join employee 
on salarys.employee_id = employee.employee_id
where employee.first_name = 'david'
and employee.last_name = 'tal'
and salarys.n_month = 8
and salarys.n_year = 2019;

-- 26 
select first_name,last_name,count(orders.order_id) 
from employee 
join orders 
on employee.employee_id = orders.employee_id 
where month(orders.date_ordered) = 1
and year(orders.date_ordered)  = 2020
group by orders.employee_id 
limit 1
;




