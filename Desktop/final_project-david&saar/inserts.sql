-- publishers inserts
INSERT INTO publisher (publisher) VALUES ('Penguin Random House');
INSERT INTO publisher (publisher) VALUES ('Hachette Livre');
INSERT INTO publisher (publisher) VALUES ('HarperCollins');
INSERT INTO publisher (publisher) VALUES ('Macmillan Publishers');
INSERT INTO publisher (publisher) VALUES ('Simon & Schuster');
INSERT INTO publisher (publisher) VALUES ('Springer Nature');
INSERT INTO publisher (publisher) VALUES ('John Wiley & Sons');
INSERT INTO publisher (publisher) VALUES ('Oxford University Press');
INSERT INTO publisher (publisher) VALUES ('Kodansha');
INSERT INTO publisher (publisher) VALUES ('Egmont Books');
select * from publishers;

-- country inserts
insert into country (country_name) values ('Israel');
insert into country (country_name) values ('United States');
insert into country (country_name) values ('England');
insert into country (country_name) values ('Scotland');
insert into country (country_name) values ('Spain');
insert into country (country_name) values ('France');
insert into country (country_name) values ('Germany');
insert into country (country_name) values ('Greece');
insert into country (country_name) values ('Italy');
insert into country (country_name) values ('Portugal');
select * from country;

-- author inserts
INSERT INTO author (first_name,last_name) VALUES ('Joanne', 'Rowling');
INSERT INTO author (first_name,last_name) VALUES ('George', 'Martin');
INSERT INTO author (first_name,last_name) VALUES ('Herman', 'Melville');
INSERT INTO author (first_name,last_name) VALUES ('Vladimir', 'Nabokov');
INSERT INTO author (first_name,last_name) VALUES ('Lewis', 'Carroll');
INSERT INTO author (first_name,last_name) VALUES ('Virginia', 'Woolf');
INSERT INTO author (first_name,last_name) VALUES ('Jonathan', 'Swift');
INSERT INTO author (first_name,last_name) VALUES ('J. R. R.', 'Tolkien');
INSERT INTO author (first_name,last_name) VALUES ('Miguel', 'Cervantes');
INSERT INTO author (first_name,last_name) VALUES ('Daniel', 'Defoe');
select * from author;

-- city inserts
insert into city (city_name , country_id) values ('Tel-Aviv' , 21);
insert into city (city_name , country_id) values ('Holon' , 21);
insert into city (city_name , country_id) values ('Liverpool' , 23);
insert into city (city_name , country_id) values ('London' , 23);
insert into city (city_name , country_id) values ('New-York' , 22);
insert into city (city_name , country_id) values ('Paris' , 26);
insert into city (city_name , country_id) values ('edinburgh', 24);
insert into city (city_name , country_id) values ('Madrid' , 25);
insert into city (city_name , country_id) values ('Milano' , 29);
insert into city (city_name , country_id) values ('Rome' , 29);
select * from city;

-- address inserts
INSERT INTO address (address,city_id,postal_code)
 VALUES ('Katz' , 22 , 10234);
INSERT INTO address (address,city_id,postal_code)
 VALUES ('Katz' , 23 ,12345);
INSERT INTO address (address,city_id,postal_code)
 VALUES ('Oxford' , 24,23456);
INSERT INTO address (address,city_id,postal_code)
 VALUES ('King-David' , 24 ,34567);
INSERT INTO address (address,city_id,postal_code)
 VALUES ('Oxford' , 25 ,45678);
INSERT INTO address (address,city_id,postal_code)
 VALUES ('Fifth Avenue' , 26 ,56789);
INSERT INTO address (address,city_id,postal_code)
 VALUES ('Elysees Avenue' , 27 ,67890);
INSERT INTO address (address,city_id,postal_code)
 VALUES ('Gran via' , 29 ,78901);
INSERT INTO address (address,city_id,postal_code)
 VALUES ('Corso Venezia' , 30 ,89012);
INSERT INTO address (address,city_id,postal_code)
 VALUES ('Via del Corso' , 31 ,90123);
select * from address;

-- books inserts
INSERT INTO books (book_name,author_id,publisher_id,publish_date,translator,weight,num_pages) 
VALUES ('Harry Potter and the Philosopher\'s Stone',21,11,'1997-06-26','Matthew Fitt',600,336);
INSERT INTO books (book_name,author_id,publisher_id,publish_date,weight,num_pages)
 VALUES ('A Dance with Dragons',22,12,'2001-07-01',1015,1056);
