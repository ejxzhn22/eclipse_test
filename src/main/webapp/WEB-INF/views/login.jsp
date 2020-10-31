<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="resources/css/style.css" />
	<link rel="stylesheet" href="resources/bootstrap-3.3.2/css/bootstrap.css">
	<link rel="stylesheet"  href="resources/bootstrap-3.3.2/css/bootstrap-theme.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body{
width:100%;
height:100%;
}
.loginbox{
margin-top:200px;
	display:flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
.form-group{
display:flex;
width: 400px;
}
label{
width: 100px;
}
</style>
<body>
	<form method="POST">
	<div class="loginbox">
		<div class="form-group">
      		<label for="exampleInputEmail1">아이디</label>
      		<input type="text" name="id" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="ID">
      	</div>
      	<div class="form-group">
      		<label for="exampleInputEmail1">비밀번호</label>
      		<input type="password" name="password" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="PASSWORD">
      	</div>
		<button type="submit" class="btn btn-outline-warning">로그인</button>
	</div>
	</form>
</body>
</html>