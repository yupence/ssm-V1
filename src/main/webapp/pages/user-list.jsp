<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>数据 - AdminLTE2定制版</title>
<meta name="description" content="AdminLTE2定制版">
<meta name="keywords" content="AdminLTE2定制版">

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/morris/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/select2/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">

		<!-- 页面头部 -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- 页面头部 /-->

		<!-- 导航侧栏 -->
		<jsp:include page="aside.jsp"></jsp:include>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<div class="content-wrapper">

			<!-- 内容头部 -->
			<section class="content-header">
			<h1>
				用户管理 <small>全部用户</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="#">用户管理</a></li>

				<li class="active">全部用户</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

				<!-- 正文区域 -->
				<section class="content"> <!-- .box-body -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">列表</h3>
					</div>

					<div class="box-body">

						<!-- 数据表格 -->
						<div class="table-box">

							<!--工具栏-->
							<div class="pull-left">
								<div class="form-group form-inline">
									<div class="btn-group">
										<button type="button" class="btn btn-default" title="新建"
												onclick="location.href='${pageContext.request.contextPath}/pages/user-add.jsp'" >
											<i class="fa fa-file-o"></i> 新建
										</button>
										
										<button type="button" class="btn btn-default" title="删除" onclick="deleteAll()">
											<i class="fa fa-refresh"></i> 删除
										</button>
									</div>
								</div>
							</div>
							<form action="${pageContext.request.contextPath}/user/findAll.do?type=1"
								  method="post">
								<div class="col-md-4 data1">
									<input type="text" class="form-control" name="username"
										   placeholder="username" value="">
								</div>
								<button type="submit" class="btn bg-maroon">搜索</button>
							</form>
							<!--工具栏/-->

							<!--数据列表-->
							<table id="dataList"
								class="table table-bordered table-striped table-hover dataTable">
								<thead>
									<tr>
										<th class="" style="padding-right: 0px"><input
											id="selall" type="checkbox" class="icheckbox_square-blue">
										</th>
										<th class="sorting_asc">ID</th>
										<th class="sorting_desc">用户名</th>
										<th class="sorting_asc sorting_asc_disabled">密码</th>
										<th class="text-center">操作</th>
									</tr>
								</thead>
								<tbody>
								   <c:forEach items="${pageInfo.list}" var = "user">
										<tr>
											<td><input id="ids" name="ids" type="checkbox" value="${user.id}"></td>
											<td>${user.id}</td>
											<td>${user.username}</td>
											<td>${user.password}</td>
											<td class="text-center">
												<a href="/user/toUpdate.do?id=${user.id}" class="btn bg-olive btn-xs">更新</a>
												<a href="/user/deleteByID.do?id=${user.id}" class="btn bg-olive btn-xs">删除</a>
												<a href="/user/toAddRole.do?id=${user.id}" class="btn bg-olive btn-xs">添加角色</a>
											</td>
										</tr>
								   </c:forEach>
									
								</tbody>
								<!--
                            <tfoot>
                            <tr>
                            <th>Rendering engine</th>
                            <th>Browser</th>
                            <th>Platform(s)</th>
                            <th>Engine version</th>
                            <th>CSS grade</th>
                            </tr>
                            </tfoot>-->
							</table>
							<!--数据列表/-->

						</div>
						<!-- 数据表格 /-->

					</div>
					<!-- /.box-body -->
						<div class="box-tools pull-right">
							<ul class="pagination">
								<li><a href="/user/findAll.do" aria-label="Previous">首页</a></li>
								<li><a href="/user/findAll.do?currentPage=${pageInfo.currentPage-1}">上一页</a></li>
								<c:forEach begin="1" end="${pageInfo.totalPage}" var="pageNum">
									<li><a href="/user/findAll.do?currentPage=${pageNum}">${pageNum}</a></li>
								</c:forEach>
								<li><a href="/user/findAll.do?currentPage=${pageInfo.currentPage+1}">下一页</a></li>
								<li><a href="/user/findAll.do?currentPage=${pageInfo.totalPage}" aria-label="Next">尾页</a></li>
							</ul>
						</div>

					</div>
					<!-- /.box-footer-->



				</section>
				<!-- 正文区域 /-->

			</div>
			<!-- @@close -->
			<!-- 内容区域 /-->

			<!-- 底部导航 -->
			<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 1.0.8
			</div>
			<strong>Copyright &copy; 2014-2017 <a
				href="http://www.chinasofti.com">研究院研发部</a>.
			</strong> All rights reserved. </footer>
			<!-- 底部导航 /-->

		</div>

		<script src="../WEB-INF/plugins/jQuery/jquery-2.2.3.min.js"></script>
		<script src="../WEB-INF/plugins/jQueryUI/jquery-ui.min.js"></script>
		<script>
			$.widget.bridge('uibutton', $.ui.button);
		</script>
		<script src="../WEB-INF/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script src="../WEB-INF/plugins/raphael/raphael-min.js"></script>
		<script src="../WEB-INF/plugins/morris/morris.min.js"></script>
		<script src="../WEB-INF/plugins/sparkline/jquery.sparkline.min.js"></script>
		<script src="../WEB-INF/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
		<script src="../WEB-INF/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
		<script src="../WEB-INF/plugins/knob/jquery.knob.js"></script>
		<script src="../WEB-INF/plugins/daterangepicker/moment.min.js"></script>
		<script src="../WEB-INF/plugins/daterangepicker/daterangepicker.js"></script>
		<script src="../WEB-INF/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
		<script src="../WEB-INF/plugins/datepicker/bootstrap-datepicker.js"></script>
		<script
			src="../WEB-INF/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
		<script
			src="../WEB-INF/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
		<script src="../WEB-INF/plugins/slimScroll/jquery.slimscroll.min.js"></script>
		<script src="../WEB-INF/plugins/fastclick/fastclick.js"></script>
		<script src="../WEB-INF/plugins/iCheck/icheck.min.js"></script>
		<script src="../WEB-INF/plugins/adminLTE/js/app.min.js"></script>
		<script src="../WEB-INF/plugins/treeTable/jquery.treetable.js"></script>
		<script src="../WEB-INF/plugins/select2/select2.full.min.js"></script>
		<script src="../WEB-INF/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
		<script
			src="../WEB-INF/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
		<script src="../WEB-INF/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
		<script
			src="../WEB-INF/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
		<script src="../WEB-INF/plugins/bootstrap-markdown/js/markdown.js"></script>
		<script src="../WEB-INF/plugins/bootstrap-markdown/js/to-markdown.js"></script>
		<script src="../WEB-INF/plugins/ckeditor/ckeditor.js"></script>
		<script src="../WEB-INF/plugins/input-mask/jquery.inputmask.js"></script>
		<script
			src="../WEB-INF/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
		<script src="../WEB-INF/plugins/input-mask/jquery.inputmask.extensions.js"></script>
		<script src="../WEB-INF/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="../WEB-INF/plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script src="../WEB-INF/plugins/chartjs/Chart.min.js"></script>
		<script src="../WEB-INF/plugins/flot/jquery.flot.min.js"></script>
		<script src="../WEB-INF/plugins/flot/jquery.flot.resize.min.js"></script>
		<script src="../WEB-INF/plugins/flot/jquery.flot.pie.min.js"></script>
		<script src="../WEB-INF/plugins/flot/jquery.flot.categories.min.js"></script>
		<script src="../WEB-INF/plugins/ionslider/ion.rangeSlider.min.js"></script>
		<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
		<script>
			$(document).ready(function() {
				// 选择框
				$(".select2").select2();

				// WYSIHTML5编辑器
				$(".textarea").wysihtml5({
					locale : 'zh-CN'
				});
			});

			// 设置激活菜单
			function setSidebarActive(tagUri) {
				var liObj = $("#" + tagUri);
				if (liObj.length > 0) {
					liObj.parent().parent().addClass("active");
					liObj.addClass("active");
				}
			}

			$(document)
					.ready(
							function() {

								// 激活导航位置
								setSidebarActive("admin-datalist");

								// 列表按钮 
								$("#dataList td input[type='checkbox']")
										.iCheck(
												{
													checkboxClass : 'icheckbox_square-blue',
													increaseArea : '20%'
												});
								// 全选操作 
								$("#selall")
										.click(
												function() {
													var clicks = $(this).is(
															':checked');
													if (!clicks) {
														$(
																"#dataList td input[type='checkbox']")
																.iCheck(
																		"uncheck");
													} else {
														$(
																"#dataList td input[type='checkbox']")
																.iCheck("check");
													}
													$(this).data("clicks",
															!clicks);
												});
							});

			function deleteAll() {
				var checkedNum=$("input[name='ids']:checked").length;
				alert(checkedNum);
				if(checkedNum==0){
					alert("请至少选择一个进行删除！！！");
					return;
				}
				if(confirm("确认要删除这些用户吗？")){
					var userList=new Array();
					$("input[name='ids']:checked").each(
							function () {
								userList.push($(this).val())
							}
					);
					alert(userList);
					$.ajax({
						type:"post",
						url: "${pageContext.request.contextPath}/user/deleteAll.do",
						data:{userList:userList.toString()},
						success:function () {
							alert("删除成功");
							location.reload();

						},
						error:function () {
							alert("删除失败");
						}
					});
				}





			}


		</script>
</body>

</html>