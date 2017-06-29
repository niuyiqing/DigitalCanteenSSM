<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- jQuery支撑 -->
<script src="js/jquery.form.js"></script>
<script src="js/custom.jquery.form.js"></script>
<script src="js/jquery.validate.js"></script>

<script>
    //菜品录入的重复性校验
    function dishImport(){
        jquerySubByFId('dishImportForm', dishImport_callback, null, "json");
    }
    function dishImport_callback(data){
        //如果消息类型为INFO（3），说明已经生成过记录表，跳转到修改页面
        //否则跳转到录入页面
        if(data.resultInfo.type == '3'){
            //window.location.href = "modifyRecordDetailDish.action?recordID=" + data.resultInfo.recordID;
            window.location.href = "importDish.action?recordID=" + data.resultInfo.recordID;
        }else if(data.resultInfo.type == '1'){
            window.location.href = "importDish.action?recordID=" + data.resultInfo.recordID;
        }
    }
</script>
	<form id="dishImportForm" name="dishImportForm" action="importRepeatCheck.action" method="post"></form>
	<nav id="mp-menu" class="mp-menu">
		<div class="mp-level">
			<h2  style="font-size:18px; background:#29C192">食堂管理系统</h2>
			<ul>
			    <li >
					<a class="icon icon-shouyeshouye" data-ajax="false" href="${pageContext.request.contextPath }/muserCanteenHostPage.action" style="font-size:17px">首页</a>
				</li>
				<li >
					<a class="icon icon-luru" data-ajax="false" href="javascript:void(0)" onclick="dishImport()" style="font-size:17px">菜品录入</a>
				</li>
				<li >
					<a class="icon icon-caipinguanli" data-ajax="false" href="#" style="font-size:17px">菜品管理</a>
					<div class="mp-level">
						<h2 class="icon icon-caipinguanli" style="padding: 1em 1em 1em 4.5em;font-size:17px;background:rgba(41,193,146,0.95)">菜品管理</h2>
						<ul>
							<li><a class="icon icon-shangjia" data-ajax="false" href="${pageContext.request.contextPath }/addDish.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">菜品上架</a></li>                               
				            <li><a class="icon icon-caipin" data-ajax="false" href="${pageContext.request.contextPath }/findDishInCanteen.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">查看已有菜品</a></li>	 
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<button style="position:absolute;left:20px;top:90%;border:none"><a class="icon icon-zhuxiao" data-ajax="false" href="${pageContext.request.contextPath }/logout.action"><span style="font-size:15px;color:#000000;">注销</span></a></button>
	</nav>

