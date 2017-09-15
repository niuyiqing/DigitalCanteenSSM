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
        <title>菜品上架</title>
        <meta http-equiv="pragma" content="no-cache" />
        <meta http-equiv="cache-control" content="no-cache" />
        <meta http-equiv="expires" content="0">   
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
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

        <!-- 日期控件导入 -->
        <script language="javascript" type="text/javascript" src="././My97DatePicker/WdatePicker.js"></script>

    </head>  
    <body>
        <script>
        	/* 在档口选择之后得到该档口之下的菜品选择框
        		objValue：档口的ID值
        		dishUpdateForm：菜品更新表单
        		dishPresetList：所有菜品信息列表
        		dishName：菜品select标签的选择值
        	*/
        	function getDish(objValue){
        		var objForm = document.forms["dishInsertForm"];
        		if(objValue == ""){
        			objForm.dishName.disabled = true;
        		}else{   			 	
        			objForm.dishName.disabled = false; 
        			objForm.dishName.options.length = 0;
        			
	    		var optionObj = document.createElement("option");
        			optionObj.text = "请选择菜品";
                    optionObj.value = "0";
                    objForm.dishName.add(optionObj);
                    
        			<c:forEach items="${dishPresetList }" var="item" >  	
 	     				var optionObj = document.createElement("option"); 							
                        optionObj.text = "${item.dishPresetName }";
                        optionObj.value = "${item.dishPresetName }";
                        objForm.dishName.add(optionObj);                
	    			</c:forEach>
        		}
        	}
    
	    	
	    	
        	function check(form){
            	if(form.cantCampusID.value == ""){
            		alert("请先选择菜品所在校区！");
            		return false;
            	}
            	if(form.wndCantID.value == ""){
            		alert("请先选择菜品所在食堂！");
            		return false;
            	}
            	if(form.dishWndID.value == ""){
            		alert("请先选择菜品所在档口！");
            		return false;
            	}
            	if(form.wndName.value == ""){
            		alert("请填写菜品名称！");
            		form.wndName.focus();
            		return false;
            	}
            }
        </script>


        <div class="container">
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
                            <p style="width:100%;height:100%;vertical-align:middle;font-size:27px">菜品上架</p> 
                        </div>
            
                        <div class="content clearfix">
                            <!-- 菜品添加 -->
                            <form  role="form" name="dishInsertForm" action="insertDish.action" method="post">                       
                                <div class="newcustom" style="margin-top:69px;padding-left:5%">           	            
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-xs-4 control-label style1">校区</label>
                                            <div class="col-xs-7">
                	                           <input type="text" class="form-control" name="campusName" value="${muserItems.campusName }" readonly="readonly">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-xs-4 control-label style1">食堂</label>
                                            <div class="col-xs-7">
        	       	                           <input type="text" class="form-control" name = "cantName" value="${muserItems.cantName }" readonly="readonly">
                                            </div>
                                        </div>

                                    </div>
                                    <br>
                                    <div class="row form-group">  
                                        <label class="col-xs-4 control-label style1">档口</label>
                                        <div class="col-xs-7">
                                            <!-- 选择菜品所属档口 -->
                                            <select name="dishWndID" class="form-control" onchange="getDish(this.value)">
                                                <option value="">请选择菜品所属档口</option>
                                                <c:forEach items="${windowItemsList }" var="item" >
                                                    <option value="${item.wndID }">${item.wndName }</option>
                                                </c:forEach>
                                            </select>
                                        </div>    
                                    </div>
                                    <br> 
                                    <div class="row form-group">                               
                                        <label class="col-xs-4 control-label style1">菜品类型</label>
                                        <div class="col-xs-7">
                                            <!-- 选择菜品所属类型-->                    
                                            <select name="dishTypeID" class="form-control">
                                                <option value="">请选择菜品所属类型</option>
                                                <c:forEach items="${dishTypeList }" var="item" >
                                                    <option value="${item.dishTypeID }">${item.dishTypeName }</option>
                                                </c:forEach>
                                            </select>   
                                        </div>                            
                                    </div>
                                    <br>    
                                    <div class="row form-group">
                                        <label class="col-xs-4 control-label style1">菜品名称</label>
                                        <div class="col-xs-7">
                                            <!-- 选择菜品  -->
                                            <select name="dishName" class="form-control" disabled="disabled">
                                                <option value="">请选择菜品</option>
                                            </select>
                                        </div>
                                    </div>
                                    <br>                                                                   
                                    <div class="form-group row">
                                        <label class="col-xs-4 control-label style1">菜品价格</label>
                                        <div class="col-xs-7">   
                                            <input type="text" class="form-control" placeholder="请在此输入菜品价格" name="dishPrice">
                                        </div>
                                    </div>
                                    <br>    
                                    <div class="form-group row">
                                        <label class="col-xs-4 control-label style1">菜品推荐</label>
                                        <div class="col-xs-7">
                                            <select name="dishRecmd" class="form-control">
                                                <option value="否" selected="selected">否</option>
                                                <option value="是">是</option>            
                                            </select>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group row">
                                        <label class="col-xs-4 control-label style1">菜品留样</label>
                                        <div class="col-xs-7">
                                            <select name="dishKeep" class="form-control">
                                                <option value="否" selected="selected">否</option>
                                                <option value="是">是</option>            
                                            </select>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group row">
                                        <label class="col-xs-4 control-label style1">菜品销售状态</label>
                                        <div class="col-xs-7"> 
                                            <select name="dishSale" class="form-control">
                                                <option value="在售" selected="selected">在售</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-xs-4 control-label style1">菜品销售时间</label>
                                        <div class="col-xs-7">
                                            <select name="dishDate" class="form-control">
                                                <option value="早餐" selected="selected">早餐</option>
                                                <option value="正餐">正餐</option>
                                                <option value="全天供应">全天供应</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <br> 
                                    
                                                                    
                                    <div class="form-group">
                                        <div align="center" style="position:relative;top:2px;">
                                            <input type="submit" class="btn btn-primary" value="添加菜品" onClick="return check(dishInsertForm)">
                                        </div>
                                    </div>
                                </div>                                   	        
                            </form>
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
        <script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
    </body>
</html>
