<%--
  Created by IntelliJ IDEA.
  User: 听音乐的酒
  Date: 2018/11/13
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    // 产生XMLHTTPRequest对象
    function createXMLHttpRequest() {
        var xmlreq = false;
        if(window.ActiveXObject){
            // for IE6  IE5
            xmlreq = new ActiveXObject("Microsoft.XMLHTTP");
        }else if (window.XMLHttpRequest){
            xmlreq = new XMLHttpRequest();
        }
        return xmlreq;
    }
    window.onload = function () {
        var btn = document.getElementById("btn");
        //给btn绑定点击事件
        btn.onclick = function (){
            //1、创建XMLHTTPRequest对象，使用open()方法，打开与服务器链接
            var xmlreq = createXMLHttpRequest();
            //xmlreq.open("GET","/ajaxServlet?id=1"); //发送的是get请求，数据通过url地址传递
            xmlreq.open("POST","/ajaxServlet");
            //标识此次请求的请求体格式为：urlencode 以便于服务端接受数据
            xmlreq.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            var  id = 1;
            var  data ="id =" + id;
            // 3、发送请求到服务端
            xmlreq.send(data);
            //4、相当于请求完成之后的回调处理函数
            xmlreq.onreadystatechange = function () {
                if (xmlreq.readyState === 4){//当响应完成之后  再处理响应数据
                    console.log(xmlreq.readyState)//接收整个响应的数据
                    document.getElementById("main").innerHTML = "<h1>"+xmlreq.responseText+"</h1>";
                }
            }
        }

    }
</script>
<html>
<head>
    <title>AJax的学习</title>
</head>
<body>
<input type="button" id="btn" value="AJax请求">
<div id="main">

</div>
</body>
</html>
