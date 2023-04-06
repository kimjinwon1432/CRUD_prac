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
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/crudform.css'/>"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
body{
	font-family: 'NanumBarunGothic';
	margin: auto 0;
	width: 100%;
}
table{
	margin: auto;
	width: 100%;
	border-collapse:collapse;
}
th, td{
	border: 1px solid #333333;
	padding: 5px;
}
#wrap_cont{
	padding: 2rem;
	margin: auto;
}
.input1{
	width: 98%;
}
.textarea{
	width: 98%;

}
</style>
<script>
$(function(){

 	$("#btn_modify").click(function(){
		//ajax
		var formData=$("#frm").serialize();
		$.ajax({
			/*전송 전 세팅*/
			type: "POST",
			data: formData,
			url: "boardModifySave.do",
			dataType:"text",
			
			/*전송 후 세팅*/
			success: function(result){ // controller -> "success", "fail"
				if(result =="success"){
					alert("수정완료");
// 					window.location.href="boardDetail.do?boardNum="+${boardnum }; 
					location="boardDetail.do?boardNum="+${boardVO.boardnum};
				} else{
					alert("수정실패");
				}
			},
			error: function(){
				alert("오류발생");
			}
		}); // end of ajax
	});//end of click function
}); // end of function
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

<div id="wrap_cont">
<table>
<form id="frm" method="post" action="boardModifySave.do">
	<caption>게시판 등록</caption>
	<colgroup>
		<col width=20%>
		<col width=80%>
	</colgroup>
	<tr>
		<th><label for="title">제목</label></th>
		<td><input type="text" name="title" id="title" class="input1" placeholder="제목 입력" value="${boardVO.title }"/></td>
	</tr>
	

	<tr><!-- 	추후 제거 -->
		<th><label for="id">작성자</label></th>
		<td><input type="text" name="id" id="id" class="input1" value="${boardVO.id }"/></td>
	</tr>
	<tr>
		<th><label for="boardnum">게시물 번호</label></th>
		<td><input type="text" name="boardnum" id="boardnum" class="input1" value="${boardVO.boardnum }"readonly/ ></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="contents" id="contents" class="textarea" maxlength="500" >${boardVO.contents }</textarea></td>
	</tr>
	<tr>
		<th >업로드</th>
		<td>
			<input type="file" name="file_path" id="file_path" value="${boardVO. file_path}">
		</td>
	</tr>
	<tr>
		<th style="text-align:'center'" colspan=2>
			<button type="button" id="btn_modify">수정완료</button>
			<button type="button" onclick="history.back();">수정 취소</button>
		</th>
	</tr>
</form>
</table>
</div>
	
<!-- 푸터 -->
<div id="footer">
	<span>김진원</span>
	<span>CRUD_project</span>
</div>

</body>
</html>