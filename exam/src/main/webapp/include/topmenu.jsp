<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CRUD</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
// $(function(){
// 	$("#btn_logout").click(function(){

// 		$.ajax({
// 			type:"POST",
// 			data:"userId="+'${id}', //json 
// 			url:"logout.do",
// 			dataType: "text", //리턴타입
// 			success: function(result){
// 				if(result=="success"){
// 					alert("로그아웃되었습니다.");
// 					location="mainPage.do";
// 				}
// 				else {
// 					alert("로그아웃에 실패했습니다.");
// 				}
// 			},
// 			error: function(){
// 				alert("오류발생");
// 			}
// 		});
// 	});
// });
</script>
</head>
<body>
<%
	String id = (String) session.getAttribute("loginUserId");
	
// 	pageContext.setAttribute("loginUserId", id);

// 	String name = (String) session.getAttribute("userName");
// 	String email = (String) session.getAttribute("userEmail");
// 	String password = (String) session.getAttribute("userPassword");
%>

<!-- 헤더 -->
<div id="header">
	<span><a href="mainPage.do">CRUD</a></span>
	<%if(id !=null){  %>
		<span><%=id%>님 안녕하세요.</span>
	<%} %>
	<a class="btn_top" href="boardList.do">게시판 목록</a>
	<a class="btn_top" href="userList.do">회원목록</a>
	<%
	if( id == null){
	%>
		<a class="btn_top" href="agreement.do">회원가입</a>
		<a class="btn_top" href="login.do">로그인</a>	
	<%
	} else{
	%>
		<a class="btn_top" href="myDetail.do">회원정보</a>
		<a class="btn_top" id="btn_logout" href="logout.do">로그아웃</a>	
	<%
	}
	%>
</div>
</body>
</html>