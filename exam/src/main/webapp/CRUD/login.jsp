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
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/main.css'/>"/>
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
<script>
$(function(){
	var id=$("#id").val();
	if(id=="") {
		alert("아이디를 입력해주세요.");
		$("#id").focus();
		return false;
	}
	if($("#password")=="") {
		alert("비밀번호를 입력해주세요.");
		$("#password").focus();
		return false;
	}
	
	$.ajax({
		type: "POST",
		data: "id="+id+"password="+password, //json(전송)타입
		url:"loginCheck.do",
		dataType:"text", //리턴타입
		
		success: function(result) {
			if(result == "success"	{
				alert(id + "님 로그인 되었습니다.");
				location = "mainPage.do";
			}) else{
				alert("로그인 정보를 다시 확인해 주세요.");
			}
		},
		error: function (result) {
			alert("오류발생");
		}
	});
	
});
</script>

</head>

<%@ include file="../include/topmenu.jsp" %>

<body>
<!-- 본문 -->
	<div id="wrap_cont">
	<form name="frm" method="post" action="loginCheck.do">
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