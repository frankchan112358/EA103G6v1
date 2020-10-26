<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.banji.model.*"%>

<%
	BanjiVO banjiVO = (BanjiVO) request.getAttribute("banjiVO");
%>

<jsp:useBean id="banjiTypeSvc" scope="page"
	class="com.banjitype.model.BanjiTypeService" />

<!DOCTYPE html>
<html>
<head>
<%@ include file="/back-end/template/head.jsp"%>
<style>
#add {
	text-align: center;
}
</style>
</head>
<body
	class="mod-bg-1 mod-nav-link header-function-fixed nav-function-top nav-mobile-push nav-function-fixed mod-panel-icon">
	<script>
		var classHolder = document.getElementsByTagName("BODY")[0];
	</script>

	<div class="page-wrapper">
		<div class="page-inner">
			<%@ include file="/back-end/template/left_aside.jsp"%>
			<div class="page-content-wrapper">
				<%@ include file="/back-end/template/header.jsp"%>
				<main id="js-page-content" role="main" class="page-content">
					<ol class="breadcrumb page-breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0);">後台首頁</a></li>
						<li class="breadcrumb-item"><a
							href="<%=request.getContextPath()%>/back-end/banji/homeBanji.jsp">班種管理</a></li>
						<li class="breadcrumb-item">新增班級種類</li>
					</ol>
					<div class="subheader">
						<h1 class="subheader-title">
							<i class='subheader-icon fal fa-users-class'></i> 新增班種
						</h1>
					</div>
					<div class="panel-container show">
						<div class="panel-content">

							<form METHOD="post"
								ACTION="<%=request.getContextPath()%>/banjiType/banjiType.do"
								name="form1">
								<div class="form-group">
									<label class="form-label" for="simpleinput">輸入班種:</label> <input
										type="text" id="simpleinput" class="form-control"
										placeholder="請輸入班級種類" name="banjiTypeName"> <font
										color=red>${errorMsgs.banjiTypeName}</font>
								</div>

								<div class="form-group">
									<label class="form-label" for="simpleinput">上課時數:</label> <input
										type="text" id="simpleinput" class="form-control"
										placeholder="請輸入時數" name="classHours"> <font color=red>${errorMsgs.classHours}</font>
								</div>

								<div class="form-group">
									<label class="form-label" for="example-textarea">班級種類介紹:</label>
									<textarea name="banjiTypeContent" class="form-control"
										id="example-textarea" rows="5" placeholder="請輸入內容"></textarea>
									<font color=red>${errorMsgs.banjiTypeContent}</font>
								</div>

								<div class="form-group">
									<label class="form-label" for="example-select">狀態:</label> <select
										class="custom-select form-control" name="banjiTypeEnable">
										<option value="1" ${(banjiVO.status==1)?'selected':'' }>上架</option>
									</select> <font color=red>${errorMsgs.banjiTypeEnable}</font>
								</div>

								<div class="form-group" id="add">
									<input type="hidden" name="action" value="insert">
									<button type="submit"class="btn btn-primary justify-content-center">送出</button>
								</div>
							</form>
						</div>
					</div>
				</main>
				<div class="page-content-overlay" data-action="toggle"
					data-class="mobile-nav-on"></div>
				<%@ include file="/back-end/template/footer.jsp"%>
			</div>
		</div>
	</div>
	<%@ include file="/back-end/template/quick_menu.jsp"%>
	<%@ include file="/back-end/template/messager.jsp"%>
	<%@ include file="/back-end/template/basic_js.jsp"%>

	<%
		java.sql.Date startDay = null;
		try {
			startDay = banjiVO.getStartDay();
		} catch (Exception e) {
			startDay = new java.sql.Date(System.currentTimeMillis());
		}
	%>

	<%
		java.sql.Date endDay = null;
		try {
			endDay = banjiVO.getEndDay();
		} catch (Exception e) {
			endDay = new java.sql.Date(System.currentTimeMillis());
		}
	%>




</body>
</html>