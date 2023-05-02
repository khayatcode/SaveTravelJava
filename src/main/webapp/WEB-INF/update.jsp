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
<title>Update Expense</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
    	<div class="d-flex justify-content-between">   	
	    	<h1>Edit an Expense:</h1>
	    	<a href="/home" class="btn btn-warning h-25 mt-3">Home</a>
    	</div>
    	<div class="row">
    		<div class="col">
    			<form:form action="/updateItem/${item.id}" method="post" modelAttribute="item">
					<input type="hidden" name="_method" value="put">		
    				<div class="mb-3">
    					<form:label path="expense" class="form-label">Expense Name:</form:label>
			        	<div>
		         			<form:errors path="expense" class="text-danger"/>
			        	</div>
			          	<form:input path="expense" class="form-control"/>
    				</div>
    				<div class="mb-3">
   						<form:label path="vendor" class="form-label">Vendor:</form:label>
			        	<div>
		         			<form:errors path="vendor" class="text-danger"/>
			        	</div>
			          	<form:input path="vendor" class="form-control"/>
    				</div>
    				<div class="mb-3">
    					<form:label path="amount" class="form-label">Amount:</form:label>
			        	<div>
		         			<form:errors path="amount" class="text-danger"/>
			        	</div>
			          	<form:input path="amount" class="form-control"/>
    				</div>
    				<div class="mb-3">
    					<form:label path="description" class="form-label">Description:</form:label>
			        	<div>
		         			<form:errors path="description" class="text-danger"/>
			        	</div>
			        	<form:textarea path="description" class="form-control"/>
    				</div>
					<input type="submit" value="Submit" class="btn btn-primary"/>
    			</form:form>
    		</div>
    	</div>
    </div>
	
</body>
</html>