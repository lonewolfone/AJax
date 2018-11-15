## AJax

### 初始AJax

局部刷新页面

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\75.png)

###XMLHttpRequest

使浏览器发出HTTP请求与接收HTTP响应

使用XMLHttpRequest对象发送一个Ajzx请求

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\80.png)

#### XMLHttpRequest对象

AJax.jsp

```jsp
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
</script>
```

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\76.png)

#### XMLHttpResquest的方法

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\79.png)

#### XMLHttpResquest的属性

#### AJax开发步骤

##### 创建XMLHttpResquest对象

AJax.jsp

```jsp
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

```

ajaxServlet

```java
@WebServlet( "/ajaxServlet")
public class ajaxServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print("Hello AJax");
//        ................................................
        String id = request.getParameter("id");
        System.out.println(id);
    }
}

```



##### 打开与服务器的链接，并设置链接信息

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\81.png)

##### 发送数据

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\92.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\93.png)

##### 接收响应数据

###### readvState

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\83.png)

###### status



###### responseText

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\84.png)

###### reponseXML

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\85.png)

##### 写服务器端的响应

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\82.png)

###数据格式

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\86.png)

#### HTML

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\87.png)

#### XML

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\88.png)

#### JSON

##### JSON简介

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\89.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\90.png)

JSON.jsp

```jsp
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
```

##### JSON解析

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\91.png)

##### JSON事例

当请求数据时，返回一个json对象

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\94.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\95.png)

JsonAJax.jsp

```jsp
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
                    //服务端响应数据(因后台传过来的是一个json字符串，可以使用 eval 或 JSON.parse 进行解析；如果后台传过来是一个对象，转换之后，就是一个json对象；如果是一个List，转换之后，是一个json数组
                     var respText = xhr.responseText;
                            //对接收到的数据进行解析
                            var jsonObject = eval("("+ respText+")");//得到的是一个数组
                            var goodsName = jsonObject[0].goodsName;
                     //将其放到 div 中
                     document.getElementById("data").innerHTML = goodsName;
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

```

jsonServlet类

```java
@WebServlet( "/jsonServlet")
public class jsonServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/json");
        response.setCharacterEncoding("utf-8"  );
        PrintWriter out = response.getWriter();
        goodsService goodsService =  new goodsServiceImpl();
        //获取商品列表
        List<Goods> goodsList = goodsService.findAllGoods();
        //将其转化为JSON字符串
        String strJson =  JSON.toJSONString(goodsList);
        //将其输出到jsp页面
        out.print(strJson);
        //关闭流
        out.close();

    }
}
```

------

JsonAJax.jsp

```jsp
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
```



###Jquery之AJax

**异步请求，局部刷新**

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\96.png)

#### AJax常用方法

##### load()方法

jsonServlet类

JSONload.jsp

```jsp
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

```

##### $.ajax

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\97.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\98.png)

#####  $.get() 方法(   或  $.post() 方法)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\99.png)

###### $.get()

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\100.png)

get.jsp(发送get请求)

```jsp
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
                $.get(
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

```

###### $.post()

异步提交；局部刷新，页面不会刷新

get.jsp(发送post请求)

```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发送get请求</title>
    <script src="js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
      
        $(function () {
            $("#btn").click(function () {
                $.post(
                    "jsonServlet",
                    {id:"123"},
                    function (data) {
                        $.each(data,function (index,item) {
                            $("#show").append(index +"---"+ item.goodsName +"<br>");
                   		 })
                    },
                    "json"  
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

```



###### 应用

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\101.png)

##### serialize()方法

#### 应用

##### 验证日期

##### 验证email

##### 动态加载列表框

###跨域