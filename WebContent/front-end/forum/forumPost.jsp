<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/front-end/template/check.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
    <%@ include file="/front-end/template/head.jsp" %>
    <style>
        .img-head {
            width: 6.125rem;
            height: 6.125rem;
        }
    </style>
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
                        <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/forum/forum.do">班級討論區</a></li>
                        <li class="breadcrumb-item"><a id="gotoForumTopic" forumTopicNo="${forumPostVO.forumTopicVO.forumTopicNo}" href="javascript:void(0)">${forumPostVO.forumTopicVO.forumTopicName}</a></li>
                        <li class="breadcrumb-item">${forumPostVO.title}</li>
                    </ol>
                    <div class="subheader">
                        <h1 class="subheader-title">
                            <i class='subheader-icon fal fa-comments-alt'></i>
                            ${forumPostVO.title}
                        </h1>
                    </div>
                    <div class="row align-items-center justify-content-center">
                        <div class="col-xl-9 col-lg-10">
                            <div class="card mb-g border shadow-0">
                                <div class="card-header p-0">
                                    <div class="p-3 d-flex flex-row">
                                        <div class="d-block flex-shrink-0">
                                            <img src="<%=request.getContextPath() %>/user.do?action=getPhoto&userNo=${forumPostVO.studentVO.userNo}" class="img-head img-fluid img-thumbnail" alt="">
                                        </div>
                                        <div class="d-block ml-2">
                                            <span class="h1 font-weight-bold text-uppercase d-block m-0"><a href="javascript:void(0);">${forumPostVO.title}</a></span>
                                            <a href="javascript:void(0);" class="fs-sm text-info h6 fw-500 mb-0 d-block">${forumPostVO.studentVO.studentName}</a>
                                            <span class="text-sm text-muted font-italic"><label class="mr-2">發文時間</label><i class="fal fa-clock mr-1"></i>
                                                <fmt:formatDate value="${forumPostVO.createTime}" pattern="yyyy-MM-dd HH:mm" />
                                            </span>
                                            <div>
                                                <a href="javascript:void(0);" class="d-inline-flex align-items-center text-dark ml-auto align-self-start">
                                                    <span>${forumPostVO.forumPostViews}</span><i class="fas fa-eye ml-1 text-danger"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body ">
                                    ${forumPostVO.content}
                                </div>
                                <div class="card-footer">
                                    <div class="d-flex align-items-center">
                                        <span class="text-sm text-muted font-italic"><label class="mr-2">更新時間</label><i class="fal fa-clock mr-1"></i>
                                            <fmt:formatDate value="${forumPostVO.updateTime}" pattern="yyyy-MM-dd HH:mm" />
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <c:forEach var="forumCommentVO" items="${forumCommentList}">
                                <div class="card mb-g border shadow-0">
                                    <div class="card-header p-0">
                                        <div class="p-3 d-flex flex-row">
                                            <div class="d-block flex-shrink-0">
                                                <img src="<%=request.getContextPath() %>/user.do?action=getPhoto&userNo=${forumCommentVO.studentVO.userNo}" class="img-head img-fluid img-thumbnail" alt="">
                                            </div>
                                            <div class="d-block ml-2">
                                                <span class="h1 font-weight-bold text-uppercase d-block m-0">回覆 : ${forumPostVO.title}</span>
                                                <a href="javascript:void(0);" class="fs-sm text-info h6 fw-500 mb-0 d-block">${forumCommentVO.studentVO.studentName}</a>
                                                <span class="text-sm text-muted font-italic"><label class="mr-2">回覆時間</label><i class="fal fa-clock mr-1"></i>
                                                    <fmt:formatDate value="${forumCommentVO.createTime}" pattern="yyyy-MM-dd HH:mm" />
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body ">
                                        ${forumCommentVO.content}
                                    </div>
                                    <div class="card-footer">
                                        <div class="d-flex align-items-center">
                                            <span class="text-sm text-muted font-italic"><label class="mr-2">更新時間</label><i class="fal fa-clock mr-1"></i>
                                                <fmt:formatDate value="${forumCommentVO.updateTime}" pattern="yyyy-MM-dd HH:mm" />
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <ul class="pagination mt-3">
                                <li class="page-item disabled">
                                    <a class="page-link" href="javascript:void(0)" aria-label="Previous">
                                        <span aria-hidden="true"><i class="fal fa-chevron-left"></i></span>
                                    </a>
                                </li>
                                <li class="page-item active" aria-current="page">
                                    <span class="page-link">
                                        1
                                        <span class="sr-only">(current)</span>
                                    </span>
                                </li>
                                <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                                <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:void(0)" aria-label="Next">
                                        <span aria-hidden="true"><i class="fal fa-chevron-right"></i></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </main>
                <div class="page-content-overlay" data-action="toggle" data-class="mobile-nav-on"></div>
                <%@ include file="/front-end/template/footer.jsp" %>
            </div>
        </div>
    </div>
    <%@ include file="/front-end/template/quick_menu.jsp" %>
    <%@ include file="/front-end/template/messager.jsp" %>
    <%@ include file="/front-end/template/basic_js.jsp" %>
    <script>
        'use strict';

        $(document).ready(function () {
            $('#gotoForumTopic').click(function (e) {
                let _this = $(this);
                let forumTopicNo = _this.attr('forumTopicNo');
                let myForm = createMyFrom('<%=request.getContextPath()%>/forum/forum.do');
                document.body.appendChild(myForm);
                myForm.append(createFormInput('hidden', 'action', 'forumTopicHomePage'));
                myForm.append(createFormInput('hidden', 'forumTopicNo', forumTopicNo));
                myForm.submit();
            });

            function createMyFrom(url) {
                let myForm = document.createElement('form');
                myForm.action = url;
                myForm.method = 'POST';
                return myForm;
            }

            function createFormInput(type, name, value) {
                let formInput = document.createElement('input');
                formInput.type = type;
                formInput.name = name;
                formInput.value = value;
                return formInput;
            }
        });
    </script>
</body>

</html>