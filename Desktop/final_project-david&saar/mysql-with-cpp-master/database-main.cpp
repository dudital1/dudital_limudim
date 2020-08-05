
/**-------------------------------------------------------------------
 *  Include required header files
 *------------------------------------------------------------------*/
 
#include "database.h"

void book_actions(MySQL& Mysql)
{

	char a = '\0';
	while (a != '6') {
		cout << "please choose action" << endl;
		cout << "1. search by book name" << endl << "2. search by author name" << endl;
		cout << "3. show oldest book" << endl << "4. show popular author between dates" << endl;
		cout << "5. show book with most translation languages" << endl << "6. go back" << endl;
		cin >> a;
		switch (a)
		{
		case '1':
			Mysql.Search_Book_by_name();
			break;
		case '2':
			Mysql.Search_Book_by_author_name();
			break;
		case '3':
			Mysql.oldest_book();
			break;
		case '4':
			Mysql.popular_author_between_dates();
			break;
		case '5':
			Mysql.most_translations();
			break;
		case '6':
			break;
		default:
			cout << "wrong input!" << endl;
		}
	}
	return;

	}




void orders_actions(MySQL& Mysql)
{
	char a = '\0';
	while (a != '9') {
		cout << "please choose action" << endl;
		cout << "1. show active orders" << endl << "2. show how many books sold by book title" << endl;
		cout << "3. calculate shipping price by order id" << endl << "4. show splitted shipments" << endl;
		cout << "5. show order status by order id" << endl << "6. show total price of xpress shipments by month" << endl;
		cout << "7. show overall bit transactions by month" << endl;
		cout << "8. showoverall shipments by company in tha past year" << endl << "9. go back" << endl;
		cin >> a;
		switch (a)
		{
		case '1':
			Mysql.current_orders();
			break;
		case '2':
			Mysql.how_many_sold();
			break;
		case '3':
			Mysql.shipping_price();
			break;
		case '4':
			Mysql.is_slplitted();
			break;
		case '5':
			Mysql.order_status();
			break;
		case '6':
			Mysql.shipments_by_xpress();
			break;
		case '7':
			Mysql.bit_transactions();
			break;
		case '8':
			Mysql.shipments_by_company();
			break;
		case '9':
			break;
		default:
			cout << "wrong input!" << endl;
		}
	}
		return;
	}


void customers_actions(MySQL& Mysql)
{
	char a = '\0';
	while (a != '6') {
		cout << "please choose action" << endl;
		cout << "1. show first customer ever" << endl << "2. show all time loyal customers" << endl;
		cout << "3. show customer purchase history" << endl << "4. show customer orders history" << endl;
		cout << "5. show unactive customers in the past two years" << endl << "6. go back" << endl;
		cin >> a;
		switch (a)
		{
		case '1':
			Mysql.oldest_customer();
			break;
		case '2':
			Mysql.loyal_customers();
			break;
		case '3':
			Mysql.purchase_history_by_customer();
			break;
		case '4':
			Mysql.orders_history_by_customer();
			break;
		case '5':
			Mysql.unactive_customers();
			break;
		case '6':
			break;
		default:
			cout << "wrong input!" << endl;
		}
	}
		return;
	}



//void employee_salary_by_month();				employee//25	--> first name: david	 last name: tal		year: 2019	month:8
//void outstanding_emploee();					employee//26	--> year: 2020	month: 1
//
void employee_actions(MySQL& Mysql)
{
	char a = '\0';
	while (a != '3') {
		cout << "please choose action" << endl;
		cout << "1. show employee salary in specific month" << endl;
		cout << "2. show outstanding employee of the month" << endl << "3. go back" << endl;
		cin >> a;
		switch (a)
		{
		case '1':
			Mysql.employee_salary_by_month();
			break;
		case '2':
			Mysql.outstanding_emploee();
			break;
		case '3':
			break;
		default:
			cout << "wrong input!" << endl;
		}
	}
	return;
}

void payments_actions(MySQL& Mysql)
{
	char a = '\0';
	while (a != '4') {
		cout << "please choose action" << endl;
		cout << "1. show store purchase between two dates" << endl << "2. show store profit in specific month" << endl;
		cout << "3. show above average transactions in the past year" << endl << "4. go back" << endl;
		cin >> a;
		switch (a)
		{
		case '1':
			Mysql.store_purchase_between_dates();
			break;
		case '2':
			Mysql.earning_by_month();
			break;
		case '3':
			Mysql.above_average_last_year();
			break;
		case '4':
			break;
		default:
			cout << "wrong input!" << endl;
		}
	}
	return;
}



void manager_app(MySQL& Mysql)
{

	char a = '\0';
	while (a != '6') {
		cout << "please choose action" << endl;
		cout << "1. Books actions" << endl << "2. Orders actions" << endl << "3. Customers actions" << endl;
		cout << "4. Employee actions" << endl << "5. Payments actions" << endl << "6. exit app" << endl;
		cin >> a;
		switch (a)
		{
		case '1':
			book_actions(Mysql);
			break;
		case '2':
			orders_actions(Mysql);
			break;
		case '3':
			customers_actions(Mysql);
			break;
		case '4':
			employee_actions(Mysql);
			break;
		case '5':
			payments_actions(Mysql);
			break;
		case '6':
			break;
		default:
			cout << "wrong input!" << endl;
		}
	}
	return;
}

void emploee_app(MySQL& Mysql)
{
	char a = '\0';
	while (a != '4') {
		cout << "please choose action" << endl << "1. Books actions" << endl;
		cout << "2. Orders actions" << endl << "3. Customers actions" << endl << "4. exit app" << endl;
		cin >> a;
		switch (a)
		{
		case '1':
			book_actions(Mysql);
			break;
		case '2':
			orders_actions(Mysql);
			break;
		case '3':
			customers_actions(Mysql);
			break;
		case '4':
			break;
		default:
			cout << "wrong input!" << endl;
		}
	}
	return;
}

void start_app(MySQL& Mysql)
{
	cout << "Welcome TO Shenkar BookStore!" << endl << "Please choose from the following:" << endl;
	cout << "1. Manager" << endl << "2. Employee" << endl;
	char c;
	cin >> c;
	while (c != '1' && c != '2')
	{
		cout << "Please try again!" << endl;
		cin >> c;
	}
	if (c == '1')
		manager_app(Mysql);
	else
		emploee_app(Mysql);
	return;
}



int main(void)
{
    MySQL Mysql;
	start_app(Mysql);
    return 0;
}
