<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style.css">
    <title>Trang đăng kí</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/register_script.js"></script>
    
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
	    			<h1 style="text-align:center">Register</h1>
	    			<form action="${pageContext.request.contextPath}/trang-dang-ki" method="POST" onsubmit="return validateForm()">
					    <div data-mdb-input-init class="form-outline mb-4">
					        <input type="text" id="name" name="name" class="form-control form-control-lg" required />
					        <label class="form-label" for="name" style="color:white">Họ và tên</label>
					    </div>
					                
					    <div class="mb-4">
					        <select data-mdb-select-init class="form-control form-control-lg" id="cities" required>
					            <option value=""  selected>Tỉnh/Thành phố</option>
					        </select>
					        <input type="hidden" id="cityName" name="cityName">
					    </div>
					    
					    <div class="mb-4">
					        <select data-mdb-select-init class="form-control form-control-lg" id="districts" required>
					            <option value="" selected>Quận/Huyện</option>
					        </select>
					        <input type="hidden" id="districtName" name="districtName">
					    </div>
					    
					    <div class="mb-4">
					        <select data-mdb-select-init class="form-control form-control-lg" id="wards"  required>
					            <option value="" selected>Phường/Xã</option>
					        </select>
					        <input type="hidden" id="wardName" name="wardName">
					    </div>
					    
					    <div data-mdb-input-init class="form-outline mb-4">
					        <input type="text" id="address" name="houseNo" class="form-control" required/>
					        <label class="form-label" for="address" style="color:white">Số nhà, Tên đường</label>
					    </div>
					
					    <div data-mdb-input-init class="form-outline mb-4">
					        <input type="text" id="phone" name="phone" class="form-control" required>
					        <label class="form-label" for="phone" style="color:white">Số điện thoại</label>
					    </div>
					
					    <div data-mdb-input-init class="form-outline mb-4">
					        <input type="email" id="email" name="email" class="form-control" required />
					        <label class="form-label" for="email" style="color:white">Email</label>
					    </div>
					
					    <div data-mdb-input-init class="form-outline mb-4">
					        <input type="password" id="password" name="password" class="form-control" required />
					        <label class="form-label" for="password" style="color:white">Mật khẩu</label>
					    </div>
					    
					    <button type="submit" name="action" value="register" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg btn-block">Register</button>
					    <c:url value="/views/web/login.jsp" var="loginUrl"/>
					    <p>Already a member? <a href="${loginUrl}">Login</a></p>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>
</body>
</html>