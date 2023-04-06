<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String) session.getAttribute("SessionUserID");
%>
<!-- 헤더 -->
	<div id="header">
		<span>CRUD</span>
		<a class="btn_top" href="boardList.do">게시판 목록</a>
		<a class="btn_top" href="userList.do">회원목록</a>
		<%
		if(id == null){
		%>
			<a class="btn_top" href="agreement.do">회원가입</a>
			<a class="btn_top" href="login.do">로그인</a>	
		<%
		} else{
		%>
			<a class="btn_top" href="userDetail.do">회원정보</a>
			<a class="btn_top" href="login.do">로그아웃</a>	
		<%
		}
		%>
	</div>
</body>
</html>