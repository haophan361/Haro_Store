<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/style.css">
<title>Trang đăng kí</title>
</head>
<body>
	<section class="h-100 bg-light">
	  <div class="container py-5 h-100">
	    <div class="row d-flex justify-content-center align-items-center h-100">
	      <div class="col">
	        <div class="card card-registration my-4">
	            <div class="col-xl-6 mx-auto">
	              <div class="card-body p-md-5 text-black">
	                <h3 class="mb-5 text-uppercase" style="text-align:center">Register</h3>	
	                				
					<div data-mdb-input-init class="form-outline mb-4">
	                  <input type="text" id="name" class="form-control form-control-lg" />
	                  <label class="form-label" for="name">Họ và tên</label>
	                </div>
	                
	                <div class="row">
	                
	                  <div class="col-md-12 mb-4">
	                    <select data-mdb-select-init>
	                      <option value="1">Tỉnh/Thành Phố</option>
	                      <option value="2">Option 1</option>
	                      <option value="3">Option 2</option>
	                      <option value="4">Option 3</option>
	                    </select>
	                  </div>
	                  
	                  <div class="col-md-12 mb-4">
	                    <select data-mdb-select-init>
	                      <option value="1">Quận/Huyện</option>
	                      <option value="2">Option 1</option>
	                      <option value="3">Option 2</option>
	                      <option value="4">Option 3</option>
	                    </select>
	                  </div>
	                  
	                  <div class="col-md-12 mb-4">
	                    <select data-mdb-select-init>
	                      <option value="1">Phường/Xã</option>
	                      <option value="2">Option 1</option>
	                      <option value="3">Option 2</option>
	                      <option value="4">Option 3</option>
	                    </select>
	                  </div>
	                  
                	</div>
	                
	                <div data-mdb-input-init class="form-outline mb-4">
	                  <input type="text" id="address" class="form-control form-control-lg" />
	                  <label class="form-label" for="address">Số nhà, Tên đường</label>
	                </div>
	 
	                <div data-mdb-input-init class="form-outline mb-4">
	                  <input type="text" id="phone" class="form-control form-control-lg" />
	                  <label class="form-label" for="phone">Số điện thoại</label>
	                </div>
	
	                <div data-mdb-input-init class="form-outline mb-4">
	                  <input type="text" id="email" class="form-control form-control-lg" />
	                  <label class="form-label" for="email">Email</label>
	                </div>
	
	                <div data-mdb-input-init class="form-outline mb-4">
	                  <input type="text" id="password" class="form-control form-control-lg" />
	                  <label class="form-label" for="password">Mật khẩu</label>
	                </div>
	
	                <div class="d-flex justify-content-end pt-3">
	                  <button type="button" name="action" value="register" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg btn-block" style="color:white">Submit form</button>
	                </div>
	
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	</section>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>
</body>
</html>