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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


    <title>超市管理系统</title>
    <style>
        body{
            height: 100%;
            /* background-color: #cdea10; */
            background:url(img/adminbg.jpg) no-repeat center center;
            background-size: 100% 100%;
        }

        #tt {
            /*border: 1px solid red;*/
            margin: 0px auto;
            width: 1000px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 120px;
            color: transparent;
        }
        span {
            animation: shan 4s linear infinite;
            text-transform: uppercase;
        }
        div span:nth-child(1){
            animation-delay: 0s;
        }
        div span:nth-child(2){
            animation-delay: .4s;
        }
        div span:nth-child(3){
            animation-delay: .8s;
        }
        div span:nth-child(4){
            animation-delay: 1.2s;
        }
        div span:nth-child(5){
            animation-delay: 1.6s;
        }
        div span:nth-child(6){
            animation-delay: 2s;
        }

        @keyframes shan {
            0% ,100%{
                color: white;
                text-shadow: 0 0 4px  pink ,
                0 0 10px pink ,
                0 0 20px cyan ,
                0 0 30px crimson ,
                0 0 40px pink ,
                0 0 50px pink ,
                0 0 60px pink ,
                0 0 70px pink ,
                0 0 80px pink ,
                0 0 90px pink ,
                0 0 100px pink;
            }
            30%,90% {
                color: transparent;
                text-shadow: none;
            }
        }

    </style>

</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<body>
<div id="tt">
    <span>超</span>
    <span>市</span>
    <span>管</span>
    <span>理</span>
    <span>系</span>
    <span>统</span>
</div>
<table class="table table-success table-striped" border="1px">
    <thead>
        <tr>
            <td>商品名称</td>
            <td>商品描述</td>
            <td>商品价格</td>
            <td>商品库存</td>
            <td>操作</td>
            <td>操作</td>
        </tr>
    </thead>
    <tbody class="tbcontent"></tbody>
<%--表格内容通过jqeury ajax动态添加--%>
</table>

<input type="button" class="btn btn-primary" value="添加" onclick="openinsertmodel()">




<!-- updateModal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">修改</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                商品id：<input type="text" class="goodsId" readonly="true"><br>
                商品名称<input type="text" class="goodsName"><br>
                商品描述<input type="text" class="goodsDescribe"><br>
                商品价格<input type="text" class="goodsMoney"><br>
                商品库存<input type="text" class="goodsNumber">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="updatesave()">Save changes</button>
            </div>
        </div>
    </div>
</div>

<!-- inserModal -->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel2">添加</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
<%--                商品id：<input type="text" class="goodsId" readonly="true"><br>--%>
                商品名称<input type="text" class="goodsName1"><br>
                商品描述<input type="text" class="goodsDescribe1"><br>
                商品价格<input type="text" class="goodsMoney1"><br>
                商品库存<input type="text" class="goodsNumber1">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="insertsave()">Save</button>
            </div>
        </div>
    </div>
</div>

</body>
<script src="js/jquery-3.3.1.min.js"></script>

<script>
    getAllgoods()

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
                        "<td><input type='button' class='btn btn-info' value='删除' name=  "+data[i].goodsId+" onclick='del(this)'></td>"+
                        "<td><input type='button' class='btn btn-info' value='修改' name=  "+data[i].goodsId+" onclick='openupdatemodel(this)'></td>"+
                "</tr>"
                }
                $(".tbcontent").empty().append(str)
            }
        })
    }

    function openupdatemodel(obj){
        var goodsId=obj.name

        //数据回显
        $("#exampleModal").modal('show');
        $(".goodsId").val(goodsId)
        $(".goodsName").val($(obj).parent().parent().children().eq(0).text())
        $(".goodsDescribe").val($(obj).parent().parent().children().eq(1).text())
        $(".goodsMoney").val($(obj).parent().parent().children().eq(2).text())
        $(".goodsNumber").val($(obj).parent().parent().children().eq(3).text())

    }

    function updatesave(){
        var goodsId= $(".goodsId").val()
        var goodsName= $(".goodsName").val()
        var goodsDescribe= $(".goodsDescribe").val()
        var goodsMoney= $(".goodsMoney").val()
        var goodsNumber= $(".goodsNumber").val()

        var data={
            "goodsId": goodsId,
                "goodsName": goodsName,
                "goodsDescribe": goodsDescribe,
                "goodsMoney": goodsMoney,
                "goodsNumber": goodsNumber,
        }
        $.ajax({
            url: "/updategoods",
            type : "POST",
            contentType : 'application/json',
            dataType : 'json',
            data :JSON.stringify(data),
            success:function (data){
                if (data=1){
                    alert("修改成功")
                    $("#exampleModal").modal('hide');//隐藏
                    getAllgoods()
                }else {
                    alert("修改失败")
                }
            }
        })
    }


    function openinsertmodel(){
        $("#exampleModal2").modal('show');
    }

    function insertsave(){

        var goodsName= $(".goodsName1").val()
        var goodsDescribe= $(".goodsDescribe1").val()
        var goodsMoney= $(".goodsMoney1").val()
        var goodsNumber= $(".goodsNumber1").val()

        //
        // console.log(goodsName)
        // console.log(goodsDescribe)
        // console.log(goodsMoney)
        // console.log(goodsNumber)


        var data={
            "goodsName": goodsName,
            "goodsDescribe": goodsDescribe,
            "goodsMoney": goodsMoney,
            "goodsNumber": goodsNumber,
        }
        $.ajax({
            url: "/insertGoods",
            type : "POST",
            contentType : 'application/json',
            dataType : 'json',
            data :JSON.stringify(data),
            success:function (data){
                if (data=1){
                    alert("添加成功")
                    $("#exampleModal2").modal('hide');//隐藏
                    getAllgoods()
                }else {
                    alert("添加失败")
                }
            }
        })

    }

    function del(obj){
        var goodsId=obj.name

        var data={
            "goodsId": goodsId,
        }
        $.ajax({
            url: "/delGoods",
            type : "POST",
            contentType : 'application/json',
            dataType : 'json',
            data :JSON.stringify(data),
            success:function (data){
                if (data=1){
                    alert("删除成功")
                    getAllgoods()
                }else {
                    alert("删除失败")
                }
            }
        })
    }
</script>

</html>
