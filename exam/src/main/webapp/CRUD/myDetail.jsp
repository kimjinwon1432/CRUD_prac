<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CRUD</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/crudform.css'/>"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	html,body{
		margin: auto 0;
	}	
	#wrap_cont{
		margin: auto;
		padding-top: 10px;
	}
	table{
		width: 80%;
		margin: auto;
	}
	td{
		text-align: left;
	}
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
		
	 
 	$("#btn_delete").click(function(){
 		if(confirm("정말 삭제하시겠습니까?")){
 			//ajax
 			var id=$("#id").val();

 			$.ajax({
 				type: "POST",
 				url: "userDelete.do",
 				data: {"id":id},
 				dataType:"text",
 				success: function(result){
 					if(result=="success"){
 						alert("삭제완료");
 					} else{
 						alert("삭제실패");
 					}
 				},
 				error: function(){
 					alert("오류발생");
 				}
 			});
 		}
		
	});
	
 	$("#btn_modify").click(function(){
		//ajax
		var formData=$("#frm").serialize();
		$.ajax({
			/*전송 전 세팅*/
			type: "POST",
			data: formData,
			url: "userModifySave.do",
			dataType:"text",
			
			/*전송 후 세팅*/
			success: function(result){
				if(result =="success"){
					alert("수정완료");
					location.reload(); // 사용자 정보 수정 후, 변경된 정보가 새로고침되어 출력됨.
				} else{
					alert("수정실패");
				}
				console.log(result);
			},
			error: function(){
				alert("오류발생");
			}
		});
		
	});
 	
	
}); 
</script>
</head>
<body>
<%@ include file="../include/topmenu.jsp" %>



<!-- 본문 -->
<div id= "wrap_cont">
<form id ="frm" method="post" action="userModifySave.do">
	<table>
		<caption> 회원 정보 </caption>
		<tr>
			<th>ID</th>
			<td><c:out value="${crudVO.id }"></c:out>
			</td>
		</tr>
		<tr>
			<th><label for="name">이름</label></th>
			<td><input type="text" name="name" id="name" value="${crudVO.name }"></td>
		</tr>
		<tr>
			<th><label for="email">이메일</label></th>
			<td><input type="email" name="email" pattern=".+globex\.com" id="email" value="${crudVO.email }"></td>
		</tr>
		<tr>
			<th><label for="phone">전화번호</label></th>
			<td id="tr_phone">
					<input type="text" name="phone1" id="phone1" maxlength="3" value="${crudVO.phone1}" size=2/> -
					<input type="text" name="phone2" id="phone2" maxlength="4" value="${crudVO.phone2}" size=3/> -
					<input type="text" name="phone3" id="phone3" maxlength="4" value="${crudVO.phone3}" size=3/>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="postNum" id="postNum" value="${crudVO.postNum }">
				<input type="button" name="check_addr" value="주소찾기">
				<br>
				<input type="text" name="address" id="address" value="${crudVO.address }"></td>
		</tr>
		<tr class="btn_tr">
			<td colspan="2" style="text-align:center;">
				<input size=10 type="button" id="btn_modify" value="사용자 정보 수정">
				<input size=10 type="button" id="btn_delete" value="회원 삭제">
			</td>
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
