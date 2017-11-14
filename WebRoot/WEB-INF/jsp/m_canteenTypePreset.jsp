<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> -->
<html>
<head>
    <base href="<%=basePath%>">   
    <title>预置食堂类型信息</title>
    <meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0">   
 	<meta charset="utf-8">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
	<meta name="format-detection" content="telephone=no">
	
	<script src="js/modernizr.custom.js"></script>
    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="css/demo.css" />
    <link rel="stylesheet" type="text/css" href="css/icons.css" />
    <link rel="stylesheet" type="text/css" href="css/component.css" />
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

<div class="container">
    <div class="mp-pusher" id="mp-pusher">
		<%@ include file="publicjsp/index.jsp" %>               
        <div class="scroller" style="background:#EEEEEE">
        	<div class="scroller-inner">
                <div class="codrops-header" style="background:#29C192">
        	         <div id="trigger" class="burger-container">
						<span class="burger-bun-top"></span>
						<span class="burger-filling"></span>
						<span class="burger-bun-bot"></span>
					 </div>					
					<p style="width:100%;height:100%;vertical-align:middle;font-size:27px">预置食堂类型</p> 
				</div>

				<div class="content clearfix">			
				<form action="insertCanteenType.action" method="post">
	<!-- 添加食堂类型 -->
				<div class=" newcustom" style="margin-top:77px" >
					<div class="form-group" >
    					<div> 
    						<input name="cantTypeName" class="form-control " type="text" placeholder="请输入预置食堂类型"> 
    					</div>
    					<br>
    					<div align="center">
    						<input  type="submit" value="添加食堂类型"  class="btn btn-primary btn-wide" data-role="none">
    					</div>
  					</div>
				</div>
	<!-- 列举所有已录入食堂类型 -->
				<div class="newcustom" style="padding: 1em 0.6em">
					<table  class="table table-striped table-bordered table-condensed">
						<thead>
					    	<tr style="background:#29C192;text-align:center;color:white;font-size:15px">
					   		 	<td>食堂类型名称</td>
					    	    <td colspan="2">编辑</td>
					    	</tr>
					    </thead>
						<c:forEach items="${canteenTypeList }" var="item" >
					    	<tr align="center" style="color:black;font-size:15px">
					    	    <td>${item.cantTypeName }</td>
					    	    <td><a href="modifyCanteenType.action?cantTypeID=${item.cantTypeID}" style="color:#66AFE9">修改</a></td>
					    	    <td><a href="deleteCanteenTypeById.action?cantTypeID=${item.cantTypeID}" style="color:#66AFE9">删除</a></td>
					    	</tr>
						</c:forEach>
					</table>
				</div>	
				</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="js/classie.js"></script>
<script src="js/mlpushmenu.js"></script>
<script>
   new mlPushMenu( document.getElementById( 'mp-menu' ), document.getElementById( 'trigger' ) );
</script>
<!-- <script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script> -->
</body>
</html>
