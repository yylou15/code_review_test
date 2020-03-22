<%--
  Created by IntelliJ IDEA.
  User: GH
  Date: 2018/12/7
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

    <link rel="StyleSheet" href="css/jpetstore.css" type="text/css"
          media="screen" />

    <meta name="generator" content="HTML Tidy for Linux/x86 (vers 1st November 2002), see www.w3.org" />
    <title>MyPetStore</title>
    <meta content="text/html; charset=windows-1252" http-equiv="Content-Type" />
    <meta http-equiv="Cache-Control" content="max-age=0" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="Expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="Pragma" content="no-cache" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    <style>
        #auto{
            position:absolute;
            display:none;
            height:auto;
            overflow:auto;
            border:solid 0.5px #808080;
            font-size:12px;
            color:green;
            cursor:pointer;
            padding:1px;
        }
        #message{
            background-color:#ececec;
            border:solid 0.5px #808080;
            height:150px;
        }
    </style>

    <script type="text/javascript">
        var xmlHttpRequest;


        function createXMLHttpRequest(){
            if(window.XMLHttpRequest){
                xmlHttpRequest = new XMLHttpRequest();
            }
            else if(window.Activeobject){
                xmlHttpRequest = new Activeobject("Msxml2.XMLHTTP");

            }
            else{
                xmlHttpRequest = new Activeobject("Microsoft.XMLHTTP");
            }
        }
        function search(content){
            //如果输入内容为空则返回
            if(content === "")
                return;
            //拿到auto的句柄
            var auto = document.getElementById("auto");
            //向下
            if(event.keyCode ===40 && auto.style.display === "block"){
                var select = document.getElementById("message");//得到选项卡
                select.focus();//选项卡获得焦点
                select.selectedIndex = 5;//默认第一个元素被选中
                return;
            }
            auto.style.display = 'none';
            //创建XMLHttpRequest对象
            //createXMLHttpRequest();
            //设置回调函数
            //xmlHttpRequest.onreadystatechange = response;
            //初始化
            //xmlHttpRequest.open('POST',encodeURI('AutoComplete.do?content='+content),true);
            //xmlHttpRequest.open("POST", "'AutoComplete?content='+content", true);
            //发送请求
            //xmlHttpRequest.send(null);
            sendRequest("AutoComplete?content="+content);
        }
        function sendRequest(url){
            //createXMLHttpRequest();
            xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.open("GET", url, true);
            xmlHttpRequest.onreadystatechange = response;
            xmlHttpRequest.send(null);
        }
        function response(){
            if(xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200 ){
                var auto = document.getElementById("auto");//拿到auto的句柄
                var content = document.getElementById("content1");//拿到content的句柄
                var select = document.getElementById("message");//拿到message的句柄
                select.length = 0;//删除select选项的内容
                var s = xmlHttpRequest.responseText;
                if(s === ""){
                    auto.style.display = "none";
                    return;
                }
                var contents = s.split(",");//截取字符串
                select.size = contents.length;//设置select的size值
                select.onkeyup = function(){
                    content.value = this.value;//select的值为其选中的值
                    if(event.keyCode === 13){//如果按下回车
                        this.parentNode.style.display = "none";
                    }
                }
                select.onclick = function(){
                    content.value = this.value;//select的值为其选中的值
                    this.parentNode.style.display = "none";
                }
                for(var i=0;i<contents.length;i++){
                    select.options[i] = new Option(contents[i],contents[i]);
                }
                //设置auto的位置
                var left = content.offsetLeft;
                var top = content.offsetTop;
                auto.style.left = left + "px";
                auto.style.top = top + content.offsetHeight + "px";
                auto.style.width = content.offsetWidth+ "px";
                auto.style.display = 'block';
                select.style.width = content.offsetWidth+ "px";
            }
        }
    </script>



</head>

<body>

<div id="Header">

    <div id="Logo">
        <div id="LogoContent">
            <a href="main"><img src="images/logo-topbar.gif" /></a>
        </div>
    </div>

    <div id="Menu">
        <div id="MenuContent">
            <a href="viewCart">
                <img align="middle" name="img_cart" src="images/cart.gif">
            </a>
            <img align="middle" src="images/separator.gif" />

            <s:if test="#session.account == null">

                <a href="signonForm">Sign In</a>
            </s:if>
            <s:if test="#session.account != null">
                <a href="signOut">Sign Out</a>
                <img align="middle" src="images/separator.gif" />
                <a href="editAccount">My Account</a>
            </s:if>
            <img align="middle" src="images/separator.gif" />

            <a href="viewHelp">?</a>
        </div>
    </div>

    <div id="Search">
        <div id="SearchContent">
            <form action="searchProduct" method="post">
                <input type="text" name="keyword" id="content1" onkeyup="search(this.value)" size="14" />
                <div id="auto">
                    <select id="message"></select>
                </div>
                <input type="submit" name="searchProducts" value="Search" />
            </form>
        </div>
    </div>

    <div id="QuickLinks">
        <a href="viewCategory?categoryId=FISH">
            <img src="images/sm_fish.gif" /></a>
        <img src="images/separator.gif" />
        <a href="viewCategory?categoryId=DOGS">
            <img src="images/sm_dogs.gif" /></a>
        <img src="images/separator.gif" />
        <a href="viewCategory?categoryId=REPTILES">
            <img src="images/sm_reptiles.gif" /></a>
        <img src="images/separator.gif" />
        <a href="viewCategory?categoryId=CATS">
            <img src="images/sm_cats.gif" /></a>
        <img src="images/separator.gif" />
        <a href="viewCategory?categoryId=BIRDS">
            <img src="images/sm_birds.gif" /></a>
    </div>

</div>

<div id="Content">
</div>