<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">        
        <title>关于</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />        
        <meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
		<meta name="format-detection" content="telephone=no">
		<link rel="stylesheet" href="css/m_bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/footnav.css" />
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

        function userQueryAll(){
                document.userQueryForm.action="userQueryAll.action";
                document.userQueryForm.submit();
            }  
        </script>
	</head>

	<body>
		<div style="position: absolute;top: 15%;width:100%">
            <h3>武汉理工后勤公众号</h3>
            <img src="/upload/pic/qrcode.png" class="center-block" width="50%">
        </div>
        <div class="footnav">
            <ul>
                <li>
                    <a data-ajax="false" href="userHomepage.action"><span>首页</span></a>
                </li>
                <li>
                    <span>订单</span>
                </li>
                <li>
                    <span>我的</span>
                </li>
                <li style="position:relative;">
                    <a data-ajax="false" href="aboutPage.action"><span>关于</span></a>
                </li>
            </ul>
        </div>
	</body>
</html>
