<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글창</title>
</head>
<body>
<section>
		<form>
			<div class="form-reply">
					<c:forEach var="replylist1" items="${replylist}">
						<div class="card border-primary mb-3" style="max-width: 20rem;">
							<div class="card-header">작성자 : ${replylist1.rewriter}</div>
							<div class="card-header">작성일자 : ${replylist1.redate}</div>
							<div class="card-body">
								<p class="card-text">${replylist1.rememo}</p>
							</div>
							<div style="text-align: center;">
							<a href="replyupdate?bno=${replylist1.bno}&reno=${replylist1.reno}">댓글수정</a>
							<a href="replydelete?bno=${replylist1.bno}&reno=${replylist1.reno}">댓글삭제</a></div>
							
						</div>
						
					</c:forEach>
			</div>
			
			<script>
		/* $(function(){
			//댓글수정 버튼을 눌렀을 때 처리
			$(".btn-default").click(function(){
				location.href="replyregister?bno?reno=" + ${replylist1.bno} + ${replylist1.reno} 
			});
		}) */
	</script>

		</form>
		<br>
			<br>
			
	</section>
</body>
</html>