INSERT INTO books (book_name,author_id,publisher_id,publish_date,translator,weight,num_pages) 
VALUES ('Moby Dick',23,13,'1851-10-18','Rami Four',970,927);
INSERT INTO books (book_name,author_id,publisher_id,publish_date,weight,num_pages) 
VALUES ('Lolita',24,14,'1955-01-01',600,336);
INSERT INTO books (book_name,author_id,publisher_id,publish_date,translator,weight,num_pages) 
VALUES ('Alice\'s Adventures in Wonderland',25,14,'1865-11-26','Fiterson Joe',490,310);
INSERT INTO books (book_name,author_id,publisher_id,publish_date,translator,weight,num_pages) 
VALUES ('To the Lighthouse',26,16,'1927-05-25','Nigel Nicolson',450,320);
INSERT INTO books (book_name,author_id,publisher_id,publish_date,weight,num_pages) 
VALUES ('Gulliver\'s Travelse',27,16,'1726-10-28',572,350);
INSERT INTO books (book_name,author_id,publisher_id,publish_date,weight,num_pages) 
VALUES ('The Hobbit',28,17,'1937-09-21',580,310);
INSERT INTO books (book_name,author_id,publisher_id,publish_date,weight,num_pages) 
VALUES ('The Two Towers',28,17,'1954-11-11',643,352);
INSERT INTO books (book_name,author_id,publisher_id,publish_date,translator,weight,num_pages) 
VALUES ('Don Quijote',29,18,'1620-01-01','Thomas Shelton',1100,863);
INSERT INTO books (book_name,author_id,publisher_id,publish_date,weight,num_pages)
 VALUES ('Robinson Crusoe',30,19,'1719-04-25',400,280);
INSERT INTO books (book_name,author_id,publisher_id,publish_date,weight,num_pages)
 VALUES ('Robinson Crusoe',30,17,'1719-04-25',400,285);
select * from books;


-- employee inserts
INSERT INTO employee (first_name,last_name,mobilephone,address_id,start_date) 
VALUES ('Saar','Pernik','0543333333',1,'2017-07-07');
INSERT INTO employee (first_name,last_name,mobilephone,address_id,start_date) 
VALUES ('David','Tal','0542222222',2,'2019-08-07');
INSERT INTO employee (first_name,last_name,mobilephone,address_id,start_date,end_date) 
VALUES ('Jhoni','Kobani','05413131313',3,'2020-03-01','2020-03-01');
INSERT INTO employee (first_name,last_name,mobilephone,address_id,start_date) 
VALUES ('Daliat','Elkarmel','0541234333',4,'2019-01-03');
INSERT INTO employee (first_name,last_name,mobilephone,address_id,start_date) 
VALUES ('Aviv','Tel','0543336754',5,'2017-10-02');
INSERT INTO employee (first_name,last_name,mobilephone,address_id,start_date) 
VALUES ('Sofi','Tsdaka','0543589233',6,'2015-07-07');
INSERT INTO employee (first_name,last_name,mobilephone,address_id,start_date,end_date) 
VALUES ('Moshe','Datz','0549384752',7,'2014-07-07','2017-01-01');
INSERT INTO employee (first_name,last_name,mobilephone,address_id,start_date) 
VALUES ('Yossi','Levi','0543764833',8,'2019-06-07');
INSERT INTO employee (first_name,last_name,mobilephone,address_id,start_date,end_date) 
VALUES ('Dov','Klien','0528743333',9,'2017-07-07','2019-03-01');
INSERT INTO employee (first_name,last_name,mobilephone,address_id,start_date) 
VALUES ('Sarit','Hadad','0506533333',10,'2016-07-07');
INSERT INTO employee (first_name,last_name,mobilephone,address_id,start_date,end_date)
 VALUES ('Koby','Peretz','0503241543',2,'2017-07-07','2020-03-01');
INSERT INTO employee (first_name,last_name,mobilephone,address_id,start_date,end_date) 
VALUES ('Shoshi','Hason','0527654327',5,'2017-07-07','2020-03-01');
select * from employee;

-- shipping_company inserts
INSERT INTO shipping_company (company_name,shipping_method) VALUES ('Israel Post' , 'Courier service');
INSERT INTO shipping_company (company_name,shipping_method) VALUES ('Israel Post' , 'Fasr Courier service');
INSERT INTO shipping_company (company_name,shipping_method) VALUES ('Israel Post' , 'Registered mail');
INSERT INTO shipping_company (company_name,shipping_method) VALUES ('Xpress' , 'home delivery');
INSERT INTO shipping_company (company_name,shipping_method) VALUES ('Xpress' , 'Pick up');
select * from shipping_company;

