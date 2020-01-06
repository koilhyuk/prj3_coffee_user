<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--<link rel="stylesheet" type="text/css" href="http://localhost:8080/jsp_prj/common/css/main.css">-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Staatliches&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">

<style type="text/css">

	/* 헤더 푸터 css */
	 @import url("http://localhost:8080/final_prj/common/header_footer.css");
	/* 헤더 푸터 css 끝 */
	/* 컨테이너 시작 */
	#containerL{min-height: 700px; min-width: 700px; }
	#loginfrm{ min-height:350px;min-width:500px;margin-left: auto; margin-right: auto;margin-top:10%; width: 300px; 
		border: 1px solid white; background-color: white; border-radius: 5px; }
	.form-control-lg{
	width: 300px; 
	margin-bottom: 5%;
	}
	#loginBtn{ width: 300px; background-color: #141A1D; margin-bottom: 5%}
	/* 컨테이너 끝 */
	/* 푸터 시작 */
 
   /* 푸터 끝 */
	
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript">
$(function() {
		/*툴팁  */
		$('[data-toggle="tooltip"]').tooltip();
		
});


	
</script>
</head>
<body>
<div id="coffeWrap" style="background-color: #F0F0E1">
<div id="header">
 <c:import url="/WEB-INF/views/common_d/header.jsp"/>
</div>

<div id="containerL" >
	<div id="loginfrm" >
	<div style="margin: 20%">
<div style=" padding-left:32%; padding-bottom:10%;width: 300px"><img src="http://localhost:8080/final_prj/common/images/2.png" style="width: 100px"></div>
		<form action="main_page_login.do" method="post">
		<input class="form-control form-control-lg" type="text" placeholder="아이디" >
		<input class="form-control form-control-lg" type="password" placeholder="비밀번호">
		<button type="submit" class="btn btn-dark" id="loginBtn">로그인</button>
		</form>
		<div style="text-align:center; width: 300px;">
		아이디가 없으신가요? <a href="#void" style="color: #141A1D; ">   회원 가입</a><br/>
		<a href="#void" style="color: #141A1D; ">아이디 또는 비밀번호를 잊으셨나요?</a>
		</div>
	</div>
	</div>
</div>

<div id="footer">
 <c:import url="/WEB-INF/views/common_d/footer.jsp"/>
</div>

</div>




</body>
</html>