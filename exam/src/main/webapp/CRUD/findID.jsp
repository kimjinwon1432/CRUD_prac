<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		height:60%;
		margin auto;
	}
</style>
</head>
<body>

<%@ include file="../include/topmenu.jsp" %>

	
<!-- 본문 -->
	<div id= "wrap_cont">
	<form id ="frm">
		<table>
		<caption> ID 찾기 </caption>
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