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
                <h1 style="text-align:center">Đổi mật khẩu</h1>
                <form action="${pageContext.request.contextPath}/trang-dang-nhap" method="post">

                    <div data-mdb-input-init class="form-outline mb-4">
                        <input type="hidden" id="password" name="password" value="${password}">
                        <input type="password" id="oldPassword" name="oldPassword" class="form-control" required/>
                        <label class="form-label" for="oldPassword" style="color:white">Nhập mật khẩu cũ</label>
                        <c:if test="${not empty wrongPassWord}">
                            <small style="color: red;">${wrongPassWord}</small>
                            <c:remove var="wrongPassWord" scope="request" />
                        </c:if>
                    </div>

                    <div data-mdb-input-init class="form-outline mb-4">
                        <input type="password" id="newPassword" name="newPassword" class="form-control" required>
                        <label class="form-label" for="newPassword" style="color:white">Mật khẩu mới</label>
                    </div>

                    <div data-mdb-input-init class="form-outline mb-4">
                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required />
                        <label class="form-label" for="confirmPassword" style="color:white">Nhập lại mật khẩu</label>
                        <c:if test="${not empty wrongConfirmPassword}">
                            <small style="color: red;">${wrongConfirmPassword}</small>
                            <c:remove var="wrongConfirmPassword" scope="request" />
                        </c:if>
                    </div>

                    <button type="submit" name="action" value="changePassword" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg btn-block">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>
</body>
</html>