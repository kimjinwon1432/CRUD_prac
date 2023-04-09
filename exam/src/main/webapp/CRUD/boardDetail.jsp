<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>    
 <c:set var="contents" value="${fn:replace(boardVO.contents, newline,'<br>' ) }"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/crudform.css'/>"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script></head>
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
$(function (){
	$("#deleteBoard").click(function (){
		if(confirm("삭제하시겠습니까?")){
			var boardnum = Number($("#tdBoardNum").html());
			console.log(boardnum);
			$.ajax({
		 		type: "POST",
		 		data: {"boardnum": boardnum}, // 데이터 들어있어
		 		url: "boardDelete.do", //저장주소
		 		dataType: "text",//return type 
		 		success: function(data){//성공   data: controller에서 준 데이터 --> "ok", "fail"
		 			if(data == "success"){
		 				alert("삭제완료");
		 				location="boardList.do";
		 			}
		 		},
		 		error: function(data){ // 실패경우 세팅
		 			alert("오류 발생"); //에러 발생할 경우는 system에러밖에 없다... 값전송이 잘안됬던가하는 등
		 		}
		 	});
		}
	});
});

function fn_submit(){
	//jquery
	if($("#title").val() =="" ){ //jquery 문법... $
		alert("제목을 입력하세요.");
		$("#title").focus();
		return false;
	} 
	
	var formData = $("#frm").serialize(); //serialize함수를통해 id가 frm인 요소의 데이터를 갖고있음
 	console.log(formData);
	//ajax요소 작성 ... 이것을 적용하면 form에서 name과 method, action방식이 필요없다.
 	$.ajax({ 
 		type: "POST",
 		data: formData, //frm 데이터 들어있어
 		url: "boardWriteSave.do", //저장주소
 		dataType: "text",//return type 
 		success: function(data){//성공   data: controller에서 준 데이터 --> "ok", "fail"
 			if(data == "ok"){
 				alert("저장완료");
 				location="boardList.do";
 			}
 		},
 		error: function(data){ // 실패경우 세팅
 			alert("오류 발생"); //에러 발생할 경우는 system에러밖에 없다... 값전송이 잘안됬던가하는 등
 		}
 	});
	
/*  //javascript
	if( document.frm.title.value==""){
		alert("제목을 입력하세요.");
		document.frm.title.focus();
		return false;
	} 
 */	
//	document.frm.submit(); // 동기 전송 방식.... frm의 내용을 action이 가리키는 곳으로 보낸다.
	
	//비동기전송방식 ajax... jquery의 하나의 요소...
	
	
}
</script>

<body>
<%@ include file="../include/topmenu.jsp" %>
<div id="wrap_cont">
<form id="frm">
<table>
	<caption>게시판 등록</caption>
	<colgroup>
		<col width=20%>
		<col width=80%>
	</colgroup>
	<tr>
		<th><label for="title">제목</label></th>
		<td>${boardVO.title }</td>
	</tr>
	
<!-- 	추후 제거 -->
	<tr>
		<th><label for="id">작성자</label></th>
		<td id="id">${boardVO.id }</td>
	</tr>
	<tr>
		<th><label for="boardnum">게시물 번호</label></th>
		<td id="tdBoardNum">${boardVO.boardnum }</td>
	</tr>
	<tr>
		<th><label for="hits">조회수</label></th>
		<td>${boardVO.hits }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${boardVO.contents }</td>
	</tr>
	<tr>
		<th >업로드</th>
		<td>
			<input type="file" name="file_path" id="file_path" value="${boardVO.file_path }">
		</td>
	</tr>
	<tr>
		<th style="text-align:'center'" colspan=2>
		<c:choose>
			<c:when test="${ boardVO.id eq loginUserId} "> <!--  조건 선언 -->
				<button type="button" onclick="location='boardModifyWrite.do?boardNum=${boardVO.boardnum}'")>수정</button>
				<button type="button" onclick="location='boardList.do'">목록</button>
				<button type="button" id="deleteBoard">삭제</button>
			</c:when>
			<c:otherwise>
				<button type="button" onclick="location='boardList.do'">목록</button>
			
			</c:otherwise>
		</c:choose>
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