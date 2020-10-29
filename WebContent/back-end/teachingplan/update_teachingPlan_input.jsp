<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/back-end/template/check.jsp"%>
<%@ page import="com.teachingplan.model.*"%>

<%
	TeachingPlanVO teachingPlanVO = (TeachingPlanVO) request.getAttribute("teachingPlanVO");
%>



<!DOCTYPE html>
<html>
<head>
<%@ include file="/back-end/template/head.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />

<style>


</style>
</head>

<body class="mod-bg-1 mod-nav-link header-function-fixed nav-function-top nav-mobile-push nav-function-fixed mod-panel-icon">
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
						<li class="breadcrumb-item">
							<a href="<%=request.getContextPath()%>/back-end/index/index.jsp">後台首頁</a>
						</li>
						<li class="breadcrumb-item">
							<a href="<%=request.getContextPath()%>/back-end/course/listAllCourse.jsp">課程總覽</a>
						</li>
						<li class="breadcrumb-item">
							<a href="<%=request.getContextPath()%>/back-end/teachingplan/listAllTeachingPlan.jsp">教學計劃管理</a>
						</li>
						<li class="breadcrumb-item">教學計劃修改</li>
					</ol>
					<div class="subheader">
						<h1 class="subheader-title">
							<i class='subheader-icon fal fa-comment-alt-edit mr-1'></i>
							教學計劃修改
						</h1>
					</div>
					<div class="row align-items-center justify-content-center">
						<div class="col-10">
							<div id="panel-2" class="panel">
								<div class="panel-hdr bg-primary-800 bg-gradient-info">
									<h2>教學計劃修改</h2>
								</div>
								<div class="panel-container show">
									<div class="panel-content">

										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/teachingPlan/teachingPlan.do" name="form1" class="was-validated">

										
											<div class="form-group">
												<label class="form-label">週次<span class="text-danger">*</span></label>
												<input class="form-control" type="number" name="week" min="0" value="${teachingPlanVO.week}" required placeholder="週次">
												<font color=red>${errorMsgs.week}</font>
												<div class="invalid-feedback">請填寫週次.</div>
											</div>

											<div class="form-group">
												<label class="form-label">堂數<span class="text-danger">*</span></label>
												<input class="form-control" type="number" name="lesson" min="0" value="${teachingPlanVO.lesson}" required placeholder="堂數">
												<font color=red>${errorMsgs.lesson}</font>
												<div class="invalid-feedback">請填寫堂數.</div>
											</div>
											
											<div class="form-group">
												<label class="form-label">教學內容</label>
												<textarea class="form-control" name="planContent" maxlength="200" rows="5" placeholder="教學內容，字數最多200字">${teachingPlanVO.planContent}</textarea>
											</div>
											

											<div class="form-row align-items-center justify-content-center">
												<button type="submit" class="btn btn-primary justify-content-center">
													<span>送出</span>
												</button>
												<input type="hidden" name="action" value="update">
												<input type="hidden" name="teachingPlanNo" value="${teachingPlanVO.teachingPlanNo}">
											</div>
										</FORM>
									</div>
								</div>
							</div>
						</div>
					</div>
				</main>
			</div>
		</div>
	</div>

	<%@ include file="/back-end/template/footer.jsp"%>

	<%@ include file="/back-end/template/quick_menu.jsp"%>
	<%@ include file="/back-end/template/messager.jsp"%>
	<%@ include file="/back-end/template/basic_js.jsp"%>




	<div class="page-content-overlay" data-action="toggle" data-class="mobile-nav-on"></div>

	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

    
 
	<script>
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(function() {
			'use strict';
			window.addEventListener('load',
					function() {
						// Fetch all the forms we want to apply custom Bootstrap validation styles to
						var forms = document
								.getElementsByClassName('needs-validation');
						// Loop over them and prevent submission
						var validation = Array.prototype.filter.call(forms,
								function(form) {
									form.addEventListener('submit', function(
											event) {
										if (form.checkValidity() === false) {
											event.preventDefault();
											event.stopPropagation();
										}
										form.classList.add('was-validated');
									}, false);
								});
					}, false);
		})();
	</script>
</body>
</html>