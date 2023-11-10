<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/12/5
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>超市系统</title>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
    }



    a {
        text-decoration: none;
        color: #12040c;
    }

    .content {
        width: 100%;
        height: 100%;
        position: relative;
    }

    .content-left1 {
        width: 19%;
        height: 600px;
        background-color: #f25a57;
        float: left;
    }

    .left-title1 {
        width: 100%;
        height: 50px;
    }

    .left-title1>a {
        display: block;
        width: 100%;
        height: 50px;
        line-height: 50px;
        text-align: center;
        color: white;
        text-decoration: none;
    }

    .seg {
        height: 1px;
        width: 100%;
        background-color: #f6843b;
    }

    .nav {
        margin: 5px 0;
    }

    .nav-title {
        height: 40px;
        width: 100%;
        color: white;
        text-align: center;
        line-height: 40px;
        cursor: pointer;
    }

    .nav-content>a {
        display: block;
        width: 100%;
        height: 30px;
        color: #CCCCCC;
        text-decoration: none;
        text-align: center;
        line-height: 30px;
        font-size: 13px;
    }

    .content-right1 {
        width: 81%;
        height: 600px;
        position: absolute;
        top: 0px;
        right: 0px;
        background-color: pink;
    }

    .background {
        overflow: hidden;
        width: 81%;
        height: 600px;
        position: absolute;
        right: 0px;
        top: 0px;
        background: url(img/background.jpg) no-repeat center center;
    }

    .returnuserlogin button {
        width: 100px;
        height: 50px;
        position: absolute;
        right: 650px;
        top: 250px;
        color: #FFFFFF;
        font-size: 20px;
        background-color: #f2272b;
        border-radius: 10px;
        border: 2px #f7803b solid;
        z-index: 2;
    }
    table ,
    tr,
    td {
        border: 1px solid #438ac9;
        border-collapse: collapse;
        text-align: center;
    }
    tr,
    td {
        height: 100px;
    }
    table {
        width: 1000px;

    }
    thead{
        font-family:"华文彩云";/*设置字体*/
        font-size:33px; /*设置字体大小*/
        font-weight:bolder; /*设置字体粗细*/
        -webkit-text-stroke:1px #e874b8;        /*文字描边*/
        -webkit-text-fill-color:transparent;    /*设置文字的填充颜色*/
    }
    tbody{
        font-family:"华文宋体";/*设置字体*/
        font-size:22px; /*设置字体大小*/
        font-weight:bolder; /*设置字体粗细*/
        -webkit-text-stroke:1px #e874b8;        /*文字描边*/
        -webkit-text-stroke:1px #2cb7d9;        /*文字描边*/
    }

    .button-3d-1{
        position: relative;
        background: orangered;
        border: none;
        color: white;
        padding: 15px 24px;
        font-size: 1.4rem;
        outline: none;
        box-shadow: -6px 6px 0 hsl(16, 100%, 30%);
        -webkit-text-stroke:1px #fbfbfc;        /*文字描边*/
    }
    .left-title1{
        font-size:30px; /*设置字体大小*/
        font-weight:100; /*设置字体粗细*/
        text-shadow:1px 0px #009916, 1px 2px #006615, 3px 1px #009916,
        2px 3px #006615, 4px 2px #009916, 4px 4px #006615,
        5px 3px #009916, 5px 5px #006615, 7px 4px #009916,
        6px 6px #006615, 8px 5px #009916, 7px 7px #006615,
        9px 6px #009916, 9px 8px #006615, 11px 7px #009916/*设置文字阴影*/

    }

</style>

<body>
<div class="content">
    <div class="content-left1">
        <div class="left-title1">
            <a href="#">小型超市主界面</a>
        </div>
        <div class="seg"></div>
        <div class="nav">
            <div class="nav-menu1">
                <div class="nav-title" onclick="one()">商品 </div>
            </div>
            <div class="nav-menu1">
                <div class="nav-title" onclick="two()">购物车</div>
            </div>
            <div class="nav-menu1">
                <div class="nav-title" onclick="there()">我的</div>
            </div>
        </div>
        <div class="seg"></div>
    </div>

    <div class="background"></div>

    <div class="content-right1" id="one">
        <table>
            <thead>
                <tr>
                    <td>商品名称</td>
                    <td>商品描述</td>
                    <td>商品价格</td>
                    <td>商品货存</td>
                    <td>操作</td>
                    <td>操作</td>
                </tr>
            </thead>
            <tbody class="tbcontent"></tbody>
        </table>
    </div>
    <div class="content-right1" id="two">
        <table>
            <thead>
            <tr>
                <td>商品名称</td>
                <td>商品描述</td>
                <td>商品价格</td>
                <td>商品货存</td>
                <td>操作</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody class="tbcontent"></tbody>
        </table>
    </div>
    <div class="content-right1" id="three">
        <div class="returnuserlogin"> <a href="index.jsp"><button>返回登陆</button></a></div>

    </div>

