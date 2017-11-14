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
        <title>用户首页</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />        
        <meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
		<meta name="format-detection" content="telephone=no">
		<meta name="apple-mobile-web-app-title" content="理工餐饮">
        <link rel="apple-touch-icon-precomposed" sizes="57x57" href="apple-touch-icon-57.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="apple-touch-icon-72.png">
        <link rel="apple-touch-icon-precomposed" sizes="76x76" href="apple-touch-icon-76.png">
        <link rel="apple-touch-icon-precomposed" sizes="120x120" href="apple-touch-icon-120.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="apple-touch-icon-144.png">
        <link rel="apple-touch-icon-precomposed" sizes="152x152" href="apple-touch-icon-152.png">
        <link rel="apple-touch-icon-precomposed" sizes="180x180" href="apple-touch-icon-180.png">
        <script src="js/modernizr.custom.js"></script>
    	<script src="js/jquery-2.1.1.min.js"></script>
    	<script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
    	<script src="js/bootstrap.min.js"></script>
    	<!--<script src="http://cdn.bootcss.com/jquery.touchswipe/1.6.18/jquery.touchSwipe.min.js"></script>-->
    	<script src="js/bootstrap-touch-slider.js"></script>

    	<link rel="stylesheet" href="css/m_bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/footnav.css" />
    	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
    	<link rel="stylesheet" type="text/css" href="css/demo.css" />
    	<link rel="stylesheet" type="text/css" href="css/icons.css" />
    	<link rel="stylesheet" type="text/css" href="css/component.css" /> 
        <link rel="stylesheet" type="text/css" href="css/bootstrap-touch-slider.css">
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
    	<div class="container" data-role="page">
    		<div class="mp-pusher" id="mp-pusher">
                <div class="scroller" style="background:#EEEEEE">
                    <div class="scroller-inner">
                        <form class="form-horizontal" role="form" name="userQueryForm" method="post">
                            <div class="codrops-header" style="background:rgba(0,0,0,0);top:18px" >
                                <input  type="text"  placeholder="请输入菜品名或档口名" id="queryName" name="queryName" style="background:rgba(255,255,255,0.1);width:70%;height:35px;color:#000;font-size:20px">                  
                                <input  type="button" value="搜索"  class="btn btn-primary btn-wide" style="background:rgba(41, 193, 146,0.8);font-size:16px" onclick="userQueryAll()">
                            </div>                                                                          
                        </form>

                        <div class="content clearfix" >
                            <div class="container-fluid" style="color:#000;padding:0 0px;">
                                <div id="bootstrap-touch-slider" class="carousel bs-slider fade  control-round indicators-line" data-ride="carousel" data-pause="hover" data-interval="3000">
                                    <ol class="carousel-indicators">
                                        <li data-target="#bootstrap-touch-slider" data-slide-to="0" class="active"></li>
                                        <li data-target="#bootstrap-touch-slider" data-slide-to="1"></li>
                                        <li data-target="#bootstrap-touch-slider" data-slide-to="2"></li>
                                        <li data-target="#bootstrap-touch-slider" data-slide-to="3"></li>
                                    </ol>
                                    <div class="carousel-inner" role="listbox">
                                        <div class="item active">
                                            <img src="/upload/pic/${adList[0].adPhoto }" alt="Bootstrap Touch Slider"  class="slide-image" />
                                        </div>
                                        <div class="item">
                                            <img src="/upload/pic/${adList[1].adPhoto }" alt="Bootstrap Touch Slider"  class="slide-image" />
                                        </div>
                                        <div class="item">
                                            <img src="/upload/pic/${adList[2].adPhoto }" alt="Bootstrap Touch Slider"  class="slide-image" />
                                        </div>
                                        <div class="item">
                                            <img src="/upload/pic/${adList[3].adPhoto }" alt="Bootstrap Touch Slider"  class="slide-image" />
                                        </div>
                                    </div>
                                </div>

                                <div class="newcustom" style="margin-top: 10px;">
                                    <table  width="100%">                                                        
                                        <tr>
                                            <td style='vertical-align: middle' onclick="location.href='fancyCanteensPage.action';">
                                                <img src="/upload/pic/FancyCanteens.png" class="center-block"  width="90%" style="border-radius:3%;">
                                            </td>                                                           
                                            <td style='vertical-align: middle' onclick="location.href='chineseCanteensPage.action';">
                                                <img src="/upload/pic/ChineseCanteens.png" class="center-block"  width="90%" style="border-radius:3%;">
                                            </td>                                             
                                        </tr>
                                        <tr>                                                           
                                            <td style='vertical-align: middle;text-align: center;font-size:18px' height="30px">特色风味</td>
                                            <td style='vertical-align: middle;text-align: center;font-size:18px' height="30px">实惠中餐</td>
                                        </tr>
                                        <tr>                          
                                            <td style='vertical-align: middle' onclick="location.href='starCanteensPage.action';">
                                                <img src="/upload/pic/StarCanteens.png" class="center-block"  width="90%" style="border-radius:3%;">
                                            </td>
                                            <td style='vertical-align: middle' onclick="location.href='shenziyuanPage.action';">
                                                <img src="/upload/pic/Restaurant.png" class="center-block"  width="90%" style="border-radius:3%;">
                                            </td>
                                        </tr>
                                        <tr>                          
                                            <td style='vertical-align: middle;text-align: center;font-size:18px' height="30px">名星食堂</td>
                                            <td style='vertical-align: middle;text-align: center;font-size:18px' height="30px">莘子苑酒店推荐</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="newcustom" style="margin-top: 10px;">    
                                    <div class="campusnav" >
                                        <ul>
                                            <c:forEach items="${campusList }" var="item" >
                                                <c:choose >
                                                    <c:when test="${item.campusID eq canteenItems.cantCampusID}">
                                                        <li ><a style="color: black;font-weight:500" href="userHomepage.action?campusID=${item.campusID}"><span>${item.campusName }</span></a><li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li ><a style="color:white;" href="userHomepage.action?campusID=${item.campusID}"><span>${item.campusName }</span></a><li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div style="position:relative;padding-top: 20px;">
                                        <ul class="nav nav-pills">
                                            <c:forEach items="${canteenItemsList }" var="item" >
                                                <c:choose >
                                                    <c:when test="${item.cantID eq canteenItems.cantID}">
                                                        <li style="font-size:18px;"><a style="color: white;font-weight:500" href="userHomepage.action?cantID=${item.cantID}"><span style="background:#f79076">${item.cantName }<span></a><li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li style="font-size:18px;"><a href="userHomepage.action?cantID=${item.cantID}">${item.cantName }</a><li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div class="timenav">
                                        <ul >
                                            <c:choose >
                                                <c:when test="${1 eq supplyTime}">
                                                    <li style="font-size:16px;"><a style="color: white;font-weight:500" href="userHomepage.action?cantID=${canteenItems.cantID}&supplyTime=1"><span style="background:#f79076">早餐</span></a><li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li style="font-size:16px;"><a style="color: black;" href="userHomepage.action?cantID=${canteenItems.cantID}&supplyTime=1"><span>早餐</span></a><li>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose >
                                                <c:when test="${2 eq supplyTime}">
                                                    <li style="font-size:16px;"><a style="color: white;font-weight:500" href="userHomepage.action?cantID=${canteenItems.cantID}&supplyTime=2"><span style="background:#f79076">中餐</span></a><li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li style="font-size:16px;"><a style="color: black;" href="userHomepage.action?cantID=${canteenItems.cantID}&supplyTime=2"><span>中餐</span></a><li>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose >
                                                <c:when test="${3 eq supplyTime}">
                                                    <li style="font-size:16px;"><a style="color: white;font-weight:500" href="userHomepage.action?cantID=${canteenItems.cantID}&supplyTime=3"><span style="background:#f79076">晚餐</span></a><li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li style="font-size:16px;"><a style="color: black;" href="userHomepage.action?cantID=${canteenItems.cantID}&supplyTime=3"><span>晚餐</span></a><li>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose >
                                                <c:when test="${4 eq supplyTime}">
                                                    <li style="font-size:16px;"><a style="color: white;font-weight:500" href="userHomepage.action?cantID=${canteenItems.cantID}&supplyTime=4"><span style="background:#f79076">全天</span></a><li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li style="font-size:16px;"><a style="color: black;" href="userHomepage.action?cantID=${canteenItems.cantID}&supplyTime=4"><span>全天</span></a><li>
                                                </c:otherwise>
                                            </c:choose>
                                        </ul>
                                    </div>
                                    <div class="row" style="padding:0 0px;"> 
                                        <div class="form-group">
                                            <div class="item-wrap">
                                                <c:choose>
                                                    <c:when test="${supplyTime!=null }">
                                                        <c:forEach items="${dishesDetailList }" var="item" >
                                                            <div class="item clearfix">
                                                                <div class="txt-item" style="margin-left:5px;padding-top:5px">
                                                                    <table  width="100%">                                                        
                                                                        <tr style="height:40px"> 
                                                                            <td style='vertical-align: left;text-align: center;width:27%' rowspan=3>
                                                                                <c:if test="${item.detailDishPhoto != null }">
                                                                                    <img src="/upload/pic/${item.detailDishPhoto }" class="center-block" height="80" width="80" style="border-radius:5%;margin-left:2px;margin-right:-50px">
                                                                                </c:if>
                                                                            </td>                                                           
                                                                            <td style='vertical-align: middle;line-height: 18px;font-size:18px;font-weight:500;width:45%' >${item.detailDishName}</td>
                                                                            <td style='vertical-align: middle;'></td>                                             
                                                                        </tr>
                                                                        <tr style="height:30px">                                                           
                                                                            <td style='vertical-align: middle;line-height: 14px;font-size:14px;'>[${item.detailWndName }]</td>
                                                                            <td style='vertical-align: middle;font-size:14px;'>${item.detailDishDate } </td> 
                                                                        </tr>
                                                                        <tr style="height:20px">                          
                                                                            <td style='vertical-align: middle;color:#29C192;font-size:18px;'>￥${item.detailDishPrice }</td>
                                                                            <td style='vertical-align: middle;font-size:16px;'><fmt:formatDate value="${item.detailDishInDate}" pattern="yyyy-MM-dd" /></td>
                                                                        </tr>
                                                                    </table>
                                                                    <div style=" height: 1px; border-top: 1px solid #ddd;text-align: center;"></div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                                   
                                                        <c:forEach items="${windowsList }" var="item">
                                                            <div id="view" class="item clearfix">                                                   
                                                                <div class="txt-item">
                                                                    <table width="100%" onclick="location.href='userWindowContents.action?wndID=${item.wndID}';" >
                                                                        <tr style="height:30px">
                                                                            <td rowspan=2>
                                                                                <img src="/upload/pic/${item.wndPhoto }" class="center-block" height="45" width="90"/>
                                                                            </td>
                                                                            <td colspan="2" style="width:75%;padding-left:12px;font-size:18px;font-weight:500">
                                                                                <p class="name">${item.wndName }</p>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height:30px">
                                                                            <td style="padding-left:12px;color:#29C192;font-size:20px;width:35%">
                                                                                <p class="txt">￥${item.wndPriceRange}</p>
                                                                            </td>
                                                                            <td style="font-size:16px">
                                                                                <p class="txt"> ${item.wndSaleHours}</p>
                                                                            </td>
                                                                        </tr>
                                                                        <!-- <tr style="height:30px">
                                                                            <td colspan="2" style="padding-left:12px;font-size:16px">
                                                                                <p class="txt">${item.wndDescription}</p>
                                                                            </td>
                                                                        </tr> -->
                                                                    </table>
                                                                    <div style=" height: 1px; border-top: 1px solid #ddd;text-align: center;"></div>
                                                                </div>                                                          
                                                            </div>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>                                                                            
                                            </div>
                                        </div>  
                                    </div>
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                    <br>  			
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    		</div>
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
        <script src="js/classie.js"></script>
        <script src="js/mlpushmenu.js"></script>
        <script>new mlPushMenu( document.getElementById( 'mp-menu' ), document.getElementById( 'trigger' ) );</script>
        <!--<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>-->
        <script type="text/javascript">
            $('#bootstrap-touch-slider').bsTouchSlider();
        </script>
    </body>
</html>
