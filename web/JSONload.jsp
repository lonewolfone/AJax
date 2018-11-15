<%--
  Created by IntelliJ IDEA.
  User: 听音乐的酒
  Date: 2018/11/14
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Jquery之AJax</title>
    <script src="js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        $(function () {
            //绑定事件  url地址/ 传递参数 / 回掉函数 ：回传参数
            $("#btn").load("/jsonServlet",function (data) {
                    //alert(data);
                    //将响应数据进行解析
                    var respData = eval("("+ data +")");
                        //进行循环展示   两个参数

                        /*$(respData).each(function (index,item) {
                            //将其在div中进行展示  追加
                            $("#show").append(index +"---"+ item.goodsName +"<br>")
                        })*/
                        $.each(respData,function (index,item) {
                            //将其在div中进行展示  追加
                            $("#show").append(index +"---"+ item.goodsName +"<br>")
                        })
                
            })
        })

    </script>
</head>
<body>
    <input type="button" id="btn" value="load方式">
    <div id="show">

    </div>
</body>
</html>
