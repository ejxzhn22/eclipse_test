<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<meta charset="UTF-8" />
<title>Home</title>
<link rel="stylesheet" href="resources/css/style.css" />
<link rel="stylesheet"
	href="resources/bootstrap-3.3.2/css/bootstrap.css">
<link rel="stylesheet"
	href="resources/bootstrap-3.3.2/css/bootstrap-theme.min.css">
<!-- 	<link rel="stylesheet"  href="resources/bootstrap-3.3.2/css/_bootswatch.scss">
	<link rel="stylesheet"  href="resources/bootstrap-3.3.2/css/_variables.scss"> -->
</head>

<body>
	<%@include file="include/header.jsp"%>
	<main class="main">
		<%@include file="include/nav.jsp"%>
		<section class="section">
			<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
				<a class="navbar-brand" href="#">Navbar</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarColor01" aria-controls="navbarColor01"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarColor01">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a class="nav-link" href="#">Home
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Features</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">Pricing</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					</ul>
					<form class="form-inline my-2 my-lg-0">
						<input class="form-control mr-sm-2" type="text"
							placeholder="Search">
						<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
					</form>
				</div>
			</nav>
			<button type="button" class="btn btn-warning">Warning</button>
		</section>
	</main>
	<script src="resources/jquery/jquery-3.5.1.js"></script>
	<script src="resources/jquery/jquery.min.js"></script>
	<script src="resources/bootstrap-3.3.2/js/bootstrap.js"></script>
</body>
</html>
