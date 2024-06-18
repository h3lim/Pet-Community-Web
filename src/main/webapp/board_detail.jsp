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
<style>
    
    .title-align {
    text-align: left;
}
</style>
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
        <div class="row">
            <div class="col-md-10 offset-md-1">
                <div class="panel">
                    <div class="panel-heading text-dark p-3">
					    <div class="row align-items-center">
					        <div class="col-md-8">
					            <h2 class="title-align mb-0">"${content.title}"</h2>
					        </div>
					        <div class="col-md-4">
					            <div class="text-md-right mt-2 mt-md-0">
					                <div class="font-weight-bold">작성자: ${content.writer}</div>
					                <div>조회수: ${content.hit}</div>
					            </div>
					        </div>
					    </div>
					</div>

                     <div class="panel-body p-3">
                    <div class="article-content mb-4">
                        <div class="list-group-item">
						            <div class="d-flex w-100 justify-content-between align-items-center">
                            <p>${content.content}</p>
                        </div>
                    </div>
                </div>
                	<hr>
					    <h4 class="mb-2">댓글</h4>
						<div class="list-group">
						    <c:forEach var="reply" items="${replies}">
						        <div class="list-group-item">
						            <div class="d-flex w-100 justify-content-between align-items-center">
						               <h6 class="mb-0" style="font-size: 0.8em;">작성자: ${reply.regid}
					                    <!-- 삭제 버튼을 작성자 정보와 같은 줄에 넣기 -->
					                    <c:choose>
								                <c:when test="${sessionScope.username == reply.regid}">
					                   	 <a href="/doggimain/DelReplyServlet?rseq=${reply.rseq}&bId=${content.boardId}" class="btn btn-sm btn-danger ml-2" style="padding: 0.7rem 0.7rem; font-size: 0.5rem;">삭제</a>
								                </c:when>
								                <c:otherwise>
								                    
								                </c:otherwise>
								            </c:choose>
					                	</h6>
					                	 <small class="text-muted">${reply.regdate}</small>
						            </div>
						            <p class="mb-0 mt-2">${reply.reply}</p>
						        </div>
						    </c:forEach>
						</div>
                        <hr>
							<c:if test="${not empty sessionScope.username}">
								    <form action="/doggimain/WriteReplyServlet" method="post">
								        <input type="hidden" name="boardId" value="${content.boardId}"><!-- 게시글 번호를 전달 -->
								        <textarea name="reply" class="form-control mb-2" placeholder="댓글을 입력하세요" required></textarea>
								        <button type="submit" class="btn btn-primary">댓글 등록</button>
								    </form>
								</c:if>
								
								<div class="row">
								    <div class="col-md-5 offset-md-1">
								        <p class="last-update" style="margin-left: -70px;">
								            작성일<fmt:parseDate value="${content.regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
								            <fmt:formatDate value="${parsedDateTime}" pattern="yy-MM-dd HH:mm" />
								        </p>
								    </div>
								    <div class="col-md-5 text-right">
								        <div class="btn-group" role="group">
								            <a class="btn btn-primary custom-rounded-right" href="/doggimain/list.board?page=${param.page}&cpp=${param.cpp}">목록 보기</a>
								            <c:choose>
								                <c:when test="${sessionScope.username == content.writer}">
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