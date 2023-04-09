<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/crudform.css'/>"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

html,body{
	margin: auto 0;
}
table{
	min-width: 580px;
	width: 80%;
	margin: auto;
	border-collapse: collapse;
}
table > caption{
	font-size: x-large;
}
td, th{
	text-align:center;
	border: 1px solid #333333;
}
#wrap_cont{
	padding: 2em;
	min-width: 650px;
}



</style>
<script>

$(function(){
	$("#btnSearch").click(function() {
		var sortValue= $("#sort").val();
		if(sortValue!=="none"){
			var url ="userList.do?sort=" +sortValue;
			window.location.href=url;
		}
	});
	//페이지 로드 시 select 설정
	var urlParams= new URLSearchParams(window.location.search);
	var sortParams = urlParams.get("sort");
	if(sortParams){  //sortParams가 null이면 아무런 동작안함!
		console.log($("#sort").val());
		$("#sort").val(sortParams);
	}
	
});

</script>
</head>
<body>
<%@ include file="../include/topmenu.jsp" %>

<!-- 본문 -->
<div id= "wrap_cont">

<form id="frm" name="frm" method="post" action="userList.do">
	<table id="resultTable">
	<caption id="tbCaption">
		<div>회원 목록</div>
		<select name="sort" id="sort">
			<option value="id">id</option>
			<option value="agreedate">가입날짜</option>
		</select>
		<input type="button" id="btnSearch" value="검색"></input>
	</caption>
		<!-- id, name, phone -->
	<colgroup>
		<col width="30%">
		<col width="10%">
		<col width="30%">
		<col width="30%">
	</colgroup>
	
	<tr>
		<th>id</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>가입날짜</th>
	</tr>
	
	<c:forEach var = "result" items="${resultList}">
	<tr>
		<td style="text-align: left;">
				<a href="userDetail.do?id=${result.id }"><c:out value="${result.id }"/></a>
		</td>
		<td><c:out value="${result.name }"></c:out></td>
		<td><c:out value="${result.phone }"></c:out></td>
		<td><c:out value="${result.agreedate }"></c:out></td>
	</tr>
	</c:forEach> 
	
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