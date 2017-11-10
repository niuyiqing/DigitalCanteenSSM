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
	    
	    <title>饮食公司首页</title>
	    
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
    	<%@ include file="publicjsp/companyMenu.jsp" %>
    	<form>
	        <input type="hidden" name = "muserID" value="${muserItems.cantID }" >
	        <input type="hidden" name = "roleID" value="${muserItems.roleID }" >
	        <input type="hidden" name = "roleName" value="${muserItems.roleName }" >	    
        </form>

        <div class="container-fluid">
	    	<div class="row">
		    	<div class="column col-sm-2">
		    		<div class="panel-group" id="accordion">
		    			<c:forEach items="${campusList }" var="item_campus">
		    				<div class="panel panel-default">
		    					<div class="panel-heading">
		    						<h4 class="panel-title">
		    							${item_campus.campusName }	    							
		    						</h4>
		    					</div>
		    					<div class="panel-collapse collapse in">
		    						<c:forEach items="${canteenItemsList }" var="item_canteen">
		    							<c:if test="${item_canteen.campusName == item_campus.campusName}">
		    								<div class="panel-body">
		    									<!-- 读取今日已经录入的记录，检查当前食堂是否已经录入 -->
		    									<c:forEach items="${RecordItemsList }" var="item_record">	    										
		    										<c:if test="${item_record.recordCantName == item_canteen.cantName}">
		    											<!-- 设置一个标记来标示是否已经录入-->
		    											<c:set var="status" value="setted" scope="page"/>
		    										</c:if>	    										
		    									</c:forEach>
		    									<a href="companyBackground.action?recordCantID=${item_canteen.cantID }">
		    										<c:if test="${status == 'setted' }">
		    											${item_canteen.cantName}
		    										</c:if>
		    										<c:if test="${status != 'setted' }">
		    											${item_canteen.cantName}【未录入】
		    										</c:if>
		    									</a>
		    									<!-- 每次要将status值重置 -->
		    									<c:set var="status" value="unsetted" scope="page"/>
		    								</div>
		    							</c:if>
		    						</c:forEach>
		    					</div>
		    				</div>
		    			</c:forEach>
		    		</div>
		    	</div>
		    	<div class="column col-sm-10">
		    		<div class="panel panel-default">
		    			<div class="panel-heading">
		    				<div class="row">
	 						    <div class="col-sm-2">
						   	    	<label>所属校区：</label>${canteenItems.campusName}
						   	    </div>
						   	    <div class="col-sm-2">
						   	    	<label>所属食堂：</label>${canteenItems.cantName}
						   	    </div>
						   	</div>
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
		                               	    <td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.recordDate }" pattern="yyyy-MM-dd" /></td>
		                               	    <td style='vertical-align: middle;text-align: center;'>${item.recordSubmitState }</td>
		                               	    <td style='vertical-align: middle;text-align: center;'>
	                                            <div class="form-group btn-group btn-group-sm">
		                               	    		<a href="findRecordDetailDish.action?recordID=${item.recordID}" class="btn btn-success">查看</a>
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
                                                <a href="companyBackground.action?recordCantID=${canteenItems.cantID}&pageNum=1&pageSize=${pagehelper.pageSize}">首页</a>
                                            </li>
                                            <li>
                                                <a href="companyBackground.action?recordCantID=${canteenItems.cantID}&pageNum=${pagehelper.prePage}&pageSize=${pagehelper.pageSize}">上一页</a>
                                            </li>
                                        </c:if>
    
                                        <c:forEach items="${pagehelper.navigatepageNums}" var="navigatepageNum">    
    
                                            <c:if test="${navigatepageNum==pagehelper.pageNum}">
                                                <li class="active">
                                                    <a href="companyBackground.action?recordCantID=${canteenItems.cantID}&pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a>
                                                </li>
                                            </c:if>
    
                                            <c:if test="${navigatepageNum!=pagehelper.pageNum}">
                                                <li>
                                                    <a href="companyBackground.action?recordCantID=${canteenItems.cantID}&pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a>
                                                </li>
                                            </c:if>
    
                                        </c:forEach>
    
                                        <c:if test="${!pagehelper.isLastPage}">
                                            <li>
                                                <a href="companyBackground.action?recordCantID=${canteenItems.cantID}&pageNum=${pagehelper.nextPage}&pageSize=${pagehelper.pageSize}">下一页</a>
                                            </li>
                                            <li>
                                                <a href="companyBackground.action?recordCantID=${canteenItems.cantID}&pageNum=${pagehelper.pages}&pageSize=${pagehelper.pageSize}">尾页</a>
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
