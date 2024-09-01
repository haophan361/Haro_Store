<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Products" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
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
    <script src="${pageContext.request.contextPath}/static/home_script.js"></script>
    <title>Haro</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <div class="container px-3 px-lg-5">
            <a class="navbar-brand" href="#!">Haro</a>
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
	           <button class="btn btn-outline-dark" type="submit">
	               <i class="bi-cart-fill me-1"></i>
	               Cart
	               <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
	           </button>
			</form>
        </div>
    </nav>
    <header class="bg-dark py-5">
    	<div class ="bg dark-4 px-lg-5 my-5"></div>
    </header>
   
    <section>
    	<div class="py-5">
    		<div class="container px-4 px-lg-5 mt-5">
   				<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify content-center" style="row-gap: 120px;" >
   					<% 
			        List<Products> products = (List<Products>) request.getAttribute("products");
    			 	if(products!=null && !products.isEmpty())
    			 	{
				        for (Products product : products) 
				        { 
    				%>
		    				<div class="col mb-5">
   								<div class="card h-100">
   									<img src="<%= product.getImage_url() %>" alt="..." width=237 height=150>
										<div  style="margin-left: 20px;">
											<h5 class="fw-bolder"><%= product.getProductName()%></h5>
											<%NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
   										String formattedCost = formatter.format(product.getCost()); %>
											<span><%= formattedCost %></span>
										</div>
										<div align="center">
						        			<i style="width:53.333336%;"></i>
					            			<b>Còn <%=product.getQuantity()%> </b>
   										</div>
   								</div>
   								<div class="card footer p-4 pt-0 border-top-0 gb-transparent">
   									<div class="text-center">
   										<a class="btn btn-outline-dark mt-auto" href="#">View options</a>
   									</div>
   								</div>
   							</div>
   					<%
        				}
    				} 
    			 	else 
    			 	{
					%>
        				<p>Không có sản phẩm nào được tìm thấy.</p>
    				<%}%>
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
