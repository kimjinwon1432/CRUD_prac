<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/crudform.css'/>"/>
<style>
body{
	margin: auto 0;
	width: 100%;
}
#wrap_cont{
	margin: auto;
	
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

#bottom{
	min-width: 580px;
	width: 80%;
	margin: auto;
	margin-top: 5px;
	text-align: right;
}
#tbCaption{
	
}
#tbCaption > div:nth-child(1){
	width: 100%;
}
#tbCaption > div:nth-child(2){
	font-size: small;
	text-align: right;
}
.div3{
	font-size: small;
	text-align: right;
	
}
#boardInfo{
	display: inline-block;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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

<div id="wrap_cont">
	<%-- <span>검색된 게시물 수: <c:out value="${ searchTotal}"/>개</span> --%>
<form id="frm" name="frm" >
	<!-- 번호, 제목, 글쓴이, 등록일, 조회수 -->
	<table>
	<caption id="tbCaption">
		<div>게시판 목록</div>
		
		<div class="div2">
		<form name="searchFrm" method="post" action="boardList.do">
			<select name="searchType" id ="searchType">
				<option value="title">제목</option>
				<option value="name">글쓴이</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchText" id="searchText"/>
			<button type="submit" >검색</button>
		</form>
		</div>
		
		<div id="boardInfo">
			<div class="div3">total: ${resultTotal } 개 </div>
			<div class="div3">
			<span>한번에 조회할 게시물 수: </span>
				<select id="unitSelect">
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
		<col width="45%">
		<col width="15%">
		<col width="15%">
		<col width="15%">
	</colgroup>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>등록일</th>
		<th>조회수</th>
	</tr>
	<c:set var="cnt" value="${rowNumber }"/>
	<c:forEach var ="result" items="${resultList }">
	<tr>
		<td><c:out value="${cnt }"/></td>
		<td style="text-align:left;">
			<a><c:out value="${result.title}"/></a>
		</td>
		<td><c:out value="${result.name}"/></td>
		<td><c:out value="${result.rdate}"/></td>
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
<div id="bottom">
	<button onclick="boardWrite.do">글쓰기</button>
</div>

</div>

	
<!-- 푸터 -->
<div id="footer">
	<span>김진원</span>
	<span>CRUD_project</span>
</div>
	
</body>
</html>