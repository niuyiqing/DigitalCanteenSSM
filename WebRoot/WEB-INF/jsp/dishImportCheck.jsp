<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <title>菜品录入审核</title>
    <meta name="viewport" content="width=device-width, 
                                     initial-scale=0.3, 
                                     maximum-scale=1.0, 
                                     user-scalable=true">
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">

	<!--自定义-->		
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/my-custom.css">
	<link rel="stylesheet" href="css/qunit-1.11.0.css">
	<script type="text/javascript" src="js/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<!--日历控件-->	
	<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-bs3.css" />
	<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-1.3.7.css" />
    <script src="js/moment.js"></script>
    <script src="js/daterangepicker-1.3.7.js"></script>

</head>
<body>
		<%@ include file="publicjsp/backgroundMenu.jsp" %>
	    
	    <div class="container-fluid">    
			<div class="row-fluid">
				<div class="container  col-sm-12 col-sm-offset-0"> 
					<div class="panel panel-default ">
						<div class="panel-heading">
							<h3 class="panel-title">菜品录入审核</h3>
						</div> 
						<div class="panel-body"> 											        
							<table class="table table-striped table-bordered table-hover table-responsive text-center">
							    <thead>
								    <tr>
								    	<th style='text-align: center;'>校区</th>
								    	<th style='text-align: center;'>食堂</th> 
								    	<th style='text-align: center;'>操作人</th> 
								    	<th style='text-align: center;'>日期</th> 
								    	<th style='text-align: center;'>提交状态</th> 
								    	<th style='text-align: center;'>编辑</th>									    			
								    </tr>
							    </thead>
							    <tbody>
								    <c:forEach items="${pagehelper.list }" var="item">
								        <tr>
								        	<td style='vertical-align: middle;text-align: center;'>${item.recordCampusName }</td>
								        	<td style='vertical-align: middle;text-align: center;'>${item.recordCantName }</td>
								        	<td style='vertical-align: middle;text-align: center;'>${item.recordMUserName }</td>
								        	<td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.recordDate}" pattern="yyyy-MM-dd" /></td>
								        	<td style='vertical-align: middle;text-align: center;'>${item.recordSubmitState }</td> 
								        	<td style='vertical-align: middle;text-align: center;'>
									        	<div class="form-group btn-group btn-group-sm">
										        	<a href="checkif.action?recordCheck=0&&recordID=${item.recordID }" class="btn btn-success">同意</a>
			        	       						<a href="checkif.action?recordCheck=2&&recordID=${item.recordID }" class="btn btn-danger">不同意</a> 
		        	       						</div>
	        	       						</td>	
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
                                                <a href="dishImportCheck.action?pageNum=${pagehelper.firstPage}&pageSize=${pagehelper.pageSize}">首页</a>
                                            </li>
                                            <li>
                                                <a href="dishImportCheck.action?pageNum=${pagehelper.prePage}&pageSize=${pagehelper.pageSize}">上一页</a>
                                            </li>
                                        </c:if>
    
                                        <c:forEach items="${pagehelper.navigatepageNums}" var="navigatepageNum">    
    
                                            <c:if test="${navigatepageNum==pagehelper.pageNum}">
                                                <li class="active">
                                                    <a href="dishImportCheck.action?pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a>
                                                </li>
                                            </c:if>
    
                                            <c:if test="${navigatepageNum!=pagehelper.pageNum}">
                                                <li>
                                                    <a href="dishImportCheck.action?pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a>
                                                </li>
                                            </c:if>
    
                                        </c:forEach>
    
                                        <c:if test="${!pagehelper.isLastPage}">
                                            <li>
                                                <a href="dishImportCheck.action?pageNum=${pagehelper.nextPage}&pageSize=${pagehelper.pageSize}">下一页</a>
                                            </li>
                                            <li>
                                                <a href="dishImportCheck.action?pageNum=${pagehelper.lastPage}&pageSize=${pagehelper.pageSize}">尾页</a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>												
						</div>					
					</div> 
				</div>      
			</div>
		</div>
	  	
	</body>
</html>
