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
        
        <title>管理员账户管理</title>
        
	    <meta name="viewport" content="width=device-width, 
                                                     initial-scale=0.3, 
                                                     maximum-scale=1.0, 
                                                     user-scalable=true">
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!--自定义-->      
        <link rel="stylesheet" href="css/my-custom.css">
        <!--分页控件--> 
        <link rel="stylesheet" href="css/qunit-1.11.0.css">
        
        <!--bootstrap-->    
        <script src="js/jquery-1.10.1.min.js"></script>       
        
        <!--bootstrap-->    
        <script src="js/bootstrap.min.js"></script>
    </head>
  
    <body>
    	<%@ include file="publicjsp/backgroundMenu.jsp" %>
    	<div class="container-fluid">
            <div class="panel panel-default">

                <div class="panel-heading">
                    <h3 class="panel-title">操作日志查看</h3>
                </div>

                <div class="panel-body">
                    <form role="form" name="muserForm" enctype="multipart/form-data">
                    	<table class="table table-striped table-bordered table-hover table-responsive text-center">
                    		<thead>
                    		    <tr>
                    		    	<th style='text-align: center;'>操作人</th>
                    		    	<th style='text-align: center;'>所属校区</th>
                    		    	<th style='text-align: center;'>所属食堂</th>
                    		    	<th style='text-align: center;'>操作</th>
                    		    	<th style='text-align: center;'>操作内容</th>
                    		    	<th style='text-align: center;'>操作时间</th>	
                    		    </tr>
                    		</thead>
                    		<tbody>
                    		    <c:forEach items="${pagehelper.list}" var="item" >
	                    	    	<tr>
	                    	    		<td style='vertical-align: middle;text-align: center;'>${item.muserName }</td>
	                    	    		<td style='vertical-align: middle;text-align: center;'>${item.muserCampus }</td>
	                	        		<td style='vertical-align: middle;text-align: center;'>${item.muserCant }</td>
	                	        		<td style='vertical-align: middle;text-align: center;'>${item.logOperation }</td>
	                	        		<td style='vertical-align: middle;text-align: center;'>${item.logContent }</td>
										<td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.logCreateDate }" pattern="yyyy-MM-dd" /></td>
	                    	    	</tr>
	                		    </c:forEach>
	                		</tbody>
                    	</table>
                    	
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
    </body>
</html>
