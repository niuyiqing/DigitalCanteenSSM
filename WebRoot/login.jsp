<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="digitalCanteenSSM.po.Dish" %>
<%@ page import="java.util.*"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  	<head>
    	<base href="<%=basePath%>">   	
    	<title>登录</title>
		<meta http-equiv="pragma" content="no-cache" />
        <meta http-equiv="cache-control" content="no-cache" />
        <meta http-equiv="expires" content="0">   
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-title" content="理工餐饮管理">
        <link rel="apple-touch-icon-precomposed" sizes="57x57" href="manager-icon-57.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="manager-icon-72.png">
        <link rel="apple-touch-icon-precomposed" sizes="76x76" href="manager-icon-76.png">
        <link rel="apple-touch-icon-precomposed" sizes="120x120" href="manager-icon-120.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="manager-icon-144.png">
        <link rel="apple-touch-icon-precomposed" sizes="152x152" href="manager-icon-152.png">
        <link rel="apple-touch-icon-precomposed" sizes="180x180" href="manager-icon-180.png">
        <link rel="stylesheet" type="text/css" href="css/dtfknormalize.css"/>
        <link rel="stylesheet" type="text/css" href="css/dtfkdefault.css">
        <link rel="stylesheet" type="text/css" href="css/dtfkstyles.css">
        <link rel="stylesheet" type="text/css" href="css/inserthtml.com.radios.css">
        <script src="js/modernizr.js"></script>
        <script>  
        if(('standalone' in window.navigator)&&window.navigator.standalone){  
                var noddy,remotes=false;  
                document.addEventListener('click',function(event){  
                        noddy=event.target;  
                        while(noddy.nodeName!=='A'&&noddy.nodeName!=='HTML') noddy=noddy.parentNode;  
                        if('href' in noddy&&noddy.href.indexOf('http')!==-1&&(noddy.href.indexOf(document.location.host)!==-1||remotes)){  
                                event.preventDefault();  
                                document.location.href=noddy.href;  
                        }  
                },false);  
        }  
        </script>
        <script>
     
        window.onload= function(){
        if(!($('#userName').val()=="")){
         document.getElementById('myForm').submit();
          }        
        }
        </script>
    <%
     String userName = "";
     String password = "";
     //获取当前站点的所有Cookie
     try{
     Cookie[] cookies = request.getCookies();
     if(cookies!=null){
          for (int i = 0; i < cookies.length; i++) {
         if ("userName".equals(cookies[i].getName())) {
             userName = cookies[i].getValue();
         } else if ("password".equals(cookies[i].getName())) {
             password = cookies[i].getValue();
         }
     }
   }    
        }catch(Exception e){}
    %>

   
  	</head>
  
  	<body >
  		<div>${message_login}</div>
          <div class="htmleaf-container">
            <div class="wrapper">
              <div style="position: relative;top: 10%;">
                <img src="/upload/pic/login.png" class="center-block" width="40%">
              </div>
              <div class="container">
                <!-- <h1>Welcome</h1> -->        
    	          <form action="${pageContext.request.contextPath}/login.action" id="myForm" method="post">
                  <input type="text" placeholder="用户名" name="userName" id="userName" value="<%=userName%>">
                  <input type="password" placeholder="密码" name="password" value="<%=password%>">
                  
                  <!-- <div class="holder">                    
                      记住密码<input type="checkbox" value="y" name="isLogin" id="checkbox-10-2"  /><label for="checkbox-10-2"></label>                    
                  </div> --> 
                  
                  <button type="submit" id="login-button">登录</button>
                  <br/><br/>
                  <!-- <a href="${pageContext.request.contextPath}/userRegisterPage.action">注册</a> -->
    	          </form>             
              </div>
              <ul class="bg-bubbles">
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
              </ul>
            </div>
            <div style="position: fixed;bottom: 5%;text-align: center;width: 100%;">
              <h3 style="color:black">建设单位:集团信息化建设工作办公室</h3>
            </div>
          </div>
  <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
  <script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
</body>
</html>
