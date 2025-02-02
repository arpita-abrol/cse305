<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page isELIgnored="false" %>
<!--
	This is the Add Employee page
	This page displays fields to add an Employee 
	The details are sent to the AddEmployeeController class in resources package
-->
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Add Movie</title>
	<link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" /> 
    	<link href="https://fonts.googleapis.com/css?family=Bebas+Neue&display=swap" rel="stylesheet">
    	<link href="./css/style.css" rel="stylesheet"></link>	
	<script src="webjars/jquery/3.3.1-1/jquery.min.js"></script>
	<script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Bebas+Neue&display=swap" rel="stylesheet">
    	<link href="./css/style.css" rel="stylesheet"></link>
</head>
<body>
	<div class="container">
	
	<h1>Add a new Movie:</h1>
 
	<form action="addMovie" method="POST">
	  <div class="form-group">
	    <label for="movieName">Movie Name</label>
	    <input type="text" class="form-control" id="movieName" name="movieName" placeholder="Enter name" required>
	  </div>
	  <div class="form-group">
	    <label for="movieType">Movie Type</label>
	    <input type="text" class="form-control" id="movieType" name="movieType" placeholder="Enter movie type" required>
	  </div>
	  <div class="form-group">
	    <label for="movieRating">Movie Rating</label>
	    <input type="text" class="form-control" id="movieRating" name="movieRating" placeholder="Enter rating" required>
	  </div>
	  <div class="form-group">
	    <label for="movieDistrFee">Movie Distribution Fee</label>
	    <input type="text" class="form-control" id="movieDistrFee" name="movieDistrFee" placeholder="Enter distribution fee" required>
	  </div>
	  <div class="form-group">
	    <label for="movieNumCopies">Number of Copies</label>
	    <input type="text" class="form-control" id="movieNumCopies" name="movieNumCopies" placeholder="Enter number of copies" required>
	  </div>
	  <button type="submit" class="btn btn-primary">Submit</button>
	</form>
	</div>
	<div class="container pt-1">
		<form action="home.jsp">
			<input type="submit" value="Home" class="btn btn-success"/>
		</form>
	</div>

</body>
</html>