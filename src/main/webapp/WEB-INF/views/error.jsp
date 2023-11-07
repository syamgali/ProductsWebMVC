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
      	<div>		
	 		<center><p class="error">Product not found [or] something went wrong! Please check..</p></center>
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
	</div>
</body>
</html>
