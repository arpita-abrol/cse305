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
	This is the Show current movie page
	This page displays the data for each Order in the "movie" request object
-->

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width:device-width, initial-scale=1">
	<link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" /> 
    	<link href="https://fonts.googleapis.com/css?family=Bebas+Neue&display=swap" rel="stylesheet">
    	<link href="./css/style.css" rel="stylesheet"></link>
	<title>Current Movies</title>
</head>
<body>

	<h1>The Movies are:</h1>
	<div class="container">
	<c:if test="${empty movie}">
		<h3> Movie Data not found! </h3> 
	</c:if>
	<c:if test="${not empty movie}">
		<table class="table table-striped">
		  <thead>
		    <tr>
		      <th>Movie ID</th>
		      <th>Movie Name</th>
		      <th></th>
		    </tr>
		  </thead>
		  <tbody>
		     <c:forEach items="${movie}" var="cd">
		       <tr>
		         <td>${cd.movieID}</td>		         
		         <td>${cd.movieName}</td>
		         <td>
		         	<!-- <form action="returnMovie">
						<div class="form-group">
			            	<input type="hidden" class="form-control" name="movieID" value=${cd.movieID}>
			        	</div>
						<input type="submit" value="Return" class="btn btn-success"/>
					</form> -->
		         </td>		         
		         
		       </tr>
		     </c:forEach>
		  </tbody>
		</table>
	</c:if>
	</div>

	<div class="container pt-1">
		<form action="home.jsp">
			<input type="submit" value="Home" class="btn btn-success"/>
		</form>
	</div>

	
	<script src="webjars/jquery/3.3.1-1/jquery.min.js"></script>
	<script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	
</body>
</html>