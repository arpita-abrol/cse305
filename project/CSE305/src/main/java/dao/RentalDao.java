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
			customerID=customerID.replace("-", "");
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM vieworderedmovies where CustID="+customerID);
			while (rs.next()) {
				Rental rental = new Rental();
				rental.setMovieID(rs.getInt("MovieID"));
				rental.setOrderID(rs.getInt("OrderID"));
				rental.setCustomerRepID(rs.getInt("CustRepID"));
				rentals.add(rental);
			}
		}
		catch (Exception e) {
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
//		}
		/*Sample data ends*/
						
		return rentals;
		
	}

}
