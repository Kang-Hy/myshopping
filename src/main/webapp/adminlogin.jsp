<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/12/5
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登陆</title>
</head>

<style>
    * {
        margin: 0;
        padding: 0;
    }


    html,
    body {
        height: 100%;
        background: url(img/adminlogin.jpg) no-repeat center center;
        background-size: 100% 900px;
    }

    .adm-contrain {
        background-color: #afc7db;
        width: 358px;
        height: 588px;
        border-radius: 18px;
        padding: 0 50px;
        position: relative;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
    }

    .adm-login {
        height: 250px;
        font-size: 38px;
        text-align: center;
        line-height: 250px;
        /* background-color: aqua; */
        position: relative;

    }

    .adm-input {
        display: block;
        width: 338px;
        margin-bottom: 20px;
        border: 0;
        padding: 10px;
        border-bottom: 1px solid rgb(156, 154, 154);
        font-size: 15px;
        outline: none;
        border-radius: 7px;


    }

    .adm-input::placeholder {
        text-transform: uppercase;
        color: #91bee2;
    }

    .adm-btn {
        width: 100%;
        background-color: #91bee2;
        text-align: center;
        font-size: 20px;
        height: 30px;
        line-height: 30px;
        border-radius: 7px;
    }

    a {
        text-decoration: none;
    }

    .adm-login button {
        position: absolute;
        left: 0px;
        top: 412px;
        background-color: #91bee2;
        border-radius: 4px;
        border: 1px solid #3f97e0;

    }
    .adm-login button a {
        color: black;

    }
</style>

<body>
<div class="adm-contrain">
    <div class="adm-login">管理员登录 <button><a href="index.jsp">返回登录</a></button> </div>
    <div class="adm-wrapper">
        <input type="text"  placeholder="管理员用户" class="adm-input" id="adminname">
        <input type="password"  placeholder="管理员密码" class="adm-input" id="adminpwd">
        <div class="adm-btn" onclick="login()">登录</div>
    </div>
</div>
</body>

<script src="js/jquery-3.3.1.min.js"></script>

<script>
    function login(){

        var adminname=$("#adminname")
        var adminpwd=$("#adminpwd").val()

        if (adminname=="admin"){
            if (adminpwd=="123456"){
                window.location.href="adminmain.jsp"
            }
        }else {
            alert("密码错误")
        }
    }
</script>

</html>
