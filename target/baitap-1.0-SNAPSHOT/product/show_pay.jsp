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
        <h2>List of Pays</h2>
        <tr style="background: #0dcaf0">
            <th>Id Pay</th>
            <th>User</th>
            <th>Date Pay</th>
            <th>Name Product</th>
            <th>Type Product</th>
            <th>Price Product</th>
            <th>Count Order</th>
            <th>Action</th>
        </tr>
        <c:forEach var="pay" items="${listPay}">
            <tr style="background: #b6effb">
                <td><c:out value="${pay.id}"/></td>
                <td><c:out value="${pay.user}"/></td>
                <td><c:out value="${pay.date}"/></td>
                <td><c:out value="${pay.name}"/></td>
                <td><c:out value="${pay.type}"/></td>
                <td><c:out value="${pay.price}"/></td>
                <td><c:out value="${pay.count}"/></td>
                <td>
                    <a href="products?action=deletePay&id=${pay.id}">
                        <input type="button" value="Delete">
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <br>
    <table border="1" cellpadding="5" style="text-align: center">
        <h2>List of Totals</h2>
        <tr style="background: #0dcaf0">
            <th>User</th>
            <th>Total</th>
        </tr>
        <c:forEach var="total" items="${listTotal}">
            <tr style="background: #b6effb">
                <td><c:out value="${total.user}"/></td>
                <td><c:out value="${total.total}"/></td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <br>
    <table border="1" cellpadding="5" style="text-align: center">
        <h2>List of Users</h2>
        <tr style="background: #0dcaf0">
            <th>User Name</th>
            <th>Full Name</th>
            <th>Address</th>
            <th>Phone Number</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr  style="background: #b6effb">
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.fullName}"/></td>
                <td><c:out value="${user.address}"/></td>
                <td><c:out value="${user.phone}"/></td>
            </tr>
        </c:forEach>
    </table>
</div>
<%@include file="include/footer.jsp" %>
</body>
</html>
