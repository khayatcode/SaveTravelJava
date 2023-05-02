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
<title>Home</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>Save Travel</h1>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">Expenses</th>
					<th scope="col">Vendor</th>
					<th scope="col">Amount</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${items}">
					<tr>
						<td>
							<a href="/show/${item.id}">
								<c:out value="${item.expense}"/>
							</a>
						</td>
						<td>
							<c:out value ="${item.vendor}"/>
						</td>
						<td>
							$<c:out value ="${item.amount}"/>
						</td>
						<td class="d-flex gap-3">
							<a href="/edit/${item.id}" class="btn btn-info">Edit</a>
							<form action="/delete/${item.id}" method="post">
								<input type="hidden" name="_method" value="delete">
								<input type="submit" value="Delete" class="btn btn-danger">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/create" class="btn btn-success">Create</a>
	</div>
</body>
</html>