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
    <script src="${pageContext.request.contextPath}/static/updateCus_script.js"></script>

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
                <form action="${pageContext.request.contextPath}/nguoi-dung?action=updateCustomer" method="POST" onsubmit="return validateForm()">

                    <div data-mdb-input-init class="form-outline mb-4">
                        <input type="hidden" id="ID" name="ID" value="${ID}">
                        <input type="text" id="name" name="name" value="${name}" class="form-control" required />
                        <label class="form-label" for="name" style="color:white">Họ và tên</label>
                    </div>

                    <div class="mb-4">
                        <select data-mdb-select-init class="form-control form-control-lg" id="cities" required>
                            <option value="" selected>Tỉnh/Thành phố</option>
                        </select>
                        <input type="hidden" id="cityName" name="cityName" value="${city}">
                    </div>

                    <div class="mb-4">
                        <select data-mdb-select-init class="form-control form-control-lg" id="districts" required>
                            <option value="" selected>Quận/Huyện</option>
                        </select>
                        <input type="hidden" id="districtName" name="districtName" value="${district}">
                    </div>

                    <div class="mb-4">
                        <select data-mdb-select-init class="form-control form-control-lg" id="wards"  required>
                            <option value="" selected>Phường/Xã</option>
                        </select>
                        <input type="hidden" id="wardName" name="wardName" value="${ward}">
                    </div>

                    <div data-mdb-input-init class="form-outline mb-4">
                        <input type="text" id="address" name="houseNo" value="${houseNo}" class="form-control" required/>
                        <label class="form-label" for="address" style="color:white">Số nhà, Tên đường</label>
                    </div>

                    <div data-mdb-input-init class="form-outline mb-4">
                        <input type="text" id="phone" name="phone" value="${phone}" class="form-control" required>
                        <label class="form-label" for="phone" style="color:white">Số điện thoại</label>
                    </div>

                    <button type="submit" name="action" value="register" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg btn-block">Register</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>
</body>
</html>