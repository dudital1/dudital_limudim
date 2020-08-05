#include "database.h"

MySQL :: MySQL()
{
    connect = mysql_init(NULL);
    if ( !connect )
    {
        cout << "MySQL Initialization Failed";
    }   

    connect = mysql_real_connect(connect, SERVER, USER, PASSWORD, DATABASE, 0,NULL,0);
    
    if ( connect )
    {
        cout << "Connection Succeeded\n\n";
    }
    
    else
    {
        cout << "Connection Failed\n";
    }
}


MySQL :: ~MySQL()
{
    mysql_close (connect);
}

void MySQL::Search_Book_by_name()
{
	/** Add MySQL Query */
	cout << "please enter book name:" << endl;
	string name;
	cin.ignore();
	std::getline(cin, name);
	string query = "select book_name from books,inventory where books.book_id = inventory.book_id AND books.book_name ='" + name + "'";
	mysql_query(connect,query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set) , num_rows = mysql_num_rows(res_set);

	if (num_rows == 0)
	{
		cout << "book not found"<<endl;
		system("pause");
		return;
	}
	while (((row = mysql_fetch_row(res_set)) != NULL)) {
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "NULL");
		}
		cout << endl;
	}
	system("pause");
}
void MySQL::Search_Book_by_author_name()
{
	/** Add MySQL Query */
	string author_Fname, author_Lname;
	cout << "please enter author first name:" << endl;
	cin.ignore();
	std::getline(cin, author_Fname);
	cout << "please enter author last name:" << endl;
	cin.ignore();
	std::getline(cin, author_Lname);
	string query = "select books.book_name from books, inventory, author where author.author_id = books.author_id "
		"and books.book_id = inventory.inventory_id and author.first_name ='" + author_Fname + "'and author.last_name ='"+ author_Lname + "'";
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set);
	while (((row = mysql_fetch_row(res_set)) != NULL)) {
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "NULL");
		}
		cout << endl;
	}
	system("pause");
}

void MySQL::oldest_customer()
{
	/** Add MySQL Query */

	string query = "select first_name,last_name,mobilephone,landLinePhone,address,city_name,country_name,join_date "
		"from customer, address, city, country order by join_date asc limit 1";
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set);
	while (((row = mysql_fetch_row(res_set)) != NULL)) {
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "NULL");
		}
		cout << endl;
	}
	system("pause");
}

void MySQL::oldest_book()
{
	/** Add MySQL Query */

	string query = "select book_name,insert_date,sell_price as store_price,buy_price,book_condition "
		"from inventory, books order by insert_date limit 1";
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set);
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "NULL");
		}
		cout << endl;
	}
	system("pause");
}


void MySQL::current_orders()
{
	/** Add MySQL Query */

	string query = "select order_id as order_number,first_name as customer_Fname,last_name as customer_Lname,date_ordered,payment_method,total_price as price,order_status "
		"from orders join customer on orders.customer_id = customer.customer_id where date_fulfilled is null order by date_ordered asc;";
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set);
	for (int i = 0; i < num_fields; i++)
	{
		printf("|%-20s", fields[i].name);
	}
	cout <<endl<<"--------------------------------------------------------------------------------------------------------------------------------------------"<< endl;
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%-20s", row[i] ? row[i] : "NULL");
		}
		cout << endl;

	}
	system("pause");
}

void MySQL::how_many_sold()
{
	/** Add MySQL Query */
	cout << "please enter book name:" << endl;
	string name;
	cin.ignore();
	std::getline(cin, name);
	string query = "SELECT count(ordered_books.inventory_id) as amount FROM ordered_books JOIN orders join inventory join books ON ordered_books.order_id = orders.order_id "
		"and inventory.inventory_id = ordered_books.inventory_id and books.book_id = inventory.book_id where orders.order_status = 'success' and book_name = '"+ name +"'";
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set);
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "NULL");
		}
		cout << endl;
	}
	system("pause");
}

void MySQL::popular_author_between_dates()
{
	/** Add MySQL Query */
	string from, to;
	cout << "from:(year-month-day)" << endl;
	cin.ignore();
	std::getline(cin, from);
	cout << "to:(year-month-day)" << endl;
	cin.ignore();
	std::getline(cin, to);
	string query = "select author.first_name,author.last_name "
		"from author "
		"join books "
		"on books.author_id = author.author_id "
	"where books.book_id = (select inventory.book_id "
	"from inventory "
	"where inventory.inventory_id = (select max(ordered_books.inventory_id) "
		"from orders "
		"join ordered_books "
		"on orders.order_id = ordered_books.order_id "
	"where orders.date_ordered >= '"+ from + "' "
		"and orders.date_ordered <= '"+ to +"' "
		"and orders.order_status = 'success'))";
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set),num_rows = mysql_num_rows(res_set);

	if (num_rows == 0)
	{
		cout << "no records found" << endl;
		system("pause");
		return;
	};
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "NULL");
		}
		cout << endl;
	}
	system("pause");
}

