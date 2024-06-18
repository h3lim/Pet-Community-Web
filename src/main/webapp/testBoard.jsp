<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
    <div class="slider-area2 slider-height2 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center pt-50">
                            <h2>실시간 반려견 뉴스</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading" style="background: #F8F8FF;">
                <div class="row">
                    <div class="col-md-6">
                        <h2>${content.title}</h2>
                    </div>
                    <div class="col-md-3 col-md-offset-3">
                        <div>작성자: ${content.writer}</div>
                        <div>조회수: ${content.hit}</div>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <div>${content.content}</div>
                <hr>
                <div class="row">
                    <div class="col-md-5">
                        <fmt:parseDate value="${content.regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" />
                        <fmt:formatDate value="${parsedDateTime}" pattern="yy-MM-dd HH:mm" />
                    </div>
                    <div class="col-md-5 col-md-offset-2">
                        <a class="btn btn-info" href="/doggimain/list.board?page=${param.page}&cpp=${param.cpp}">목록 보기</a>
                        <c:choose>
                            <c:when test="${user.userId == content.writer}">
                                <a class="btn btn-primary" href="/doggimain/modify.board?bId=${content.boardId}">수정하기</a>
                                <a class="btn btn-danger" href="/doggimain/delete.board?bId=${content.boardId}" onclick="return confirm('정말 삭제하시겠습니까?')">삭제하기</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-primary" href="/doggimain/write.board">새 글 쓰기</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
   <!-- JS here -->
    
    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="./assets/js/popper.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="./assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="./assets/js/owl.carousel.min.js"></script>
    <script src="./assets/js/slick.min.js"></script>
    <!-- One Page, Animated-HeadLin -->
    <script src="./assets/js/wow.min.js"></script>
    <script src="./assets/js/animated.headline.js"></script>
    <script src="./assets/js/jquery.magnific-popup.js"></script>

    <!-- Nice-select, sticky -->
    <script src="./assets/js/jquery.nice-select.min.js"></script>
    <script src="./assets/js/jquery.sticky.js"></script>
    
    <!-- contact js -->
    <script src="./assets/js/contact.js"></script>
    <script src="./assets/js/jquery.form.js"></script>
    <script src="./assets/js/jquery.validate.min.js"></script>
    <script src="./assets/js/mail-script.js"></script>
    <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="./assets/js/plugins.js"></script>
    <script src="./assets/js/main.js"></script>
</body>
</html>