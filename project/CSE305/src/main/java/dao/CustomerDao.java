package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Customer;
import model.Customer;

import java.util.stream.IntStream;

public class CustomerDao {
	/*
	 * This class handles all the database operations related to the customer table
	 */
	
	/**
	 * @param String searchKeyword
	 * @return ArrayList<Customer> object
	 */
	public List<Customer> getCustomers(String searchKeyword) {
		/*
		 * This method fetches one or more customers and returns it as an ArrayList
		 */
		
		List<Customer> customers = new ArrayList<Customer>();

		/*
		 * The students code to fetch data from the database will be written here
		 * Each record is required to be encapsulated as a "Customer" class object and added to the "customers" List
		 */
		
		if( searchKeyword == null )
			searchKeyword = "";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * from CustomersView WHERE LOWER(LastName) LIKE \"%" + searchKeyword + "%\" OR LOWER(FirstName) LIKE \"%" + searchKeyword + "%\";");
			while(rs.next()) {
				Customer customer = new Customer();
				customer.setAddress(rs.getString("Address"));
				customer.setLastName(rs.getString("LastName"));
				customer.setFirstName(rs.getString("FirstName"));
				customer.setCity(rs.getString("City"));
				customer.setState(rs.getString("State"));
				customer.setEmail(rs.getString("Email"));
				customer.setZipCode(rs.getInt("Zipcode"));
				customer.setTelephone(rs.getString("Telephone"));
				customer.setCreditCard(rs.getString("CreditCardNumber"));
				customer.setRating(rs.getInt("Rating"));
				customer.setCustomerID(getCustomerID(customer.getEmail()));
				customers.add(customer);
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		/*Sample data begins
		for (int i = 0; i < 10; i++) {
			Customer customer = new Customer();
			customer.setCustomerID("111-11-1111");
			customer.setAddress("123 Success Street");
			customer.setLastName("Lu");
			customer.setFirstName("Shiyong");
			customer.setCity("Stony Brook");
			customer.setState("NY");
			customer.setEmail("shiyong@cs.sunysb.edu");
			customer.setZipCode(11790);
			customer.setTelephone("5166328959");
			customer.setCreditCard("1234567812345678");
			customer.setRating(1);
			customers.add(customer);			
		}
		Sample data ends*/
		
		return customers;
	}


	public Customer getHighestRevenueCustomer() {
		/*
		 * This method fetches the customer who generated the highest total revenue and returns it
		 * The students code to fetch data from the database will be written here
		 * The customer record is required to be encapsulated as a "Customer" class object
		 */

		Customer customer = new Customer();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * from mostActiveCustomers;");
			while(rs.next()) {
				customer.setLastName(rs.getString("LastName"));
				customer.setFirstName(rs.getString("FirstName"));
				customer.setEmail(rs.getString("Email"));
				customer.setCustomerID(getCustomerID(customer.getEmail()));
			}
		} catch(Exception e) {
			System.out.println(e);
		}

		/*Sample data begins*/
//		Customer customer = new Customer();
//		customer.setCustomerID("111-11-1111");
//		customer.setLastName("Lu");
//		customer.setFirstName("Shiyong");
//		customer.setEmail("shiyong@cs.sunysb.edu");
		/*Sample data ends*/
	
