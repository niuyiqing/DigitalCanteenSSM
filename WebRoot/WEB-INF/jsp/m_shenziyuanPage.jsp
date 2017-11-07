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
        <title>莘子苑页面</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />        
        <meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
		<meta name="format-detection" content="telephone=no">
		
        <script src="js/modernizr.custom.js"></script>
    	<script src="js/jquery-2.1.1.min.js"></script>
    	<script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
    	<script src="js/bootstrap.min.js"></script>
    	<script src="http://cdn.bootcss.com/jquery.touchswipe/1.6.18/jquery.touchSwipe.min.js"></script>
    	<script src="js/bootstrap-touch-slider.js"></script>

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
  		<div >
            <img src="/upload/pic/restpage.png" class="center-block" width="100%">
        </div>
    	<div class="newcustom">						                			               
		    <div style=" height: 1px; border-top: 1px solid #ddd;text-align: center;margin-top:8px;"></div>
	            <div class="row" style="padding:0 0px;"> 
                    <p style="height:30px;padding-top:14px;padding-left:3px;background:#f79076;font-size:18px">特惠精选</p>
            			<c:forEach items="${starShenziyuanDishesList }"  var="item">
        	    		    <table  width="100%" >					
        	    		        <tr style="height:50px">					 				                	    		        
        	    		            <td style='vertical-align: middle;width:30%' rowspan=2>
                	    				<c:if test="${item.dishPhoto != null }">
                	       				    <img src="/upload/pic/${item.dishPhoto }" class="center-block" height="80" width="128" style="border-radius:3%"/>
                	       				</c:if>
           	    				    </td>						               	    			 	
        	    			   	    <td colspan="2"style='vertical-align: middle;text-align: left;font-size:18px; font-weight:500;color:black;width: 55%;line-height: 18px;'>${item.dishName }</td>        	    			   	    						                	   	
        	    			    </tr>
	         	    			<tr style="height:50px">						  
	         	    			    <td style='vertical-align: middle;text-align: left;color:#29C192;font-size:20px;'>￥${item.dishPrice }</td>
	         	    			    <!-- <td style='vertical-align: middle;color:black;font-size:14px;'>${item.dishDate } </td> -->
	         	    			    <td style='vertical-align: middle;text-align: center;font-size:14px;color:black;width:15%'>${item.dishTypeName }</td>    
	         	    			</tr>
	         	    		</table>
                            <div style=" height: 1px; border-top: 1px solid #ddd;text-align: center;"></div>
		         	</c:forEach>
		         	<br>
		         	<p style="height:30px;padding-top:14px;padding-left:3px;background:#f79076;font-size:18px">所有菜品</p>
		         	<c:forEach items="${nonStarShenziyuanDishesList }"  var="item">
            	    		<table  width="100%" >					
        	    		        <tr style="height:50px">					 				                	    		        
        	    		            <td style='vertical-align: middle;width:30%' rowspan=2>
                	    				<c:if test="${item.dishPhoto != null }">
                	       				    <img src="/upload/pic/${item.dishPhoto }" class="center-block" height="80" width="128" style="border-radius:3%"/>
                	       				</c:if>
           	    				    </td>						               	    			 	
        	    			   	    <td colspan="2" style='vertical-align: middle;text-align: left;font-size:18px; font-weight:500;color:black;width: 55%;line-height: 18px;'>${item.dishName }</td>        	    			   	    						                	   	
        	    			    </tr>
	         	    			<tr style="height:50px">						  
	         	    			    <td style='vertical-align: middle;text-align: left;color:#29C192;font-size:20px;'>￥${item.dishPrice }</td>
	         	    			    <!-- <td style='vertical-align: middle;color:black;font-size:14px;'>${item.dishDate } </td> -->
	         	    			    <td style='vertical-align: middle;text-align: center;font-size:14px;color:black;width:15%'>${item.dishTypeName }</td>    
	         	    			</tr>
	         	    		</table>
                                <div style=" height: 1px; border-top: 1px solid #ddd;text-align: center;"></div>
		         	</c:forEach>  
			    </div>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>                               
        </div>
        <div class="footnav">
            <ul>
                <li>
                    <a data-ajax="false" href="userHomepage.action"><span>首页</span></a>
                </li>
                <li>
                    <span>订单</span>
                </li>
                <li>
                    <span>我的</span>
                </li>
                <li style="position:relative;">
                    <a data-ajax="false" href="aboutPage.action"><span>关于</span></a>
                </li>
            </ul>
        </div>
  	</body>
</html>
