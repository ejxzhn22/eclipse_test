<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style.css" />
</head>
<body>
<nav class="nav">
      
      <ul class="list-group">
  <li class="list-group-item d-flex justify-content-between align-items-center">
   <a href="${contextPath}/register">게시판 글쓰기</a>
  </li>
  <li class="list-group-item d-flex justify-content-between align-items-center">
    <a href="${contextPath}/listPaging">게시판 목록보기</a>
  </li>
  <li class="list-group-item d-flex justify-content-between align-items-center">
    	메롱
  </li>
</ul>
 </nav>
</body>
</html>