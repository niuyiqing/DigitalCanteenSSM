<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

        <nav id="mp-menu" class="mp-menu">
					<div class="mp-level">
						<h2  style="font-size:18px; background:#29C192">后台管理系统</h2>
						<ul>
						    <li >
								<a class="icon icon-shouyeshouye" data-ajax="false" href="${pageContext.request.contextPath }/backgroundHomepage.action" style="font-size:17px">首页</a>
							</li>
							<li >
								<a class="icon icon-caipinguanli" data-ajax="false" href="#" style="font-size:17px">菜品管理</a>
								<div class="mp-level">
									<h2 class="icon icon-caipinguanli" style="padding: 1em 1em 1em 4.5em;font-size:17px; background:rgba(41,193,146,0.95)">菜品管理</h2>
									<ul>
										<li >
											<a  href="${pageContext.request.contextPath }/recordExportToExcel.action" data-ajax="false" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">菜品导出</a>
										</li>
										<li >
											<a  href="${pageContext.request.contextPath }/dishImportCheck.action" data-ajax="false" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">录入审核</a>									
										</li>
										<li >
											<a  href="adManagement.action" data-ajax="false" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">广告推送管理</a>									
										</li>
									</ul>
								</div>
							</li>
							<li >
								<a class="icon icon-renyuanguanli" data-ajax="false" href="#" style="font-size:17px">人员管理</a>
								<div class="mp-level">
									<h2 class="icon icon-renyuanguanli" style="padding: 1em 1em 1em 4.5em;font-size:17px;background:rgba(41,193,146,0.95)">人员管理</h2>
									<ul>
										<li><a href="${pageContext.request.contextPath }/findAllMUser.action" data-ajax="false" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">用户管理</a></li>
										<li><a href="${pageContext.request.contextPath }/addMUser.action" data-ajax="false" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">新增用户</a></li>
									</ul>
								</div>
							</li>
							<li >
								<a class="icon icon-gonggongxinxishezhi" href="#" style="font-size:17px">预置信息</a>
								<div class="mp-level">
									<h2 class="icon icon-gonggongxinxishezhi" style="padding: 1em 1em 1em 4.5em;font-size:17px;background:rgba(41,193,146,0.95)">预置信息</h2>
									<ul>
										<li><a data-ajax="false" href="${pageContext.request.contextPath }/canteenTypePreset.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">预置食堂类型</a></li>
		                                <li><a data-ajax="false" href="${pageContext.request.contextPath }/dishTypePreset.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">预置菜品类型</a></li>       
							            <li><a data-ajax="false" href="${pageContext.request.contextPath }/campusPreset.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">预置校区</a></li>
							  		    <li><a data-ajax="false" href="${pageContext.request.contextPath }/canteenPreset.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">预置食堂</a></li>			          		
							  	        <li><a data-ajax="false" href="${pageContext.request.contextPath }/windowPreset.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">预置档口</a></li>	  		 
							  		    <li><a data-ajax="false" href="${pageContext.request.contextPath }/dishPreset.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">预置菜品</a></li>	 
									</ul>
								</div>
							</li>
							<li >
								<a class="icon icon-caozuorizhi" href="#" style="font-size:17px">操作日志</a>
								<div class="mp-level">
									<h2 class="icon icon-caozuorizhi" style="padding: 1em 1em 1em 4.5em;font-size:17px;background:rgba(41,193,146,0.95)">操作日志</h2>
									<ul>
										<li >
											<a data-ajax="false" href="${pageContext.request.contextPath }/loginfo.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">日志查看</a>
										</li>
									</ul>
								</div>
							</li>
							<li >
								<a class="icon icon-pinglunguanli" href="#" style="font-size:17px">评论管理</a>
								<div class="mp-level">
									<h2 class="icon icon-pinglunguanli" style="padding: 1em 1em 1em 4.5em;font-size:17px;background:rgba(41,193,146,0.95)">评论管理</h2>
									<ul>
										<li >
											<a data-ajax="false" href="${pageContext.request.contextPath }/commentSelectWindow.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">评论查看</a>
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
					<button style="position:absolute;left:20px;bottom:10%;border:none"><a class="icon icon-zhuxiao" data-ajax="false" href="${pageContext.request.contextPath }/logout.action"><span style="font-size:15px;color:#000000;">注销</span></a></button>
				</nav>

    



