<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Products" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.0/mdb.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico">
    <link href="css/styles.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
	<script src="${pageContext.request.contextPath}/static/home_script.js"></script>
    <title>Haro</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <div class="container px-3 px-lg-5">
			<c:url value="/views/admin/home.jsp" var="homeUrl"/>
            <a class="navbar-brand" href="${homeUrl}">Haro</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <form action="trang-chu" method="get">
	            <div class="collapse navbar-collapse" id="navbarSupportedContent">
	            	<div class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					  	<div class="input-group rounded" style="width: 600px;">
			  				<input type="search" id="keyword" name="keyword" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
			  				<button class="btn btn-primary" type="submit" name="action" value="searchPro">
	                			<i class="fas fa-search"></i>
	            			</button>
						</div>
					</div>
				</div>
			</form>
            
            <form class="d-flex ms">
	           <button type="submit" name="action" value="newForm" class="btn btn-success">Insert Product</button>
			</form>
			
        </div>
    </nav>
    <header class="bg-dark py-5">
    	<div class ="bg dark-4 px-lg-5 my-5"></div>
    </header>
   
    <section>
    	<div class="py-5">
    		<div class="container px-4 px-lg-5 mt-5">
   				<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4" style="row-gap: 20px;">
					<c:if test="${not empty products}">
						<c:forEach var="p" items="${products}">
							<div class="col mb-5">
								<div class="card h-100">
									<img src="${p.image_url}" alt="${p.productName}" width="237" height="150">
									<div style="margin-left: 20px;">
										<h5 class="fw-bolder">${p.productName}</h5>
										<span>
                                        <fmt:formatNumber value="${p.cost}" type="currency" currencySymbol="₫" groupingUsed="true" />
                                    </span>
									</div>
									<div align="center">
										<i style="width:53.33%;"></i>
										<b>Còn ${p.quantity}</b>
									</div>
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div style="display: flex; justify-content:center; gap:10px;">
											<form action="trang-chu" method="get">
												<input type="hidden" name="ID" value="${p.ID}">
												<button type="submit" name="action" value="editForm" class="btn btn-primary">Update</button>
											</form>
											<form action="trang-chu" method="post">
												<input type="hidden" name="ID" value="${p.ID}">
												<button type="submit" name="action" value="deletePro" class="btn btn-danger">Delete</button>
											</form>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty products}">
						<p>Không có sản phẩm nào được tìm thấy.</p>
					</c:if>
   				</div>
    		</div>
    	</div>
    </section>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.0/mdb.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
