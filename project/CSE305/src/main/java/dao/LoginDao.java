package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import model.Login;
import model.Movie;

public class LoginDao {
	/*
	 * This class handles all the database operations related to login functionality
	 */
	
	
	public Login login(String username, String password) {
		/*
		 * Return a Login object with role as "manager", "customerRepresentative" or "customer" if successful login
		 * Else, return null
		 * The role depends on the type of the user, which has to be handled in the database
		 * username, which is the email address of the user, is given as method parameter
		 * password, which is the password of the user, is given as method parameter
		 * Query to verify the username and password and fetch the role of the user, must be implemented
		 */
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM Login WHERE Email=\"" + username + "\";");
			while( rs.next() ) {
				if( rs.getString("Pswd").equals(password) ) {
					Login login = new Login();
					login.setUsername(username);
					login.setPassword(password);
					login.setRole(rs.getString("Role"));
					return login;
				}
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return null;
		
		/*Sample data begins
		Login login = new Login();
		login.setRole("customerRepresentative");
		login.setRole("customer");
		login.setRole("manager");
		return login;
		Sample data ends*/
		
	}
	
	public String addUser(Login login) {
		/*
		 * Query to insert a new record for user login must be implemented
		 * login, which is the "Login" Class object containing username and password for the new user, is given as method parameter
		 * The username and password from login can get accessed using getter methods in the "Login" model
		 * e.g. getUsername() method will return the username encapsulated in login object
		 * Return "success" on successful insertion of a new user
		 * Return "failure" for an unsuccessful database operation
		 */
		
		/*Sample data begins*/
		return "success";
		/*Sample data ends*/
	}

}
