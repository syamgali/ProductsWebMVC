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
<body>
	<div class="container mt-3">
       		<div class="alert alert-success">
       			<center><h1>Add Product</h1></center>
       		</div>
       		<form method="post" action="add">
       			<div class="row">
       				<div class="col" span="2">
       					<input type="text" name="name" class="form-control"
       					 placeholder="Enter Name" value="${product.name}" } />
       				</div>
       			</div>
       			<div class="row mt-3 ">
       				<div class="col">
       					<input type="number" name="price" class="form-control"
       					 placeholder="Enter Price" value="${not empty product.price}" } />
       				</div>
       				<div class="col">
       					<input type="text" name="category" class="form-control"
       					 placeholder="Enter Category" value="${product.category}" } />
       				</div>
       			</div>
       			<div class="row mt-3 ">
       				<div class="col">
       					<input type="submit" value="Add Product" class="btn btn-success"/>
       					&nbsp;&nbsp;
       					<a href="<c:url value='/' />" class="btn btn-success">Home</a>
       					&nbsp;&nbsp;
       					<input type="button" value="Back" class="btn btn-success" onclick="window.history.back()"/>
       				</div>
       			</div>
       			<div class="row mt-3 ">
			       	<c:if test="${not empty requestScope['org.springframework.validation.BindingResult.product'].allErrors}">
					    <p class="error"><c:out value="${requestScope['org.springframework.validation.BindingResult.product'].allErrors}" /></p>
					</c:if>
				</div>
       		</form>
       </div>
</body>
</html>
