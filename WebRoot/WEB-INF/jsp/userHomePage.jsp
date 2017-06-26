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
        
        <title>用户首页</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
        
        <meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		
        <script src="js/modernizr.custom.js"></script>
    	<script src="js/jquery-2.1.1.min.js"></script>
    	<script src="js/bootstrap.min.js"></script>
    	
    	<!-- <link rel="stylesheet" href="css/bootstrap.min.css"> --> 	
    	<link rel="stylesheet" href="css/m_bootstrap.min.css"/>
    	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
    	<link rel="stylesheet" type="text/css" href="css/demo.css" />
    	<link rel="stylesheet" type="text/css" href="css/icons.css" />
    	<link rel="stylesheet" type="text/css" href="css/component.css" /> 
        
        <script>
        	/* 在校区选择之后得到该校区之下的食堂选择框
        		objValue：校区的ID值
        		windowInsertForm：档口预置表单
        		canteenItemsList：所有食堂信息列表
        		wndCantID：食堂select标签的选择值
        	*/
  	    	function getCanteen(objValue)
	    	{	
	    		var objForm = document.forms["windowInCanteenForm"];
	    	
        		if(objValue == ""){
        			objForm.wndCantID.disabled = true;
        		}else{  
        			objForm.wndCantID.disabled = false; 
        			objForm.wndCantID.options.length = 0;
        			
        			var optionObj = document.createElement("option");
		            optionObj.text = "请选择所属食堂";
		            optionObj.value = "";
		            objForm.wndCantID.add(optionObj);
	                        
        			<c:forEach items="${canteenItemsList }" var="item" >  	
        	 			var cantCampusID = ${item.cantCampusID };
 	     				var optionObj = document.createElement("option");
        	 			if( cantCampusID == Number(objValue)){
	                        optionObj.text = "${item.cantName }";
	                        optionObj.value = "${item.cantID }";
	                        objForm.wndCantID.add(optionObj);
        	 			}  
	    			</c:forEach>
        		}
	    	}
	    	
    		function findWindowsInCanteen(){
    			document.windowInCanteenForm.action="userHomepage.action";
	    		document.windowInCanteenForm.submit();
    		}
    		
    		function userQueryAll(){
        		document.userQueryForm.action="userQueryAll.action";
	    		document.userQueryForm.submit();
    		}
  	    </script>   
  	    
    
    </head>
    
