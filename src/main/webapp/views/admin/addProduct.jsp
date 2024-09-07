<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style.css">
    <title>Chỉnh sửa sản phẩm</title>
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
	    			<h1 style="text-align:center">Chỉnh sửa sản phẩm</h1>
	    			<form action="${pageContext.request.contextPath}/trang-chu" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
						<input type="hidden" id="ID" name="ID" value="${ID}"/>
					    <div data-mdb-input-init class="form-outline mb-4">
					        <input type="text" id="name" name="name" value="${name}" class="form-control form-control-lg" required />
					        <label class="form-label" for="name" style="color:white">Tên sản phẩm</label>
					    </div>
					    
					    <div data-mdb-input-init class="form-outline mb-4">
					        <input type="text" id="type" name="type" value="${type}" class="form-control form-control-lg" required />
					        <label class="form-label" for="type" style="color:white">Loại sản phẩm</label>
					    </div>
					                
					    <div data-mdb-input-init class="form-outline mb-4">
					        <input type="text" id="brand" name="brand" value="${brand}" class="form-control" required/>
					        <label class="form-label" for="brand" style="color:white">Hãng</label>
					    </div>
					
					    <div data-mdb-input-init class="form-outline mb-4">
					        <input type="text" id="cost" name="cost" value="${cost}" class="form-control" required>
					        <label class="form-label" for="cost" style="color:white">Giá</label>
					    </div>
					
					    <div data-mdb-input-init class="form-outline mb-4">
					        <input type="text" id="quantity" name="quantity" value="${quantity}" class="form-control" required />
					        <label class="form-label" for="quantity" style="color:white">Số lượng</label>
					    </div>
					
					    <div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="imageInput" style="color:white">Image</label>
							<input <c:if test="${ID == null}">required</c:if>
								   type="file" id="imageInput" name="imageCode" value="" class="form-control" accept="image/*"
								   onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
							<br>
							<img id="blah" width="400" height="350" src="${pageContext.request.contextPath}/static/Image/${image_url}">
						</div>

					    <button type="submit" name="action" value="${ID == null ? 'insertPro' : 'updatePro'}"  data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg btn-block">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>
</body>
</html>