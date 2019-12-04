<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!--
	This is the List Sellers page
	This page displays the data for each Seller object in the ArrayList from the getSellers method in dao.CustomerDao class
	The details are fetched using the "sellers" field from the request object
-->


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width:device-width, initial-scale=1">
	<link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css?family=Bebas+Neue&display=swap" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="./css/style.css">
	<title>List Sellers</title>
</head>
<body>

	<h1>The Customer Details are:</h1>
	<c:if test="${empty sellers}">
		<h3> Seller details not found! <h3/>
	</c:if>
	<c:if test="${not empty sellers}">
		<table class="table table-striped">
		  <thead>
		    <tr>
		      <th>First Name</th>
		      <th>Last Name</th>
		      <th>Address</th>
		      <th>City</th>
		      <th>State</th>
		      <th>Zip Code</th>
			  <th>Telephone</th>
			  <th>Email</th>
			  <th>Credit Card</th>
			  <th>Rating</th>
		    </tr>
		  </thead>
		  <tbody>
		     <c:forEach items="${customers}" var="cd">
		       <tr>
		         <td>${cd.firstName}</td>
		         <td>${cd.lastName}</td>
		         <td>${cd.address}</td>
		         <td>${cd.city}</td>
		         <td>${cd.state}</td>
		         <td>${cd.zipCode}</td>
		         <td>${cd.telephone}</td>
		         <td>${cd.email}</td>
		         <td>${cd.creditCard}</td>
		         <td>${cd.rating}</td>
		       </tr>
		     </c:forEach>
		  </tbody>
		</table>
	</c:if>

	<div class="container pt-1">
		<form action="home.jsp">
			<input type="submit" value="Home" class="btn btn-success"/>
		</form>
	</div>


	<script src="webjars/jquery/3.3.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/4.1.3/bootstrap.min.js"></script>

</body>
</html>
