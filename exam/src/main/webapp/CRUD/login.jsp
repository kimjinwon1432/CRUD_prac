<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/crudform.css'/>"/>
	<style>
	html,body{
		margin: auto 0;
	}
	<!-- 메인 -->
	#wrap_cont{
		width:100%;
		height: 60%;
		margin: auto;
	}
	
	#wrap_cont > form > table{
		margin: auto;
		padding: 10% 0 10% 0;
	}
	th{
		text-align: center;
	}
	.btn{
		background-color: #bdd7ee;
		border: 0;
		width: 230px;
		font-size: 1.4rem;
	}
	
	.btn:hover{
		color:#f0f0f0;
	}
	a{
		text-decoration: none;
	}
	.loginText{
		text-align: center;
	}
	
	
	</style>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/main.css'/>"/>
</head>
<body>
<!-- 헤더 -->
	<div id="header">
		<span>CRUD</span>
		<a class="btn_top" href="agreement.do">회원가입</a>
		<a class="btn_top" href="login.do">로그인</a>
	</div>
<!-- 본문 -->
	<div id="wrap_cont">
	<form name="frm" method="post" action="lginSubmit.do">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" placeholder="아이디"></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" name="password" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<th colspan=2>
					<button class="btn" type="submit">로그인</button>
				</th>
			</tr>
			<tr>
				<th colspan=2>
					<button class="btn">회원가입</button>
				</th>
			</tr>
			<tr>
				<th colspan=2>
					<span><a href="">ID 찾기</a> / <a href="">비밀번호 찾기</a></span>
				</th>
			</tr>
		
		</table>
	
	</form>
</div>

<!-- 푸터 -->
<div id="footer">
	<span>김진원</span>
	<span>CRUD_project</span>
</div>
</body>
</html>