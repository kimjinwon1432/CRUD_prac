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
<title>CRUD - Member join</title>	
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/crudform.css'/>"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	html,body{
		margin: auto 0;
	}
	#wrap_cont{	
		height:60%;
	}
	#wrap_cont > form > table{
		margin: auto;
		padding: 10px;
	}
	.check{
	}
	.check > td{
		heigth: inherit;
	}
	.block{
		display: none;
	}
	tr{
		padding-top: 5px;		
	}
	th{
		padding-right:5px;
	}
	td{
		line-hieght: 3.0;
	}
	

	.join_tr > td > input{
		padding-left: 40px;
		padding-right: 40px;	
	}

	
</style>

<script> 
$(function(){
	//id 중복확인 버튼
	$("#btn_idCheck").click(function(){
		var id = $.trim($("#id").val());
		if(id==""){
			alert("아이디를 입력해주세요");
			$("#id").focus();
			return false;
		}
		
		$.ajax({
			type:"POST",
			data:"id="+id, //json 
			url:"checkId.do",
			dataType: "text", //리턴타입
			success: function(result){
				if(result=="available"){
					alert("사용가능한 아이디입니다.");
				}
				else {
					alert("이미 사용중인 아이디입니다.");
					$("#id").focus();
				}
			},
			error: function(){
				alert("오류발생");
			}
		});
		
		
	});
	//회원가입 버튼
	$("#btn_submit").click(function () {
		var id = $("#id").val();
		var password =$("#password").val();
		var name = $("#name").val();
		var phone = $("#phone").val();
		//var phoneTemp = phone.replace(/-/g, "");
		//$("#phone").val(phoneTemp);
		
		id=$.trim(id);
		password=$.trim(password);
		name=$.trim(name);
		
		console.log(phone);
		
		if(id ==""){
			alert("아이디를 입력해주세요");
			return false;
		}		
		if(password ==""){
			alert("비밀번호를 입력해주세요");
			return false;
		}		
		if(name ==""){
			alert("이름을 입력해주세요");
			return false;
		}		
		
		//ajax
		var formData=$("#frm").serialize();
		$.ajax({
			/*전송 전 세팅*/
			type: "POST",
			data: formData,
			url: "joinSave.do",
			dataType:"text",
			
			/*전송 후 세팅*/
			success: function(result){
				if(result =="ok"){
					alert("가입완료");
					location="mainPage.do";
				} else{
					alert("가입 실패");
				}
			},
			error: function(result){
				alert("오류발생");
			}
		});
		
	});
	
	$("#password, #passwordCheck").on('keyup', function(){
		var pw = $("#password").val();
		var pwCheck=$("#passwordCheck").val();
		if(pw!="" || pwCheck!=""){
			if(pw == pwCheck){
				$("#pw_check").removeClass("block");
				$("#pw_check").html("비밀번호가 일치합니다.<br>");
				console.log($("#pw_check").innerText);
				$("#pw_check").css("color", "blue");
			}
			else{
				$("#pw_check").removeClass("block");
				$("#pw_check").html("비밀번호가 일치하지 않습니다.<br>");
				$("#pw_check").css("color", "red");
			}
		} //eof
	});
	
}); 
/* 
$(document).ready(function() {

});
 */
</script>
</head>
<body>


<!-- 헤더 -->
	<div id="header">
		<span>CRUD</span>
		<a class="btn_top" href="agreement.do">회원가입</a>
		<a class="btn_top" href="login.do">로그인</a>
	</div>
	
<!-- 본문 -->
	<div id= "wrap_cont">
	<form id ="frm">
		<table>
			<tr>
				<th><label for="id">ID</label></th>
				<td>
				<input type="text" name="id" id="id" placeholder="아이디">
				<input type="button" id="btn_idCheck" value="ID중복확인">
				</td>
			</tr>
			<tr>
				<th><label for="password">비밀번호</label></th>
				<td><input type="password" name="password" id="password"placeholder="비밀번호"></td>
			</tr>
			<tr>
				<th><label for="passwordCheck">비밀번호확인</label></th>
			<td>	<span id="pw_check" class="block"><br></span>
					
					<input type="password" name="passwordCheck" id="passwordCheck" placeholder="비밀번호 확인"></td>
			</tr>
			<tr>
				<th><label for="name">이름</label></th>
				<td><input type="text" name="name" id="name"placeholder="이름"></td>
			</tr>
			<tr>
				<th><label for="email">이메일</label></th>
				<td><input type="email" name="email"placeholder=""></td>
			</tr>
			<tr>
				<th><label for="phone">전화번호</label></th>
				<td><input type="text" name="phone"> (예: 010-1234-1234)
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="postNum"placeholder="">
					<input type="button" name="check_addr" value="주소찾기">
					<br>
					<input type="text" name="address"></td>
			</tr>
			<tr class="join_tr">
				<th></th>
				<td><input size=10 type="submit" id="btn_submit" value="회원가입"></td>
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