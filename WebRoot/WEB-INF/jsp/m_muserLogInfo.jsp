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
        <meta charset="utf-8">
        <title>管理员账户管理</title>
        
	    <meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0">   
 		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
        
        <script src="js/modernizr.custom.js"></script>
    	<script src="js/jquery-2.1.1.min.js"></script>
    	<script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/m_bootstrap.min.css">
        <!--自定义-->      
        <link rel="stylesheet" href="css/my-custom.css">
        <!--分页控件--> 
        <link rel="stylesheet" href="css/qunit-1.11.0.css">
        <link rel="stylesheet" type="text/css" href="css/normalize.css"/>
    	<link rel="stylesheet" type="text/css" href="css/demo.css"/>
    	<link rel="stylesheet" type="text/css" href="css/icons.css"/>
    	<link rel="stylesheet" type="text/css" href="css/component.css"/>
    	<link rel="stylesheet" type="text/css" href="css/leftDelete.css"/> 
    </head>
  
    <body>
        <div class="container" data-role="page">
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
                            <p style="width:100%;height:100%;vertical-align:middle;font-size:27px">操作日志查看</p>
                        </div>
        	            <div class="container-fluid" style="padding:0 0px;">
                            <form role="form" name="muserForm" enctype="multipart/form-data">
                            	<div class="row" style="padding:0 0px;margin-top:66px">
                                    <div class="form-group">
                                        <div class="item-wrap">
                                		    <c:forEach items="${pagehelper.list}" var="item" >
                                                <div  id="view" class="item clearfix" style="width:100%">
                                                    <div class="txt-item" style=" margin-right:0px; margin-left:5px;padding-top:5px;padding-bottom: 5px;">
                                                        <table style="width:100%;table-layout:fixed;">
            	                    	    	            <tr>	               	        	           
                                                                <td style='vertical-align: middle;font-size:1.5em'>${item.muserName }</td>
                                                                <td style='vertical-align: middle;'>${item.muserCampus }/${item.muserCant }</td>
                                                                <td style='vertical-align: middle;'><fmt:formatDate value="${item.logCreateDate }" pattern="yyyy-MM-dd" /></td>
            	                    	    	            </tr>
                                                            <tr>
                                                                <td style='vertical-align: middle;' colspan=3>${item.logOperation }:${item.logContent }</td>                                         
                                                            </tr>
                                                        </table>
                                                    </div>                                       
                                                </div>
            	                		    </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="message">
                                        <p class="text-center">
                                            共<b>${pagehelper.total}</b>条记录，当前显示第&nbsp;<b>${pagehelper.pageNum}/${pagehelper.pages}</b>&nbsp;页
                                        </p>
                                    </div>
                                    <div style="text-align:center;">
                                        <ul class="pagination">
                                            <c:if test="${!pagehelper.isFirstPage}">                                        
                                                <li>
                                                    <a href="loginfo.action?pageNum=${pagehelper.prePage}&pageSize=${pagehelper.pageSize}">上一页</a>
                                                </li>
                                            </c:if>

                                            <c:forEach items="${pagehelper.navigatepageNums}" var="navigatepageNum">    

                                                <c:if test="${navigatepageNum==pagehelper.pageNum}">
                                                    <li class="active">
                                                        <a href="loginfo.action?pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a>
                                                    </li>
                                                </c:if>

                                                <c:if test="${navigatepageNum!=pagehelper.pageNum}">
                                                    <li>
                                                        <a href="loginfo.action?pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a>
                                                    </li>
                                                </c:if>

                                            </c:forEach>

                                            <c:if test="${!pagehelper.isLastPage}">
                                                <li>
                                                    <a href="loginfo.action?pageNum=${pagehelper.nextPage}&pageSize=${pagehelper.pageSize}">下一页</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </div>
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
    </body>
</html>
    	