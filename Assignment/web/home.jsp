<%-- 
    Document   : home
    Created on : Oct 29, 2021, 10:32:10 AM
    Author     : tenhik
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Laptop Store</title>
        <!--css file-->
        <link rel="stylesheet" href="assets/style.css">
        <link rel="icon" href="assets/favicon.ico" type="image/x-icon">
        <!-- boostrap -->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <!-- font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
    <jsp:useBean id="getCategory" scope="page" class="dal.CategoryDAO"></jsp:useBean> 
        <body>
        <jsp:include page="template/header.jsp"/>
        <jsp:include page="template/banner.jsp"/>
        <div class="container-fluid">
            <div class="row">
                <jsp:include page="template/category.jsp"/>
                <div class="col-xl-9 row">
                    <!--no product-->
                    <c:if test="${totalProduct==0}"> 
                        <div class="col-md-12 ">
                            <div class="error-template">
                                <img src="https://www.magentapress.in/images/img-no-products.png"alt="">
                            </div>
                        </div>
                    </c:if>
                    <!--sorting and pagging-->
                    <div class="col-xs-12">
                        <div class="filter">
                            <jsp:include page="template/sort.jsp"/>
                            <jsp:include page="template/pagging.jsp"/>
                        </div>
                        <div class="row mt-3">
                            <!--product item-->
                            <c:forEach items="${listProducts}" var="o">  
                                <div class="col-xl-3 col-xs-6 col-sm-4 col-md-4 col-lg-3 mt-2" style="display: flex">
                                    <!-- product -->
                                    <div class="make-3D-space">
                                        <div class="product-card">
                                            <div class="product-front">
                                                <div class="shadow"></div>
                                                <c:forEach var="i" items="${o.listImage}">
                                                    <img class="card-img-top"
                                                         src="${i.img1}"
                                                         alt="" />
                                                </c:forEach>
                                                <div class="image_overlay"></div>
                                                <a href="detail?productId=${o.id}" 
                                                   class=" view_details font-weight-bold text-uppercase text-center text-white" 
                                                   style="text-decoration:none">
                                                    Xem chi tiết</a>
                                                <div class="stats">
                                                    <div class="block"></div>
                                                    <div class="stats-container">
                                                        <div class="product-name">
                                                            <span class="product_name h3">${o.name} </span>
                                                        </div>
                                                        <span class="product_price">$ ${o.price}</span>
                                                        <c:if test="${o.cateId==1}">
                                                            <p>Mỏng, nhẹ</p>
                                                        </c:if>
                                                        <c:if test="${o.cateId==2 || o.cateId ==3}">
                                                            <p>Mạnh mẽ</p>
                                                        </c:if>
                                                        <c:if test="${o.cateId==4}">
                                                            <p>Tiện dụng</p>
                                                        </c:if>
                                                        <c:if test="${o.cateId==5}">
                                                            <p>Dễ tiếp cận</p>
                                                        </c:if>
                                                        <div class="product-options">
                                                            <strong>CPU:</strong>
                                                            <span>${getCategory.getProcessorById(o.processorId)}</span>
                                                        </div>
                                                        <div class="product-options">
                                                            <strong>RAM:</strong>
                                                            <span>${o.ram}</span>
                                                        </div>
                                                        <div class="product-options">
                                                            <strong>HDD:</strong>
                                                            <span>${o.harddrive}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>               
                                </div>
                            </c:forEach>  
                        </div>
                        <!--end product item-->
                    </div>
                </div>
                <!-- page -->
            </div>
        </div>
        <!-- footer -->
        <jsp:include page="template/footer.jsp"/>
        <script>
            document.addEventListener("DOMContentLoaded", function (event) {
                var scrollpos = localStorage.getItem('scrollpos');
                if (scrollpos)
                    window.scrollTo(0, scrollpos);
            });

            window.onbeforeunload = function (e) {
                localStorage.setItem('scrollpos', window.scrollY);
            };
        </script>
        <script src="assets/main.js"></script>
    </body>

</html>
