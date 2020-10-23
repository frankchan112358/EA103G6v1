<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.banji.model.*"%>

<%
	BanjiVO banjiVO = (BanjiVO) request.getAttribute("banjiVO");
%>

<jsp:useBean id="empSvc" scope="page"
				class="com.emp.model.EmpService" />
<jsp:useBean id="banjiTypeSvc" scope="page"
				class="com.banjitype.model.BanjiTypeService" />
<jsp:useBean id="classroomSvc" scope="page" 
				class="com.classroom.model.ClassroomService"/>
				
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/back-end/template/head.jsp" %> 
</head>
<body class="mod-bg-1 mod-nav-link header-function-fixed nav-function-top nav-mobile-push nav-function-fixed mod-panel-icon">
    <script>
        var classHolder = document.getElementsByTagName("BODY")[0];
    </script>

    <div class="page-wrapper">
        <div class="page-inner">
            <%@ include file="/back-end/template/left_aside.jsp" %> 
            <div class="page-content-wrapper">
                <%@ include file="/back-end/template/header.jsp" %> 
                <main id="js-page-content" role="main" class="page-content">
                    <ol class="breadcrumb page-breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0);">後台首頁</a></li>
                        <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/banji/homeBanji.jsp">養成班管理</a></li>
                          <li class="breadcrumb-item">新增養成班</li>
                    </ol>
                    <div class="subheader">
                        <h1 class="subheader-title">
                            <i class='subheader-icon fal fa-users-class' ></i> 新增養成班
                        </h1>
                    </div>
                     <div class="panel-container show">
                                        <div class="panel-content">
                                     
                                            <form METHOD="post" ACTION="<%=request.getContextPath()%>/banji/banji.do" name="form1">
                                                <div class="form-group">
                                                    <label class="form-label" for="simpleinput">選擇班種:</label>
                                                    <select  class="custom-select form-control"  name="banjiTypeNo">
                                                    <option value="" >請選擇班種</option>
													<c:forEach var="banjiTypeVO" items="${banjiTypeSvc.all}">
															<option value="${banjiTypeVO.banjiTypeNo}"${(banjiVO.banjiTypeNo==banjiTypeVO.banjiTypeNo)? 'selected':'' }>${banjiTypeVO.banjiTypeName}
													</c:forEach>
													</select>
													 <font color=red>${errorMsgs.banjiTypeNo}</font>
                                                </div>
                                               
                                                <div class="form-group">
                                                    <label class="form-label" for="simpleinput">輸入班級:</label>
                                                    <input type="text" id="simpleinput" class="form-control" placeholder="請輸入班級" name="banjiName">
                                                     <font color=red>${errorMsgs.banjiName}</font>
                                                </div>
                                                
                                                <div class="form-group">
												   <label class="form-label" for="example-select">選擇導師:</label>
												<select class="custom-select form-control" name="empNo">
													<option value="">請選擇導師</option>
													<c:forEach var="empVO" items="${empSvc.all}">
													<option value="${empVO.empNo}"${(banjiVO.empNo==empVO.empNo)? 'selected':'' }>${empVO.empName}
													</c:forEach>
												</select>
												<font color=red>${errorMsgs.empNo}</font>
											  </div>
											  
                                                 <div class="form-group">
                                                    <label class="form-label" for="example-date">開訓日:</label>
                                                    <input class="form-control" name="startDay" id="f_date1" onfocus="this.blur()"  >
                                                     <font color=red>${errorMsgs.startDay}</font>
                                                </div>
                                                
                                                 <div class="form-group">
                                                    <label class="form-label" for="example-date">結訓日:</label>
                                                    <input class="form-control" name="endDay" id="f_date2" onfocus="this.blur()" >
                                               	<font color=red>${errorMsgs.endDay}</font>
                                                </div>
                                                
                                                <div class="form-group">
                                                    <label class="form-label" for="simpleinput">上課時數:</label>
                                                    <input type="text" id="simpleinput" class="form-control" placeholder="請輸入時數" name="classHours">
                                               <font color=red>${errorMsgs.classHours}</font>
                                                </div>
                                                
                                                <div class="form-group">
                                                    <label class="form-label" for="simpleinput">學員人數:</label>
                                                    <input type="text" id="simpleinput" class="form-control" placeholder="請輸入學員人數" name="numberOfStudent">
                                                <font color=red>${errorMsgs.numberOfStudent}</font>
                                                
                                                </div>
                                                  <div class="form-group">
                                                    <label class="form-label" for="simpleinput">教室:</label>
                                                    <select class="custom-select form-control"  name="classroomNo">
                                                   <option value="" >請選擇教室</option>
                                                    <c:forEach var="classroomVO" items="${classroomSvc.all}">
													<option value="${classroomVO.classroomNo}"${(banjiVO.classroomNo==classroomVO.classroomNo)? 'selected':'' }>${classroomVO.classroomName}
													</c:forEach>
													</select>
                                                <font color=red>${errorMsgs.classroomNo}</font>
                                                </div>
                                                
                                                <div class="form-group">
                                                    <label class="form-label" for="example-textarea">班級內容:</label>
                                                    <textarea name="banjiContent" class="form-control" id="example-textarea" rows="5"placeholder="請輸入內容"></textarea>
                                               <font color=red>${errorMsgs.banjiContent}</font>
                                                </div>
                                               
                                                <div class="form-group">
                                                    <label class="form-label" for="example-select">狀態:</label>
                                               <select class="custom-select form-control" name="status">
													<option value="1" ${(banjiVO.status==1)?'selected':'' }>開課</option>
													<option value="0" ${(banjiVO.status==0)?'selected':'' }>結訓</option>
													<option value="2" ${(banjiVO.status==2)?'selected':'' }>延期</option>
													<option value="" ${(banjiVO.status==3)?'selected':'' }>未開課</option>
												</select>           
                                                <font color=red>${errorMsgs.status}</font>
                                                </div>
                                          
                                               <div class="form-group" id="add" >
												<input type="hidden" name="action" value="insert">
												<button type="submit" class="btn btn-primary justify-content-center" >送出</button>
											</div>
                                            </form>
                                        </div>
                                    </div>
                </main>
                <div class="page-content-overlay" data-action="toggle" data-class="mobile-nav-on"></div>
                <%@ include file="/back-end/template/footer.jsp" %>
            </div>
        </div>
    </div>
    <%@ include file="/back-end/template/quick_menu.jsp" %>
    <%@ include file="/back-end/template/messager.jsp" %>
    <%@ include file="/back-end/template/basic_js.jsp" %>
    
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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/back-end/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/back-end/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/back-end/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
#add{
text-align:center ;
}
</style>

<script>
$(function(){
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
	    	scrollInput : false,  //滾輪
		   value:'<%=startDay%>',
			   onShow:function(){
	               this.setOptions({
	                minDate: new Date()
	               })
	              },
	              timepicker:false,
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	//startDate:	            '2017/07/10',  // 起始日
	 //minDate:               '-1970-01-01', // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});

        $('#f_date2').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       scrollInput : false,  //滾輪
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=endDay%>',
		   onShow : function() {
               this.setOptions({
                   minDate : $('#f_date1').val()
               })
           },
           timepicker : false
       });
   });
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	//startDate:	            '2017/07/10',  // 起始日
	//minDate:               '-1970-01-01'  // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後

</script>
    
</body>
</html>