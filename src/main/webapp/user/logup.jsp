<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .logup {
            border-radius: 10px;
            text-align: center;
            position: relative;
            margin: auto;
            height:370px; width:300px;
            padding:10px;
            border:1px #CCC solid;
            box-shadow: 5px 5px 5px 0px gray;
        }
        .logup input {
            padding:5px; margin:5px
        }
        p {
            color: red;
        }
    </style>
</head>
<body>
    <div class="logup">
        <a href="/products">
            <input type="button" value="Back Home!">
        </a>
        <h2>Log Up</h2>
        <form method="post" action="/users">
            <input type="text" name="user" placeholder="name" size="33">
            <input type="password" name="pass" id="myPass" placeholder="pass" size="24">
            <input type="checkbox" onclick="myFunction()">Show
            <input type="text" name="fullname" placeholder="full name" size="33" required>
            <input type="text" name="address" placeholder="address" size="33" required>
            <input type="text" name="phone" placeholder="phone number" size="33" required>
            <input type="submit" value="Sign Up">
            <a href="/user/login.jsp">
                <input type="button" value="Sign In">
            </a>
            <c:if test='${requestScope["textup"] != null}'>
                <p>Account error!!!</p>
            </c:if>
        </form>
    </div>
    <script>
        function myFunction() {
            var x = document.getElementById("myPass");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
    </script>
</body>
</html>
