package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Movie;
import model.Rental;

public class RentalDao {
	
	public List<Rental> getOrderHisroty(String customerID) {
		
		List<Rental> rentals = new ArrayList<Rental>();
			
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM getOrderHistory WHERE CustomerId=" + customerID.replaceAll("[^0-9]", "") + ";");
			while(rs.next()) {
				Rental rental = new Rental();
				rental.setOrderID(rs.getInt("OrderId"));
				rental.setMovieID(rs.getInt("MovieId"));
				rental.setCustomerRepID(rs.getInt("EmployeeId"));
				rentals.add(rental);
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		/*Sample data begins*/
//		for (int i = 0; i < 4; i++) {
//			Rental rental = new Rental();
//			
//			rental.setOrderID(1);
//			rental.setMovieID(1);
//			rental.setCustomerRepID(1);
//		
//			rentals.add(rental);
//			
//			
//		}
		/*Sample data ends*/
						
		return rentals;
		
	}

}
