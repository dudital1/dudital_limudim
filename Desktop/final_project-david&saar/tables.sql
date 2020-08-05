use final_proj;

-- drop table books;

CREATE TABLE books
(
	book_id int not null AUTO_INCREMENT,
    book_name varchar(50) not null,
    author_id int not null,
    publisher_id int not null,
    publish_date datetime not null,
    translator varchar(50),
    weight int not null,
    num_pages int not null,
    foreign key(author_id) 
		REFERENCES author(author_id),
	foreign key(publisher_id) 
		REFERENCES publisher(publisher_id),
    primary key(book_id)
);



CREATE TABLE author
(
	author_id int not null AUTO_INCREMENT,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    primary key(author_id)
);

create table publisher
(
	publisher_id int not null AUTO_INCREMENT,
    publisher varchar(50) not null,
    primary key(publisher_id)
);

CREATE TABLE employee
(
	employee_id int not null AUTO_INCREMENT,
	first_name varchar(50) not null,
    last_name varchar(50) not null,
    mobilephone varchar(15) not null,
    address_id int not null,
    start_date date not null,
    end_date date default null,
	foreign key(address_id) 
		REFERENCES address(address_id),
    primary key(employee_id)
);

CREATE TABLE country
(
	country_id int not null AUTO_INCREMENT,
	country_name varchar(50) not null,
    primary key(country_id)
);

CREATE TABLE city
(
	city_id int not null AUTO_INCREMENT,
	city_name varchar(50) not null,
    country_id int not null,
	foreign key(country_id) 
		REFERENCES country(country_id),
    primary key(city_id)
);

CREATE TABLE address
(
	address_id int not null AUTO_INCREMENT,
	address varchar(50) not null,
    city_id int not null,
    postal_code varchar(50) not null,
	foreign key(city_id) 
		REFERENCES city(city_id),
    primary key(address_id)
);

CREATE TABLE salarys
(
	salarys_id int not null AUTO_INCREMENT,
	employee_id int not null,
	n_year year not null,
    n_month tinyint,
    n_hours smallint,
    per_hour smallint,
	foreign key(employee_id) 
		REFERENCES employee(employee_id),
    primary key(salarys_id)
);

CREATE TABLE customer
(
	customer_id int not null AUTO_INCREMENT,
	first_name varchar(50) not null,
    last_name varchar(50) not null,
    mobilephone varchar(15) not null,
    landLinePhone varchar(15) not null,
    address_id int not null,
	join_date date,
	foreign key(address_id) 
		REFERENCES address(address_id),
    primary key(customer_id)
);

CREATE TABLE shipping_company
(
	company_id int not null AUTO_INCREMENT,
    company_name varchar(50),
    shipping_method varchar(50),
    primary key(company_id)
);

CREATE TABLE orders
(
	order_id int not null AUTO_INCREMENT,
    customer_id int not null,
    date_ordered date not null,
    date_fulfilled date,
    employee_id int not null,
    payment_method enum('credit card' , 'bit' , 'transfer' , 'cash') not null,
    total_price int not null,
    order_status enum('in progress' , 'in transit','canceled','success') not null,
    foreign key(customer_id) 
		REFERENCES customer(customer_id),
	foreign key(employee_id) 
		REFERENCES employee(employee_id),
    primary key(order_id)
);

CREATE TABLE shipments
(
	shipment_id int not null AUTO_INCREMENT,
    order_id int not null,
    company_id int not null,
    address_id int not null,
	foreign key(order_id) 
		REFERENCES orders(order_id),
	foreign key(company_id) 
		REFERENCES shipping_company(company_id),
	foreign key(address_id) 
		REFERENCES address(address_id),
    primary key(shipment_id)
);

-- CREATE TABLE shipped_item
-- (
-- 	item_id int not null AUTO_INCREMENT,
--    shipment_id int not null,
--    inventory_id int not null,
--    quantity tinyint not null,
-- 	foreign key(shipment_id) 
-- 		REFERENCES shipments(shipment_id),
-- 	foreign key(inventory_id) 
-- 		REFERENCES inventory(inventory_id),
--    primary key(item_id)
-- );

CREATE TABLE ordered_books
(
	ob_id int not null AUTO_INCREMENT,
    order_id int not null,
    inventory_id int not null,
    quantity tinyint not null,
	foreign key(order_id) 
		REFERENCES orders(order_id),
	foreign key(inventory_id) 
		REFERENCES inventory(inventory_id),
    primary key(ob_id)
);
alter table ordered_books drop quantity;

CREATE TABLE inventory
(
	inventory_id int not null AUTO_INCREMENT,
	book_id int not null,
	quantity int not null,
	insert_date date not null,
    sell_price int not null,
    buy_price int not null,
	foreign key(book_id) 
		REFERENCES books(book_id),
    primary key(inventory_id)
);

CREATE TABLE payments
(
	payments_id int not null AUTO_INCREMENT,
	payments_type enum('rent','building tax','water','electricity','landline charge','mobile charge',
    'Israel post deliveries','Xpress deliveries','salarys','other') not null,
	_month tinyint not null,
	_year int not null,
    amount int not null,
    primary key(payments_id)
);

CREATE TABLE book_translations
(
	translation_id int not null AUTO_INCREMENT,
	_language varchar(50) not null,
    book_id int not null,
	foreign key(book_id) 
		REFERENCES books(book_id),
    primary key(translation_id)
);


















