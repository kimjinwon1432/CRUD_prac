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
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/crudform.css'/>"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	html,body{
		margin: auto 0;
	}

</style>
<script>
 $(function(){
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

<!-- 헤더 -->
<div id="header">
	<span>CRUD</span>
	<a class="btn_top" href="agreement.do">회원가입</a>
	<a class="btn_top" href="login.do">로그인</a>
</div>


<!-- 본문 -->
<div id= "wrap_cont">
<form id ="frm" method="post" action="userModifySave.do">
	<table>
		<tr>
			<th><label for="id">ID</label></th>
			<td>
			<input type="text" name="id" id="id" value="${crudVO.id }" readonly>
			
			</td>
		</tr>
		<tr>
			<th><label for="name">이름</label></th>
			<td><input type="text" name="name" id="name" value="${crudVO.name }"></td>
		</tr>
		<tr>
			<th><label for="email">이메일</label></th>
			<td><input type="email" name="email" id="email" value="${crudVO.email }"></td>
		</tr>
		<tr>
			<th><label for="phone">전화번호</label></th>
			<td><input type="text" name="phone" id="phone" value="${crudVO.phone }"><br> (예: 010-1234-1234)
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