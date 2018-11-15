<%--
  Created by IntelliJ IDEA.
  User: 听音乐的酒
  Date: 2018/11/14
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSonAJax页面</title>
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

            //为button绑定事件
            document.getElementById("btn").onclick = function () {
                var xhr = createXMLHttpRequest();
                xhr.open("get","/jsonServlet");
                //相当于请求完成之后的回调处理函数
                xhr.onreadystatechange = function () {
                    if ( xhr.readyState === 4){
                    //服务端响应数据
                     var respText = xhr.responseText;
                            //因后台传过来的是一个json字符串，可以使用 eval 或 JSON.parse 进行解析；如果后台传过来是一个对象，转换之后，就是一个json对象；如果是一个List，转换之后，是一个json数组
                            var jsonObj = JSON.parse(respText);
                            //对接收到的数据进行解析
                            //var jsonObject = eval("("+ respText+")");//得到的是一个数组
                            var inner = "";
                            for (var i = 0 ;i < jsonObj.length ;i++){
                                inner += jsonObj[i].goodsName;
                            }
                            document.getElementById("data").innerHTML = inner;
                           /* var goodsName = jsonObject[0].goodsName;
                     //将其放到 div 中
                     document.getElementById("data").innerHTML = goodsName;*/
                    }
                }
                xhr.send(null);
            }
        }
    </script>
</head>
<body>
    <input type="button" id="btn" value="获取json数据">
    <div id="data">

    </div>
</body>
</html>
