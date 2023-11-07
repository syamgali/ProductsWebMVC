<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        
    </head>
    <body>
        <div class="container mt-3">
        	<div class="alert alert-success">
       			<center><h1>Products Store</h1></center>
       		</div>
        	<div class="container">
        		<a href="<c:url value='/add'/>" class="btn btn-success">Add Product</a>
        		&nbsp;&nbsp;
        		<a href="<c:url value='/search'/>" class="btn btn-success">Search Products</a>
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
        </div>
    </body>
</html>
