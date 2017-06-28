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
    	<script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
    	<script src="js/bootstrap.min.js"></script>
    	<script src="http://cdn.bootcss.com/jquery.touchswipe/1.6.18/jquery.touchSwipe.min.js"></script>
    	<script src="js/bootstrap-touch-slider.js"></script>

    	<link rel="stylesheet" href="css/m_bootstrap.min.css"/>
    	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
    	<link rel="stylesheet" type="text/css" href="css/demo.css" />
    	<link rel="stylesheet" type="text/css" href="css/icons.css" />
    	<link rel="stylesheet" type="text/css" href="css/component.css" /> 
        <link rel="stylesheet" href="css/bootstrap-touch-slider.css"  media="all">

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
    
<body>
<div class="container">		  
	<div class="mp-pusher" id="mp-pusher">    
		<!-- 左侧导航栏 -->	
    	<%@ include file="publicjsp/userSetInfo.jsp" %> 
    	<!-- 搜索框与按钮 -->
		<div class="scroller" style="background:#EEEEEE">
        	<div class="scroller-inner">	                	
	        	<form class="form-horizontal" role="form" name="userQueryForm" method="post">
		        	<div class="codrops-header" style="background:rgba(0,0,0,0);" >
		    		    <div id="trigger" class="burger-container" style="margin-bottom: -8px;">   	  		        
		    		        <span class="burger-bun-top"></span>
							<span class="burger-filling"></span>
							<span class="burger-bun-bot"></span>
		    		    </div> 
		    		    <input  type="text"  placeholder="请输入菜品名或档口名" id="queryName" name="queryName" style="background:rgba(255,255,255,0.8);width:170px;height:35px;color:#000">	    		    
		    		    <input  type="button" value="查询"  class="btn btn-primary btn-wide" onclick="userQueryAll()">
		    		</div>		    		    													
				</form>

    		   			   			
    			<!-- 所属校区，所属试探，食堂下的档口 --> 		
				<div class="content clearfix" >
					<div class="container-fluid" style="color:#000;padding:0 0px;">
						<div id="bootstrap-touch-slider" class="carousel bs-slider fade  control-round indicators-line" data-ride="carousel" data-pause="hover" data-interval="3000">

	            			<!-- Indicators -->
	            			<ol class="carousel-indicators">
	            			    <li data-target="#bootstrap-touch-slider" data-slide-to="0" class="active"></li>
	            			    <li data-target="#bootstrap-touch-slider" data-slide-to="1"></li>
	            			    <li data-target="#bootstrap-touch-slider" data-slide-to="2"></li>
	            			</ol>

	            			<!-- Wrapper For Slides -->
	            			<div class="carousel-inner" role="listbox">

	                		<!-- First Slide -->
	                		<div class="item active">
	                		    <!-- Slide Background -->
	                		    <img src="images/slide4.jpeg" alt="Bootstrap Touch Slider"  class="slide-image"/>
	                		</div>
	                		<!-- End of Slide -->

	                		<!-- Second Slide -->
	                		<div class="item">
	                		    <!-- Slide Background -->
	                		    <img src="images/slide5.jpg" alt="Bootstrap Touch Slider"  class="slide-image"/>
	                		</div>
	                		<!-- End of Slide -->

	                		<!-- Third Slide -->
	                		<div class="item">
	                		    <!-- Slide Background -->
	                		    <img src="images/slide6.jpg" alt="Bootstrap Touch Slider"  class="slide-image"/>
	                		</div>
	                		<!-- End of Slide -->

	            			</div><!-- End of Wrapper For Slides -->

	            			<!-- Left Control -->
	            			<!-- <a class="left carousel-control" href="#bootstrap-touch-slider" role="button" data-slide="prev">
	            			    <span class="fa fa-angle-left" aria-hidden="true"></span>
	            			    <span class="sr-only">Previous</span>
	            			</a> -->

	            			<!-- Right Control -->
	            			<!-- <a class="right carousel-control" href="#bootstrap-touch-slider" role="button" data-slide="next">
	            			    <span class="fa fa-angle-right" aria-hidden="true"></span>
	            			    <span class="sr-only">Next</span>
	            			</a> -->

	    				</div> <!-- End  bootstrap-touch-slider Slider --> 	    	

	    				<div class="newcustom">						                		
                        	<div class="row">
                            	<form class="form-horizontal" role="form" name="windowInCanteenForm" method="post">
                            		<div class="form-group">      
                            			<label class="col-xs-3 control-label style1">所属校区</label>
                                		<div class="col-xs-9">    
                                    		
	                        	        		<select name="cantCampusID" class="form-control" onchange="getCanteen(this.value)">    <c:forEach items="${campusList }" var="item" >
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
                                    	<label class="col-xs-3 control-label style1">所属食堂</label>
                                    	<div class="col-xs-8">    
   	                        	        	
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
                        	<div style=" height: 1px; border-top: 1px solid #ddd;text-align: center;margin-top:8px;"></div>
                        	<div class="row" style="padding:0 0px;"> 
			                    <div class="form-group">
			                        <div class="item-wrap">			                           			               	           
			                        	<c:forEach items="${windowItemsList }" var="item">
			                                <div id="view" class="item clearfix">				                    	    		
						                	    <div class="txt-item">
								                    <table width=100% height=84px onclick="location.href='userWindowContents.action?wndID=${item.wndID}';" >
											            <tr>
							                                <td style="width:50%;padding-left:12px">
							                                    <p class="name">${item.wndName }</p>
							                                </td>
							                                <td style="width:50%">
							                                   <p class="name">${item.wndAddr}</p>
							                                </td>
							                            </tr>
							                            <tr>
							                                <td style="padding-left:12px">
							                                    <p class="txt">${item.wndPriceRange} 支持${item.wndPayment}</p>
							                                </td>
							                                <td>
							                                    <p class="txt"> ${item.wndSaleHours}营业</p>
							                                </td>
							                            </tr>
							                            <tr>
							                                <td style="padding-left:12px">
							                                    <p class="txt">${item.wndDescription}</p>
							                                </td>
							                                <td>
							                                    <p class="txt"> 备注：${item.wndNote}</p>
							                                </td>
							                            </tr>
							                        </table>
											        <div style=" height: 1px; border-top: 1px solid #ddd;text-align: center;"></div>
							                	</div>						                	    			
						                	</div>
					                	</c:forEach>						                              					  	
						        	</div>
					            </div>  
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
	<script type="text/javascript">
        $('#bootstrap-touch-slider').bsTouchSlider();
    </script>
</body>
</html>