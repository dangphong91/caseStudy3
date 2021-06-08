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
    <title>Product Management Application</title>
    <style>
        a {
            text-decoration: none;
        }
    </style>
</head>
<body style="width: 85vw; margin: auto">
<%@include file="include/header.jsp" %>
<div align="center" style="margin-top: 50px">
    <table border="1" cellpadding="5" style="text-align: center">
        <h2>List of Orders</h2>
        <tr style="background: #0dcaf0">
            <th>Id Order</th>
            <th>Date Order</th>
            <th>Name Product</th>
            <th>Type Product</th>
            <th>Price Product</th>
            <th>Count Order</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="order" items="${listOrder}">
            <tr style="background: #b6effb">
                <td><c:out value="${order.id}"/></td>
                <td><c:out value="${order.date}"/></td>
                <td><c:out value="${order.nameProduct}"/></td>
                <td><c:out value="${order.type}"/></td>
                <td><c:out value="${order.price}"/></td>
                <td><c:out value="${order.count}"/></td>
                <td>
                    <a href="products?action=deleteOrder&id=${order.id}">
                        <input type="button" value="Delete">
                    </a>
                    <a href="products?action=addPay&id=${order.id}">
                        <input type="button" value="Pay">
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <br>
    <table border="1" cellpadding="5" style="text-align: center">
        <h2>List of Pays</h2>
        <tr style="background: #0dcaf0">
            <th>Id Pay</th>
            <th>Date Pay</th>
            <th>Name Product</th>
            <th>Type Product</th>
            <th>Price Product</th>
            <th>Count Order</th>
        </tr>
        <c:forEach var="pay" items="${listPay}">
            <tr style="background: #b6effb">
                <td><c:out value="${pay.id}"/></td>
                <td><c:out value="${pay.date}"/></td>
                <td><c:out value="${pay.name}"/></td>
                <td><c:out value="${pay.type}"/></td>
                <td><c:out value="${pay.price}"/></td>
                <td><c:out value="${pay.count}"/></td>
            </tr>
        </c:forEach>
    </table>
    <h3>TOTAL PAYMENT : ${requestScope["total"]}</h3>
</div>
<%@include file="include/footer.jsp" %>
</body>
</html>
