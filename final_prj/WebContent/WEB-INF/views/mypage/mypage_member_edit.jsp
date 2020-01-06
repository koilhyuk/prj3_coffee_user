<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Staatliches&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">
<style type="text/css">
	/* 사이드메뉴 시작 */
	@import url("http://localhost:8080/final_prj/common/header_footer.css");
	@import url("http://localhost:8080/final_prj/common/side_menu.css");
	/* 사이드메뉴 끝 */
	
	/* 컨테이너 시작 */
		#container{min-height: 800px;
		margin-top: 2%;
		margin-bottom: 3%;
		margin-left: auto;
		margin-right: auto;
		max-width: 1200px;
		}
	#mainView{width: 900px; float:right; min-height: 800px;}
	.imgSize{height: 40px}
	/* 컨테이너 끝 */
	@import url("http://localhost:8080/final_prj/common/member_edit.css");
	html,body{
    margin:0; padding:0;
    width:100%; height:100%
	}
	#class4Wrap{
    display: flex;
    min-height: 100vh;
    flex-direction: column;
	}
	#container{
	    flex: 1;
	}
	/* footer시작 */
	#footer{clear:both;}
	/* footer끝 */
	
	#idCon,#idCon1,#passCon1,#passCon3,#passCon2,#nickCon,#nameCon,#nameCon1,#nickCon1,#birthCon1,
	#mailCon,#mailCon1,#phoneCon,#phoneCon1,#birthCon,#cardCon5,#cardCon6,
	#cardCon1,#cardCon2,#cardCon3,#cardCon4,#birthCon1,
	#idCon2
	{color:#FF0000; font-weight: bold; display: none; }
	#idCon4{color:blue; font-weight: bold; display: none;}
	
	#order_title{margin-top: 25px;padding-left: 25px; font-size: 40px;  margin-bottom: 30px; font-family: locus_sangsang; border-left: 5px solid #DBDBDF;}
	#orderCalc{max-width : 800px; height:80px;font-size: 25px;  background-color: #DBDBDF; padding-top: 2%;padding-bottom: 2%; margin-left: 10%; font-family: Eoe_Zno_EB}
	.calcContent{float: right;width : 400px ;text-align: center;font-size: 25px; font-weight: bold; text-align: center;}
	#editTable{margin-left: 10%; margin-top: 30px; width: 600px; font-family: GoyangIlsan} 
	.form-control{
	height: 50px
	}
	#id{border-radius: 18px; border: 2px solid #609;}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript">
$(function() {
	$('[data-toggle="tooltip"]').tooltip();
	
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
		if($("#pass").val()==null){
			$("#pass").val()
		}

		var email = $("#email1").val()+"@"+$("#email2").val();
		$("#email").val(email);
			 
	
		var birth = $("#bYear").val()+$("#bMonth").val()+$("#bDay").val();	 
		$("#birth").val(birth);
		
		alert("회원 정보 수정이 완료되었습니다.");
		$("#memberUpdate").submit();
		
		
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
		
});
</script>
</head>
<body>
<div id="class4Wrap">
	
<div id="header">
	<c:import url="/WEB-INF/views/common_d/header_login.jsp"/>
</div><!-- header -->

<div id="container" >
<div id="mypageSide" class="menuFont">
	<jsp:include page="mypage_menu.jsp"/>
</div>
<div id="mainView">
<div id="order_title">
회원 정보 변경
</div>

<div id="editTable" >
<%-- <c:import url="/WEB-INF/views/mypage/member_edit.jsp"/> --%>
<div id="containerSignupdate">
<form action="member_edit_process.do" id=memberUpdate method="post">

	<div class="form-group input-group" ><!-- 아이디가 이미 있을경우 alert -->
		<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/images/s_id.png" style="width: 35px">
		    </span>
		 </div>
        <input name="m_id" class="form-control" value="${sessionScope.id}" readonly="readonly" type="text" maxlength="20">
    </div> <!-- form-group// -->
    	<p class="text-right" id="idCon">이미 사용중이거나 탈퇴한 아이디입니다.  </p><!-- 아이디가 이미 있을경우 alert -->
         <p class="text-right" id="idCon4">사용 가능한 아이디 입니다. </p><!-- 아이디가 이미 있을경우 alert -->
         <p class="text-right" id="idCon1">아이디는 특수문자(4글자 이하 12글자 이상)를 사용할 수 없습니다. </p><!-- 아이디가 이미 있을경우 alert -->
         <p class="text-right" id="idCon2">아이디는 필수 입력 사항입니다. </p><!-- 아이디가 이미 있을경우 alert -->

    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/images/s_password.png" style="width: 35px">
		     </span>
		</div>
        <input class="form-control" name="m_pass" id="pass" placeholder="비밀번호" type="password" maxlength="20">
        <input type="hidden" id="hiddenPass" >
    </div> <!-- form-group// -->
    <p class="text-right" id="passCon1">숫자,영문자가 한자리 이상 들어간 조합으로 8자리 이상 사용해야 합니다. </p><!-- 아이디가 이미 있을경우 alert -->
         <p class="text-right" id="passCon3">비밀번호는 필수 입력 사항입니다. </p><!-- 아이디가 이미 있을경우 alert -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		   <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/images/s_password.png" style="width: 35px">
		    </span>
		</div>
        <input class="form-control" placeholder="비밀번호 확인" type="password" maxlength="20">
    </div> <!-- form-group// -->      
     <p class="text-right" id="passCon2">비밀번호가 일치하지 않습니다. </p>    
                               
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text">
		    	<img src="http://localhost:8080/final_prj/common/images/s_nickname.png" style="width: 35px">
		     </span>
		 </div>
        <input name="m_nick" id="nickName" class="form-control" placeholder="닉네임"  value="${memberDomain.nick }" type="text" maxlength="10">
    </div> <!-- form-group// -->
    	 <p class="text-right" id="nickCon">특수문자는 사용하실 수 없습니다.</p><!-- 아이디가 이미 있을경우 alert -->
         <p class="text-right" id="nickCon1">닉네임은 필수 입력 사항입니다.</p><!-- 아이디가 이미 있을경우 alert -->
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/images/s_name.png" style="width: 35px">
		   </span>
		 </div>
        <input name="m_name" id="cName" class="form-control" value="${memberDomain.name}" readonly="readonly" type="text" maxlength="20">
    </div> <!-- form-group// -->
    	<p class="text-right" id="nameCon">이름은 한글만 입력하실 수 있습니다.</p><!-- 아이디가 이미 있을경우 alert -->
        <p class="text-right" id="nameCon1">이름은 필수 입력 사항입니다.</p><!-- 아이디가 이미 있을경우 alert -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		   <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/images/s_email.png" style="width: 35px">
		   </span>
		 </div>
        <input name="email1" id="email1" class="form-control" placeholder="이메일" value="${emailId}"type="email" value="">
        	<span style="font-size: 30px">@</span>
        <input name="email2" id="email2" class="form-control" readonly="readonly" placeholder="직접입력" value="${emailDomain}" type="email">
		<select class="custom-select" name="email3" id="email3" style="max-width: 200px; ">
		    <option selected="selected">직접입력</option>
		    <option value="1"${emailDomain eq 'daum.com'? 'selected':'' }>daum.com</option>
		    <option value="2"${emailDomain eq 'naver.com'? 'selected':'' }>naver.com</option>
		    <option value="3"${emailDomain eq 'gmail.com'? 'selected':'' }>gmail.com</option>
		</select>
		<input type="hidden" name="m_email" id="email">
    </div> <!-- form-group// -->
    	<p class="text-right" id="mailCon">이메일 형식대식대로 작성해주세요</p><!-- 이메일가 -->
        <p class="text-right" id="mailCon1">이메일은 필수 입력 사항입니다.</p><!-- 이메일가 -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/images/s_phon.png" style="width: 35px">
		  </span>
		</div>
		<input name="m_phone" id="phone" class="form-control" placeholder="핸드폰번호 (ex) 010-0000-0000" value="${memberDomain.phone}" type="text" maxlength="13">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/images/s_gender.png" style="width: 35px">
		    </span>
		</div>
		<select class="custom-select" style="max-width: 500px;" name="m_gender">
		    <option selected="selected" value="n">성별</option>
		    <option value="F"${memberDomain.gender eq 'F'? 'selected':'' }>여자</option>
		    <option value="M"${memberDomain.gender eq 'M'? 'selected':'' }>남자</option>
		</select>
    </div> <!-- form-group// -->
    <label >생년월일</label>
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/images/s_birth.png" style="width: 35px">
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
       <button type="button" id="btnComJoin" name="btnComJoin" class="btn btn-dark btn-block">정보 수정</button>
    </div> <!-- form-group// -->      
	</form>
	</div>
</div>

</div>

</div><!-- container DIV end -->

<div id="footer">
	<c:import url="/WEB-INF/views/common_d/footer.jsp"/>

</div>

</div><!-- wrap -->

</body>
</html>