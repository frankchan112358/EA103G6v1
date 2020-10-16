<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/front-end/template/check.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="democratSvc" scope="page" class="com.democrat.model.DemocratService" />
<%
//init code
%>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/front-end/template/head.jsp" %> 
</head>
<body class="mod-bg-1 mod-nav-link header-function-fixed nav-function-top nav-mobile-push nav-function-fixed mod-panel-icon">
    <script>
        var classHolder = document.getElementsByTagName("BODY")[0];
    </script>
    <div class="page-wrapper">
        <div class="page-inner">
            <%@ include file="/front-end/template/left_aside.jsp" %> 
            <div class="page-content-wrapper">
                <%@ include file="/front-end/template/header.jsp" %> 
                <main id="js-page-content" role="main" class="page-content">
                    <ol class="breadcrumb page-breadcrumb">
                        <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/front-end/index/index.jsp">前台首頁</a></li>
                        <li class="breadcrumb-item">DEMOCRAT</li>
                    </ol>
                    <div class="subheader">
                        <h1 class="subheader-title">
                            <i class='subheader-icon fal fa-democrat'></i> DEMOCRAT
                        </h1>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div id="panel-1" class="panel">
                                <form class="needs-validation" novalidate>
                                    <div class="panel-hdr bg-primary-800 bg-success-gradient ">
                                        <h2 class="text-white">DEMOCRAT總覽</h2>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div class="form-group">
                                                <button id="new" data-toggle="modal" data-target="#editor-democrat" type="button" class="btn btn-primary waves-effect waves-themed float-left">申請</button>
                                                <!-- datatable start -->
                                                <table id="table-democrat" class="table table-bordered table-hover table-striped w-100">
                                                    <thead>
                                                        <tr>
                                                            <th>名稱</th>
                                                            <th>內容</th>
                                                            <th>狀態</th>
                                                            <th>修改</th>
                                                            <th>取消</th>
                                                        </tr>                                                            
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                                <!-- datatable end -->
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>                            
                        </div>
                    </div>
                </main>
                <div class="page-content-overlay" data-action="toggle" data-class="mobile-nav-on"></div>
                <%@ include file="/front-end/template/footer.jsp" %>
            </div>
        </div>
    </div>
    <div class="modal fade" id="editor-democrat" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Modal
                        <small class="m-0 text-muted">描述</small>
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="fal fa-times"></i></span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="form-democrat" class="needs-validation" novalidate>
                        <div class="form-group">
                            ...
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancel">取消</button>
                    <button type="button" class="btn btn-primary" id="save">送出</button>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/front-end/template/quick_menu.jsp" %>
    <%@ include file="/front-end/template/messager.jsp" %>
    <%@ include file="/front-end/template/basic_js.jsp" %>   
    <script>
        'use strict';
        $(document).ready(function(){
            var formLeave =  document.getElementById('form-democrat');

            $('#table-democrat').dataTable({
                responsive: true,
                language:{url:`<%=request.getContextPath()%>/SmartAdmin4/js/datatable/lang/tw.json`}
            });
        });
    </script>
</body>
</html>