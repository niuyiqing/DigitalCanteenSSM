<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
    <head>
    	<meta charset="utf-8">
    	
    	<title>食堂管理首页</title>

    	<meta name="viewport" content="width=device-width, 
                                             initial-scale=0.3, 
                                             maximum-scale=1.0, 
                                             user-scalable=true">        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!--自定义-->      
        <link rel="stylesheet" href="css/my-custom.css">
        <!--分页控件--> 
        <link rel="stylesheet" href="css/qunit-1.11.0.css">
    	
        <!--bootstrap-->    
        <script src="js/jquery-1.10.1.min.js"></script>       
    
        <!--bootstrap-->    
        <script src="js/bootstrap.min.js"></script>   
        <!--日历控件-->	
		<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-bs3.css" />
		<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-1.3.7.css" />
	    <script src="js/moment.js"></script>
	    <script src="js/daterangepicker-1.3.7.js"></script>		
    </head>
  
    <body>
	    <script type="text/javascript">
	
		function exportExcelInCanteen(){
			document.muserCanteenForm.action="canteenRecordExportToExcel.action";
	    	document.muserCanteenForm.submit();	
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
	
    	<%@ include file="publicjsp/canteenMenu.jsp" %>
        <div class="container-fluid">
            <div class="panel panel-default">

                <div class="panel-heading">
                    <h3 class="panel-title">
	                    <div class="col-xs-1">
	                        <label>${muserItems.cantName }</label>
	                    </div>
                   	 菜品录入记录</h3>                 
                </div> 	
                <div class="panel-body">
                    <form role="form" name="muserCanteenForm" action="canteenRecordExportToExcel.action" method="post">
                    	<div  class="form-group col-sm-3">						
							<div class="input-group" style="width: 240px; margin-left: 0px;">
							    <input type="text" class="form-control date-picker" id="dateTimeRange"/>
							    <span class="input-group-addon">
							        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
							    </span>
							    <input type="hidden" name="beginTime" id="beginTime" />
							    <input type="hidden" name="endTime" id="endTime"  />								    
							</div>													
						</div>
						<div  class="col-sm-3">
							<button onclick="exportExcelInCanteen()" class="btn btn-primary">导出</button>
						</div>
						
	                    <!-- 食堂管理员 -->
	                    <input type="hidden" name = "campusID" value="${muserItems.campusID }" >
	                    <input type="hidden" name = "cantID" value="${muserItems.cantID }" >
	                    <input type="hidden" name = "muserID" value="${muserItems.cantID }" >
                        <div class="form-group">                            
	                        <%@ include file="recordInCanteen.jsp" %>
                            <div>
                                <div class="message">
                                    <p class="text-center">
                                        共<b>${pagehelper.total}</b>条记录，当前显示第&nbsp;<b>${pagehelper.pageNum}/${pagehelper.pages}</b>&nbsp;页
                                    </p>
                                </div>
                                <div style="text-align:center;">
                                    <ul class="pagination">
                                        <c:if test="${!pagehelper.isFirstPage}">                                        
                                            <li>
                                                <a href="muserCanteenHostPage.action?pageNum=1&pageSize=${pagehelper.pageSize}">首页</a>
                                            </li>
                                            <li>
                                                <a href="muserCanteenHostPage.action?pageNum=${pagehelper.prePage}&pageSize=${pagehelper.pageSize}">上一页</a>
                                            </li>
                                        </c:if>
    
                                        <c:forEach items="${pagehelper.navigatepageNums}" var="navigatepageNum">    
    
                                            <c:if test="${navigatepageNum==pagehelper.pageNum}">
                                                <li class="active">
                                                    <a href="muserCanteenHostPage.action?pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a>
                                                </li>
                                            </c:if>
    
                                            <c:if test="${navigatepageNum!=pagehelper.pageNum}">
                                                <li>
                                                    <a href="muserCanteenHostPage.action?pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a>
                                                </li>
                                            </c:if>
    
                                        </c:forEach>
    
                                        <c:if test="${!pagehelper.isLastPage}">
                                            <li>
                                                <a href="muserCanteenHostPage.action?pageNum=${pagehelper.nextPage}&pageSize=${pagehelper.pageSize}">下一页</a>
                                            </li>
                                            <li>
                                                <a href="muserCanteenHostPage.action?pageNum=${pagehelper.pages}&pageSize=${pagehelper.pageSize}">尾页</a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div> 
                        </div>
                    </form> 
                </div>

            </div>
        </div> 
<!--日期控件-->
  	<script type="text/javascript">
		$(function() {
		    $('#dateTimeRange').daterangepicker({
		        applyClass : 'btn-sm btn-success',
		        cancelClass : 'btn-sm btn-default',
		        locale: {
		            applyLabel: '确认',
		            cancelLabel: '取消',
		            fromLabel : '起始时间',
		            toLabel : '结束时间',
		            customRangeLabel : '自定义',
		            firstDay : 1
		        },
		        ranges : {
		            /* '最近1小时': [moment().subtract('hours',1), moment()], */
		            '今日': [moment().startOf('day'), moment()],
		            /* '昨日': [moment().subtract('days', 1).startOf('day'), moment().subtract('days', 1).endOf('day')],
		            '最近7日': [moment().subtract('days', 6), moment()],
		            '最近30日': [moment().subtract('days', 29), moment()], */
		            '本月': [moment().startOf("month"),moment()],
		            '上个月': [moment().subtract(1,"month").startOf("month"),moment().subtract(1,"month").endOf("month")]
		        },
		        opens : 'right',    // 日期选择框的弹出位置
		        separator : ' 至 ',
		        showWeekNumbers : true,     // 是否显示第几周
		 
		 
		        //timePicker: true,
		        //timePickerIncrement : 10, // 时间的增量，单位为分钟
		        //timePicker12Hour : false, // 是否使用12小时制来显示时间
		 
		         
		        //maxDate : moment(),           // 最大时间
		        format: 'YYYY-MM-DD'
		 
		    }, function(start, end, label) { // 格式化日期显示框
		        $('#beginTime').val(start.format('YYYY-MM-DD'));
		        $('#endTime').val(end.format('YYYY-MM-DD'));
		    })
		    .next().on('click', function(){
		        $(this).prev().focus();
		    });
		});
		 
		/**
		 * 清除时间
		 */
		function begin_end_time_clear()
		{
		    $('#dateTimeRange').val('');
		    $('#beginTime').val('');
		    $('#endTime').val('');
		}
	</script>
    </body>
</html>
