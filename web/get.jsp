<%--
  Created by IntelliJ IDEA.
  User: 听音乐的酒
  Date: 2018/11/15
  Time: 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发送get请求</title>
    <script src="js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
       /*
         $(function () {
            $("#btn").click(function () {
                $.get(
                    url,地址
                    data,传递参数
                    type,返回方式
                    callBack;回掉函数
                )
            })
        })
       * */
        $(function () {
            //给button绑定点击事件
            $("#btn").click(function () {
                //在每次发送请求之前先进行清空
                $("#show").empty();
                //当点击的时候触发get请求，请求到Servlet,然后将响应的数据在div(其他容器)中循环展示
                $.post(
                    // url地址
                    "jsonServlet",
                    //请求参数
                    {id:"123"},
                    //回调函数
                    function (data) {//回调函数中携带参数data，本身为一个json数组，无需处理直接输出
                        $.each(data,function (index,item) {
                            //将其在div中进行展示  追加
                            $("#show").append(index +"---"+ item.goodsName +"<br>");
                    })
                    },
                    "json"  //作用：将回调函数中数据：data 进行解析
                    )
            })
        })
    </script>
</head>
<body>
    <input type="button" id="btn" value="发送get请求">
    <div id="show">
        
    </div>
</body>
</html>
