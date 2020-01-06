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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Staatliches&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">

<style type="text/css">

	/* 헤더 푸터 css */
	 @import url("http://localhost:8080/final_prj/common/header_footer.css");
	/* 헤더 푸터 css 끝 */
	/* 컨테이너 시작 */
	#containerL{min-height:100vh; min-width: 500px; }
	#loginfrm{ min-height:300px;min-width:500px;margin-left: auto; margin-right: auto;margin-top:15%; width: 300px; 
		border: 1px solid white; background-color: white; border-radius: 5px; }
	.form-control-lg{
	width: 300px; 
	margin-bottom: 5%;
	}
	#loginBtn{ width: 300px; background-color: #141A1D; margin-bottom: 5%}
	/* 컨테이너 끝 */
	/* 푸터 시작 */
 
   /* 푸터 끝 */
	#idCon,#passCon,#idPassCon{color:#FF0000; font-weight: bold; display: none;}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript">

/* window.history.forward();

function noBack() {

	window.history.forward();

} */
$(function() {
		/*툴팁  */
		$('[data-toggle="tooltip"]').tooltip();
	
/* 	$("#loginBtn").click(function(){
	 	$("#loginOk").submit(); 
	});	 */
	$("#m_pass").keypress(function (key) {
		 
        if(key.which==13){//키가 13이면 실행 (엔터는 13)
        	$("#loginBtn").click();
        }
 
    });
	
	$("#loginBtn").click(function() {
	
		if ($("#m_id").val()=="") {
			$("#idCon").show().fadeOut(5000);
			$("#m_id").focus();
			return ;
		}//if
		
		if ($("#m_pass").val()=="") {
			$("#passCon").show().fadeOut(5000);
			$("#m_pass").focus();
			return;
		}//if

		
		$.ajax({
			url:"loginChk.do",
			type:"post",
			data:"m_id="+$("#m_id").val()+"&m_pass="+$("#m_pass").val(),
			dataType:"json",
			success: function (json) {
				if (json.login_flag) {
					$("#loginFrm").submit();
				}else{
					$("#idPassCon").show().fadeOut(5000);
					
				}
			},
			error: function (xhr) {
				alert("문제가 발생했습니다. 다시 로그인 해주세요");
			}
		});
	});
		
});


	
</script>
</head>
<body style="background-color: #F0F0E1">
<div id="coffeWrap" style="background-color: #F0F0E1">
<div id="header">
 <c:import url="/WEB-INF/views/common_d/header.jsp"/>
</div>

<div id="containerL" >
<form method="post" action="loginOk.do" id="loginFrm">
	<div id="loginfrm" >
	<div style="margin: 20%">
<div style=" padding-left:32%; padding-bottom:10%;width: 300px"><img src="http://localhost:8080/final_prj/common/memberImg/loginImg.png" style="width: 100px"></div>
		<input class="form-control form-control-lg" type="text" placeholder="아이디" id="m_id" name="m_id">
		<input class="form-control form-control-lg" type="password" placeholder="비밀번호" id="m_pass" name="m_pass">
		         <p class="text-right" id="idCon">아이디를 입력하세요.</p><!-- 아이디가 없을경우 -->
		         <p class="text-right" id="passCon">비밀번호를 입력하세요.</p><!-- 비밀번호가 없을경우 -->
		         <p class="text-right" id="idPassCon">가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.</p><!-- 비밀번호가 없을경우 -->
		<button type="button" class="btn btn-dark" id="loginBtn" >로그인</button>
		<div style="text-align:center; width: 300px;">
		아이디가 없으신가요? <a href="agreement.do" style="color: #141A1D; ">   회원 가입</a><br/>
		<a href="find_id_pass_frm.do" style="color: #141A1D; ">아이디 또는 비밀번호를 잊으셨나요?</a>
		</div>
	</div>
	</div>
</form>
</div>

<div id="footer">
 <c:import url="/WEB-INF/views/common_d/footer.jsp"/>
</div>

</div>




</body>
</html>