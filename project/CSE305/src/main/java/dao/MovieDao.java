package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Order;
import model.Customer;
import model.Employee;
import model.Movie;

public class MovieDao {

	
	public List<Movie> getMovies() {
		
		/*
		 * The students code to fetch data from the database will be written here
		 * Query to fetch details of all the movies has to be implemented
		 * Each record is required to be encapsulated as a "Movie" class object and added to the "movies" List
		 */

		List<Movie> movies = new ArrayList<Movie>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM Movie;");
			while(rs.next()) {
				Movie movie = new Movie();
				movie.setMovieID(rs.getInt("Id"));
				movie.setMovieName(rs.getString("MovieName"));
				movie.setMovieType(rs.getString("MovieType"));
				movie.setRating(rs.getInt("Rating"));
				movie.setDistFee(rs.getInt("DistrFee"));
				movie.setNumCopies(rs.getInt("NumCopies"));
				movies.add(movie);
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		/*Sample data begins*/
//		for (int i = 0; i < 10; i++) {
//			Movie movie = new Movie();
//			movie.setMovieID(1);
//			movie.setMovieName("The Godfather");
//			movie.setMovieType("Drama");
//			movie.setDistFee(10000);
//			movie.setNumCopies(3);
//			movie.setRating(5);
//			movies.add(movie);
//		}
		/*Sample data ends*/
		
		return movies;

	}
	
	public Movie getMovie(String movieID) {

		/*
		 * The students code to fetch data from the database based on "movieID" will be written here
		 * movieID, which is the Movie's ID who's details have to be fetched, is given as method parameter
		 * The record is required to be encapsulated as a "Movie" class object
		 */

		Movie movie = new Movie();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM Movie WHERE Id =" + movieID + ";");
			while(rs.next()) {
				movie.setMovieID(rs.getInt("Id"));
				movie.setMovieName(rs.getString("MovieName"));
				movie.setMovieType(rs.getString("MovieType"));
				movie.setRating(rs.getInt("Rating"));
				movie.setDistFee(rs.getInt("DistrFee"));
				movie.setNumCopies(rs.getInt("NumCopies"));
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		/*Sample data begins*/
//		movie.setMovieID(1);
//		movie.setMovieName("The Godfather");
//		movie.setMovieType("Drama");
//		movie.setDistFee(10000);
//		movie.setNumCopies(3);
//		movie.setRating(5);
		/*Sample data ends*/
		
		return movie;
	}
	
	public String addMovie(Movie movie) {

		/*
		 * All the values of the add movie form are encapsulated in the movie object.
		 * These can be accessed by getter methods (see Employee class in model package).
		 * e.g. movieName can be accessed by movie.getMovieName() method.
		 * The sample code returns "success" by default.
		 * You need to handle the database insertion of the movie details and return "success" or "failure" based on result of the database insertion.
		 */
		
		// TODO form validation, restraints on adding movie
		try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
            Statement st = con.createStatement();
            int rowsUpdated = st.executeUpdate("CALL AddMovie(" +
                                            "\"" + movie.getMovieName() + "\", " +
                                            "\"" + movie.getMovieType() + "\", " +
                                            movie.getRating() + ", " +
                                            movie.getDistFee() + ", " +
                                            movie.getNumCopies() +
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
	
	public String editMovie(Movie movie) {
		/*
		 * All the values of the edit movie form are encapsulated in the movie object.
		 * These can be accessed by getter methods (see Movie class in model package).
		 * e.g. movieName can be accessed by movie.getMovieName() method.
		 * The sample code returns "success" by default.
		 * You need to handle the database update and return "success" or "failure" based on result of the database update.
		 */
		
		try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
            Statement st = con.createStatement();
            int rowsUpdated = st.executeUpdate("CALL EditMovie(" +
            								movie.getMovieID() + ", " +
                                            "\"" + movie.getMovieName() + "\", " +
                                            "\"" + movie.getMovieType() + "\", " +
                                            movie.getRating() + ", " +
                                            movie.getDistFee() + ", " +
                                            movie.getNumCopies() +
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

	public String deleteMovie(String movieID) {
		/*
		 * movieID, which is the Movie's ID which has to be deleted, is given as method parameter
		 * The sample code returns "success" by default.
		 * You need to handle the database deletion and return "success" or "failure" based on result of the database deletion.
		 */
		
		try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
            Statement st = con.createStatement();
            int rowsUpdated = st.executeUpdate("CALL DeleteMovie(" + movieID + ");");
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
	
	public List<Movie> getBestsellerMovies() {
		
		/*
		 * The students code to fetch data from the database will be written here
		 * Query to fetch details of the bestseller movies has to be implemented
		 * Each record is required to be encapsulated as a "Movie" class object and added to the "movies" List
		 */

		List<Movie> movies = new ArrayList<Movie>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM viewBestSeller;");
			while(rs.next()) {
				Movie movie = new Movie();
				movie.setMovieID(rs.getInt("MovieId"));
				movie.setMovieName(rs.getString("MovieName"));
				movie.setMovieType(rs.getString("MovieType"));
				movies.add(movie);
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return movies;
		
		/*Sample data begins
		for (int i = 0; i < 5; i++) {
			Movie movie = new Movie();
			movie.setMovieID(1);
			movie.setMovieName("The Godfather");
			movie.setMovieType("Drama");
			movies.add(movie);
		}
		Sample data ends*/

	}
	
	public List<Movie> getMovieSuggestions(String customerID) {
		
		/*
		 * The students code to fetch data from the database will be written here
		 * Query to fetch movie suggestions for a customer, indicated by customerID, must be implemented
		 * customerID, which is the Customer's ID for whom the movie suggestions are fetched, is given as method parameter
		 * Each record is required to be encapsulated as a "Movie" class object and added to the "movies" ArrayList
		 */

		List<Movie> movies = new ArrayList<Movie>();
		
		/*Sample data begins*/
		for (int i = 0; i < 4; i++) {
			Movie movie = new Movie();
			movie.setMovieID(1);
			movie.setMovieName("The Godfather");
			movie.setMovieType("Drama");
			movies.add(movie);
		}
		/*Sample data ends*/
		
		return movies;
	}
	
	public List<Movie> getCurrentMovies(String customerID){
		
		/*
		 * The students code to fetch data from the database will be written here
		 * Query to fetch currently hold movie for a customer, indicated by customerID, must be implemented
		 * customerID, which is the Customer's ID for whom currently hold movie are fetched, is given as method parameter
		 * Each record is required to be encapsulated as a "Movie" class object and added to the "movies" ArrayList
		 */

		List<Movie> movies = new ArrayList<Movie>();
		/*Sample data begins*/
		for (int i = 0; i < 4; i++) {
			Movie movie = new Movie();
			movie.setMovieID(1);
			movie.setMovieName("The Godfather");
			movies.add(movie);
		}
		/*Sample data ends*/
		
		return movies;
		
		
		
	}
	
public List<Movie> getQueueOfMovies(String customerID){
		
		/*
		 * The students code to fetch data from the database will be written here
		 * Query to fetch movie queue for a customer, indicated by customerID, must be implemented
		 * customerID, which is the Customer's ID for whom movie queue are fetched, is given as method parameter
		 * Each record is required to be encapsulated as a "Movie" class object and added to the "movies" ArrayList
		 */

		List<Movie> movies = new ArrayList<Movie>();
		/*Sample data begins*/
		for (int i = 0; i < 4; i++) {
			Movie movie = new Movie();
			movie.setMovieID(1);
			movie.setMovieName("The Godfather");
			movie.setMovieType("Drama");
			movies.add(movie);
		}
		/*Sample data ends*/
		
		return movies;
		
		
		
	}

	public List<Movie> getMovieTypes() {
		
		/*
		 * The students code to fetch data from the database will be written here
		 * Each record is required to be encapsulated as a "Movie" class object and added to the "movies" ArrayList
		 * A query to fetch the unique movie types has to be implemented
		 * Each movie type is to be added to the "movie" object using setType method
		 */
		
		List<Movie> movies = new ArrayList<Movie>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT DISTINCT MovieType FROM Movie;");
			while(rs.next()) {
				Movie movie = new Movie();
				movie.setMovieType(rs.getString("MovieType"));
				movies.add(movie);
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		/*Sample data begins*/
//		for (int i = 0; i < 6; i++) {
//			Movie movie = new Movie();
//			movie.setMovieType("Drama");
//			movies.add(movie);
//		}
		/*Sample data ends*/
		
		return movies;
	}

	public List<Movie> getMoviesByName(String movieName) {
		
		/*
		 * The students code to fetch data from the database will be written here
		 * The movieName, which is the movie's name on which the query has to be implemented, is given as method parameter
		 * Query to fetch movies containing movieName in their name has to be implemented
		 * Each movie's corresponding order data also has to be fetched
		 * Each movie record is required to be encapsulated as a "Movie" class object and added to the "movies" List
		 * Each order record is required to be encapsulated as a "Order" class object and added to the "orders" List
		 * The movies and orders Lists are to be added to the "output" List and returned
		 */

		List<Movie> movies = new ArrayList<Movie>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM Movie WHERE LOWER(MovieName) LIKE LOWER(\"%" + movieName + "%\");");
			while(rs.next()) {
				Movie movie = new Movie();
				movie.setMovieID(rs.getInt("Id"));
				movie.setMovieName(rs.getString("MovieName"));
				movie.setMovieType(rs.getString("MovieType"));
				movies.add(movie);
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		/*Sample data begins*/
//		for (int i = 0; i < 4; i++) {
//			Movie movie = new Movie();
//			movie.setMovieID(1);
//			movie.setMovieName("The Godfather");
//			movie.setMovieType("Drama");
//			movies.add(movie);	
//		}
		/*Sample data ends*/
		

		
		return movies;
	}
	
	public List<Movie> getMoviesByActor(String actorName) {
		
		/*
		 * The students code to fetch data from the database will be written here
		 * The movieName, which is the movie's name on which the query has to be implemented, is given as method parameter
		 * Query to fetch movies containing movieName in their name has to be implemented
		 * Each movie's corresponding order data also has to be fetched
		 * Each movie record is required to be encapsulated as a "Movie" class object and added to the "movies" List
		 * Each order record is required to be encapsulated as a "Order" class object and added to the "orders" List
		 * The movies and orders Lists are to be added to the "output" List and returned
		 */

		List<Movie> movies = new ArrayList<Movie>();
		
		/*Sample data begins*/
		for (int i = 0; i < 4; i++) {
			Movie movie = new Movie();
			movie.setMovieID(1);
			movie.setMovieName("The Godfather");
			movie.setMovieType("Drama");
			movies.add(movie);
			
		}
		/*Sample data ends*/
		

		
		return movies;
	}
	

	public List<Movie> getMoviesByType(String movieType) {
		
		/*
		 * The students code to fetch data from the database will be written here
		 * The movieType, which is the movie's type on which the query has to be implemented, is given as method parameter
		 * Query to fetch movies containing movieType as their type has to be implemented
		 * Each movie's corresponding order data also has to be fetched
		 * Each movie record is required to be encapsulated as a "Movie" class object and added to the "movies" List
		 * Each order record is required to be encapsulated as a "Order" class object and added to the "orders" List
		 * The movies and orders Lists are to be added to the "output" List and returned
		 */

		List<Movie> movies = new ArrayList<Movie>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM Movie WHERE MovieType = \"" + movieType + "\";");
			while(rs.next()) {
				Movie movie = new Movie();
				movie.setMovieID(rs.getInt("Id"));
				movie.setMovieName(rs.getString("MovieName"));
				movie.setMovieType(movieType);
				movies.add(movie);
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		/*Sample data begins*/
//		for (int i = 0; i < 4; i++) {
//			Movie movie = new Movie();
//			movie.setMovieID(1);
//			movie.setMovieName("The Godfather");
//			movie.setMovieType("Drama");
//			movies.add(movie);
//			
//		}
		/*Sample data ends*/
		
		return movies;
	}
	
	public List<Movie> getMovieRentalsByName(String movieName) {
		
		

		List<Movie> movies = new ArrayList<Movie>();
		
		try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
            Statement st = con.createStatement();
            int rowsUpdated = st.executeUpdate("CALL ListMovieByName(" + "\"" + movieName + "\", " + ");");
            
        } catch(Exception e) {
            System.out.println(e);
        }
        
		return movies;
		
		/*Sample data begins*/
//		for (int i = 0; i < 4; i++) {
//			Movie movie = new Movie();
//			movie.setMovieID(1);
//			movie.setMovieName("The Godfather");
//			movie.setMovieType("Drama");
//			movies.add(movie);
//			
//		}
		/*Sample data ends*/
	}
	
	public List<Movie> getMovieRentalsByCustomer(String customerName) {
		
		

		List<Movie> movies = new ArrayList<Movie>();
		
		/*Sample data begins*/
		for (int i = 0; i < 4; i++) {
			Movie movie = new Movie();
			movie.setMovieID(1);
			movie.setMovieName("The Godfather");
			movie.setMovieType("Drama");
			movies.add(movie);
			
		}
		/*Sample data ends*/
		

		
		return movies;
	}
	

	public List<Movie> getMovieRentalsByType(String movieType) {
		
		List<Movie> movies = new ArrayList<Movie>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql3.cs.stonybrook.edu:3306/" + System.getenv("NETID"), System.getenv("NETID"), System.getenv("SBUID"));
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM Movie WHERE MovieType = \"" + movieType + "\";");
			while(rs.next()) {
				Movie movie = new Movie();
				movie.setMovieID(rs.getInt("Id"));
				movie.setMovieName(rs.getString("MovieName"));
				movie.setMovieType(movieType);
				movies.add(movie);
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		/*Sample data begins*/
//		for (int i = 0; i < 4; i++) {
//			Movie movie = new Movie();
//			movie.setMovieID(1);
//			movie.setMovieName("The Godfather");
//			movie.setMovieType("Drama");
//			movies.add(movie);	
//		}
		/*Sample data ends*/
		

		
		return movies;
	}
	

	public List<Movie> getBestsellersForCustomer(String customerID) {

		/*
		 * The students code to fetch data from the database will be written here.
		 * Each record is required to be encapsulated as a "Movie" class object and added to the "movies" ArrayList.
		 * Query to get the Best-seller list of movies for a particular customer, indicated by the customerID, has to be implemented
		 * The customerID, which is the customer's ID for whom the Best-seller movies have to be fetched, is given as method parameter
		 */

		List<Movie> movies = new ArrayList<Movie>();
				
		/*Sample data begins*/
		for (int i = 0; i < 6; i++) {
			Movie movie = new Movie();
			movie.setMovieID(1);
			movie.setMovieName("The Godfather");
			movie.setMovieType("Drama");
			movie.setDistFee(10000);
			movie.setNumCopies(3);
			movie.setRating(5);
			movies.add(movie);
		}
		/*Sample data ends*/
		
		return movies;

	}

}
