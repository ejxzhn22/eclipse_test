<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
	<link rel="stylesheet" href="resources/css/style.css" />
	<link rel="stylesheet" href="resources/bootstrap-3.3.2/css/bootstrap.css">
	<link rel="stylesheet"  href="resources/bootstrap-3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
    <%@include file="include/header.jsp" %>
    <main class="main">
      <%@include file="include/nav.jsp" %>
      <section class="section">
      	<ol class="breadcrumb">
  			<li class="breadcrumb-item">게시판글쓰기</li>
		</ol>
      	
      	<form role="form" method="post">
      	
      	<div class="form-group">
      		<label for="exampleInputEmail1">제목</label>
      		<input type="text" name="title" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="제목을 입력하세요">
      	</div>
      	<div class="form-group">
      		<label for="exampleTextarea">내용</label>
      		<textarea name="content" class="form-control" id="exampleTextarea" rows="10" placeholder="내용을 입력하세요"></textarea>
    	</div>
    	<div class="form-group">
      		<label for="exampleInputEmail1">작성자</label>
      		<input type="text" name="id"  value="${user.id}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" readonly>
      	</div>
      	<div>
      		<button type="submit" class="btn btn-outline-primary">작성완료!</button>
      	</div>
      	</form>
      </section>
    </main>
  </body>
</html>