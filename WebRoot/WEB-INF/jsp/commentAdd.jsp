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
        <title>添加评论</title>   
        <meta http-equiv="pragma" content="no-cache" />
        <meta http-equiv="cache-control" content="no-cache" />
        <meta http-equiv="expires" content="0">   
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
    
        <script src="js/jquery-1.10.1.min.js"></script>
        <script src="js/modernizr.custom.js"></script>
        <script src="js/jquery.form.js"></script>
        <script src="js/custom.jquery.form.js"></script>
        <script src="js/jquery.validate.js"></script>
        <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/icons.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
        <link rel="stylesheet" type="text/css" href="css/jquery.raty.css"/>
        <script src="js/jquery.raty.js"></script>
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
  	    	/* 得到系统格式化的日期 */
	    	function insertCommentInWindow(form) {
	    	   /*  var txt=$("#function-hint").val();
	    	    document.getElementById('test').value=txt; */
	    	    document.commentInsertForm.action="insertCommentInWindow.action";
            	document.commentInsertForm.submit(); 
	    	}
  	    </script>
  	    
        <div class="codrops-header" style="background:#29C192;">
            <div class="back-container">
              <button class="btn btn-link btn-lg" ><a style="color:#ffffff" class="icon icon-fanhui" data-ajax="false" href="${pageContext.request.contextPath }/userWindowContents.action?wndID=${windowItems.wndID}"></a></button>
            </div>  
            <p style="padding-top:7px;width:100%;height:100%;font-size:22px;color:white">${windowItems.wndName }(${windowItems.cantName })</p>
        </div>

                    <div class=" newcustom" style="margin-top:77px" >
                        <div class="row">
                            <form class="form-horizontal" role="form" name="commentInsertForm" method="post">
                                <input name="cmtWndID" type="hidden" value="${windowItems.wndID }">
								<input name="cmtUserID" type="hidden" value="${userItems.userID }">
								<input name="cmtDate" type="hidden" value="${cmtDate }">
                                <div class="row">                                       	                        	        
                                    <div class="col-xs-3 control-label" style="color:black;padding-top:5%">评分</div>
                                    <div class="col-xs-9">
                                        <div class="score" style="padding-top:12px" id="{pigcms{$vo['score']}">
                                        	<input name="cmtScore" type="hidden" value="" id = "cmtScore">
                                        </div>
						            </div>
                                </div>    
                                <div class="row">       
                                    <div class="col-xs-3 control-label" style="color:black;padding-top:5%">评论内容</div>
                                    <div class="col-xs-9 ">    
                                        <input type="text" class="form-control" name="cmtContent">
                                    </div>                                    
                                </div>                         
                                <div class="form-group">    
                                    <div align="center">                        	       
                            	        <input type="submit" class="btn btn-block" style="margin-top:20px;margin-bottom:15px;width:80%;background:#72dbc8;color:#fff;font-size:18px" value="发布" onclick="insertCommentInWindow()">
                                    </div>
                                </div>
                            </form>                        	                        
                        </div>    
                    </div> 
        <script type="text/javascript">  
                //评分的js代码  
            $.fn.raty.defaults.path = 'images';  
            $('.score').each(function(i,e){  
                var v = $(this).attr("id");  
                $(this).raty({score:v,  
                    click: function(score, evt) {  
                        var t1 = document.getElementById('cmtScore');
						t1.value = score;
                    }  
                });  
            });  
        </script> 
    </body>
</html>
