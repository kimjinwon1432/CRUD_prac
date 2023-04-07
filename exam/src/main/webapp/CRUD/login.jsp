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
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script><style>
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
	$("#btn_join").click(function() {
		location="agreement.do";
	});
	
	
	$("#btn_login").click(function() {
		var inputId=$("#id").val();
		
		if(inputId=="") {
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return false;
		}
		if($("#password").val()=="") {
			alert("비밀번호를 입력해주세요.");
			$("#password").focus();
			return false;
		}
		
		$.ajax({
			type: "POST",
			data: "id="+inputId+"&password="+$("#password").val(), //json(전송)타입
			url:"loginCheck.do",
			dataType:"text", //리턴타입
			
			success: function(result) {
				if(result == "success")	{
					console.log("id: ",id);
					alert(inputId + "님 로그인 되었습니다.");
					location = "mainPage.do";
				} else{
					alert("로그인 정보를 다시 확인해 주세요.");
				}
			},
			error: function (result) {
				alert("오류발생");
			}
		});
	});
});
</script>

</head>

<%@ include file="../include/topmenu.jsp" %>

<body>
<!-- 본문 -->
	<div id="wrap_cont">
	<form name="frm" method="post" >
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" id="id" name="id" placeholder="아이디"></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" id ="password" name="password" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<th colspan=2>
					<input type="button" id= "btn_login" class="btn"  value="로그인"></input>
				</th>
			</tr>
			<tr>
				<th colspan=2>
					<button type="button" class="btn" id="btn_join" >회원가입</button>
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