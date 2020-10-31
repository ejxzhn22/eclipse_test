<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트</title>
<link rel="stylesheet" href="resources/css/style.css" />
<style>
.pagination{
	margin: 0 auto;
	width:400px;
}
</style>
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
		  <div class="paging">
			  <ul class="pagination">
			   <c:if test="${pageMaker.prev}">
				    <li class="page-item">
				      <%--<a class="page-link" href="listPaging?page=${pageMaker.startPage - 1}">&laquo;</a> --%>
				    	<a href="${pageMaker.startPage - 1}">&laquo;</a>
				    </li>
			    </c:if>
			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    <li class="page-item" >
				      <a class="page-link" href="listPaging?page=${idx}">${idx}</a>
				    </li>
			     </c:forEach>
			    <c:if test="${pageMaker.next&&pageMaker.endPage > 0}">
				    <li class="page-item">
				      <%-- <a class="page-link" href="listPaging?page=${pageMaker.endPage + 1}">&raquo;</a>--%>
				    	<a href="${pageMaker.endPage + 1}">&raquo;</a>
				    </li>
			    </c:if>
			  </ul>
			  <form id="listPageForm">
    			<input type="hidden" name="page" value="${pageMaker.criteria.page}">
    			<input type="hidden" name="perPageNum" value="${pageMaker.criteria.perPageNum}">
			</form>
		</div>
		  
      </section>
    </main>
    <script >
	    $(".pagination li a").on("click", function (event) {
	        event.preventDefault();
	
	        var targetPage = $(this).attr("href");
	        var listPageForm = $("#listPageForm");
	        listPageForm.find("[name='page']").val(targetPage);
	        listPageForm.attr("action", "/listPaging").attr("method", "get");
	        listPageForm.submit();
	    });
    </script>
  </body>
</html>