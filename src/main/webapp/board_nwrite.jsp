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
<body>
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
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col-md-8">
            <div class="panel">
                <div class="panel-heading text-white" align="center" style="background: #F8F8FF;margin-top: 20px;">
            
                    <h2>게시글 등록</h2>
                </div>
                <div class="panel-body">
                    <form action="/doggimain/regist.board" method="post">
                        <div class="form-group">
                            <label for="writer" hidden>작성자</label>
                            <input id="writer" name="bWriter" value="${sessionScope.username}" type="text" class="form-control" placeholder="작성자" readonly>
                        </div>

                        <div class="form-group">
                            <label for="title" hidden>글제목</label>
                            <input id="title" name="bTitle" type="text" class="form-control" placeholder="글제목">
                        </div>

                        <div class="form-group">
                            <label for="content" hidden>글내용</label>
                            <textarea id="content" name="bContent" class="form-control" placeholder="게시글 내용을 입력하세요." rows="5"></textarea>
                        </div>

                        <div class="form-group text-center">
						    <div class="col-6 d-inline-block">
						        <button type="submit" class="btn btn-primary form-control" onclick="this.disabled=true; this.form.submit(); return confirm('등록하시겠습니까?')">등록</button>
						    </div>
						    <div class="col-2"></div>
						    <div class="col-6 d-inline-block">
						        <button type="button" class="btn btn-danger form-control" onclick="location.href='/doggimain/list.board?page=1&cpp=${param.cpp}'">취소</button>
						    </div>
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