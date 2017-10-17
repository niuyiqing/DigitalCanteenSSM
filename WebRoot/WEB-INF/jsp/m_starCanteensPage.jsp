<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  	<head>
	    <base href="<%=basePath%>">
	    
	    <title>名星食堂</title>

  	</head>
  
  	<body>
    <!-- 后台传送名星食堂列表starCanteensList到本页面，如果starCanteensList为空，显示提示语“暂无名星食堂” -->
  	</body>
</html>
