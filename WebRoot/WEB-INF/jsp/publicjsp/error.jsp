<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>错误页面</title>   
	<meta name="viewport" content="width=device-width, 
                                     initial-scale=0.3, 
                                     maximum-scale=1.0, 
                                     user-scalable=true">
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link rel="stylesheet" href="css/m_bootstrap.min.css">
  </head>
  
  <body>
    <div style="position: absolute;top: 15%;width:100%">
      <h3>系统遇到未知错误，请返回</h3>
    </div>
    <div style="position: absolute;top: 25%;width:100%">
      <h3><a onclick="javascript:history.back(-1)">返回上一页</a></h3>
    </div>
  </body>
</html>
