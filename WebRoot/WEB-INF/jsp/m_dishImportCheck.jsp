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
    <base href="<%=basePath%>">    
    	<title>推送消息</title>
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
         
        <script src="js/jquery-1.10.1.min.js"></script>       
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
	<div class="container">
		<div class="codrops-header" style="background:#29C192;">
  			<div class="back-container">
                <button class="btn btn-link btn-lg">
                    <a style="color:#fff" class="icon icon-fanhui" data-ajax="false" href="${pageContext.request.contextPath }/backgroundHomepage.action"></a>
                </button>
        	</div>    
            <p style="width:100%;height:100%;vertical-align:middle;font-size:27px">录入审核</p> 
    	</div>   
	    <div class="container-fluid" style="margin-top:77px">    
											        
							<table   class="table table-striped table-bordered table-condensed">
							    <thead>
								    <tr style="background:#29C192;text-align:center;color:white;font-size:15px">
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
								        <tr style="color:black;font-size:15px">
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
                                    <p class="text-center" style="color:black">
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
	</body>
</html>
