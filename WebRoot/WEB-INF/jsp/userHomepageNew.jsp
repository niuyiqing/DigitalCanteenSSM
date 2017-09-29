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
        </script> 
    </head>
  
    <body>
    	<div class="container">
    		<div class="mp-pusher" id="mp-pusher">
                <!-- 左侧导航栏 -->  
                <%@ include file="publicjsp/userSetInfo.jsp" %>
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
                                            <img src="/upload/pic/${adList[0].adPhoto }" alt="Bootstrap Touch Slider"  class="slide-image" onload="DrawImage(this)"/>
                                        </div>
                                        <div class="item">
                                            <img src="/upload/pic/${adList[1].adPhoto }" alt="Bootstrap Touch Slider"  class="slide-image" onload="DrawImage(this)"/>
                                        </div>
                                        <div class="item">
                                            <img src="/upload/pic/${adList[2].adPhoto }" alt="Bootstrap Touch Slider"  class="slide-image" onload="DrawImage(this)"/>
                                        </div>
                                        <div class="item">
                                            <img src="/upload/pic/${adList[3].adPhoto }" alt="Bootstrap Touch Slider"  class="slide-image" onload="DrawImage(this)"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="newcustom" style="margin-top: 10px;">
                                    <table  width=100%>                                                        
                                        <tr>
                                            <td style='vertical-align: middle' onclick="location.href='findAllCampuses.action';">
                                                <img src="/upload/pic/3e13ffb4-e5df-43e8-8794-172e475398b2.jpg" class="center-block" height="100" width="140" style="border-radius:3%;">
                                            </td>                                                           
                                            <td style='vertical-align: middle' >
                                                <img src="/upload/pic/3e13ffb4-e5df-43e8-8794-172e475398b2.jpg" class="center-block" height="100" width="140" style="border-radius:3%;">
                                            </td>                                             
                                        </tr>
                                        <tr>                                                           
                                            <td style='vertical-align: middle;text-align: center;font-size:1.5em' height="30px">特色风味</td>
                                            <td style='vertical-align: middle;text-align: center;font-size:1.5em' height="30px">实惠中餐</td>
                                        </tr>
                                        <tr>                          
                                            <td style='vertical-align: middle' >
                                                <img src="/upload/pic/3e13ffb4-e5df-43e8-8794-172e475398b2.jpg" class="center-block" height="100" width="140" style="border-radius:3%;">
                                            </td>
                                            <td style='vertical-align: middle' >
                                                <img src="/upload/pic/3e13ffb4-e5df-43e8-8794-172e475398b2.jpg" class="center-block" height="100" width="140" style="border-radius:3%;">
                                            </td>
                                        </tr>
                                        <tr>                          
                                            <td style='vertical-align: middle;text-align: center;font-size:1.5em' height="30px">名星食堂</td>
                                            <td style='vertical-align: middle;text-align: center;font-size:1.5em' height="30px">莘子苑酒店推荐</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="newcustom" style="margin-top: 10px;">    
                                    <div style="position:relative;height:50px;padding-top: 20px;background-color: #f79076;">
                                        <ul class="nav nav-pills">
                                            <c:forEach items="${campusList }" var="item" >
                                                <c:choose >
                                                    <c:when test="${item.campusID eq campus.campusID}">
                                                        <li style="font-size:18px;"><a style="background-color: #f2e2de;" href="userHomepage.action?campusID=${item.campusID}">${item.campusName }</a><li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li style="font-size:18px;"><a style="color:white;" href="userHomepage.action?campusID=${item.campusID}">${item.campusName }</a><li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div style="position:relative;height:70px;padding-top: 20px;">
                                        <ul class="nav nav-pills">
                                            <c:forEach items="${canteenItemsList }" var="item" >
                                                <c:choose >
                                                    <c:when test="${item.cantID eq canteenItems.cantID}">
                                                        <li style="font-size:18px;"><a style="background-color: #f2e2de;" href="userHomepage.action?cantID=${item.cantID}">${item.cantName }</a><li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li style="font-size:18px;"><a href="userHomepage.action?cantID=${item.cantID}">${item.cantName }</a><li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div class="row" style="padding:0 0px;"> 
                                        <div class="form-group">
                                            <div class="item-wrap">                                                                        
                                                <c:forEach items="${windowsList }" var="item">
                                                    <div id="view" class="item clearfix">                                                   
                                                        <div class="txt-item">
                                                            <table width=100% height=84px onclick="location.href='userWindowContents.action?wndID=${item.wndID}';" >
                                                                <tr>
                                                                    <td style="width:60%;padding-left:12px;font-size:1.5em;font-weight:500">
                                                                        <p class="name">${item.wndName }</p>
                                                                    </td>
                                                                    <td style="width:40%">
                                                                       <p class="name">${item.wndAddr}</p>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-left:12px">
                                                                        <p class="txt">￥${item.wndPriceRange}&nbsp &nbsp支持${item.wndPayment}</p>
                                                                    </td>
                                                                    <td>
                                                                        <p class="txt"> ${item.wndSaleHours}营业</p>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-left:12px">
                                                                        <p class="txt">${item.wndDescription}</p>
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
    			<!-- 牛怡青 牛怡青 牛怡青 牛怡青 牛怡青 牛怡青 牛怡青 牛怡青 牛怡青 牛怡青 牛怡青 -->
    			<!-- 牛怡青 牛怡青 牛怡青 牛怡青 牛怡青 牛怡青 牛怡青 牛怡青 牛怡青 牛怡青 牛怡青 -->
    			
    			<!-- 后台传递过来的元素有：campusList，canteenItems，windowsList，canteenItemsList -->
    			<!-- 分别是所有校区列表，选中的食堂，选中食堂的所有档口列表，该校区所有食堂列表 -->
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
        <!-- 轮播图大小自适应 -->
            <script type="text/javascript" src="js/jqthumb.js"></script>
            <script>
            function DrawImage(hotimg)
            {
               $(hotimg).jqthumb({
               classname      : 'jqthumb',
                        width          : '100%',
                        height         : '200px',
                        position       : { y: '50%', x: '50%'},
                        zoom           : '1',
                        method         : 'auto',
               });
            }
            </script>
    </body>
</html>