</div>
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script>

    $("#one").hide()
    $("#two").hide()
    $("#three").hide()


    function getAllgoods(){
        $.ajax({
            url:"/goodsGetAll",
            success:function (data) {
                var str=""
                for (var i = 0; i <data.length ; i++) {
                    str += "        <tr>"+
                        "<td>"+data[i].goodsName+"</td>"+
                        "<td>"+data[i].goodsDescribe+"</td>"+
                        "<td>"+data[i].goodsMoney+"</td>"+
                        "<td>"+data[i].goodsNumber+"</td>"+
                        "<td><input type='button' class='button-3d-1' value='购买' name=  "+data[i].goodsId+" onclick='buy1(this)'></td>"+
                        "<td><input type='button' class='button-3d-1' value='加入购物车' name=  "+data[i].goodsId+" onclick='joincar(this)'></td>"+
                        "</tr>"
                }
                $(".tbcontent").empty().append(str)
            }
        })
    }

    function getCarAllgoods(){
        $.ajax({
            url:"/getCar",
            success:function (data) {
                var str=""
                for (var i = 0; i <data.length ; i++) {
                    str += "        <tr>"+
                        "<td>"+data[i].goodsName+"</td>"+
                        "<td>"+data[i].goodsDescribe+"</td>"+
                        "<td>"+data[i].goodsMoney+"</td>"+
                        "<td>"+data[i].goodsNumber+"</td>"+
                        "<td><input type='button' class='button-3d-1' value='购买' name=  "+data[i].goodsId+" onclick='buy(this)'></td>"+
                        "<td><input type='button' class='button-3d-1' value='移出购物车' name=  "+data[i].goodsId+" onclick='outcar(this)'></td>"+
                        "</tr>"
                }
                $(".tbcontent").empty().append(str)
            }
        })
    }

    function joincar(obj){
        var goodsId=obj.name
        var data={
            "goodsId": goodsId,
            "inCar":"true"
        }
        $.ajax({
            url: "/inoutcar",
            type : "POST",
            contentType : 'application/json',
            dataType : 'json',
            data :JSON.stringify(data),
            success:function (data){
                if (data=1){
                    alert("加入成功")
                }else {
                    alert("修改失败")
                }
            }
        })

    }

    function outcar(obj){
        var goodsId=obj.name
        var data={
            "goodsId": goodsId,
            "inCar":"false"
        }
        $.ajax({
            url: "/inoutcar",
            type : "POST",
            contentType : 'application/json',
            dataType : 'json',
            data :JSON.stringify(data),
            success:function (data){
                if (data=1){
                    alert("移出成功")
                    getCarAllgoods()
                }else {
                    alert("移出失败")
                }
            }
        })

    }

    function buy(obj){
        var goodsId=obj.name
        var goodsNumber= $(obj).parent().parent().children().eq(3).text()

        var s =parseInt(goodsNumber)-1
        goodsNumber = s.toString();

        var data={
            "goodsId": goodsId,
            "goodsNumber":goodsNumber
        }
        $.ajax({
            url: "/buyGoods",
            type : "POST",
            contentType : 'application/json',
            dataType : 'json',
            data :JSON.stringify(data),
            success:function (data){
                if (data=1){
                    alert("购买成功")
                    getCarAllgoods()
                }else {
                    alert("购买失败")
                }
            }
        })
    }
    function buy1(obj){
        var goodsId=obj.name
        var goodsNumber= $(obj).parent().parent().children().eq(3).text()

        var s =parseInt(goodsNumber)-1
        goodsNumber = s.toString();

        var data={
            "goodsId": goodsId,
            "goodsNumber":goodsNumber
        }
        $.ajax({
            url: "/buyGoods",
            type : "POST",
            contentType : 'application/json',
            dataType : 'json',
            data :JSON.stringify(data),
            success:function (data){
                if (data=1){
                    alert("购买成功")
                    getAllgoods()
                }else {
                    alert("购买失败")
                }
            }
        })
    }

    function one(){
        $("#two").hide()
        $("#three").hide()
        $("#one").toggle()
        getAllgoods()
    }


    function two(){
        $("#one").hide()
        $("#three").hide()
        $("#two").toggle()
        getCarAllgoods()

    }
    function there(){
        $("#one").hide()
        $("#two").hide()
        $("#three").toggle()
    }
</script>
</html>