-- customer inserts
INSERT INTO customer (first_name,last_name,mobilephone,landLinePhone,address_id,join_date) 
VALUES ('Sasi','Shemesh','0542134567','03-7689542',1,'2017-07-07');
INSERT INTO customer (first_name,last_name,mobilephone,landLinePhone,address_id,join_date) 
VALUES ('Andi','Ram','0542543267','03-7610672',1,'2014-11-05');
INSERT INTO customer (first_name,last_name,mobilephone,landLinePhone,address_id,join_date) 
VALUES ('Dani','Avdia','0549537567','03-7612342',1,'2015-12-04');
INSERT INTO customer (first_name,last_name,mobilephone,landLinePhone,address_id,join_date) 
VALUES ('Omry','Caspi','0542134567','03-7643242',1,'2018-08-27');
INSERT INTO customer (first_name,last_name,mobilephone,landLinePhone,address_id,join_date) 
VALUES ('Tiger','Woods','0526544567','03-7654342',1,'2019-10-17');
INSERT INTO customer (first_name,last_name,mobilephone,landLinePhone,address_id,join_date) 
VALUES ('Michael','Jordan','0508674567','03-7687562',1,'2020-07-18');
INSERT INTO customer (first_name,last_name,mobilephone,landLinePhone,address_id,join_date) 
VALUES ('Gal','Fridman','0542126845','03-7698732',1,'2020-06-13');
INSERT INTO customer (first_name,last_name,mobilephone,landLinePhone,address_id,join_date)
 VALUES ('Arik','Zeevi','0542047560','03-7456742',1,'2019-02-12');
INSERT INTO customer (first_name,last_name,mobilephone,landLinePhone,address_id,join_date)
 VALUES ('Yarden','Jerbi','0542654132','03-7682342',1,'2018-03-21');
INSERT INTO customer (first_name,last_name,mobilephone,landLinePhone,address_id,join_date)
 VALUES ('Noa','Kirel','0542056713','03-7676122',1,'2016-01-01');
select * from customer;

-- salarys inserts
INSERT INTO salarys (employee_id ,n_year ,n_month,n_hours,per_hour )
 VALUES (1,2018,10,180,25);
INSERT INTO salarys (employee_id ,n_year ,n_month,n_hours,per_hour )
 VALUES (1,2018,11,160,25);
INSERT INTO salarys (employee_id ,n_year ,n_month,n_hours,per_hour )
 VALUES (1,2018,12,167,25);
INSERT INTO salarys (employee_id ,n_year ,n_month,n_hours,per_hour )
 VALUES (2,2019,8,177,35);
 INSERT INTO salarys (employee_id ,n_year ,n_month,n_hours,per_hour )
 VALUES (2,2019,9,157,35);
 INSERT INTO salarys (employee_id ,n_year ,n_month,n_hours,per_hour )
 VALUES (3,2019,4,180,42);
 INSERT INTO salarys (employee_id ,n_year ,n_month,n_hours,per_hour )
 VALUES (3,2019,5,180,48);
  INSERT INTO salarys (employee_id ,n_year ,n_month,n_hours,per_hour )
 VALUES (4,2019,1,130,22);
 INSERT INTO salarys (employee_id ,n_year ,n_month,n_hours,per_hour )
 VALUES (5,2017,2,140,68);
INSERT INTO salarys (employee_id ,n_year ,n_month,n_hours,per_hour )
 VALUES (5,2017,3,160,68);
 INSERT INTO salarys (employee_id ,n_year ,n_month,n_hours,per_hour )
 VALUES (6,2016,2,140,68);
INSERT INTO salarys (employee_id ,n_year ,n_month,n_hours,per_hour )
 VALUES (6,2016,3,160,68);
  INSERT INTO salarys (employee_id ,n_year ,n_month,n_hours,per_hour )
 VALUES (7,2015,2,140,58);
INSERT INTO salarys (employee_id ,n_year ,n_month,n_hours,per_hour )
 VALUES (7,2015,3,160,58);
 select * from salarys;
 
 -- inventory inserts
 INSERT INTO inventory (book_id,insert_date,sell_price,buy_price,book_condition) VALUES (1,'2017-04-01',120,50,'new');
