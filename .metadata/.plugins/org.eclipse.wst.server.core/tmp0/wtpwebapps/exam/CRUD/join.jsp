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
	#pw_validation{
		font-size: 0.1em;
		color: red;
	}
	#pw_check{font-size: 0.1em;}
	#tr_phone{
		display: inline-block;
	}
	#phone1{
		width: 13%;
	}
	#phone2, #phone3{
		width:22%;
	}
</style>

<script> 
$(function(){
	//check Input
	var checkID=false;
	var checkPW=false;
	//check Validation
	var checkIdVal=false;
	var checkPwVal=false;
	
	var checkPhoneVal=false;
	var checkEmailVal=false;
	
	
	//input #id
	var idKeyUp = function () {
		var id = $.trim($("#id").val());
		
		//id 정규식
		var sEnChk=id.search(/[a-z]/g); // Small en Check
		var numChk=id.search(/[0-9]/g);
		
		if(id.length >=4){
			if(sEnChk !=-1 && numChk!=-1){
				console.log(typeof(sEnChk),typeof(numChk) );
				checkIdVal=true;
			} else{
				checkIdVal=false;
				
			}
		}
		console.log("keyup..checkIdVal: ", checkIdVal);
		console.log(sEnChk, numChk);
	}
	$("#id").on('keyup', idKeyUp);
	
	
	
	//id 중복확인 버튼
	$("#btn_idCheck").click(function(){
		var id = $.trim($("#id").val());
		console.log("btn_idCheck: ",checkID);
		console.log()
		if(id==""){
			alert("아이디를 입력해주세요");
			$("#id").focus();
			return false;
		}
		
		if(id.length < 4){
			alert("아이디는 4자리 이상 입력해주세요.");
			return false;
		}
		
		if(id.length>=4 && checkIdVal){ // id가 4자리이상, 알파벳소문자/숫자의 조합
			console.log("btn_idCheck...checkIdVal: ", checkIdVal);
		
			$.ajax({
				type:"POST",
				data:"id="+id, //json 
				url:"checkId.do",
				dataType: "text", //리턴타입
				success: function(result){
					if(result=="available"){
						checkID=true;
						alert("사용가능한 아이디입니다.");
					}
					else {
						checkID=false;
						alert("이미 사용중인 아이디입니다.");
						$("#id").focus();
					}
				},
				error: function(){
					alert("오류발생");
				}
			});
		}//EOIf
		else{
			alert("숫자와 알파벳 소문자의 조합을 입력해주세요");
			return true;
		}
		
	});
	
	var phone1Val = false;
	var phone2Val = false;
	var phone3Val = false;
	
	//input #phone1,2,3 정규식 맞게 입력받기 
	$("#phone1").on('keyup',function() {
		var check =$.isNumeric($("#phone1").val());
		var regex = /^01([0|1|6|7|8|9]){1}$/;
		
		if($(this).val()!=="" && !check){
			alert("숫자만 입력하세요");
			$(this).val(""); 
			$(this).focus();
		} else{
			if( $(this).val().length==3 && !regex.test($(this).val())){
				alert("올바른 번호가 아닙니다.");
				$(this).val("");
				return false;
			}
			
		}
		if($(this).val().length==3) $("#phone2").focus();
	});
	$("#phone2").on('keyup',function() {
		var check =$.isNumeric($("#phone2").val());
		var regex = /^([0-9]){4}$/;
		
		if($(this).val()!=="" && (!check || $(this).val().search(/\s/) != -1)){
			alert("숫자만 입력하세요"); 
			$(this).val("");
			$(this).focus();
		}
		else if($(this).val().length==4 && regex.test($(this).val())) { 
			phone3Val=true;
			$("#phone3").focus();
		}
	});
	$("#phone3").on('keyup',function() {
		var check =$.isNumeric($("#phone3").val());
		if($(this).val()!=="" && (!check || $(this).val().search(/\s/) != -1) ){
			alert("숫자만 입력하세요");
			$(this).val(""); 
			$(this).focus();
		} 
		else if(check&&$(this).val().length==4) phone3Val=true;
	});
	
	//input 확인
	

	$("#pw_validation").html("특수문자, 소/대문자영어, 숫자가 각 1개이상 포함된 4자리 이상의 비밀번호를 입력하세요.");

	
	function fn_pwValCheck(){
		var pwInputCheck="^(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]),{4,}$";
		
		var pw = $("#password").val();
		var sEnChk=pw.search(/[a-z]/g); // Small en Check
		var lEnChk=pw.search(/[A-Z]/g); // Large en Check
		var numChk=pw.search(/[0-9]/g);
		var spChk = pw.search(/[!@#$%^&*]/g);
		console.log(pw.search(pwInputCheck));
		
		console.log(sEnChk, lEnChk, numChk, spChk);
		if(sEnChk!==-1 && lEnChk!==-1 && numChk!==-1 && spChk!==-1 && pw.length>=4){ // all true
			$("#pw_validation").html("보안강도가 좋습니다.");
			$("#pw_validation").css("color", "blue");
			checkPW= true;
		} else{ //정규식에 맞지 않을 경우 false
			$("#pw_validation").html("특수문자, 소/대문자영어, 숫자가 각 1개이상 포함된 4자리 이상의 비밀번호를 입력하세요.");
			$("#pw_validation").css("color", "red");
			checkPW= false;
		}
		
	}
	$("#password, #passwordCheck").on('keyup', function(){
		
		var pw = $("#password").val();
		var pwCheck=$("#passwordCheck").val();
		
		fn_pwValCheck();
		
		if(pw!="" && pwCheck!=""){ //pw입력 후 pwCheck란에 입력 시
			$("#pw_check").removeClass("block");
			
			if(pw == pwCheck){ //둘이 일치
				$("#pw_check").html("비밀번호가 일치합니다.<br>");
				console.log($("#pw_check").innerText);
				$("#pw_check").css("color", "blue");
				checkPwVal = true;
			}
			else{ //둘이 다름
				$("#pw_check").html("비밀번호가 일치하지 않습니다.<br>");
				$("#pw_check").css("color", "red");
				checkPwVal = false;
			}
			$("#pw_check").show()
			
		} else{
				$("#pw_check").addClass("block");
			}
		console.log("checkPwVal: ",checkPwVal);
	});
	
	
	var inputCheck = function () {
		var id = $("#id").val();
		var password =$("#password").val();
		var name = $("#name").val();
		var phone1 = $("#phone1").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();
		var email = $("#email").val();
		var address = $("#address").val();
		var postNum= $("#postNum").val();	

		id=$.trim(id);
		password=$.trim(password);
		name=$.trim(name);
		
		if(id ==""){
			alert("아이디를 입력해주세요");
			return false;
		} 
		if(!checkID){
			alert("아이디 중복검사를 해주세요");
			return false;
		}
		
		if(password ==""){
			alert("비밀번호를 입력해주세요");
			return false;
		} 
		if(!checkPW){ //checkPW == false 일때
			alert("비밀번호를 다시 확인해주세요");
			return false;
		}
		if(!checkPwVal){ //checkPWVal == false 일때 .. validation이 틀릴때
			alert("비밀번호 확인을 다시 입력해주세요");
			return false;
		}
		
		if(name ==""){
			alert("이름을 입력해주세요");
			return false;
		}	
		if(phone1=="" ||phone2==""  || phone3==""){
			alert("전화번호를 입력해주세요.");
			return false;
		}
// 		if(!(phone1Val && phone2Val && phone3Val)) {
// 			alert("전화번호를 완벽하게 입력해주세요.");
// 			return false;
// 		}
		if(email==""){
			alert("이메일을 입력하세요");
			return false;
		}
		
		if(postNum=="" || address ==""){
			alert("주소를 입력하세요");
			return false;
		}
		
		
		return true;
	}
	//회원가입 버튼
	$("#btn_submit").click(function () {
		var check = inputCheck();
		console.log("btn_submit....inputCheck: ", check);
		if(!check) return false;
		
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

}); 

</script>
</head>
<body>


<!-- 헤더 -->
	<div id="header">
		<span>CRUD</span>
		<a class="btn_top" href="boardList.do">게시판 목록</a>
		<a class="btn_top" href="userList.do">회원목록</a>
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
				<th></th>
				<td colspan="2"><span id="pw_validation" ></span><br></td>
			</tr>
			<tr>
				<th><label for="password">비밀번호</label></th>
				<td>
				<input type="password" name="password" id="password"placeholder="비밀번호"></td>
			</tr>
			<tr>
				<th><label for="passwordCheck">비밀번호확인</label></th>
				<td>
					<span id="pw_check" class="block"><br></span>
					<input type="password" name="passwordCheck" id="passwordCheck" placeholder="비밀번호 확인">
				</td>
			</tr>
			<tr>
				<th><label for="name">이름</label></th>
				<td><input type="text" name="name" id="name"placeholder="이름"></td>
			</tr>
			<tr>
				<th><label for="email">이메일</label></th>
				<td><input type="email" name="email" id="email" placeholder=""></td>
			</tr>
			<tr>
				<th><label for="phone1">전화번호</label></th>
 				<td id="tr_phone">
<!-- 					<input type="text" name="phone" id="phone" maxlength="13"> (예: 010-1234-1234) <br>-->
					<input type="text" name="phone1" id="phone1" maxlength="3" size=2/> -
					<input type="text" name="phone2" id="phone2" maxlength="4" size=3/> -
					<input type="text" name="phone3" id="phone3" maxlength="4" size=3/>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="postNum" id="postNum" placeholder="">
					<input type="button" name="check_addr"  value="주소찾기">
					<br>
					<input type="text" name="address" id="address">
				</td>
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