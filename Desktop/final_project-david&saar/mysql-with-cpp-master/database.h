#pragma once
#include "header.h"
#include "database-detail.h"

class MySQL
{
    protected:
        /** MySQL connectivity Variables */
        MYSQL *connect;
        MYSQL_RES *res_set;
        MYSQL_ROW row;
		MYSQL_FIELD* fields;
    public:
        /** MySQL Constructor */
        MySQL();
												///////// what to insert	
		void Search_Book_by_author_name();		//
		void Search_Book_by_name();				//1		--> lolita
		void oldest_customer();					//2		
		void oldest_book();						//3			
		void current_orders();					//4		--> **graphics will look good on full screen**
		void how_many_sold();					//5		
		void popular_author_between_dates();	//6		--> from: 2019-01-01	to: 2020-03-01
		void loyal_customers();					//7		
		void most_translations();				//8		
		void purchase_history_by_customer();	//9		--> first name: andi	last name: ram	(he bought same book twice in the same day)
		void orders_history_by_customer();		//10	--> first name: andi	last name: ram
		void shipping_price();					//11	--> any number between 1-8
		void is_slplitted();					//12	--> first name: sasi	last name: shemesh
		void order_status();					//13	--> any number between 1-8
		void shipments_by_xpress();				//14	--> year: 2019	month: 8
		void bit_transactions();				//15	--> year: 2020	month: 1
		void above_average_last_year();			//16	--> avg = 59.375
		void shipments_by_company();			//17	

		void unactive_customers();				//19	


		void store_purchase_between_dates();			//22	--> from: 2013-01-01	to: 2020-08-01
		void earning_by_month();				//23	--> year: 2020	month: 4
					
		void employee_salary_by_month();			//25	--> first name: david	 last name: tal		year: 2019	month:8
		void outstanding_emploee();				//26	--> year: 2020	month: 1


        /** MySQL Destructor */
        ~MySQL();
};