void MySQL::loyal_customers()
{
	/** Add MySQL Query */
	string query = "select first_name,last_name,count(ordered_books.inventory_id) as amount "
		"from customer "
		"join orders "
		"join ordered_books "
		"on customer.customer_id = orders.customer_id "
		"and ordered_books.order_id = orders.order_id "
		"group by customer.first_name "
		"order by count(orders.order_id) desc limit 3";
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set);
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "NULL");
		}
		cout << endl;
	}
	system("pause");
}


void MySQL::most_translations()
{
	/** Add MySQL Query */
	string query = "select book_name, count(book_translations.book_id) as amount "
		"from books "
		"join book_translations "
		"on books.book_id = book_translations.book_id "
		"group by book_translations.book_id "
		"limit 1";
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set);
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "NULL");
		}
		cout << endl;
	}
	system("pause");
}


void MySQL::purchase_history_by_customer()
{
	/** Add MySQL Query */
	string customer_Fname, customer_Lname;
	cout << "please enter customer first name:" << endl;
	cin.ignore();
	std::getline(cin, customer_Fname);
	cout << "please enter customer last name:" << endl;
	cin.ignore();
	std::getline(cin, customer_Lname);
	string query = "select book_name,date_ordered,sell_price as price "
		"from ordered_books "
		"join orders "
		"join customer "
		"join inventory "
		"join books "
		"on ordered_books.order_id = orders.order_id "
		"and orders.customer_id = customer.customer_id "
		"and inventory.inventory_id = ordered_books.order_id "
		"and inventory.book_id = books.book_id "
		"where orders.order_status = 'success' "
		"and customer.first_name = '" +customer_Fname+ "' "
		"and customer.last_name = '" + customer_Lname + "' "
		"order by date_ordered";
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set), num_rows = mysql_num_rows(res_set);
	if (num_rows == 0)
	{
		cout << "no records found" << endl;
		system("pause");
		return;
	}
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "NULL");
		}
		cout << endl;
	}
	system("pause");
}

void MySQL::orders_history_by_customer()
{
	/** Add MySQL Query */
	string customer_Fname, customer_Lname;
	cout << "please enter customer first name:" << endl;
	cin.ignore();
	std::getline(cin, customer_Fname);
	cout << "please enter customer last name:" << endl;
	cin.ignore();
	std::getline(cin, customer_Lname);
	cout << endl;
	string query = "select first_name,last_name,book_name,publisher,date_ordered,date_fulfilled,payment_method,total_price,order_status "
		"from customer "
		"join orders "
		"join ordered_books "
		"join inventory "
		"join books "
		"join publisher "
		"on orders.customer_id = customer.customer_id "
		"and orders.order_id = ordered_books.order_id "
		"and inventory.inventory_id = ordered_books.inventory_id "
		"and books.book_id = inventory.book_id "
		"and publisher.publisher_id = books.publisher_id "
		"where customer.first_name = '"+customer_Fname+"' "
		"and customer.last_name = '"+customer_Lname+"' "
		"order by date_ordered desc";
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set), num_rows = mysql_num_rows(res_set);
	if (num_rows == 0)
	{
		cout << "no records found" << endl;
		system("pause");
		return;
	}
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "NULL");
		}
		cout << endl;
	}
	system("pause");
}


void MySQL::shipping_price()
{
	/** Add MySQL Query */
	string  shipment_id;
	cout << "please enter order id:" << endl;
	cin.ignore();
	std::getline(cin, shipment_id);
	string query = "select weight as grams_weight,shipping_method from books "
		"join inventory "
		"join ordered_books "
		"join orders "
		"join shipments "
		"join shipping_company "
		"on inventory.book_id = books.book_id "
		"and ordered_books.inventory_id = inventory.inventory_id "
		"and ordered_books.order_id = orders.order_id "
		"and shipments.order_id = orders.order_id "
		"and shipping_company.company_id = shipments.company_id "
		"where orders.order_id ="+ shipment_id +
		" group by orders.order_id";
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set), num_rows = mysql_num_rows(res_set);
	if (num_rows == 0)
	{
		cout << "no records found" << endl;
		system("pause");
		return;
	}
	int i = 0;
	float ship_coefficient=0;
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "NULL");
			
		}
		if (row[1] != NULL && row[0] != NULL) {
			if (!strcmp(row[1], "Registered mail"))
				ship_coefficient = 0.001;
			if (!strcmp(row[1], "Courier service"))
				ship_coefficient = 0.003;
			if (!strcmp(row[1], "Fasr Courier service"))
				ship_coefficient = 0.005;
			if (!strcmp(row[1], "Pick up"))
				ship_coefficient = 0.004;
			if (!strcmp(row[1], "home delivery"))
				ship_coefficient = 0.01;
			cout << "|shipping price: " <<atoi(row[0]) * ship_coefficient<< " $"<<endl;
		}

	}
	system("pause");
}



