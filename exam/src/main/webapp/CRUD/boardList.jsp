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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CRUD</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/crudform.css'/>"/>
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
td, th{
	text-align:center;
	border: 1px solid #333333;
}
#btn_write{
		background-color: #bdd7ee;
		text-decoration: none;
		font-size:1rem;
}
#bottom{
	height: 30px;
}

#wrap_cont {
	margin: auto;
}

</style>

<script>
$(function(){
	var urlParams = new URLSearchParams(window.location.search);
	var searchTypeParams = urlParams.get("searchType");
	var searchTextParams = urlParams.get("searchText");
	if(searchTypeParams){
		console.log(searchTypeParams);
		$("#searchType").val(searchTypeParams);
	}
	if(searchTextParams ){
		console.log(searchTextParams);
		$("#searchText"	).val(searchTextParams);
	}
});
</script>
</head>
<body>

<%@ include file="../include/topmenu.jsp" %>

	
	
<!-- 본문 -->
<div id="wrap_cont">
<%-- 	<span>검색된 게시물 수: <c:out value="${ searchTotal}"/>개</span> --%>
<form id="frm" name="frm" >
	<!-- 번호, 제목, 글쓴이, 등록일, 조회수 -->
	<table>
	<caption id="tbCaption">
		<div>게시판 목록</div>
		
		<div class="div2">
		<form name="searchFrm" method="post" action="boarList.do">
			<select name="searchType" id ="searchType">
				<option value="title">제목</option>
				<option value="id">글쓴이</option>
				<option value="contents">내용</option>
			</select>
			<input type="text" name="searchText" id="searchText"/>
			<button type="submit" >검색</button>
		</form>
		</div>
		
		<div id="boardInfo">
			<div class="div3">total: ${total } 개 </div>
			<div class="div3">
				<span>한번에 조회할 게시물 수: </span>
				<select id="unit">
					<option value="5"> 5 개씩</option>
					<option value="10"> 10 개씩</option>
					<option value="15"> 15 개씩</option>
					<option value="20"> 20 개씩</option>
				</select>
			</div>
		</div>
	</caption>
	
	<colgroup>
		<col width="10%">
		<col width="10%">
		<col width="45%">
		<col width="10%">
		<col width="15%">
		<col width="5%">
	</colgroup>
	<tr>
		<th>번호</th>
		<th>게시물 번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>등록일</th>
		<th>조회수</th>
	</tr>
	<c:set var="cnt" value="${rowNumber }"/>
	<c:forEach var ="result" items="${resultList }">
	<tr>
		<td><c:out value="${result.rn }"/></td>
		<td><c:out value="${result.boardnum }"/></td>
		<td style="text-align:left;">
			<a href="boardDetail.do?boardNum=${result.boardnum }"><c:out value="${result.title}"/></a>
		</td>
		<td><c:out value="${result.id}"/></td>
		<td><c:out value="${result.regdate}"/></td>
		<td><c:out value="${result.hits}"/></td>
	</tr>
	
	<c:set var="cnt" value="${cnt-1 }"/>
	</c:forEach>
	</table>
	
	<div style="width: 80%; margin:auto; margin-top:5px; text-align:center;">
		<c:forEach var="i" begin="1" end="${totalPage }">
			<a href="boardList.do?viewPage=${i}"><c:out value="${i}"/></a>
		</c:forEach>
	</div>
</form>
	<c:if test="${loginUserId ne null }">
	<div id="bottom">
		<a id= "btn_write" href="boardWrite.do">글쓰기</a>
	</div>
	</c:if>
</div>

	
<!-- 푸터 -->
<div id="footer">
	<span>김진원</span>
	<span>CRUD_project</span>
</div>
	
</body>
</html>