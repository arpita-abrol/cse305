package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Employee;
import model.Movie;
import model.Account;

public class AccountDao {
	
	public int getSalesReport(Account account) {
			
			/*
			 * The students code to fetch data from the database will be written here
			 * Query to get sales report for a particular month must be implemented
			 * account, which has details about the month and year for which the sales report is to be generated, is given as method parameter
			 * The month and year are in the format "month-year", e.g. "10-2018" and stored in the dateOpened attribute of account object
			 * The month and year can be accessed by getter method, i.e., account.getAcctCreateDate()
			 */
	
			int income = 0;
					
			/*Sample data begins*/
			income = 100;
			/*Sample data ends*/
			
	
			return income;
			
		}
	
	public String setAccount(String customerID, String accountType) {

		try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
            Statement st = con.createStatement();
            int rowsUpdated = st.executeUpdate("CALL EditAccount(" + customerID.replaceAll("[^\\d]", "") + ", \"" + accountType + "\");");
            if( rowsUpdated > 0 )
                return "success";
        } catch(Exception e) {
            System.out.println(e);
        }
        
        return "failure";
		
		/*Sample data begins*/
//		return "success";
		/*Sample data ends*/

	}
	

}
