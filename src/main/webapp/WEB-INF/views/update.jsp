<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정하기</title>
</head>
<body>
    <%@include file="include/header.jsp" %>
    <main class="main">
      <%@include file="include/nav.jsp" %>
      <section class="content">
			<div class="box-header">
				<h3 class="box-title">게시판 수정하기</h3>
			</div>
		
			<form role="form" method="post">
				<div class="box-body">
					<div class="form-group">
						<label>제목</label> <input type="text"
							name='title' class="form-control"  value="${board.title}">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" name="content" rows="3"
							 >${board.content}</textarea>
					</div>
		
					<div class="form-group">
						<label>작성자</label> <input type="text"
							name="id" class="form-control"  
							 value="${board.id}" readonly>
					</div>
					<!-- 수정에 사용할 글번호 -->
					<input type="hidden" name="bno" value="${board.bno}" />
				</div>
		
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">수정완료</button>
				</div>
			</form>
		</section>
    </main>
  </body>
</html>