void MySQL::is_slplitted()
{
	string customer_Fname, customer_Lname;
	cout << "please enter customer first name:" << endl;
	cin.ignore();
	std::getline(cin, customer_Fname);
	cout << "please enter customer last name:" << endl;
	cin.ignore();
	std::getline(cin, customer_Lname);
	string query = "select orders.order_id,orders.date_ordered,orders.date_fulfilled,orders.order_status,orders.total_price,orders.payment_method "
		"from orders "
		"join customer "
		"join shipments "
		"on orders.customer_id = customer.customer_id "
		"and shipments.order_id = orders.order_id "
		"where customer.first_name = '"+customer_Fname+"' "
		"and customer.last_name = '"+customer_Lname+"' "
		"group by orders.order_id "
		"having count(shipments.shipment_id) > 1;";
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set), num_rows = mysql_num_rows(res_set);
	if (num_rows == 0)
	{
		cout << "no records found" << endl;
		system("pause");
		return;
	}
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "NULL");
		}
		cout << endl;
	}
	system("pause");
}

void MySQL::order_status()
{
	string order_id;
	cout << "please enter order id:" << endl;
	cin.ignore();
	std::getline(cin, order_id);
	string query = "select order_status from orders where order_id="+order_id;
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set), num_rows = mysql_num_rows(res_set);
	if (num_rows == 0)
	{
		cout << "no records found" << endl;
		system("pause");
		return;
	}
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "NULL");
		}
		cout << endl;
	}
	system("pause");
}

void MySQL::shipments_by_xpress()
{
	string month,year;
	cout << "please enter year:" << endl;
	cin.ignore();
	std::getline(cin, year);
	cout << "please enter month:" << endl;
	cin.ignore();
	std::getline(cin, month);
	string query = "select sum(total_price) as total_price from orders join shipments join shipping_company "
		"on orders.order_id = shipments.order_id "
		"and shipments.company_id = shipping_company.company_id "
		"where orders.order_status = 'success' "
		"and company_name = 'Xpress' "
		"and month(orders.date_ordered) ="+month+
		" and year(orders.date_ordered) =" +year;
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set), num_rows = mysql_num_rows(res_set);
	if (num_rows == 0)
	{
		cout << "no records found" << endl;
		system("pause");
		return;
	}
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "No Records");
		}
		cout << endl;
	}
	system("pause");
}


void MySQL::bit_transactions()
{
	string month, year;
	cout << "please enter year:" << endl;
	cin.ignore();
	std::getline(cin, year);
	cout << "please enter month:" << endl;
	cin.ignore();
	std::getline(cin, month);
	string query = "select sum(total_price) "
		"from orders "
		"where payment_method = 'bit' "
		"and order_status = 'success' "
		"and month(orders.date_ordered) =" + month +
		" and year(orders.date_ordered) =" + year;
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set), num_rows = mysql_num_rows(res_set);
	if (num_rows == 0)
	{
		cout << "no records found" << endl;
		system("pause");
		return;
	}
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "No Records");
		}
		cout << endl;
	}
	system("pause");
}


void MySQL::above_average_last_year()
{
	string query = "select orders.order_id,orders.date_ordered,orders.payment_method,orders.total_price " 
		"from orders join ordered_books "
		"join inventory "
		"on inventory.inventory_id = ordered_books.inventory_id "
		"and ordered_books.order_id = orders.order_id "
		"where(sell_price - buy_price) > "
		"( "
		"	SELECT avg(sell_price - buy_price) FROM orders join inventory join ordered_books "
		"	on inventory.inventory_id = ordered_books.inventory_id "
		"	and ordered_books.order_id = orders.order_id "
		"where DATEDIFF(curdate(), date_ordered) <= 365 "
		")";
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set);
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "No Records");
		}
		cout << endl;
	}
	system("pause");
}


void MySQL::shipments_by_company()
{
	string query = "select company_name,count(shipments.shipment_id) as amount "
		"from orders join shipments join shipping_company "
		"on orders.order_id = shipments.order_id "
		"and shipments.company_id = shipping_company.company_id "
		"where DATEDIFF(curdate(), date_ordered) <= 365 "
		"group by company_name";
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set);
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "No Records");
		}
		cout << endl;
	}
	system("pause");
}

