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
<link rel="stylesheet" type="text/css" href="http://localhost:8080/jsp_prj/common/css/main.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Staatliches&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">

<style type="text/css">
	@font-face { font-family: 'Eoe_Zno_EB'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/Eoe_Zno_EB.woff') format('woff'); font-weight: normal; font-style: normal; }
	@font-face { font-family: 'GoyangIlsan'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff') format('woff'); font-weight: bold; font-style: normal; }
	/* 헤더시작 */
	#header{width: 500px; min-height: 80px;  margin-left: auto; margin-right: auto; padding-top: 30px; padding-bottom: 30px }
	#hContent{width: 370px; margin-left: auto; margin-right: auto; }
	#hTitle{font-family:'Staatliches', cursive; color: #333C50 ;font-size: 65px; }
	#hLogo{  padding-bottom:8px ;width: 65px; height: 72px ; }
	

	/* 헤더끝 */
	/* 컨테이너 시작 */
	#coffeWrap{height: 100vh;}
	#containerJ{width:600px ; margin-left: auto; margin-right: auto;margin-bottom: 3%;}
	#containerSignup{min-height: 800px; width: 500px;  margin-left: auto; margin-right: auto; }
	.input-group-text{
	background-color: #D5CEC6;
	}
	.divider-text {
    position: relative;
    text-align: center;
    margin-top: 15px;
    margin-bottom: 15px;
	}
	.divider-text span {
    padding: 7px;
    font-size: 12px;
    position: relative;   
    z-index: 2;
	}
	.divider-text:after {
    content: "";
    position: absolute;
    width: 100%;
    border-bottom: 1px solid #ddd;
    top: 55%;
    left: 0;
    z-index: 1;
	}
	.form-control{
	height: 50px;
	}
	.form-group {
	margin-bottom: 0.5rem;
	}
	.custom-select{
	height: 50px;
	}
	.btn-dark{
	background-color: #494342;
	}
	.btn-dark:hover{
	background-color: #A9A19B;
	border-color: #D5CEC6;
	color:#141A1D ;
	}
	p{
	margin-bottom: .5rem;
	}
	/* 컨테이너 끝 */
	 /* 푸터 시작 */

 
   /* 푸터 끝 */
	#idCon,#idCon1,#passCon1,#passCon3,#passCon2,#nickCon,#nameCon,#nameCon1,#nickCon1,#birthCon1,
	#mailCon,#mailCon1,#phoneCon,#phoneCon1,#birthCon,#cardCon5,#cardCon6,
	#cardCon1,#cardCon2,#cardCon3,#cardCon4,#birthCon1,
	#idCon2
	{color:#FF0000; font-weight: bold; display: none; }
	#idCon4{color:blue; font-weight: bold; display: none;}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript">

window.history.forward();

function noBack() {

	window.history.forward();

}

$(function() {
	$('#email3').change(function(){
		$("#email3 option:selected").each(function () {
			if($(this).val()=='직접입력'){ //직접입력일 경우
				$("#email2").val(""); //값 초기화 
				$("#email2").attr("disabled",false); //활성화 
				}else{ 
					//직접입력이 아닐경우 
					$("#email2").val($(this).text()); //선택값 입력 
					$("#email2").attr("disabled",true); //비활성화
					} 
			}); 
	});//이메일 값 넘기기
	
	$("#btnComJoin").click(function () {
		if($("#id").val().trim()==""){
			$("#idCon2").show().fadeOut(3000);
			$("#id").focus();
			return;
		}else if($("#pass").val().trim()==""){
			$("#passCon3").show().fadeOut(3000);
			$("#pass").focus();
			return;
		}else if($("#pass1").val().trim()==""){
			$("#pass1").focus();
			return;
		}else if($("#nickName").val().trim()==""){
			$("#nickCon1").show().fadeOut(3000);
			$("#nickName").focus();
			return;
		}else if($("#cName").val().trim()==""){
			$("#nameCon1").show().fadeOut(3000);
			$("#cName").focus();
			return;
		}else if($("#email1").val().trim()==""){
			$("#mailCon1").show().fadeOut(3000);
			$("#email1").focus();
			return false;
 		}else if($("#email3").val()=='직접입력'){
			$("#mailCon1").show().fadeOut(3000);
			$("#email3").focus();
			return false; 
		}else if($("#phone").val().trim()==""){
			$("#phoneCon1").show().fadeOut(3000);
			$("#phone").focus();
			return false;
		}else if($("#bYear").val()=='년도'){
			$("#birthCon1").show().fadeOut(3000);
			$("#bYear").focus();
			return false;
		}else if($("#bMonth").val()=='월'){
			$("#birthCon1").show().fadeOut(3000);
			$("#bMonth").focus();
			return false;
		}else if($("#bDay").val()=='일'){
			$("#birthCon1").show().fadeOut(3000);
			$("#bDay").focus();
			return false;
		}else if($("#phone").val().trim()==""){
			$("#phoneCon1").show().fadeOut(3000);
			$("#phone").focus();
			return false;
		}else if($("#phone").val().trim()==""){
			$("#phoneCon1").show().fadeOut(3000);
			$("#phone").focus();
			return false;
		}else if($("#cardNum1").val().trim()==""){
			$("#cardCon5").show().fadeOut(3000);
			$("#cardNum1").focus();
			return false;
		}else if($("#cardNum2").val().trim()==""){
			$("#cardCon5").show().fadeOut(3000);
			$("#cardNum2").focus();
			return false;
		}else if($("#cardNum3").val().trim()==""){
			$("#cardCon5").show().fadeOut(3000);
			$("#cardNum3").focus();
			return false;
		}else if($("#cardNum4").val().trim()==""){
			$("#cardCon5").show().fadeOut(3000);
			$("#cardNum4").focus();
			return false;
		}else if($("#cardList").val()=='카드사 선택'){
			$("#cardCon2").show().fadeOut(3000);
			$("#cardList").focus();
			return false;
		}else if($("#cMonth").val()=='MM'){
			$("#cardCon6").show().fadeOut(3000);
			$("#cMonth").focus();
			return false;
		}else if($("#cYear").val()=='YY'){
			$("#cardCon6").show().fadeOut(3000);
			$("#cYear").focus();
			return false;
		}else if($("#cvc").val()==''){
			$("#cardCon6").show().fadeOut(3000);
			$("#cvc").focus();
			return false;
		}
		var email = $("#email1").val()+"@"+$("#email2").val();
		$("#email").val(email);
			 
	
		var birth = $("#bYear").val()+$("#bMonth").val()+$("#bDay").val();	 
		$("#birth").val(birth);
		
		alert("회원가입이 완료되었습니다.");
		$("#signUpFrm").submit();
		
		
		});
			
		var chkEN= RegExp(/^[a-zA-Z0-9]{4,12}$/);
		var chkName= RegExp(/^[가-힣]+$/);
		var chkPass = RegExp(/^(?=.*?[A-Za-z])(?=.*?[0-9]).{8,}$/);
		var chkNick= RegExp(/^[가-힣a-zA-Z0-9]{2,12}$/);
		var chkEmail= RegExp(/^[A-Za-z0-9_\.\-]+$/);
		var chkEmail2= RegExp(/^[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		var chkCard= RegExp(/^[0-9]{4}$/);
		var chkPhone = RegExp(/^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/);
		var chkCvc= RegExp(/^[0-9]{3}$/);
		
		 $("#id").focusout(function(){
		var chkEN= RegExp(/^[a-zA-Z0-9]{4,12}$/);

			$.ajax({
				url:"idChk.do",
				type:"get",
				data:"id="+$("#id").val(),
				dataType:"json",
				success: function (json) {
					var temp=$("#id").val();
					if (json.idChk_flag && temp.length>3 && temp.length<13 && chkEN.test($("#id").val())) {
						$("#idCon4").show().fadeOut(3000);
					}else if(!chkEN.test($("#id").val())){
						$("#idCon1").show().fadeOut(3000);
						$("#id").val("");
						$("#id").focus();
						return ;
					}else{
						$("#idCon").show().fadeOut(3000);
						$("#id").val("").focus();
						return ;
					}
				},
				error: function (xhr) {
					alert("문제가 발생했습니다. 잠시후 다시 시도해 주세요.");
				}
			});
		
		});//* 아이디 특문 글자수 확인 */
		
		 $("#pass1").focusout(function(){
			 
			if(!chkPass.test($("#pass1").val()) ){
				$("#passCon1").show().fadeOut(3000);
				$("#pass").val("").focus();
				$("#pass1").val("");
				return;
			}
			if($("#pass").val()!=($("#pass1").val())){
				$("#passCon2").show().fadeOut(3000);
				$("#pass").val("");
				$("#pass").focus();
			}
		});//* 비밀번호 확인 길이특문 확인  */ 

		 $("#pass").focusout(function(){
			if($("#pass1").val() !=""){ 
			 if($("#pass").val()!=($("#pass1").val())){
					$("#passCon2").show().fadeOut(3000);
					$("#pass1").val("");
					$("#pass1").focus();
				}
			}
			 
			if(!chkPass.test($("#pass").val())){
				$("#passCon1").show().fadeOut(3000);
				$("#pass").val("").focus();
				$("#pass1").val("");
				return;
			}
			
		});//* 비밀번호길이특문 확인  */ 

		
		 $("#nickName").focusout(function(){
			if(!chkNick.test($("#nickName").val())){
				$("#nickCon").show().fadeOut(3000);
				$("#nickName").val("").focus();
				return;
			}
		});//* 닉네임특문확인 */
		
		 $("#cName").focusout(function(){
			if(!chkName.test($("#cName").val())){
				$("#nameCon").show().fadeOut(3000);
				$("#cName").val("");
				$("#cName").focus();
				return;
			}
		});//* 이름특문확인 */
		
		 $("#email1").focusout(function(){
			if(!chkEmail.test($("#email1").val())){
				$("#mailCon").show().fadeOut(3000);
				$("#email1").val("").focus();
				return;
			}
		});//* 이메일형식확인 */
		 $("#email2").focusout(function(){
			if(!chkEmail2.test($("#email2").val())){
				$("#mailCon").show().fadeOut(3000);
				$("#email2").val("").focus();	
				return;
			}
		});//* 이메일형식확인 */
		
		 $("#phone").focusout(function(){
			if(!chkPhone.test($("#phone").val())){
				$("#phoneCon").show().fadeOut(3000);
				$("#phone").val("").focus();
				return;
			}
		});//* 전화형식확인 */
		
		/* 생년월일 *//////////////////////////////////
		var date= new Date();
		var year="";
		var op_year= date.getFullYear();
		//		년
		$("#bYear").append("<option>년도</option>");
		for (var i = (op_year); i >= (op_year-70); i--) {
			$("#bYear").append("<option value='"+i+"'>"+i+"</option>");
		}
		//		월
		var month= "";
		$("#bMonth").append("<option>월</option>");
		for (var m = 1; m <= 12; m++) {
			$("#bMonth").append("<option value='"+m+"'>"+m+"</option>")
		}
		
		
		$("#bDay").append("<option>일</option>");
		for (var d = 1; d <= 31; d++) {
			$("#bDay").append("<option value='"+d+"'>"+d+"</option>")
		}
		/* 생년월일 *//////////////////////////////
		
		/* 카드번호 형식 확인 *///////////////////////////////////////////////////
		 $("#cardNum1").focusout(function(){
			if(!chkCard.test($("#cardNum1").val())){
				$("#cardCon4").show().fadeOut(3000);
				$("#cardNum1").val("").focus();		
				return;
			}
		});//* 카드번호형식확인 */
		 $("#cardNum2").focusout(function(){
			if(!chkCard.test($("#cardNum2").val())){
				$("#cardCon4").show().fadeOut(3000);
				$("#cardNum2").val("").focus();		
				return;
			}
		});//* 카드번호형식확인 */
		 $("#cardNum3").focusout(function(){
			if(!chkCard.test($("#cardNum3").val())){
				$("#cardCon4").show().fadeOut(3000);
				$("#cardNum3").val("").focus();		
				return;
			}
		});//* 카드번호형식확인 */
		 $("#cardNum4").focusout(function(){
			if(!chkCard.test($("#cardNum4").val())){
				$("#cardCon4").show().fadeOut(3000);
				$("#cardNum4").val("").focus();	
				return;
			}
		});//* 카드번호형식확인 */
		
		
		$("#cYear").append("<option>YY</option>");
		/* var c_year=  */
		
		 var c_year= parseInt((op_year+"").substring(2,4));
		
		for (var c = (c_year); c <=(c_year+6);c++) {
			$("#cYear").append("<option value='"+c+"'>"+c+"</option>");
		}
		
		//		월
		var month="";
		$("#cMonth").append("<option>MM</option>");
		for (var m = 1; m <= 12; m++) {
			$("#cMonth").append("<option value='"+m+"'>"+m+"</option>")
		}
		
		// cvc cardCon3
		 $("#cvc").focusout(function(){
			if(!chkCvc.test($("#cvc").val())){
				$("#cardCon3").show().fadeOut(3000);
				$("#cvc").val("").focus();		
				return;
			}
		});//* 카드번호형식확인 */
		
		/* 카드번호 형식 확인 */	////////////////////////////////////////
		
	
		
});
</script>
</head>
<body style="background-color: #F0F0E1">
<div id="coffeWrap" style="background-color: #F0F0E1">
<div id="containerJ">
<div id="header">
	<div id="hContent" >
	  <a id="hTitle" class="navbar-brand" href="/final_prj/index.do" >
	    <img id="hLogo" src="http://localhost:8080/final_prj/common/memberImg/logo.png" class="d-inline-block align-center" alt="" >
	    Yul's Coffee  
	  </a>
	</div>   
</div>
<div id="containerSignup">
<form action="signup_process.do" id="signUpFrm" method="post">

	<div class="form-group input-group" ><!-- 아이디가 이미 있을경우 alert -->
		<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/memberImg/s_id.png" style="width: 35px">
		    </span>
		 </div>
        <input name="m_id" id="id" class="form-control" placeholder="아이디" type="text" maxlength="20">
    </div> <!-- form-group// -->
         <p class="text-right" id="idCon">이미 사용중이거나 탈퇴한 아이디입니다.  </p><!-- 아이디가 이미 있을경우 alert -->
         <p class="text-right" id="idCon4">사용 가능한 아이디 입니다. </p><!-- 아이디가 이미 있을경우 alert -->
         <p class="text-right" id="idCon1">아이디는 특수문자(4글자 이하 12글자 이상)를 사용할 수 없습니다. </p><!-- 아이디가 이미 있을경우 alert -->
         <p class="text-right" id="idCon2">아이디는 필수 입력 사항입니다. </p><!-- 아이디가 이미 있을경우 alert -->

    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/memberImg/s_password.png" style="width: 35px">
		     </span>
		</div>
        <input class="form-control" name="m_pass" id="pass" placeholder="비밀번호" type="password" maxlength="20">
    </div> <!-- form-group// -->
         <p class="text-right" id="passCon1">숫자,영문자가 한자리 이상 들어간 조합으로 8자리 이상 사용해야 합니다. </p><!-- 아이디가 이미 있을경우 alert -->
         <p class="text-right" id="passCon3">비밀번호는 필수 입력 사항입니다. </p><!-- 아이디가 이미 있을경우 alert -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		   <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/memberImg/s_password.png" style="width: 35px">
		    </span>
		</div>
        <input id="pass1" class="form-control" placeholder="비밀번호 확인" type="password" maxlength="20">
    </div> <!-- form-group// -->                                      
         <p class="text-right" id="passCon2">비밀번호가 일치하지 않습니다. </p><!-- 아이디가 이미 있을경우 alert -->
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text">
		    	<img src="http://localhost:8080/final_prj/common/memberImg/s_nickname.png" style="width: 35px">
		     </span>
		 </div>
        <input name="m_nick" id="nickName" class="form-control" placeholder="닉네임" type="text" maxlength="10">
    </div> <!-- form-group// -->
         <p class="text-right" id="nickCon">특수문자는 사용하실 수 없습니다.</p><!-- 아이디가 이미 있을경우 alert -->
         <p class="text-right" id="nickCon1">닉네임은 필수 입력 사항입니다.</p><!-- 아이디가 이미 있을경우 alert -->
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/memberImg/s_name.png" style="width: 35px">
		   </span>
		 </div>
        <input name="m_name" id="cName" class="form-control" placeholder="이름" type="text" maxlength="20">
    </div> <!-- form-group// -->
         <p class="text-right" id="nameCon">이름은 한글만 입력하실 수 있습니다.</p><!-- 아이디가 이미 있을경우 alert -->
         <p class="text-right" id="nameCon1">이름은 필수 입력 사항입니다.</p><!-- 아이디가 이미 있을경우 alert -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		   <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/memberImg/s_email.png" style="width: 35px">
		   </span>
		 </div>
        <input name="email1" id="email1" class="form-control" placeholder="이메일" type="email">
        	<span style="font-size: 30px">@</span>
        <input name="email2" id="email2"  class="form-control" placeholder="직접입력" type="email">
		<select class="custom-select" name="email3" id="email3"  style="max-width: 200px; ">
		    <option selected="selected" >직접입력</option>
		    <option value="1">daum.com</option>
		    <option value="2">naver.com</option>
		    <option value="3">gmail.com</option>
		</select>
		<input type="hidden" name="m_email" id="email">
    </div> <!-- form-group// -->
         <p class="text-right" id="mailCon">이메일 형식대식대로 작성해주세요</p><!-- 이메일가 -->
         <p class="text-right" id="mailCon1">이메일은 필수 입력 사항입니다.</p><!-- 이메일가 -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/memberImg/s_phon.png" style="width: 35px">
		  </span>
		</div>
    	<input name="m_phone" id="phone" class="form-control" placeholder="핸드폰번호 (ex) 010-0000-0000" type="text" maxlength="13">
    </div> <!-- form-group// -->
         <p class="text-right" id="phoneCon">전화번호 형식을 지켜주세요.</p><!-- 아이디가 이미 있을경우 alert -->
         <p class="text-right" id="phoneCon1">전화번호는 필수 입력 사항입니다.</p><!-- 아이디가 이미 있을경우 alert -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/memberImg/s_gender.png" style="width: 35px">
		    </span>
		</div>
		<select class="custom-select" style="max-width: 500px;" name="m_gender">
		    <option selected="selected" value="n">성별</option>
		    <option value="F">여자</option>
		    <option value="M">남자</option>
		</select>
    </div> <!-- form-group// -->
		<label >생년월일</label>
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/memberImg/s_birth.png" style="width: 35px">
		     </span>
		</div>
		<select class="form-control" id="bYear" name="bYear">
		</select>
		<select class="form-control" id="bMonth" name="bMonth">
		</select>
		<select class="form-control" id="bDay" name="bDay">
		</select>
		<input type="hidden" name="m_birth" id="birth">
	</div> <!-- form-group end.// -->
         <p class="text-right" id="birthCon">생년월일은 필수 입력 사항입니다.</p><!-- 아이디가 이미 있을경우 alert -->
         <p class="text-right" id="birthCon1">생년월일은 필수 입력 사항입니다.</p><!-- 아이디가 이미 있을경우 alert -->

	<div class="form-group">
	<label for="cardNumber">카드번호</label>
	<div class="input-group">
		<div class="input-group-prepend">
			<span class="input-group-text"><img src="http://localhost:8080/final_prj/common/memberImg/s_card.png" style="width: 35px"></span>
		</div>
		 <input name="card_num1" id="cardNum1" class="form-control" placeholder="" type="text" maxlength="4">
        <input name="card_num2" id="cardNum2" class="form-control" placeholder="" type="text" maxlength="4">
         <input name="card_num3" id="cardNum3" class="form-control" placeholder="" type="text" maxlength="4">
          <input name="card_num4" id="cardNum4" class="form-control" placeholder="" type="text" maxlength="4">
	</div> <!-- input-group.// -->
	         <p class="text-right" id="cardCon1">카드번호는 필수 입력 사항입니다.</p><!-- 카드번호 -->
	         <p class="text-right" id="cardCon4">카드번호는 숫자(4자)만 입력하실 수 있습니다.</p><!-- 카드번호 -->
	         <p class="text-right" id="cardCon5">카드번호는 필수 입력 사항입니다.</p><!-- 카드번호 -->
	</div> <!-- form-group.// -->
		 <div class="form-group input-group">
		<select class="custom-select" id="cardList" name="com_name">
		    <option selected="selected">카드사 선택</option>
			<c:forEach var="COM_NAME" items="${cardData}">
			<option value="${COM_NAME}"><c:out value="${COM_NAME}"/></option>
			</c:forEach>
		</select>
    </div> <!-- form-group// -->
	         <p class="text-right" id="cardCon2">카드사는 필수 선택 사항입니다.</p><!-- 아이디가 이미 있을경우 alert -->
	<div class="row">
	    <div class="col-sm-8">
	        <div class="form-group">
	            <label><span class="hidden-xs">유효기간</span> </label>
	        	<div class="form-inline">
	        		<select class="form-control" id="cMonth" name="card_month" style="width:45%">
					</select>
		            <span style="width:10%; text-align: center" > / </span>
		            <select class="form-control" id="cYear" name="card_year" style="width:45%">
					</select>
	        	</div>
	        </div>
	    </div>
	    <div class="col-sm-4">
	        <div class="form-group">
	            <label data-toggle="tooltip" data-original-title="3 digits code on back side of the card">cvc <i class="fa fa-question-circle"></i></label>
	            <input class="form-control" name="card_cvc" required="" type="text" maxlength="3" id="cvc">
	        </div> <!-- form-group.// -->
	        </div>
	         <p class="text-right" id="cardCon3">cvc는 숫자(3자)를 입력해야 합니다.</p><!-- 아이디가 이미 있을경우 alert -->
	         <p class="text-right" id="cardCon6">유효기간(cvc)은 필수 입력 사항입니다.</p><!-- 아이디가 이미 있을경우 alert -->
	    </div><!-- row.// -->
    <div class="form-group">
        <button type="button" id="btnComJoin" name="btnComJoin" class="btn btn-dark btn-block"> 회원가입  </button>
    </div> <!-- form-group// -->      
	</form>
	</div> 
    <p class="text-center">이미 회원이신가요? <a href="login.do">로그인</a> </p>                                                                 
</div>


</div>




</body>
</html>