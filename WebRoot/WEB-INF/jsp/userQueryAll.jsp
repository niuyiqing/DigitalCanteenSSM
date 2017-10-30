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
    	
    	<title>用户查询</title>
    	
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
    	
        
    	<link rel="stylesheet" href="css/m_bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/footnav.css" />
    	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
    	<link rel="stylesheet" type="text/css" href="css/demo.css" />
    	<link rel="stylesheet" type="text/css" href="css/icons.css" />
    	<link rel="stylesheet" type="text/css" href="css/component.css" /> 
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

        function userQueryAll(){
                document.userQueryForm.action="userQueryAll.action";
                document.userQueryForm.submit();
            }  
        </script>
    </head>
  
    <body>
        <div class="container">		  
			<div class="mp-pusher" id="mp-pusher">    
			   	<!-- 搜索框与按钮 -->
				<div class="scroller" style="background:#EEEEEE">
			       	<div class="scroller-inner">	                	
			        	<form class="form-horizontal" role="form" name="userQueryForm" method="post">
				        	<div class="codrops-header" style="background:rgba(0,0,0,0);top:18px" >
				    		    <!-- <div class="back-container" style="padding-top:6px;margin-bottom:-5px;">
                                    <button class="btn btn-link btn-lg" style="padding-top: 4px;">
                                        <a style="color:#fff" class="icon icon-fanhui" data-ajax="false" href="${pageContext.request.contextPath }/userHomepage.action"></a>
                                    </button>    
                                </div> -->
				    		    <input  type="text"  placeholder="请输入菜品名或档口名" id="queryName" name="queryName" style="background:rgba(255,255,255,0.1);width:70%;height:35px;color:#000">	    		    
				    		    <input  type="button" value="查询"  class="btn btn-primary btn-wide" style="background:rgba(41, 193, 146,0.8);" onclick="userQueryAll()">
				    		</div>
                            <div >
                                <img src="/upload/pic/3.jpg" class="center-block" width="100%">
                            </div>		    		    													
						</form>			   		   			   			
			   			<!-- 所属校区，所属试探，食堂下的档口 --> 		
						
						<div class="container-fluid" style="color:#000;padding:0 0px;">	    	
		    				<div class="newcustom">						                			               
		                       	<div style=" height: 1px; border-top: 1px solid #ddd;text-align: center;margin-top:8px;"></div>
		                       	<form role="form" name="dishForm" enctype="multipart/form-data">
					                <input name="dishID" type="hidden" value="${dishItems.dishID }">		                
        	                        <div class="row" style="padding:0 0px;"> 
    	                                <div class="form-group">
    	                                        <p style="height:30px;padding-top:14px;padding-left:3px;background:#f79076">菜名的搜索结果:</p>
    	                                        <c:forEach items="${dishItemsList }"  var="item">
        				                	    		    <table  width=100% >					
        				                	    		        <tr style="height:30px">					 				                	    		        
        				                	    		            <td style='vertical-align: left;text-align: center;min-width: 100px;' rowspan=3>
                				                	    				<c:if test="${item.dishPhoto != null }">
                				                	       				    <img src="/upload/pic/${item.dishPhoto }" class="center-block" height="80" width="80" style="border-radius:5%"/>
                				                	       				</c:if>
        				                   	    				    </td>						               	    			 	
        				                	    			   	    <td style='vertical-align: middle;text-align: center;font-size:1.5em; font-weight:500;width: 100%;'>${item.dishName }</td>
        				                	    			   	    <td style='vertical-align: left;min-width: 100px;'>${item.dishTypeName }</td>						                	   	
        				                	    			    </tr>
        				                	    			    <tr style="height:30px">							               	    		   
    				                	    			   	        <td style='vertical-align: middle;text-align: center;font-size:0.8em; width: 100%;'>[${item.wndName }]</td>
    				                	    			   	        <td style='vertical-align: left;min-width: 100px;'>${item.dishDate } ${item.dishSale }</td> 
    				                	    			        </tr>
    				                	    			        <tr style="height:30px">						  
    				                	    			   	        <td style='vertical-align: middle;text-align: center;color:#29C192;font-size:1.5em; width: 100%;'>￥${item.dishPrice }</td>
    				                	    			   	        <td style='vertical-align: middle;min-width: 100px;'>${item.campusName }/${item.cantName }</td>     
    				                	    			        </tr>
    				                	    			    </table>
                                                            <div style=" height: 1px; border-top: 1px solid #ddd;text-align: center;"></div>
    				                	        </c:forEach>
    				                	        <br>
    				                	        <p style="height:30px;padding-top:14px;padding-left:3px;background:#f79076">档口名的搜索结果:</p>
    				                	        <c:forEach items="${windowItemsList }" var="item">
										                    <table width="100%" onclick="location.href='userWindowContents.action?wndID=${item.wndID}';" >
                                                                <tr style="height:30px">
                                                                    <td  rowspan=3 >
                                                                        <img src="/upload/pic/${item.wndPhoto }" class="center-block" height="80" width="80" style="border-radius:5%;margin-left:5px"/>
                                                                    </td>
                                                                    <td style="padding-left:12px;font-size:1.5em;font-weight:500">
                                                                        <p>${item.wndName }</p>
                                                                    </td>
                                                                    <td style="width:25%">
                                                                        <p>${item.campusName }/${item.cantName }</p>
                                                                    </td>
                                                                </tr>
                                                                <tr style="height:30px">
                                                                    <td>
                                                                        <p>￥${item.wndPriceRange}&nbsp &nbsp支持${item.wndPayment}</p>
                                                                    </td>
                                                                    <td>
                                                                        <p> ${item.wndSaleHours}营业</p>
                                                                    </td>
                                                                </tr>
                                                                <tr style="height:30px">
                                                                    <td style="padding-left:12px">
                                                                        <p>${item.wndDescription}</p>
                                                                    </td>
                                                                </tr>
                                                            </table>
													        <div style=" height: 1px; border-top: 1px solid #ddd;text-align: center;"></div>
							                	</c:forEach> 
    				                    </div>  
    				                </div>
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                    <br>                               
    		                    </form>
                            </div>
			            </div>          
			        </div>
			   	</div>	
			</div>
		</div>
        <div class="footnav">
            <ul>
                <li>
                    <a href="userHomepage.action"><span>首页</span></a>
                </li>
                <li style="position:relative;">
                    <span>附近</span>
                </li>
                <li>
                    <span>订单</span>
                </li>
                <li>
                    <span>我的</span>
                </li>
            </ul>
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
    	