void MySQL::unactive_customers()
{
	string query = "select customer.customer_id,first_name,last_name,mobilephone,landLinePhone from customer "
		"join orders "
		"on orders.customer_id = customer.customer_id "
		"where customer.customer_id "
		"in "
		"( "
		"	select customer.customer_id "
		"	from orders "
		"	join customer "
		"	on customer.customer_id = orders.customer_id "
		"where order_status = 'success' "
		"and DATEDIFF(curdate(), date_fulfilled) >= 730"
		" ) "
		"and DATEDIFF(curdate(), date_fulfilled) <= 730";
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set);
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "No Records");
		}
		cout << endl;
	}
	system("pause");
}




void MySQL::store_purchase_between_dates()
{
	string D1, D2;
	cout << "please enter date from:(year-month-day)" << endl;
	cin.ignore();
	std::getline(cin, D1);
	cout << "please enter date to:(year-month-day)" << endl;
	cin.ignore();
	std::getline(cin, D2);
	string query = "select count(inventory_id) as amount ,sum(buy_price) as total_price " 
		"from inventory "
		"where insert_date >= '"+D1+"' "						//2013-01-01
		"and insert_date <= '"+D2+"'";							//2020-01-01
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set), num_rows = mysql_num_rows(res_set);
	if (num_rows == 0)
	{
		cout << "no records found" << endl;
		system("pause");
		return;
	}
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "No Records");
		}
		cout << endl;
	}
	system("pause");
}


void MySQL::earning_by_month()
{
	string month, year;
	cout << "please enter year:" << endl;
	cin.ignore();
	std::getline(cin, year);
	cout << "please enter month:" << endl;
	cin.ignore();
	std::getline(cin, month);
	string query = "select "
		"(select sum(total_price) from orders where month(date_ordered) = '"+ month +"' and year(date_ordered) = '"+ year +"') "
		"-"
		"(select sum(buy_price) from inventory where month(insert_date) = '"+ month +"' and year(insert_date) = '"+ year +"') "
		"as earnings";
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set), num_rows = mysql_num_rows(res_set);
	if (num_rows == 0)
	{
		cout << "no records found" << endl;
		system("pause");
		return;
	}
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "No Records");
		}
		cout << endl;
	}
	system("pause");
}

void MySQL::employee_salary_by_month()
{
	string month, year,employee_Fname,employee_Lname;
	cout << "please enter employee first name:" << endl;
	cin.ignore();
	std::getline(cin, employee_Fname);
	cout << "please enter employee last name:" << endl;
	cin.ignore();
	std::getline(cin, employee_Lname);
	cout << "please enter year:" << endl;
	cin.ignore();
	std::getline(cin, year);
	cout << "please enter month:" << endl;
	cin.ignore();
	std::getline(cin, month);
	string query = "select salarys.n_hours * salarys.per_hour as salary "
		"from salarys "
		"join employee "
		"on salarys.employee_id = employee.employee_id "
		"where employee.first_name = '"+employee_Fname+"' "
		"and employee.last_name = '"+employee_Lname+"' "
		"and salarys.n_month = " + month +
		" and salarys.n_year = " + year;
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set), num_rows = mysql_num_rows(res_set);
	if (num_rows == 0)
	{
		cout << "no records found" << endl;
		system("pause");
		return;
	}
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "No Records");
		}
		cout << endl;
	}
	system("pause");
}

void MySQL::outstanding_emploee()
{
	string month, year;
	cout << "please enter year:" << endl;
	cin.ignore();
	std::getline(cin, year);
	cout << "please enter month:" << endl;
	cin.ignore();
	std::getline(cin, month);
	string query = "select first_name,last_name,count(orders.order_id) as amount "
		"from employee "
		"join orders "
		"on employee.employee_id = orders.employee_id "
		"where month(orders.date_ordered) = "+month+
		" and year(orders.date_ordered) ="+year+
		" group by orders.employee_id "
		"limit 1";
	mysql_query(connect, query.c_str());
	res_set = mysql_store_result(connect);
	fields = mysql_fetch_fields(res_set);
	unsigned int num_fields = mysql_num_fields(res_set), num_rows = mysql_num_rows(res_set);
	if (num_rows == 0)
	{
		cout << "no records found" << endl;
		system("pause");
		return;
	}
	while (((row = mysql_fetch_row(res_set)) != NULL))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("|%s : %s\n", fields[i].name, row[i] ? row[i] : "No Records");
		}
		cout << endl;
	}
	system("pause");
}







