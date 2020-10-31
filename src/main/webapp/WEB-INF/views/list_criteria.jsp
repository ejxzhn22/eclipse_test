<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트</title>
<link rel="stylesheet" href="resources/css/style.css" />

</head>
<body>
    <%@include file="include/header.jsp" %>
    <main class="main">
      <%@include file="include/nav.jsp" %>
      <section class="table-responsive">
      	<table class="table">
		  <tr>
		  	<td>글번호</td>
		  	<td>제목</td>
		  	<td>작성일</td>
		  	<td>작성자</td>
		  	<td>조회수</td>
		  </tr>
		  <c:forEach var="board" items="${articles}">
		  	<tr>
		  		<td>${board.bno}</td>
		  		<td><a href="detail?bno=${board.bno}">${board.title}</a></td>
		  		<td>${board.regdate}</td>
		  		<td>${board.id}</td>
		  		<td><span class="badge">${board.readcnt}</span></td>
		  	</tr>
		  </c:forEach>
		  </table>
      </section>
    </main>
  </body>
</html>