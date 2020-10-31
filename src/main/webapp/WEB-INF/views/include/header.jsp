<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css" />
<link rel="stylesheet"
	href="resources/bootstrap-3.3.2/css/bootstrap.css">
<link rel="stylesheet"
	href="resources/bootstrap-3.3.2/css/bootstrap-theme.min.css">

<title>header</title>
</head>
<body>
	<header class="header">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">sujinBoard</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarColor03" aria-controls="navbarColor03"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor03">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="${contextPath}/">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><c:if test="${user==null}">
							<a class="nav-link" href="${contextPath}/login">로그인</a>
						</c:if>
						</li>
					<c:if test="${user!=null }">
						<li class="nav-item"><a class="nav-link"
							href="${contextPath}/logout">로그아웃</a></li>
						<li class="nav-item nav-link">${user.name} 님 환영합니다!</li>
					</c:if>
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="text"
						placeholder="Search">
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
	</header>
	</nav>
		<script src="resources/jquery/jquery-3.5.1.js"></script>
	<script src="resources/jquery/jquery.min.js"></script>
</body>
</html>