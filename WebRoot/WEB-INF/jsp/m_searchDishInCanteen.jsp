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
    	<title>搜索已上架菜品</title>
    	
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
        <script type="text/javascript">

        function searchDishInCanteen(){
            document.searchDishForm.action="searchDishInCanteen.action";
            document.searchDishForm.submit(); 
            /* $.ajax({
                type:'post',
                url:'${pageContext.request.contextPath}/canteenRecordExportToExcel.action',
                contentType:'application/x-www-form-urlencoded',
                //发送的是key/value，接收的是json
                data:{beginTime:$('#beginTime'),endTime:$('#endTime')},
                //回调函数:返回json结果
                success:function(data){
                        alert("导出成功！");
                }
            
            }); */
        }
        
        </script>
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
						    <p style="width:100%;height:100%;vertical-align:middle;font-size:27px">搜索菜品</p>
				        </div> 								
            	        <div class="container-fluid" style="color:#000;padding:0 0;">
                            <div class="newcustom" style="margin-top:69px;">
                                <form  role="form" name="searchDishForm" action="searchDishInCanteen.action" method="post">
            					    <div class="form-group">
                                        <div class="col-xs-6">                                  
                                            <input type="text" class="form-control" name="dishName"> 
                                        </div>
                                        <div>
                                            <input type="button" class="btn btn-primary" value="搜索" onclick="searchDishInCanteen()">
                                        </div>
                                    </div>		                
            	                    <div class="row" style="padding:0 0px;"> 
        	                            <div class="form-group">
        	                                <div class="item-wrap">
        	                                    <c:forEach items="${dishItems}" var="item">
        	                                        <div class="item clearfix">   				                	    		
            				                	    		    <div class="txt-item" style=" margin-right:0px; margin-left:5px;padding-top:5px">
            				                	    		        <table  width="100%" onclick="location.href='modifyDish.action?dishID=${item.dishID}&dishWndID=${item.wndID}&wndCantID=${item.cantID}';">							               	    		   
            				                	    			        <tr>					 				                	    				
            				                	    			            <td style='vertical-align: left;text-align: center;width:85px;' rowspan="3">
                    				                	    				   	<c:if test="${item.dishPhoto != null }">
                    				                	       						<img src="/upload/pic/${item.dishPhoto }" class="center-block" height="80" width="80" style="border-radius:5%"/>
                    				                	       					</c:if>
            				                   	    				        </td>						               	    			 	
            				                	    			   	        <td style='vertical-align: middle;font-size:18px;font-weight:500; width:50%;' >${item.dishName }</td>
            				                	    			   	        <td style='vertical-align: left;font-size:16px;'>${item.dishTypeName }</td>						                	   	
            				                	    			        </tr>
            				                	    			        <tr>							               	    		   
            				                	    			   	        <td style='vertical-align: middle;font-size:16px;'>[${item.wndName }]</td>
            				                	    			   	        <td style='vertical-align: left;font-size:16px;'>${item.dishDate }</td> 
            				                	    			        </tr>
            				                	    			        <tr>						  
            				                	    			   	        <td style='vertical-align: middle;color:#29C192;font-size:20px;' colspan="2">￥${item.dishPrice }</td>
            				                	    			        </tr>
            				                	    			    </table>
            				                	    		    </div>
            				                	    		    <a href="deleteDishById.action?dishID=${item.dishID}" data-role="button" data-ajax="false" class="delect-btn" target="_top">删除</a>            				                	    		
        				                	        </div>
        				                	    </c:forEach>       				                                         					 	
        							        </div>
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
