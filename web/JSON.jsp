<%--
  Created by IntelliJ IDEA.
  User: 听音乐的酒
  Date: 2018/11/14
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSON数据格式</title>
    <script type="text/javascript">
        var jsonObject = {
            "name":"二狗",
            "age" : 25,
            "address":{"county":"China","city":"北京"},
            "teacher":function () {
                alert("JavaEE,UI");
            }
        };

        window.onload = function () {
            alert(jsonObject.name);
            alert(jsonObject.age);
            alert(jsonObject.address.county);
            alert(jsonObject.address.city);
            jsonObject.teacher();
        }
    </script>
</head>
<body>

</body>
</html>
