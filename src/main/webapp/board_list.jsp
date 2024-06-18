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
	<style>
        .black-bold {
            color: #000; /* 검정색 */
            font-weight: bold; /* 볼드체 */
        }
        
    	.custom-thead {
        background-color: #ea9b9a;
    	}

    </style>
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
        <h2 class="mt-5 mb-4"></h2>

        <div class="row mb-3">
            <div class="col-md-12">
               <!--  <div class="float-right">
                    <input class="btn btn-primary btn-countPerPage" type="button" value="10" onclick="location.href='/doggimain/list.board?page=1&cpp=10'">
                    <input class="btn btn-primary btn-countPerPage" type="button" value="20" onclick="location.href='/doggimain/list.board?page=1&cpp=20'">
                    <input class="btn btn-primary btn-countPerPage" type="button" value="30" onclick="location.href='/doggimain/list.board?page=1&cpp=30'">
                </div> -->
            </div>
        </div>
 		<c:if test="${empty boardList}">
            <p>No articles found.</p>
        </c:if>	
        <table class="table table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
		            <th style="width: 10%;">글 번호</th>
		            <th style="width: 10%;">작성자</th>
		            <th style="width: 30%;">제목</th>
		            <th style="width: 15%;">날짜</th>
		            <th style="width: 10%;">조회수</th>
		        </tr>
            </thead>

            <tbody>
                <c:forEach var="b" items="${boardList}">
                    <tr>
                        <td>${b.boardId}</td>
                        <td>${b.writer}</td>
                      	<td><a href="/doggimain/content.board?bId=${b.boardId}&page=${pc.paging.page}&cpp=${pc.paging.cpp}" class="black-bold">${b.title}</a></td>
                        <td>${b.regDate}</td>
                        <td>${b.hit}</td>
                    </tr>
                </c:forEach>
            </tbody>

            <tfoot>
                <tr>
                    <td colspan="5" align="center">
                        <ul class="pagination justify-content-center">
                            <c:if test="${pc.prev}">
                                <li class="page-item"><a class="page-link" href="/doggimain/list.board?page=${pc.beginPage-1}&cpp=${pc.paging.cpp}">이전</a></li>
                            </c:if>

                            <c:forEach var="pageNum" begin="1" end="5">
                                <li class="page-item">
                                    <a href="/doggimain/list.board?page=${pageNum}&cpp=${pc.paging.cpp}" class="page-link ${pageNum == pc.paging.page ? 'active' : ''}">${pageNum}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${pc.next}">
                                <li class="page-item"><a class="page-link" href="/doggimain/list.board?page=${pc.endPage+1}&cpp=${pc.paging.cpp}">다음</a></li>
                            </c:if>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" align="right">
                        <form action="/doggimain/search.board" class="form-inline">
                            <div class="form-group">
                                <select name="category" class="form-control mr-2">
                                    <option value="title">제목</option>
                                    <option value="writer">작성자</option>
                                    <option value="content">내용</option>
                                </select>
                                <input type="text" name="search" placeholder="검색어 입력" class="form-control mr-2">
                                <input type="submit" value="검색" class="btn btn-primary">
                                <input type="button" value="글 작성" class="btn btn-primary" onclick="location.href='/doggimain/write.board'">
                            </div>
                        </form>
                    </td>
                </tr>
            </tfoot>
        </table>
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
<%@ include file="footer.jsp" %>