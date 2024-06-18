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
<title>Insert title here</title>
</head>
<body>
 <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="assets/img/logo/logo.jpeg" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->
     <div class="slider-area2 slider-height2 d-flex align-items-center">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="hero-cap text-center pt-50">
                        <h2>자유게시판</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="panel">
                <div class="panel-heading text-white" align="center" style="background: #F8F8FF;">
                    <h2>게시글 수정 페이지</h2>
                </div>
                <div class="panel-body">
                    <form action="/doggimain/update.board" method="post">
                        <input type="hidden" name="bId" value="${article.boardId}">
                        <div class="form-group">
                            <label for="writer" class="sr-only">작성자</label>
                            <input id="writer" name="bWriter" value="${article.writer}" type="text" class="form-control" readonly>
                        </div>
                        <div class="form-group">
                            <label for="title" class="sr-only">글제목</label>
                            <input id="title" name="bTitle" type="text" class="form-control" value="${article.title}">
                        </div>
                        <div class="form-group">
                            <label for="content" class="sr-only">글내용</label>
                            <textarea id="content" name="bContent" class="form-control" rows="5">${article.content}</textarea>
                        </div>
                        <div class="form-group text-right">
                             <button type="submit" class="btn btn-primary btn-sm mr-2" onclick="return confirm('수정하시겠습니까?')">수정</button>
							 <button type="button" class="btn btn-danger btn-sm" onclick="location.href='/doggimain/list.board?page=1&cpp=${param.cpp}'">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
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
<%@ include file="footer.jsp" %>