INSERT INTO inventory (book_id,insert_date,sell_price,buy_price,book_condition) VALUES (1,'2017-04-01',100,50,'like new');
INSERT INTO inventory (book_id,insert_date,sell_price,buy_price,book_condition) VALUES (3,'2019-04-01',110,55,'good');
INSERT INTO inventory (book_id,insert_date,sell_price,buy_price,book_condition) VALUES (4,'2019-04-01',98,50,'new');
INSERT INTO inventory (book_id,insert_date,sell_price,buy_price,book_condition) VALUES (5,'2018-04-01',92,10,'new');
INSERT INTO inventory (book_id,insert_date,sell_price,buy_price,book_condition) VALUES (6,'2018-04-01',110,30,'like new');
INSERT INTO inventory (book_id,insert_date,sell_price,buy_price,book_condition) VALUES (7,'2017-04-01',105,40,'new');
INSERT INTO inventory (book_id,insert_date,sell_price,buy_price,book_condition) VALUES (2,'2017-04-01',98,50,'new');
INSERT INTO inventory (book_id,insert_date,sell_price,buy_price,book_condition) VALUES (6,'2018-04-01',92,10,'fair');
INSERT INTO inventory (book_id,insert_date,sell_price,buy_price,book_condition) VALUES (6,'2020-04-01',80,30,'poor');
INSERT INTO inventory (book_id,insert_date,sell_price,buy_price,book_condition) VALUES (7,'2020-04-01',105,40,'new');
INSERT INTO inventory (book_id,insert_date,sell_price,buy_price,book_condition) VALUES (11,'2018-02-01',80,20,'poor');
INSERT INTO inventory (book_id,insert_date,sell_price,buy_price,book_condition) VALUES (12,'2018-01-01',100,40,'new');
select * from inventory;
 
-- payments inserts
INSERT INTO payments (payments_type,_month,_year,amount) VALUES ('rent',10,2017,4030);
 INSERT INTO payments (payments_type,_month,_year,amount) VALUES ('building tax',10,2017,1500);
INSERT INTO payments (payments_type,_month,_year,amount) VALUES ('water',10,2017,600);
 INSERT INTO payments (payments_type,_month,_year,amount) VALUES ('electricity',10,2017,1790);
 INSERT INTO payments (payments_type,_month,_year,amount) VALUES ('landline charge',10,2017,70);
 INSERT INTO payments (payments_type,_month,_year,amount) VALUES ('mobile charge',10,2017,120);
INSERT INTO payments (payments_type,_month,_year,amount) VALUES ('Israel post deliveries',10,2017,6000);
 INSERT INTO payments (payments_type,_month,_year,amount) VALUES ('Xpress deliveries',10,2017,3600);
 INSERT INTO payments (payments_type,_month,_year,amount) VALUES ('salarys',10,2017,89000);
 INSERT INTO payments (payments_type,_month,_year,amount) VALUES ('other',10,2017,980);
INSERT INTO payments (payments_type,_month,_year,amount) VALUES ('other',12,2014,15000);
 INSERT INTO payments (payments_type,_month,_year,amount) VALUES ('building tax',12,2014,1200);
 INSERT INTO payments (payments_type,_month,_year,amount) VALUES ('rent',12,2014,3130);
 INSERT INTO payments (payments_type,_month,_year,amount) VALUES ('water',12,2014,50);
 select * from payments;
 
 
 -- orders inserts
 INSERT INTO orders (customer_id,date_ordered,employee_id,payment_method,total_price,order_status) 
 VALUES(1,'2020-03-03',1,'bit',250,'in progress');
INSERT INTO orders (customer_id,date_ordered,date_fulfilled,employee_id,payment_method,total_price,order_status) 
 VALUES(4,'2020-01-05','2020-01-08',1,'bit',70,'success');
INSERT INTO orders (customer_id,date_ordered,employee_id,payment_method,total_price,order_status)
 VALUES(2,'2020-07-10',1,'bit',200,'in progress');
INSERT INTO orders (customer_id,date_ordered,date_fulfilled,employee_id,payment_method,total_price,order_status)
 VALUES(5,'2020-01-03','2020-03-03',2,'cash',120,'success');
INSERT INTO orders (customer_id,date_ordered,employee_id,payment_method,total_price,order_status) 
VALUES(9,'2020-06-23',4,'bit',130,'in transit');
INSERT INTO orders (customer_id,date_ordered,employee_id,payment_method,total_price,order_status) 
VALUES(10,'2020-07-24',5,'bit',90,'in progress');
INSERT INTO orders (customer_id,date_ordered,date_fulfilled,employee_id,payment_method,total_price,order_status)
 VALUES(6,'2019-08-03','2019-10-10',1,'credit card',220,'success');
