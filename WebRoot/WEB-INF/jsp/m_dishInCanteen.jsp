<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="digitalCanteenSSM.po.Dish" %>
<%@ page import="java.util.*"%>
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
    	<meta charset="utf-8">
    	<title>食堂菜品</title>
    	
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
    	<script src="js/jquery.mobile-1.4.3.min.js"></script>
    	<!--日历控件-->	
		<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-bs3.css" />
		<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-1.3.7.css" />
	    <script src="js/moment.js"></script>
	    <script src="js/daterangepicker-1.3.7.js"></script>
	    
    	<link rel="stylesheet" href="css/m_bootstrap.min.css"/>
        <!--自定义-->      
        <link rel="stylesheet" href="css/my-custom.css">
        <!--分页控件--> 
        <link rel="stylesheet" href="css/qunit-1.11.0.css">
    	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
    	<link rel="stylesheet" type="text/css" href="css/demo.css" />
    	<link rel="stylesheet" type="text/css" href="css/icons.css" />
    	<link rel="stylesheet" type="text/css" href="css/component.css" />
    	<link rel="stylesheet" type="text/css" href="css/leftDelete.css"  />  
    </head>
  
    <body>
        <div class="container" data-role="page">
            <div class="mp-pusher" id="mp-pusher">
            <%@ include file="publicjsp/canteennavindex.jsp" %> 
      	        <div class="scroller" style="background:#EEEEEE">
                    <div class="scroller-inner">
           		        <div class="codrops-header" style="background:#29C192">
        	                <div id="trigger" class="burger-container">
							    <span class="burger-bun-top"></span>
							    <span class="burger-filling"></span>
							    <span class="burger-bun-bot"></span>
					        </div>					
						    <p style="width:100%;height:100%;vertical-align:middle;font-size:27px">食堂菜品</p>
				        </div> 								
            	        <div class="container-fluid" style="color:#000;padding:0 0;">
                            <div class="newcustom" style="margin-top:69px;">
                                <div class="row" style="padding:16px 0px 16px 0px;font-size: 1.2rem">
                					<div class="col-xs-4" style="padding-right:0px">
                				   		<label >所属校区：</label>${muserItems.campusName}
                				   	</div>
                				   	<div class="col-xs-4" style="padding-right:0px">
                				   		<label >所属食堂：</label>${muserItems.cantName}
                				   	</div>
                				   	<div class="col-xs-4" style="padding-right:0px">
                				   		<label >管理员：</label>${muserItems.muserName}
                				   	</div>
                				</div>
                                <a data-ajax="false" href="addDish.action" class="btn btn-primary">菜品上架</a>
                    <br><br>
                                <form role="form" name="dishForm" enctype="multipart/form-data">
            					    <input name="dishID" type="hidden" value="${dishItems.dishID }">		                
            	                    <div class="row" style="padding:0 0px;"> 
        	                            <div class="form-group">
        	                                <div class="item-wrap">
        	                                    <c:forEach items="${pagehelper.list }" var="item">
        	                                        <div class="item clearfix">   				                	    		
    				                	    		    <div class="txt-item" style=" margin-right:0px; margin-left:5px;padding-top:5px">
    				                	    		        <table  width=100% onclick="location.href='modifyDish.action?dishID=${item.dishID}&dishWndID=${item.wndID}&wndCantID=${item.cantID}';">							               	    		   
    				                	    			        <tr>					 				                	    				
    				                	    			            <td style='vertical-align: left;text-align: center;min-width: 100px;' rowspan=3>
            				                	    				   	<c:if test="${item.dishPhoto != null }">
            				                	       						<img src="/upload/pic/${item.dishPhoto }" class="center-block" height="80" width="100"/>
            				                	       					</c:if>
    				                   	    				        </td>						               	    			 	
    				                	    			   	        <td style='vertical-align: middle;text-align: center;font-size:1.2em; width: 100%;' >${item.dishName }</td>
    				                	    			   	        <td style='vertical-align: left;min-width: 100px;'>${item.dishTypeName }</td>						                	   	
    				                	    			        </tr>
    				                	    			        <tr>							               	    		   
    				                	    			   	        <td style='vertical-align: middle;text-align: center;font-size:0.8em; width: 100%;'>[${item.wndName }]</td>
    				                	    			   	        <td style='vertical-align: left;min-width: 100px;'>${item.dishDate } ${item.dishSale }</td> 
    				                	    			        </tr>
    				                	    			        <tr>						  
    				                	    			   	        <td style='vertical-align: middle;text-align: center;color:#29C192;font-size:1.5em; width: 100%;'>￥${item.dishPrice }</td>
    				                	    			   	        <td style='vertical-align: middle;min-width: 100px;'><fmt:formatDate value="${item.dishInDate}" pattern="yyyy-MM-dd" /></td>
    				                	    			   	         
    				                	    			        </tr>
    				                	    			    </table>
    				                	    		    </div>
    				                	    		    <a href="deleteDishById.action?dishID=${item.dishID}" data-role="button" data-ajax="false" class="delect-btn" target="_top">删除</a>
            				                	    		
        				                	        </div>
        				                	    </c:forEach>       				                                         					 	
        							        </div>
        				                </div>  
        				            </div> 
                                    
                                    <div>
                                        <div class="message">
                                            <p class="text-center">
                                                <br>
                                                <br>
                                                <br>
                                                共<b>${pagehelper.total}</b>条记录，当前显示第&nbsp;<b>${pagehelper.pageNum}/${pagehelper.pages}</b>&nbsp;页
                                            </p>
                                        </div>
                                        <div style="text-align:center;">
                                            <ul class="pagination">
                                                <c:if test="${!pagehelper.isFirstPage}">                                        
                                                    <li>
                                                        <a data-ajax="false" href="findDishInCanteen.action?pageNum=${pagehelper.prePage}&pageSize=${pagehelper.pageSize}">上一页</a>
                                                    </li>
                                                </c:if>

                                                <c:forEach items="${pagehelper.navigatepageNums}" var="navigatepageNum">    

                                                    <c:if test="${navigatepageNum==pagehelper.pageNum}">
                                                        <li class="active">
                                                            <a data-ajax="false" href="findDishInCanteen.action?pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a>
                                                        </li>
                                                    </c:if>

                                                    <c:if test="${navigatepageNum!=pagehelper.pageNum}">
                                                        <li>
                                                            <a data-ajax="false" href="findDishInCanteen.action?pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a>
                                                        </li>
                                                    </c:if>

                                                </c:forEach>

                                                <c:if test="${!pagehelper.isLastPage}">
                                                    <li>
                                                        <a data-ajax="false" href="findDishInCanteen.action?pageNum=${pagehelper.nextPage}&pageSize=${pagehelper.pageSize}">下一页</a>
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
        </div> 
        <script src="js/classie.js"></script>
        <script src="js/mlpushmenu.js"></script>
        <script>
            new mlPushMenu( document.getElementById( 'mp-menu' ), document.getElementById( 'trigger' ) );
        </script>
        <script>
        		$(".item").on('swipeleft', function(event) {
        		event.preventDefault();
        		
        		$(this).addClass('selected').siblings('.item').removeClass('selected');
        		$(this).find('.delect-btn').on('click', function(event) {
          			/* event.preventDefault(); 
          	    Act on the event 
          		 	$(this).parent(".item").animate({
            		height: 0,
            		width: 0},
            		300, function() {
            	stuff to do after animation is complete
            		$(this).remove();
          			});  */
        		});
        		});
        		$(".item").on('swiperight', function(event) {
        		event.preventDefault();
        		
        		$(this).removeClass('selected');
        		});
        		/* $(".item").on('swiperight', function(event) {
        		event.preventDefault();
        		/* Act on the event */
        		/* $(this).removeClass('selected');
        		}); */
        		
        </script>  													   										    		
    </body>
</html>
