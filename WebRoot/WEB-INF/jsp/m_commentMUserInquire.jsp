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
    	
    	<title>评论管理</title>
    	<meta charset="utf-8">
    	<meta http-equiv="pragma" content="no-cache" >
        <meta http-equiv="cache-control" content="no-cache" >
        <meta http-equiv="expires" content="0">   
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" >
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
        
        <script src="js/modernizr.custom.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-2.1.1.min.js"></script>
        
        <!--自定义-->      
        <link rel="stylesheet" href="css/my-custom.css"> 
        <!--分页控件--> 
        <link rel="stylesheet" href="css/qunit-1.11.0.css"> 
        
        <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/icons.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
        <link rel="stylesheet" type="text/css" href="css/leftDelete.css"  />
    </head>
  
    <body>
    	
        <script>
        	/* 在校区选择之后得到该校区之下的食堂选择框
        		objValue：校区的ID值
        		windowInsertForm：档口预置表单
        		canteenItemsList：所有食堂信息列表
        		wndCantID：食堂select标签的选择值
        	*/
  	    	function getCanteen(objValue)
	    	{	
	    		var objForm = document.forms["commentMUserInquireForm"];
	    	
        		if(objValue == ""){
        			objForm.wndCantID.disabled = true;
        		}else{  
        			objForm.wndCantID.disabled = false; 
        			objForm.wndCantID.options.length = 0;
        			
        			var optionObj = document.createElement("option");
        			optionObj.text = "请选择档口所属食堂";
	                optionObj.value = 0;
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
	    	
	    	function getWindow(objValue)
	    	{	
	    		var objForm = document.forms["commentMUserInquireForm"];
	    	
        		if(objValue == ""){
        			objForm.wndID.disabled = true;
        		}else{  
        			objForm.wndID.disabled = false; 
        			objForm.wndID.options.length = 0;       	
	                
        			<c:forEach items="${windowItemsList }" var="item" >  	
        	 			var wndCantID = ${item.wndCantID };
 	     				var optionObj = document.createElement("option");
        	 			if( wndCantID == Number(objValue)){
	                        optionObj.text = "${item.wndName }";
	                        optionObj.value = "${item.wndID }";
	                        objForm.wndID.add(optionObj);
        	 			}  
	    			</c:forEach>
        		}
	    	}
	    	
    
            function check(form){
            	if(form.cantCampusID.value == ""){
            		alert("请先选择档口所在校区！");
            		return false;
            	}
            	if(form.wndCantID.value == ""){
            		alert("请先选择档口所在食堂！");
            		return false;
            	}
            	if(form.wndName.value == ""){
            		alert("请填写档口名称！");
            		form.wndID.focus();
            		return false;
            	}
            } 
  	    </script>
  	    
<div class="container" data-role="page">
     <div class="mp-pusher" id="mp-pusher">
      <%@ include file="publicjsp/index.jsp" %> 
        <div class="scroller" style="background:#EEEEEE">
            <div class="scroller-inner">
                <div class="codrops-header" style="background:#29C192">
                         <div id="trigger" class="burger-container">
                            <span class="burger-bun-top"></span>
                            <span class="burger-filling"></span>
                            <span class="burger-bun-bot"></span>
                         </div>                 
                        <p style="width:100%;height:100%;vertical-align:middle;font-size:27px">评论管理</p>
                </div>

    	<div class="container-fluid" style="color:#000;padding:0 0px;">
            <div class="newcustom" style="margin-top:69px">	
                        <form class="form-horizontal" role="form" name="commentMUserInquireForm" action="commentMUserInquire.action" method="post">
                            <div align="center">
                                    <!-- 选择食堂所属校区 -->
                                    <select name="cantCampusID"  class="form-control select select-primary mrs mbm" onchange="getCanteen(this.value)">
                                        <option value="">请选择食堂所属校区</option>
                                        <c:forEach items="${campusList }" var="item" >
                                            <option value="${item.campusID }">${item.campusName }</option>
                                        </c:forEach>
                                    </select>
                                    <br>
                                    <!-- 选择档口所属食堂 -->
                                    <select name="wndCantID"  disabled="disabled" class="form-control select select-primary mrs mbm" onchange="getWindow(this.value)">
                                        <option value="">请选择档口所属食堂</option>
                                    </select>
                                    <br>
                                    <!-- 选择档口 -->
                                    <select name="wndID"  class="form-control select select-primary mrs mbm" disabled="disabled" >
                                        <option value="">请选择档口</option>
                                    </select>
                                    <br>
                                <div align="center">
                                    <!-- 档口添加按钮 -->
                                    <input type="submit" class="btn btn-primary btn-wide" value="查询" onClick="return check(commentMUserInquireForm)">
                                </div>
                                <br>
                            </div>
                        </form>                               	                        
	
    				<!-- 显示在一个食堂中的所有菜品 -->
    				<form role="form" name="commentForm" enctype="multipart/form-data">
						<input name="wndID" type="hidden" value="${windowItems.wndID }">
						<div class="row" style="font-size:18px;margin-top:8px;margin-bottom:10px;align:center">
                                &nbsp &nbsp &nbsp
						   		${windowItems.cantName}&nbsp
						   		${windowItems.wndName}&nbsp
						   		${windowItems.wndScore}分
						</div>
						<br>
    					
    					<div class="row" style="padding:0 0px;">
                            <div class="form-group">
                                <div class="item-wrap">
    							<c:forEach items="${commentItemsList }" var="item" >
                                    <div  id="view" class="item clearfix">
                                        <div class="txt-item" style=" margin-right:0px; margin-left:5px;padding-top:5px;padding-bottom: 5px;">
                                            <table width=85%>					    			 
									            <tr>
                                                    <td style='vertical-align: middle;text-align: center;' rowspan=3>
                                                        <c:if test="${item.userPhoto != null }">
                                                            <img src="/upload/pic/${item.userPhoto }" class="center-block" height="60" width="60" style="border-radius:50%;margin-left:0;margin-right:-20px"/>
                                                        </c:if>
                                                    </td>
									 	            <td style='vertical-align: middle;text-align: left;font-size:1.5em' >${item.userName }</td>
									   	            <td style='vertical-align: middle;text-align: left;'>${item.cmtScore }分</td>
									   	            <td style='vertical-align: middle;text-align: center;'>${item.cmtGoodNum}次赞</td>
                                                    <td style='vertical-align: middle;text-align: left;'><fmt:formatDate value="${item.cmtDate}" pattern="yyyy-MM-dd" /></td> 
									            </tr>
                                                <tr>
                                                    <td style='vertical-align: middle;text-align: left;' colspan=4>${item.cmtContent }</td>
                                                </tr>
                                                <tr>
                                                    <td style='vertical-align: middle;text-align: left;font-size:1.3em' colspan=4><a href="deleteCommentById.action?cmtID=${item.cmtID}&wndID=${item.cmtWndID}" style="color:#e23f47">删除</a></td>
                                                </tr>
                                            </table>
                                        </div>
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
    </body>
</html>
