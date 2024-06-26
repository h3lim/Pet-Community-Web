<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.virtual-box {
    margin-bottom: 20px;
}

</style>
</head>
<body>

<div class="virtual-box"></div>
<div class="container">
       <div class="row">
           <div class="col-md-offset-2 col-md-8">
               <div class="panel">
                   <div class="panel-heading text-white"  align="center" style="background: #F8F8FF;">
                       <h2>게시글 등록</h2>
                   </div>
                   <div class="panel-body">
                       <form action="/doggimain/regist.board" method="post">
                           <div class="form-group">
                               <label for="writer" hidden>작성자</label>
                               <input id="writer" name="bWriter" value="${user.userId}"
                               type="text" class="form-control" placeholder="작성자" readonly>
                           </div>
   
                           <div class="form-group">
                               <label for="title" hidden>글제목</label>
                               <input id="title" name="bTitle" type="text" class="form-control" placeholder="글제목">
                           </div>
   
                           <div class="form-group">
                               <label for="content" hidden>글내용</label>
                               <textarea id="content" name="bContent" class="form-control" placeholder="게시글 내용을 입력하세요." rows="5"></textarea>
                           </div>
                           
                           
                           <div>
                            <button type="submit" class="btn btn-primary form-control" onclick="return confirm('등록하시겠습니까?')">등록</button>
                            <button type="button" class="btn btn-danger form-control" onclick="location.href=">취소</button>
                           </div>
                       </form>
                   </div>
               </div>
           </div>
       </div>
   </div>


</body>
</html>