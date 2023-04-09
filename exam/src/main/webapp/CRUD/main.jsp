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
<title>CRUD</title>	
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/crudform.css'/>"/>
<style>
	html,body{
		margin: auto 0;
	}
   	
	#header{
		background-color: #5b9bd5;
		display: flex;
		flex-wrap: nowrap;
	}
	#header > span:first-child {
		font-size:x-large;
		flex: auto;
	}
	.btn_top{
		display: block;
		width: 3em;
		margin: 5px;
		background-color: #bdd7ee;
		text-decoration: none;
		padding: 10px;
		font-size:1rem;
		padding:5px;
		width: inherit;
	}
	.btn_top:hover{
		background-color: #1a4a70;
   		color: white;
	}
 
 #wrap_cont {
	margin: auto;
}
	
	.hover{
		background-color: white;
	}
	
	#footer{
		background-color: #1f4e79;
		height: 20%;
	}
	
	
	#content01{
		margin: auto;
		width: 500px;
		heigth: 1050px;
		text-align: center;
		padding: 100px 0px 100px 0px;
	}

</style>
</head>

<script type="text/javascript">
	</script>

<body>
<%@ include file="../include/topmenu.jsp" %>

	<div id="wrap_cont">
		<div id="content01">
			main Page
		</div>
	</div>
	<div id="footer">
	<span>김진원</span>
	<span>CRUD_project</span>
	</div>
	
	
</body>
</html>