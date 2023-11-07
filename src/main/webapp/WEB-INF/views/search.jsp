<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<style>
.error {
	color: #ff0000;
	font-style: italic;
	font-weight: bold;
}
</style>
</head>
<script type="text/javascript">
function formSubmit(){
	var formSub = false;
	document.getElementById("query").value = "";
	if(document.getElementById("id").value != null && document.getElementById("id").value != "") {
		document.getElementById("query").value = document.getElementById("id").value;
		formSub = true;
	} else if(document.getElementById("name").value != null && document.getElementById("name").value != "") {
		document.getElementById("query").value = document.getElementById("name").value;
		formSub = true;
	} else if(document.getElementById("price").value != null && document.getElementById("price").value != "") {
		document.getElementById("query").value = document.getElementById("price").value;
		formSub = true;
	} else if(document.getElementById("category").value != null && document.getElementById("category").value != "") {
		document.getElementById("query").value = document.getElementById("category").value;
		formSub = true;
	}
	
	if(formSub == true){
		document.getElementById("searchForm").submit();
	} else {
		alert("Enter atleast one search field!");
	}
}
</script>
<body>
	<div class="container mt-3">
       		<div class="alert alert-success">
       			<center><h1>Search Product</h1></center>
       		</div>
       		<form name="searchForm" id="searchForm" method="post" action="search">
       		<input type="hidden" name="query" id="query" value=""/>
       			<div class="row">
       				<div class="col">
       					<input type="number" name="id" id="id" class="form-control"
       					 placeholder="Enter Id"/>
       				</div>
       				<div class="col">
       					<input type="text" name="name" id="name" class="form-control"
       					 placeholder="Enter Name"/>
       				</div>
       			</div>
       			<div class="row mt-3 ">
       				<div class="col">
       					<input type="number" name="price" id="price" class="form-control"
       					 placeholder="Enter Price"/>
       				</div>
       				<div class="col">
       					<input type="text" name="category" id="category" class="form-control"
       					 placeholder="Enter Category"/>
       				</div>
       			</div>
       			<div class="row mt-3 ">
       				<div class="col">
       					<input type="button" value="Search" class="btn btn-success" onclick="formSubmit()"/>
       					&nbsp;&nbsp;
       					<a href="<c:url value='/' />" class="btn btn-success">Home</a>
       					&nbsp;&nbsp;
       					<input type="button" value="Back" class="btn btn-success" onclick="window.history.back()"/>
       				</div>
       			</div>
       			<br>
       			<c:if test="${not empty products}">   			
	        	<div class="alert alert-success">
	       			<center><h1>Result List</h1></center>
	       		</div>
	        	<table class="table table-responsive table-bordered table-hover mt-2">
	        		<thead>
	        			<tr>
	        				<th>Product Id</th>
	        				<th>Name</th>
	        				<th>Price</th>
	        				<th>Category</th>
	        				<th>Actions</th>
	        			</tr>
	        		</thead>
	        		<tbody>
	        			<c:forEach var="product" items="${products}">
	        				<tr>
	        					<td>${product.id} </td>
	        					<td>${product.name} </td>
	        					<td>${product.price} </td>
	        					<td>${product.category} </td>
	        					<td>
	        						<a href="<c:url value='/edit/${product.id}' />" class="btn btn-warning">Edit</a>
	        						&nbsp;
	        						<a href="<c:url value='/delete/${product.id}' />" class="btn btn-danger">Delete</a>
	        					</td>
	        				</tr>
	        			</c:forEach>
	        		</tbody>
	        	</table>
	        	</c:if>
       			<div class="row mt-3 ">
			       	<c:if test="${not empty requestScope['org.springframework.validation.BindingResult.product'].allErrors}">
					    <p class="error"><c:out value="${requestScope['org.springframework.validation.BindingResult.product'].allErrors}" /></p>
					</c:if>
				</div>
       		</form>
       </div>
</body>
</html>
