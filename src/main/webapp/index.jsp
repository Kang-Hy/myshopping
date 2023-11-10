<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/12/5
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        html,
        body
        {
            height: 100%;
        }


        .container {
            height: 100%;
            /* background-color: #cdea10; */
            background:url(img/index.jpg) no-repeat center center;
            background-size: 100% 100%;
        }

        .login-wrapper {
            background-color: #1b0e3c;
            width: 358px;
            height: 588px;
            border-radius: 18px;
            padding: 0 50px;
            position: relative;


            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }

        .header {
            font-size: 40px;
            font-weight: bold;
            text-align: center;
            line-height: 200px;
            color: #fb5ae3;
        }

        .input-item {
            display: block;
            width: 100%;
            margin-bottom: 20px;
            border: 0;
            padding: 10px;
            border-bottom: 1px solid rgb(156, 154, 154);
            font-size: 15px;
            outline: none;
            border-radius: 7px;


        }

        .input-item::placeholder {
            text-transform: uppercase;
            color: #fb5ae3;
        }

        .btn {
            text-align: center;
            padding: 10px;
            width: 100%;
            margin-top: 40px;
            background-color: #330940;
            color: #fff;
            border-radius: 7px;
        }

        .msg {
            text-align: center;
            line-height: 88px;
        }

        a {
            text-decoration-line: none;
            color: #6f9cf6;
            font-size: 20px;
        }
    </style>

</head>
<body>
<div class="container">
    <div class="login-wrapper">
        <div class="header">登录</div>
        <div class="form-wrapper">
            <input type="text" placeholder="username" class="input-item username" >
            <input type="password"  placeholder="password" class="input-item userpwd">
            <div class="btn" onclick="login()">登录</div>
        </div>
        <div class="msg">
            <a href="adminlogin.jsp">管理员登录</a>
        </div>
    </div>
</div>

</body>
<script src="js/jquery-3.3.1.min.js"></script>

<script>
    function login(){

        var username=$(".username").val()
        var userpwd=$(".userpwd").val()
        if (username=="user"){
            if (userpwd=="123456"){
                window.location.href="usermain.jsp"
            }
        }else {
            alert("密码错误")
        }
    }
</script>

</html>
