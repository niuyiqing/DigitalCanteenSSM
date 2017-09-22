<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML >
<html>
    <head>
    	<meta charset="utf-8">
    	
    	<title>轮播图</title>

    	<meta name="viewport" content="width=device-width, 
                                             initial-scale=0.3, 
                                             maximum-scale=1.0, 
                                             user-scalable=true">        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!--自定义-->      
        <link rel="stylesheet" href="css/my-custom.css">
    	
        <!--bootstrap-->    
        <script src="js/jquery-1.10.1.min.js"></script>       
    
        <!--bootstrap-->    
        <script src="js/bootstrap.min.js"></script>   
		<link rel="stylesheet" type="text/css" media="all" href="css/rotationpicture.css" />
	    <script src="js/moment.js"></script>
	    <script src="js/daterangepicker-1.3.7.js"></script>		
    </head>
  
  <body>
  	<div class="page-wrapp">
	    <div class="item-wrap">
	        <div class="sub-item" data-index="1">
				<img src="/upload/pic/0ed056a8-924a-4085-ab75-1921e04e16f5.jpg" alt="" class="img-item"/>			   							
	        </div>
	        <div class="sub-item" data-index="2">
				<img src="/upload/pic/0f747b14-bdef-40f8-8346-ca6139cf0353.jpg" alt="" class="img-item"/>			   							
	        </div>	   			 
	</div>
	
	<!-- 轮播按钮 -->
	<div class="left-btn-wrap">
	    <span class="silder-left-btn" id="leftBtn"></span>
	</div>
	<div class="right-btn-wrap">
	    <span class="silder-right-btn" id="rightBtn"></span>
	</div>   
	<ul id="silderNav">
        <li class="silder-index" data-index="1">1</li>
        <li class="silder-index" data-index="2">2</li>
    </ul>
    
	<script>
		 /*左滚动参数说明：$itemWrap=$('.item-wrap'); 轮播外层盒子*/
		$leftBtn.on('click', function(){
		    $itemWrap.animate({
		        'margin-left': 0 - $imgItems.width()
		    }, 1000, function(){
		        /*轮播一次就动态的将第一个图片元素移到最后，变成最后一张图片，这样可以实现无限循环的效果*/ 
		        $itemWrap.append($('.item-wrap .sub-item').first());
		        $itemWrap.css("margin-left",0);
		    })
		})
	
		/*右滚动*/ 
		$rightBtn.on('click', function(){
		    $itemWrap.prepend($('#itemWrap .sub-item').last());
		        $itemWrap.css("margin-left",0 - $imgItems.width());
		    $itemWrap.animate({
		        'margin-left': 0
		    }, 1000)
		})
	</script>
    
  </body>
</html>
