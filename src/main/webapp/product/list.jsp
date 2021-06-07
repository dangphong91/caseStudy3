<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/headers/">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <title>Product Management</title>
    <style>
        nav li a {
            display: block;
            color: #000;
            padding: 8px 16px;
            text-decoration: none;
        }
        nav li a.active {
            background-color: #04AA6D;
            color: white;
        }
        nav li a:hover:not(.active) {
            background-color: #555;
            color: white;
        }
        a {
            text-decoration: none;
        }
        .slide .slideshow-container {
            max-width: 1000px;
            position: relative;
            margin: auto;
        }
         .slide .text {
            color: #f2f2f2;
            font-size: 15px;
            padding: 8px 12px;
            position: absolute;
            bottom: 8px;
            width: 100%;
            text-align: center;
        }
        .slide .numbertext {
            color: #f2f2f2;
            font-size: 12px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
        }
        .slide .dot {
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }
        .slide .active {
            background-color: #717171;
        }
        .slide .fade {
            -webkit-animation-name: fade;
            -webkit-animation-duration: 3s;
            animation-name: fade;
            animation-duration: 3s;
        }
        @-webkit-keyframes fade {
            from {opacity: .4}
            to {opacity: 1}
        }
        @keyframes fade {
            from {opacity: .4}
            to {opacity: 1}
        }
    </style>
</head>
<body style="width: 85vw; margin: auto">
    <%@include file="include/header.jsp" %>
    <%@include file="include/navbarleft.jsp" %>
    <%@include file="include/navbarright.jsp" %>
<div style="margin: auto; text-align: center; width: 75%">
    <br>
    <div class="slide">
        <%@include file="include/slide.jsp" %>
    </div>
    <div>
        <br>
        <h2>List of Products</h2>
        <c:if test='${requestScope["view"] == null}'>
            <c:forEach var="product" items="${listProduct}">
                <div style="padding: 10px; width: 22%; float: left; margin: 1.5%; border-radius: 10px; box-shadow: 3px 3px 3px 0px green">
                    <img style="width: 95%;" src=<c:out value="img/${product.img}"/>>
                    <c:out value="${product.name}"/><br>
                    <c:out value="${product.type}"/><br>
                    <c:out value="Giá ${product.price}"/><br>
                    <c:out value="Còn ${product.inventory} sản phẩm"/><br>
                    <c:if test='${requestScope["user"] == "admin"}'>
                        <a href="products?action=edit&id=${product.id}">
                            <input type="button" value="Edit">
                        </a>
                        <a href="products?action=delete&id=${product.id}">
                            <input type="button" value="Delete">
                        </a>
                    </c:if>
                    <c:if test='${requestScope["user"] != "admin" && requestScope["user"] != null}'>
                        <a href="products?action=add&id=${product.id}">
                            <input type="button" value="Add To Cart">
                        </a>
                    </c:if>
                </div>
            </c:forEach>
        </c:if>
        <c:if test='${requestScope["view"] != null}'>
            <center>
            <table style="text-align: center">
                <tr style="background: blue">
                    <th style="padding: 10px">Name</th>
                    <th style="padding: 10px">Type</th>
                    <th style="padding: 10px">Price</th>
                    <th style="padding: 10px">Inventory</th>
                    <th style="padding: 10px">Image</th>
                    <c:if test='${requestScope["user"] != null}'>
                        <th style="padding: 10px">Action</th>
                    </c:if>
                </tr>
                <c:forEach var="product" items="${listProduct}">
                    <tr style="background: #b6d4fe">
                        <td style="padding: 20px"><c:out value="${product.name}"/></td>
                        <td style="padding: 20px"><c:out value="${product.type}"/></td>
                        <td style="padding: 20px"><c:out value="${product.price}"/></td>
                        <td style="padding: 20px"><c:out value="${product.inventory}"/></td>
                        <td style="padding: 20px"><img style="width: 100px;" src=<c:out value="img/${product.img}"/>></td>
                        <c:if test='${requestScope["user"] == "admin"}'>
                        <td style="padding: 20px">
                            <a href="products?action=edit&id=${product.id}">Edit</a>
                            <a href="products?action=delete&id=${product.id}">Delete</a>
                        </td>
                        </c:if>
                        <c:if test='${requestScope["user"] != "admin" && requestScope["user"] != null}'>
                        <td style="padding: 20px">
                            <a href="products?action=add&id=${product.id}">Add To Cart</a>
                        </td>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
            </center>
        </c:if>
    </div>
</div>
<%@include file="include/footer.jsp" %>
<script>
    window.onscroll = function() {scrollFunction()};
    function scrollFunction() {
        if (document.body.scrollTop > 40 || document.documentElement.scrollTop > 40) {
            document.getElementById("navbarleft").style.left = "0px";
            document.getElementById("navbarright").style.right = "0px";
        } else {
            document.getElementById("navbarleft").style.left = "-300px";
            document.getElementById("navbarright").style.right = "-300px";
        }
    }
</script>
</body>
</html>
