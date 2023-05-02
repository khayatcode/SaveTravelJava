<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-between">   	
	    	<h1>Expense Detail:</h1>
	    	<div class="d-flex h-100 gap-3">
		    	<a href="/home" class="btn btn-warning h-25 mt-3">Home</a>
		    	<a href="/edit/${item.id}" class="btn btn-secondary h-25 mt-3">Edit</a>
	    	</div>
    	</div>	
    	<div class="mt-3">   
    		<div class="d-flex">
	    		<h5>Expense Name:&nbsp;</h5> 
	    		<p><em><c:out value="${item.expense}"/></em></p>
    		</div> 
    		
    		<div class="d-flex">
 				<h5>Expense Description:&nbsp;</h5>
 				<p><em><c:out value="${item.description}"/></em></p>	
    		</div>	
    		
	    	<div class="d-flex">
	    		<h5>Vendor:&nbsp;</h5>
	    		<p><em><c:out value="${item.vendor}"/></em></p>
    		</div>
	    	<div class="d-flex">
	    		<h5>Amount Spent:&nbsp;</h5>
	    		<p><em>$<c:out value="${item.amount}"/></em></p>
    		</div>
    	</div>
	</div>
</body>
</html>