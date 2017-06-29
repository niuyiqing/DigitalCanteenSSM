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
        <title>菜品</title>
        <meta http-equiv="pragma" content="no-cache" >
        <meta http-equiv="cache-control" content="no-cache" >
        <meta http-equiv="expires" content="0">   
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" >
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
        <script src="js/modernizr.custom.js"></script>
        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/icons.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
        <link rel="stylesheet" type="text/css" href="css/leftDelete.css"  />
    </head>
  
    <body>
        <div class="container" data-role="page">
            <div class="mp-pusher" id="mp-pusher">
                <div class="scroller" style="background:#EEEEEE">
                    <div class="scroller-inner">
                        <div class="codrops-header" style="background:rgba(0,0,0,0);" >
                            <div class="back-container">
                                <button class="btn btn-link btn-lg" ><a style="color:#fff" class="icon icon-fanhui" data-ajax="false" href="${pageContext.request.contextPath }/userHomepage.action"></a></button>
                            </div> 
                        </div>
    	                <div class="container-fluid" style="padding:0 0px;">
                        	<div class="row" style="color:black;padding:16px 0px 16px 0px;font-size: 1.6rem;margin-top:12%">
                                <div class="col-xs-2" style="padding-right:0px">
                                    ${windowItems.campusName }
                                </div>
                                <div class="col-xs-3" style="padding-right:0px">
                                    ${windowItems.cantName }
                                </div>
                                <div class="col-xs-3" style="padding-right:0px">
                                    ${windowItems.wndName }
                                </div>   
                                <div class="col-xs-3" style="padding-right:0px">
                                <label >评分：</label>${windowItems.wndScore }
                                </div>
                            </div>
                            <div class="row" style="color:black;padding:16px 0px 16px 0px;font-size: 1.4rem;">
                                <div class="col-xs-4" style="padding-right:0px;text-align:center">
                                    <a data-ajax="false" href="${pageContext.request.contextPath }/userWindowContents.action?wndID=${windowItems.wndID}">菜品</a>
                                </div>
                                <div class="col-xs-4" style="padding-right:0px;text-align:center">
                                    <a data-ajax="false" href="${pageContext.request.contextPath }/findAllCommentInWindow.action?wndID=${windowItems.wndID}">评价</a>
                                </div>
                                <div class="col-xs-4" style="padding-right:0px;text-align:center">
                                    <a data-ajax="false" href="addCommentInWindow.action?wndID=${windowItems.wndID}">我要评价</a>
                                </div>
                            </div>
                            <br>

                            <div class="item-wrap" style="margin-top:10px">
    				            <form role="form" name="dishForm" enctype="multipart/form-data">
					       	        <input name="dishID" type="hidden" value="${dishItems.dishID }">								
					       	   	        <c:forEach items="${dishItemsList }" var="item" >
                                            <div id="view" class="item clearfix">
                                                <div class="txt-item">
                                                    <table width="70%">
    				                    	            <tr>    							 		
    				                    		           	<td style='vertical-align: middle;text-align: center;' rowspan=3 width="30%">
    				                    	                 	<c:if test="${item.dishPhoto != null }">												   	
    			   	     	   	       	           		            <img src="/upload/pic/${item.dishPhoto }" class="center-block" height="100" width="100"/>
    			   	     	   	       	           	        </c:if>
    		   		     	   	       	                    </td>
                                                            <td style='vertical-align: middle;text-align: left;font-size:1.5em;padding-left:12px' colspan=2>${item.dishName }</td>
    				                    	            </tr>
                                                        <tr>
                                                            <td style='vertical-align: middle;text-align: left;padding-left:12px'>${item.dishSale }</td>
                                                            <td style='vertical-align: middle;text-align: center;'>${item.dishDate }</td>
                                                        </tr>
                                                        <tr>
                                                            <td style='vertical-align: middle;text-align: left;color:#29C192;font-size:1.5em;padding-left:12px'>￥${item.dishPrice }</td>
                                                            <td style='vertical-align: middle;text-align: center;'>${item.dishTypeName }</td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
					       	   	        </c:forEach>		
    				            </form>
                            </div>
    		            </div>
    	           </div>
                </div>
            </div>
        </div>
    </body>
</html>