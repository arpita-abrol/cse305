package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Customer;
import model.Employee;

public class EmployeeDao {
	/*
	 * This class handles all the database operations related to the employee table
	 */
	
	public String addEmployee(Employee employee) {

		/*
		 * All the values of the add employee form are encapsulated in the employee object.
		 * These can be accessed by getter methods (see Employee class in model package).
		 * e.g. firstName can be accessed by employee.getFirstName() method.
		 * The sample code returns "success" by default.
		 * You need to handle the database insertion of the employee details and return "success" or "failure" based on result of the database insertion.
		 */
		
		try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
            Statement st = con.createStatement();
            int rowsUpdated = st.executeUpdate("CALL AddEmployee(" +
            								employee.getEmployeeID().replaceAll("[^0-9]", "") + ", " +
                                            "\"" + employee.getEmail() + "\", " +
                                            "\"" + employee.getStartDate() + "\", " +
                                            employee.getHourlyRate() + ", " +
                                            "\"" + employee.getLastName() + "\", " +
                                            "\"" + employee.getFirstName() + "\", " +
                                            "\"" + employee.getAddress() + "\", " +
                                            employee.getZipCode() + ", " +
                                            "\"" + employee.getCity() + "\", " +
                                            "\"" + employee.getState() + "\", " +
                                            "\"" + employee.getTelephone() + "\" " +
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

	public String editEmployee(Employee employee) {
		/*
		 * All the values of the edit employee form are encapsulated in the employee object.
		 * These can be accessed by getter methods (see Employee class in model package).
		 * e.g. firstName can be accessed by employee.getFirstName() method.
		 * The sample code returns "success" by default.
		 * You need to handle the database update and return "success" or "failure" based on result of the database update.
		 */
		
		try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
            Statement st = con.createStatement();
            int rowsUpdated = st.executeUpdate("CALL EditEmployee(" +
            								employee.getEmployeeID().replaceAll("[^0-9]", "") + ", " +
                                            "\"" + employee.getEmail() + "\", " +
                                            "\"" + employee.getStartDate() + "\", " +
                                            employee.getHourlyRate() + ", " +
                                            "\"" + employee.getLastName() + "\", " +
                                            "\"" + employee.getFirstName() + "\", " +
                                            "\"" + employee.getAddress() + "\", " +
                                            employee.getZipCode() + ", " +
                                            "\"" + employee.getCity() + "\", " +
                                            "\"" + employee.getState() + "\", " +
                                            "\"" + employee.getTelephone() + "\" " +
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

	public String deleteEmployee(String employeeID) {
		/*
		 * employeeID, which is the Employee's ID which has to be deleted, is given as method parameter
		 * The sample code returns "success" by default.
		 * You need to handle the database deletion and return "success" or "failure" based on result of the database deletion.
		 */
		
		try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
            Statement st = con.createStatement();
            int rowsUpdated = st.executeUpdate("CALL DeleteEmployee(" + employeeID + ");");
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
	
	public List<Employee> getEmployees() {

		/*
		 * The students code to fetch data from the database will be written here
		 * Query to return details about all the employees must be implemented
		 * Each record is required to be encapsulated as a "Employee" class object and added to the "employees" List
		 */

		List<Employee> employees = new ArrayList<Employee>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * from EmployeesView;");
			while(rs.next()) {
				Employee employee = new Employee();
				employee.setEmail(rs.getString("Email"));
				employee.setFirstName(rs.getString("FirstName"));
				employee.setLastName(rs.getString("LastName"));
				employee.setAddress(rs.getString("Address"));
				employee.setCity(rs.getString("City"));
				employee.setStartDate(rs.getString("StartDate"));
				employee.setState(rs.getString("State"));
				employee.setZipCode(rs.getInt("Zipcode"));
				employee.setTelephone(rs.getString("Telephone"));
				employee.setEmployeeID(getEmployeeID(employee.getEmail()));
				employee.setHourlyRate(rs.getInt("HourlyRate"));
				employees.add(employee);
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		/*Sample data begins*/
//		for (int i = 0; i < 10; i++) {
//			Employee employee = new Employee();
//			employee.setEmail("shiyong@cs.sunysb.edu");
//			employee.setFirstName("Shiyong");
//			employee.setLastName("Lu");
//			employee.setAddress("123 Success Street");
//			employee.setCity("Stony Brook");
//			employee.setStartDate("2006-10-17");
//			employee.setState("NY");
//			employee.setZipCode(11790);
//			employee.setTelephone("5166328959");
//			employee.setEmployeeID("631-413-5555");
//			employee.setHourlyRate(100);
//			employees.add(employee);
//		}
		/*Sample data ends*/
		
		return employees;
	}

	public Employee getEmployee(String employeeID) {

		/*
		 * The students code to fetch data from the database based on "employeeID" will be written here
		 * employeeID, which is the Employee's ID who's details have to be fetched, is given as method parameter
		 * The record is required to be encapsulated as a "Employee" class object
		 */

		Employee employee = new Employee();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * from EmployeesView WHERE EmployeeId=" + employeeID.replaceAll("[^0-9]", "") + ";");
			while(rs.next()) {
				employee.setEmail(rs.getString("Email"));
				employee.setFirstName(rs.getString("FirstName"));
				employee.setLastName(rs.getString("LastName"));
				employee.setAddress(rs.getString("Address"));
				employee.setCity(rs.getString("City"));
				employee.setStartDate(rs.getString("StartDate"));
				employee.setState(rs.getString("State"));
				employee.setZipCode(rs.getInt("Zipcode"));
				employee.setTelephone(rs.getString("Telephone"));
				employee.setEmployeeID(getEmployeeID(employee.getEmail()));
				employee.setHourlyRate(rs.getInt("HourlyRate"));
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		/*Sample data begins*/
//		employee.setEmail("shiyong@cs.sunysb.edu");
//		employee.setFirstName("Shiyong");
//		employee.setLastName("Lu");
//		employee.setAddress("123 Success Street");
//		employee.setCity("Stony Brook");
//		employee.setStartDate("2006-10-17");
//		employee.setState("NY");
//		employee.setZipCode(11790);
//		employee.setTelephone("5166328959");
//		employee.setEmployeeID("631-413-5555");
//		employee.setHourlyRate(100);
		/*Sample data ends*/
		
		return employee;
	}
	
	public Employee getHighestRevenueEmployee() {
		
		/*
		 * The students code to fetch employee data who generated the highest revenue will be written here
		 * The record is required to be encapsulated as a "Employee" class object
		 */
		
		Employee employee = new Employee();
		
		/*Sample data begins*/
		employee.setEmail("shiyong@cs.sunysb.edu");
		employee.setFirstName("Shiyong");
		employee.setLastName("Lu");
		employee.setEmployeeID("631-413-5555");
		/*Sample data ends*/
		
		return employee;
	}

	public String getEmployeeID(String username) {
		/*
		 * The students code to fetch data from the database based on "username" will be written here
		 * username, which is the Employee's email address who's Employee ID has to be fetched, is given as method parameter
		 * The Employee ID is required to be returned as a String
		 */
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * from EmployeesView WHERE Email=\"" + username + "\";");
			while(rs.next()) {
				String employeeID = rs.getString("EmployeeId");
				return employeeID.substring(0,3) + "-" + employeeID.substring(3,5) + "-" + employeeID.substring(5);
			}
		} catch(Exception e) {
			System.out.println(e);
		}

		return "111-11-1111";
	}

}