<body class="container"> 		  
	<div class="mp-pusher" id="mp-pusher">    
		<!-- 左侧导航栏 -->	
    	<%@ include file="publicjsp/userSetInfo.jsp" %> 
    	<!-- 搜索框与按钮 -->
		<div class="scroller" style="background:#EEEEEE">
        	<div class="scroller-inner">	                	
	        	<form class="form-horizontal" role="form" name="userQueryForm" method="post">
		        	<div class="codrops-header" style="background:#29C192" >
		    		    <div id="trigger" class="burger-container" >   	  		        
		    		        <span class="burger-bun-top"></span>
							<span class="burger-filling"></span>
							<span class="burger-bun-bot"></span>
		    		    </div> 
		    		    <input type="text"  placeholder="请在此输入菜品名或档口名" id=queryName name="queryName">	    		    
		    		    <input  type="button" value="查询"  class="btn btn-primary btn-wide" onclick="userQueryAll()">	
		    		</div>		    		    								
					<!-- <p style="width:100%;height:100%;vertical-align:middle;font-size:30px">用户管理系统</p> -->
					<!-- 轮播图 -->
					<%@ include file="userRotatePicture.html" %> 
				</form>     		   			
    			<!-- 所属校区，所属试探，食堂下的档口 --> 		
				<div class="content clearfix" >
					<div class="container-fluid" style="margin-top:77px">	    	
						<div class="panel-group" id="accordion">					
	                		<div class="panel panel-default">
	                    		<div class="panel-body">
	                        		<div class="row">
	                            		<form class="form-horizontal" role="form" name="windowInCanteenForm" method="post">
	                            			<div class="form-group">                                                                          
	                                    		<label class="col-sm-2 control-label">所属校区</label>
	                                    		<div class="col-sm-9">    
	                                        		<!-- 选择食堂所属校区 -->
	   	                        	        		<select name="cantCampusID" class="form-control" onchange="getCanteen(this.value)">   	        	
	   	                        	        			<c:forEach items="${campusList }" var="item" >
												   			<c:choose>
															    <c:when test="${userItems.userCampusID == item.campusID }">
															       <option value="${item.campusID }" selected="selected">${item.campusName }</option>
															    </c:when>
															    <c:otherwise>
															        <option value="${item.campusID }">${item.campusName }</option>
															    </c:otherwise>
															 </c:choose>
														</c:forEach>					 
	   	                        	        		</select>
	                                    		</div>                                   
	                                		</div>
	                                
	                                		<div class="form-group">                                                                           
	                                    		<label class="col-sm-2 control-label">所属食堂</label>
	                                    		<div class="col-sm-9">    
	   	                        	        		<!-- 选择档口所属食堂 -->
	   	                        		    		<select name="wndCantID" class="form-control"  onchange="findWindowsInCanteen()">  	                        	        	 	                        	       	                        	        
				   	                        	        <c:forEach items="${canteenItemsInCampus }" var="item" >
												   			<c:choose>
															    <c:when test="${userItems.userCantID == item.cantID }">
															       <option value="${item.cantID }" selected="selected">${item.cantName }</option>
															    </c:when>
															    <c:otherwise>
															        <option value="${item.cantID }">${item.cantName }</option>
															    </c:otherwise>
															  </c:choose>
														</c:forEach>
													</select>
	                                    		</div>                                    
	                                		</div>                             
	                            		</form>                        	                        
	                        		</div>    
	                    		</div>
	                		</div>
	
	                		<div class="panel panel-default">
	                    		<div class="panel-body">
	                        		<table class="table table-striped table-bordered table-hover table-responsive text-center">
	                            		<thead>
		                                	<tr>
			                                    <th style='text-align: center;'>校区名称</th>
			                                    <th style='text-align: center;'>食堂名称</th>
			                                    <th style='text-align: center;'>档口名称</th>
			                                    <th style='text-align: center;'>档口位置</th>
			                                    <th style='text-align: center;'>价格范围</th>
			                                    <th style='text-align: center;'>营业时间段</th>
			                                    <th style='text-align: center;'>支付方式</th>
			                                    <th style='text-align: center;'>档口描述</th>
			                                    <th style='text-align: center;'>备注</th>
			                                </tr>
	                            		</thead>
	
	                            		<tbody>
			                                <c:forEach items="${windowItemsList }" var="item" >
			                                    <tr>
			                                        <td style='vertical-align: middle;text-align: center;'>${item.campusName }</td>
			                                        <td style='vertical-align: middle;text-align: center;'>${item.cantName }</td>
			                                        <td style='vertical-align: middle;text-align: center;'>
			                                        	<a href="userWindowContents.action?wndID=${item.wndID}" class="btn btn-info">${item.wndName }</a>
			                                        </td>
			                                        <td style='vertical-align: middle;text-align: center;'>${item.wndAddr}</td>
			                                        <td style='vertical-align: middle;text-align: center;'>${item.wndPriceRange}</td>
			                                        <td style='vertical-align: middle;text-align: center;'>${item.wndSaleHours}</td>
			                                        <td style='vertical-align: middle;text-align: center;'>${item.wndPayment}</td>
			                                        <td style='vertical-align: middle;text-align: center;'>${item.wndDescription}</td>
			                                        <td style='vertical-align: middle;text-align: center;'>${item.wndNote}</td>
			                                    </tr>
			                                </c:forEach>
	                            		</tbody>
	                        		</table>                      
	                    		</div>
	                		</div>
	            		</div>
	            	</div>          
				</div>
	        </div>
	   	</div>	
	</div>
	<script src="js/classie.js"></script>
	<script src="js/mlpushmenu.js"></script>
	<script>new mlPushMenu( document.getElementById( 'mp-menu' ), document.getElementById( 'trigger' ) );</script>
	<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
</body>
</html>