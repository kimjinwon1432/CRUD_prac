<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/crudform.css'/>"/>
<style>
	html,body{
		margin: auto 0;
	}
	ul{
		padding: 0;
		list-style-type:none;
	}
	.terms_list{
		margin: auto;
	}
	.article{
		margin: auto;
		border: solid 1px;
		border-color: gray;
		overflow:scroll;
		width: 70%;
		height: 200px;
	}
	
	.terms_box{
		<!--  상, 하  -->
		padding: 10px 10px;
	}
	
	.btn_span{
		margin :auto ;
	}
	.terms_list > li > span > h3{
		padding: 3px 3px;
	}
	.title > span > h3{
		text-align:center;
	}
	.btn_ag_div{
		text-align:center;
		display: flex;
		justify-content: center;
	}
	.btn_ag_div > span{
		margin: 2em 0.5em 2em 0.5em;
	}
	
	.btn_ag{
		display: block;
		width: 3em;
		font-size: 1.3rem;
		margin: 5px;
		background-color: #bdd7ee;
		text-decoration: none;
		padding: 10px;
	}
	.btn_ag:hover{
		background-color: #1a4a70;
   		color: white;
	}

</style>
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
	<div class="terms_title">
		
	<ul class="terms_list">
		<li><div class="title"><span><h3>회원가입 약관</h3></span></div></li>
		<li>
			<div class="terms_box">
				<div class="article">
					<h3 class="article_title">환영합니다.</h3>
					<p class="article_text">
						1개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>
						2개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>
						3개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>
						4개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>
						5개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>
						1개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>
						3개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>
						5개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>
						7개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>
						9개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>
						1개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>
						3개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>
						4개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>
						6개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>
						개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>
						개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>
					</p>
				</div>
			</div>
		</li>
		<li>
			<div class="btn_ag_div">
			<span>
				<a class="btn_ag" href="join.do">동의</a>
			</span>
			<span>
				<a class="btn_ag" href="mainPage.do">비동의</a>
			</span>
			</div>
		</li>
	</ul>
	</div>
	
		
</div>
	
<!-- 푸터 -->
	<div id="footer">
		<span>김진원</span>
		<span>CRUD_project</span>
	</div>
	
</body>
</html>