<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#pop_loading.modal-overlay{
		width: 100%;
		height: 100%;
		position: absolute;
		left: 0;
		top: 0;
		flex-direction: column;
		justify-content: center;
	}
	#pop_loading .modal-window{
		width: 300px;
		height: 300px;
		position: relative;
		top: -100px;
		padding: 10px;
	}
	
</style>
</head>
<body>

	<div id="pop_loading" class="modal-overlay">
		<div class ="modal-window">
			<div class="title"> 
				<h2> Loading </h2>
			</div>
			<div class="content">
				<p>로딩중입니다.</p>
			</div>
		</div>
	</div>

</body>
</html>