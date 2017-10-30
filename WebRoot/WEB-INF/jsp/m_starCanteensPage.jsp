<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  	<head>
	    <base href="<%=basePath%>">
	    
	    <title>名星食堂</title>
	    <meta http-equiv="pragma" content="no-cache" />
        <meta http-equiv="cache-control" content="no-cache" />
        <meta http-equiv="expires" content="0">   
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
        
        <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/icons.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
    	<link rel="stylesheet" type="text/css" href="css/footnav.css" />
        <script src="js/modernizr.custom.js"></script>
        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.form.js"></script>
        <script src="js/custom.jquery.form.js"></script>
        <script src="js/jquery.validate.js"></script>
        <!-- iOS Web APP中点击链接跳转到Safari 浏览器新标签页的问题 -->
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
  	</head>
  
  	<body>
  		<div class="codrops-header" style="background:rgba(0,0,0,0);">
            <div class="back-container">
                <button class="btn btn-link btn-lg">
                    <a style="color:black" class="icon icon-fanhui" data-ajax="false" href="${pageContext.request.contextPath }/userHomepage.action"></a>
                </button>    
            </div>
            <p style="padding-top:7px;width:100%;height:100%;font-size:27px;color:black">名星食堂</p>  
        </div>
        <div >
        	<img src="/upload/pic/StarCanteens.png" class="center-block" width="100%">
        </div>
        <c:forEach items="${starCanteensList }" var="item">
        	<div class="newcustom" style="margin-top: 10px;">
        	    <table onclick="location.href='userHomepage.action?cantID=${item.cantID}';" width=100%>
        	        <tr>
        	        	<td style='vertical-align: middle;text-align: center;font-size:1.5em;color:black;width:20%'>${item.cantName }</td>
        	            <td style='vertical-align: middle;width:50%' >
        	                <img src="/upload/pic/3e13ffb4-e5df-43e8-8794-172e475398b2.jpg" class="center-block" height="100" width="160" style="border-radius:3%;">
        	            </td>                                                                                                       
        	        </tr>
        	    </table>
        	</div>
        </c:forEach>
        <br>
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                    <br> 
        <div class="footnav">
            <ul>
                <li>
                    <a href="userHomepage.action"><span>首页</span></a>
                </li>
                <li style="position:relative;">
                    <span>附近</span>
                </li>
                <li>
                    <span>订单</span>
                </li>
                <li>
                    <span>我的</span>
                </li>
            </ul>
        </div>


    <!-- 后台传送名星食堂列表starCanteensList到本页面，如果starCanteensList为空，显示提示语“暂无名星食堂” -->
    <!-- 轮播图大小自适应 
            <script type="text/javascript" src="js/jqthumb.js"></script>
            <script>
            function DrawImage(hotimg)
            {
               $(hotimg).jqthumb({
               classname      : 'jqthumb',
                        width          : '100%',
                        height         : '200px',
                        position       : { y: '50%', x: '50%'},
                        zoom           : '1',
                        method         : 'auto',
               });
            }
            </script>   -->
  	</body>
</html>