		return customer;
		
	}

	public List<Customer> getCustomerMailingList() {

		/*
		 * This method fetches the all customer mailing details and returns it
		 * The students code to fetch data from the database will be written here
		 * Each customer record is required to be encapsulated as a "Customer" class object and added to the "customers" List
		 */

		
		List<Customer> customers = new ArrayList<Customer>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * from CustomersView;");
			while(rs.next()) {
				Customer customer = new Customer();
				customer.setAddress(rs.getString("Address"));
				customer.setLastName(rs.getString("LastName"));
				customer.setFirstName(rs.getString("FirstName"));
				customer.setCity(rs.getString("City"));
				customer.setState(rs.getString("State"));
				customer.setEmail(rs.getString("Email"));
				customer.setZipCode(rs.getInt("Zipcode"));
				customer.setCustomerID(getCustomerID(customer.getEmail()));
				customers.add(customer);
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		/*Sample data begins*/
//		for (int i = 0; i < 10; i++) {
//			Customer customer = new Customer();
//			customer.setCustomerID("111-11-1111");
//			customer.setAddress("123 Success Street");
//			customer.setLastName("Lu");
//			customer.setFirstName("Shiyong");
//			customer.setCity("Stony Brook");
//			customer.setState("NY");
//			customer.setEmail("shiyong@cs.sunysb.edu");
//			customer.setZipCode(11790);
//			customers.add(customer);			
//		}
		/*Sample data ends*/
		
		return customers;
	}

	public Customer getCustomer(String customerID) {

		/*
		 * This method fetches the customer details and returns it
		 * customerID, which is the Customer's ID who's details have to be fetched, is given as method parameter
		 * The students code to fetch data from the database will be written here
		 * The customer record is required to be encapsulated as a "Customer" class object
		 */
		
		Customer customer = new Customer();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * from CustomersView WHERE CustomerId=" + customerID.replaceAll("[^0-9]", "") + ";");
			while(rs.next()) {
				customer.setAddress(rs.getString("Address"));
				customer.setLastName(rs.getString("LastName"));
				customer.setFirstName(rs.getString("FirstName"));
				customer.setCity(rs.getString("City"));
				customer.setState(rs.getString("State"));
				customer.setEmail(rs.getString("Email"));
				customer.setZipCode(rs.getInt("Zipcode"));
				customer.setTelephone(rs.getString("Telephone"));
				customer.setCreditCard(rs.getString("CreditCardNumber"));
				customer.setRating(rs.getInt("Rating"));
				customer.setCustomerID(getCustomerID(customer.getEmail()));
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		/*Sample data begins*/
//		customer.setCustomerID("111-11-1111");
//		customer.setAddress("123 Success Street");
//		customer.setLastName("Lu");
//		customer.setFirstName("Shiyong");
//		customer.setCity("Stony Brook");
//		customer.setState("NY");
//		customer.setEmail("shiyong@cs.sunysb.edu");
//		customer.setZipCode(11790);
//		customer.setTelephone("5166328959");
//		customer.setCreditCard("1234567812345678");
//		customer.setRating(1);
		/*Sample data ends*/
		
		return customer;
	}
	
	public String deleteCustomer(String customerID) {

		/*
		 * This method deletes a customer returns "success" string on success, else returns "failure"
		 * The students code to delete the data from the database will be written here
		 * customerID, which is the Customer's ID who's details have to be deleted, is given as method parameter
		 */

		try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
            Statement st = con.createStatement();
            int rowsUpdated = st.executeUpdate("CALL DeleteCust(" + customerID.replaceAll("[^0-9]", "") + ");");
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

	public String getCustomerID(String username) {
		/*
		 * This method returns the Customer's ID based on the provided email address
		 * The students code to fetch data from the database will be written here
		 * username, which is the email address of the customer, who's ID has to be returned, is given as method parameter
		 * The Customer's ID is required to be returned as a String
		 */

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * from CustomersView WHERE Email=\"" + username + "\";");
			while(rs.next()) {
				String customerID = rs.getString("CustomerId");
				return customerID.substring(0,3) + "-" + customerID.substring(3,5) + "-" + customerID.substring(5);
			}
		} catch(Exception e) {
			System.out.println(e);
		}

		return "";
	}

	public String addCustomer(Customer customer) {

		/*
		 * All the values of the add customer form are encapsulated in the customer object.
		 * These can be accessed by getter methods (see Customer class in model package).
		 * e.g. firstName can be accessed by customer.getFirstName() method.
		 * The sample code returns "success" by default.
		 * You need to handle the database insertion of the customer details and return "success" or "failure" based on result of the database insertion.
		 */
		
		try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
            Statement st = con.createStatement();
            int rowsUpdated = st.executeUpdate("CALL AddCust(" +
                    						customer.getCustomerID().replaceAll("[^0-9]", "") + ", " +
                                            "\"" + customer.getEmail() + "\", " +
                                            customer.getRating() + ", " +
                                            "\"" + customer.getCreditCard() + "\", " +
                                            "\"" + customer.getFirstName() + "\", " +
                                            "\"" + customer.getLastName() + "\", " +
                                            "\"" + customer.getAddress() + "\", " +
                                            customer.getZipCode() + ", " +
                                            "\"" + customer.getCity() + "\", " +
                                            "\"" + customer.getState() + "\", " +
                                            "\"" + customer.getTelephone() + "\" " +
                                            ");");
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

	public String editCustomer(Customer customer) {
		/*
		 * All the values of the edit customer form are encapsulated in the customer object.
		 * These can be accessed by getter methods (see Customer class in model package).
		 * e.g. firstName can be accessed by customer.getFirstName() method.
		 * The sample code returns "success" by default.
		 * You need to handle the database update and return "success" or "failure" based on result of the database update.
		 */
		
		try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
            Statement st = con.createStatement();
            int rowsUpdated = st.executeUpdate("CALL EditCust(" +
                    						customer.getCustomerID().replaceAll("[^0-9]", "") + ", " +
                                            "\"" + customer.getEmail() + "\", " +
                                            customer.getRating() + ", " +
                                            "\"" + customer.getCreditCard() + "\", " +
                                            "\"" + customer.getFirstName() + "\", " +
                                            "\"" + customer.getLastName() + "\", " +
                                            "\"" + customer.getAddress() + "\", " +
                                            customer.getZipCode() + ", " +
                                            "\"" + customer.getCity() + "\", " +
                                            "\"" + customer.getState() + "\", " +
                                            "\"" + customer.getTelephone() + "\" " +
                                            ");");
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
