<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/style.css">
	<title>Trang đăng nhập</title>
</head>
<body>
	<div class="form-container">
		<div class="container py-5 h-100">
			<div class="row d-flex align-items-center justify-content-center h-100">
				<div class="col-md-8 col-lg-7 col-xl-6">
			        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
			          class="img-fluid" alt="Phone image">
      			</div>
      			<div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
      				<h1 style="text-align:center">Login</h1>
     				<form action="${pageContext.request.contextPath}/trang-chu" method="POST">
						<div data-mdb-input-init class="form-outline mb-4">
							<input type="email" id="email" class="form-control"/>
							<label class="form-label" for="email" style="color:white">Email</label>
						</div>
			
						<div data-mdb-input-init class="form-outline mb-4">
							<input type="password" id="password" class="form-control" />
							<label class="form-label" for="password" style="color:white">Password</label>
						</div>
				  		<button type="submit" name="action" value="login" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg btn-block">Sign in</button>
				  		<div class="text-center">
				  			<c:url value="/views/web/register.jsp" var="registerUrl"/>
					    	<p>Not a member? <a href="${registerUrl}">Register</a></p>
				  		</div>
					</form>
    			</div>
			</div>
		</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>
</body>
</html>