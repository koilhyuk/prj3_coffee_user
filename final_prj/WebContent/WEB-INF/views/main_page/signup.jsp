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
	#containerJ{width:600px ; margin-left: auto; margin-right: auto;}
	#containerSignup{min-height: 850px; width: 500px;  margin-left: auto; margin-right: auto;}
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
		
		$('#email3').change(function(){
			$("#email3 option:selected").each(function () {
				if($(this).val()== '1'){ //직접입력일 경우
					$("#email2").val(''); //값 초기화 
					$("#email2").attr("disabled",false); //활성화
					}else{ 
						//직접입력이 아닐경우 
						$("#email2").val($(this).text()); //선택값 입력 
						$("#email2").attr("disabled",true); //비활성화
						} 
				}); 
			});

			
		
});
</script>
</head>
<body style="background-color: #F0F0E1">
<div id="coffeWrap" style="background-color: #F0F0E1">
<div id="containerJ">
<div id="header">
	<div id="hContent" >
	  <a id="hTitle" class="navbar-brand" href="#" >
	    <img id="hLogo" src="images/logo.png" class="d-inline-block align-center" alt="" >
	    Yul's Coffee  
	  </a>
	</div>   
</div>
<div id="containerSignup">
<form>

	<div class="form-group input-group" ><!-- 아이디가 이미 있을경우 alert -->
		<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="images/s_id.png" style="width: 35px">
		    </span>
		 </div>
        <input name="id" class="form-control" placeholder="아이디" type="text" maxlength="20">
    </div> <!-- form-group// -->
         <p class="text-right" style="margin-bottom: 1%">이미 사용중이거나 탈퇴한 아이디입니다.  </p><!-- 아이디가 이미 있을경우 alert -->

    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="images/s_password.png" style="width: 35px">
		     </span>
		</div>
        <input class="form-control" placeholder="비밀번호" type="password" maxlength="20">
    </div> <!-- form-group// -->
         <p class="text-right" style="margin-bottom: 1%">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요. </p><!-- 아이디가 이미 있을경우 alert -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		   <span class="input-group-text"> 
		    	<img src="images/s_password.png" style="width: 35px">
		    </span>
		</div>
        <input class="form-control" placeholder="비밀번호 확인" type="password" maxlength="20">
    </div> <!-- form-group// -->                                      
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text">
		    	<img src="images/s_nickname.png" style="width: 35px">
		     </span>
		 </div>
        <input name="nickName" class="form-control" placeholder="닉네임" type="text" maxlength="10">
    </div> <!-- form-group// -->
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="images/s_name.png" style="width: 35px">
		   </span>
		 </div>
        <input name="cName" class="form-control" placeholder="이름" type="text" maxlength="20">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		   <span class="input-group-text"> 
		    	<img src="images/s_email.png" style="width: 35px">
		   </span>
		 </div>
        <input name="email1" class="form-control" placeholder="이메일" type="email">
        	<span style="font-size: 30px">@</span>
        <input name="email2" class="form-control" placeholder="직접입력" type="email">
		<select class="custom-select" id="email3" style="max-width: 200px; ">
		    <option selected="">직접입력</option>
		    <option value="1">daum.com</option>
		    <option value="2">naver.com</option>
		    <option value="3">gmail.com</option>
		</select>
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="images/s_phon.png" style="width: 35px">
		  </span>
		</div>
		<select class="custom-select" style="max-width: 120px;">
		    <option selected="">010</option>
		    <option value="1">011</option>
		</select>
    	<input name="" class="form-control" placeholder="핸드폰번호 (ex) 0000-0000" type="text">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="images/s_gender.png" style="width: 35px">
		    </span>
		</div>
		<select class="custom-select" style="max-width: 500px;">
		    <option selected="">성별</option>
		    <option value="1">여자</option>
		    <option value="2">남자</option>
		</select>
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="images/s_birth.png" style="width: 35px">
		     </span>
		</div>
		<select class="form-control">
			<option selected=""> 년</option>
			<option>2019</option>
		</select>
		<select class="form-control">
			<option selected="">월</option>
			<option>1</option>
		</select>
		<select class="form-control">
			<option selected="">일</option>
			<option>1</option>
		</select>
	</div> <!-- form-group end.// -->


	<div class="form-group">
	<label for="cardNumber">카드번호</label>
	<div class="input-group">
		<div class="input-group-prepend">
			<span class="input-group-text"><img src="images/s_card.png" style="width: 35px"></span>
		</div>
		 <input name="cardNum1" class="form-control" placeholder="" type="text">
        <input name="cardNum2" class="form-control" placeholder="" type="text">
         <input name="cardNum3" class="form-control" placeholder="" type="text">
          <input name="cardNum4" class="form-control" placeholder="" type="text">
	</div> <!-- input-group.// -->
	</div> <!-- form-group.// -->
		 <div class="form-group input-group">
		<select class="custom-select" id="cardC">
		    <option selected="selected">카드사 선택</option>
		    <option value="1">국민카드</option>
		    <option value="2">우리카드</option>
		    <option value="3">신한카드</option>
		</select>
    </div> <!-- form-group// -->
	
	<div class="row">
	    <div class="col-sm-8">
	        <div class="form-group">
	            <label><span class="hidden-xs">유효기간</span> </label>
	        	<div class="form-inline">
	        		<select class="form-control" style="width:45%">
					  <option>MM</option>
					  <option>01 - Janiary</option>
					  <option>02 - February</option>
					  <option>03 - February</option>
					</select>
		            <span style="width:10%; text-align: center"> / </span>
		            <select class="form-control" style="width:45%">
					  <option>YY</option>
					  <option>2018</option>
					  <option>2019</option>
					</select>
	        	</div>
	        </div>
	    </div>
	    <div class="col-sm-4">
	        <div class="form-group">
	            <label data-toggle="tooltip" title="" data-original-title="3 digits code on back side of the card">CVV <i class="fa fa-question-circle"></i></label>
	            <input class="form-control" required="" type="text">
	        </div> <!-- form-group.// -->
	    </div>
	</div> <!-- row.// -->
    <div class="form-group">
        <button type="submit" class="btn btn-dark btn-block"> 회원가입  </button>
    </div> <!-- form-group// -->      
    <p class="text-center">이미 회원이신가요? <a href="#void">로그인</a> </p>                                                                 
</form>
</div>


</div>
</div>




</body>
</html>