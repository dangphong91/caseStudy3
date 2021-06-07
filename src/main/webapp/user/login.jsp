<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .login {
            border-radius: 10px;
            text-align: center;
            position: relative;
            margin: auto;
            height:270px; width:300px;
            padding:10px;
            border:1px #CCC solid;
            box-shadow: 5px 5px 5px 0px green;
        }
        .login input {
            padding:5px; margin:5px
        }
        p {
            color: red;
        }
    </style>
</head>
<body>
    <form method="post" action="/products">
        <div class="login">
            <a href="/products">
                <input type="button" value="Back Home!">
            </a>
            <h2>Log In</h2>
            <input type="text" name="user" placeholder="name" size="33">
            <input type="password" name="pass" id="myPass" placeholder="pass" size="33"><br>
            <input type="checkbox" onclick="myFunction()">Show Password<br>
            <input type="submit" value="Sign In">
            <a href="/user/logup.jsp">
                <input type="button" value="Sign Up">
            </a>
            <c:if test='${requestScope["textin"] != null}'>
                <p>Account error!!!</p>
            </c:if>
        </div>
    </form>
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