INSERT INTO orders (customer_id,date_ordered,employee_id,payment_method,total_price,order_status)
 VALUES(8,'2020-04-04',4,'bit',150,'in progress');
INSERT INTO orders (customer_id,date_ordered,employee_id,payment_method,total_price,order_status)
 VALUES(7,'2020-06-23',5,'bit',300,'in transit');
INSERT INTO orders (customer_id,date_ordered,date_fulfilled,employee_id,payment_method,total_price,order_status)
 VALUES(2,'2019-12-20','2020-01-09',2,'bit',140,'success');
INSERT INTO orders (customer_id,date_ordered,date_fulfilled,employee_id,payment_method,total_price,order_status)
 VALUES(3,'2020-01-10','2020-03-10',1,'transfer',185,'canceled');
 select * from orders;
INSERT INTO orders (customer_id,date_ordered,date_fulfilled,employee_id,payment_method,total_price,order_status) 
 VALUES(3,'2017-03-03','2017-03-05',1,'bit',180,'success');
 select * from orders;
 
-- shipments inserts
 INSERT INTO shipments (order_id,company_id,address_id)
 VALUES(1,1,1);
  INSERT INTO shipments (order_id,company_id,address_id)
 VALUES(1,4,2);
  INSERT INTO shipments (order_id,company_id,address_id)
 VALUES(2,1,3);
  INSERT INTO shipments (order_id,company_id,address_id)
 VALUES(2,1,4);
  INSERT INTO shipments (order_id,company_id,address_id)
 VALUES(3,3,5);
  INSERT INTO shipments (order_id,company_id,address_id)
 VALUES(4,2,6);
   INSERT INTO shipments (order_id,company_id,address_id)
 VALUES(5,5,7);
  INSERT INTO shipments (order_id,company_id,address_id)
 VALUES(6,5,8);
  INSERT INTO shipments (order_id,company_id,address_id)
 VALUES(7,4,9);
   INSERT INTO shipments (order_id,company_id,address_id)
 VALUES(8,2,10);
 select * from shipments;
 
 
 -- ordered_books inserts
 INSERT INTO ordered_books(order_id,inventory_id)VALUES(1,1);
INSERT INTO ordered_books(order_id,inventory_id)VALUES(2,2);
INSERT INTO ordered_books(order_id,inventory_id)VALUES(2,2);
INSERT INTO ordered_books(order_id,inventory_id)VALUES(2,3);
INSERT INTO ordered_books(order_id,inventory_id)VALUES(3,4);
INSERT INTO ordered_books(order_id,inventory_id)VALUES(4,5);
INSERT INTO ordered_books(order_id,inventory_id)VALUES(5,6);
INSERT INTO ordered_books(order_id,inventory_id)VALUES(6,7);
INSERT INTO ordered_books(order_id,inventory_id)VALUES(7,8);
INSERT INTO ordered_books(order_id,inventory_id)VALUES(8,9);
INSERT INTO ordered_books(order_id,inventory_id)VALUES(9,10);
INSERT INTO ordered_books(order_id,inventory_id)VALUES(6,10);
INSERT INTO ordered_books(order_id,inventory_id)VALUES(3,10);
INSERT INTO ordered_books(order_id,inventory_id)VALUES(10,10);
INSERT INTO ordered_books(order_id,inventory_id)VALUES(10,11);
INSERT INTO ordered_books(order_id,inventory_id)VALUES(12,12);
INSERT INTO ordered_books(order_id,inventory_id)VALUES(12,13);
select * from ordered_books;
 
 
 INSERT INTO book_translations (_language,book_id) VALUES ('Hebrew', 1);
INSERT INTO book_translations (_language,book_id) VALUES ('Spanish', 1);
INSERT INTO book_translations (_language,book_id) VALUES ('Greek', 1);
INSERT INTO book_translations (_language,book_id) VALUES ('French', 1);
INSERT INTO book_translations (_language,book_id) VALUES ('Hebrew', 2);
INSERT INTO book_translations (_language,book_id) VALUES ('Spanish', 2);
INSERT INTO book_translations (_language,book_id) VALUES ('Greek', 3);
INSERT INTO book_translations (_language,book_id) VALUES ('French', 4);
INSERT INTO book_translations (_language,book_id) VALUES ('Hebrew', 5);
INSERT INTO book_translations (_language,book_id) VALUES ('Spanish', 6);
INSERT INTO book_translations (_language,book_id) VALUES ('Greek', 7);
INSERT INTO book_translations (_language,book_id) VALUES ('French', 8);
 
 
