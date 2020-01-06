<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
%>
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
	#header{width: 500px; min-height: 80px;  margin-left: auto; margin-right: auto; padding-top: 50px; padding-bottom: 30px ;}
	#hContent{width: 370px; margin-left: auto; margin-right: auto; }
	#hTitle{font-family:'Staatliches', cursive; color: #333C50 ;font-size: 65px; }
	#hLogo{  padding-bottom:8px ;width: 65px; height: 72px ; }
	

	/* 헤더끝 */
	/* 컨테이너 시작 */
	#coffeWrap{height: 100vh;}
	#containerFind{ width:800px ; margin-left: auto; margin-right: auto;}
	#containerFindFrm{ }
	
	/* Tabs*/
	section {
	    padding: 60px 0;
	}
	
	section .section-title {
	    text-align: center;
	    color: #007b5e;
	    margin-bottom: 50px;
	    text-transform: uppercase;
	}
	#tabs{
		background: #F0F0E1;
	    /* color: #eee; */
	}
	#tabs h6.section-title{
	    color: #eee;
	}
	
	#tabs .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
	    color: #f3f3f3;
	    background-color: transparent;
	    border-color: transparent transparent #f3f3f3;
	    border-bottom: 4px solid !important;
	    font-size: 20px;
	    font-weight: bold;
	}
	#tabs .nav-tabs .nav-link {
	    border: 1px solid transparent;
	    border-top-left-radius: .25rem;
	    border-top-right-radius: .25rem;
	    color:#494342 ;
	    font-size: 20px;
	}
	.nav-tabs{
		border-bottom: 1px solid #D5CEC6;
	}
	.findFrm{min-width: 800px; padding-left: 10px; padding-right: 10px; padding-top: 50px}
	.btn{
	width: 100%; 
	margin-top:40px;
	margin-bottom: 5%;
	background-color: #494342;
	color: #F0F0E2;
	 font-weight: bold;
	}
	.btn:hover{
	background-color: #A9A19B;
	 color: #141A1D;
	 font-weight: bold;
	 border-color: #D5CEC6;
	}
	.form-control{
	 margin-bottom: 25px;
	}
	.loginfFont{
	font-size: 18px;
	font-weight: bold;
	font-family: 'GoyangIlsan';
	margin-bottom: 5px;
	}

	#pass, #passChk{margin-bottom: 5px;}
	#modifyBtn{ margin-top: 10px;  margin-bottom: 10px;}
	/* 컨테이너 끝 */
	 /* 푸터 시작 */
	
 
   /* 푸터 끝 */
	.findAlert{color:#FF0000; font-weight: bold; display: none; }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript">
$(function() {
	
	 $("#idFindBtn").click(function(){
		
		 $.ajax({
			url:"find_id.do",
			type:"post",
			data:"m_name="+$("#name").val()+"&m_email="+$("#email").val()+"&m_phone="+$("#phone").val(),
			dataType:"json",
			success: function(json) {
				var output="해당 회원정보의 아이디는 존재하지 않습니다.";
				if (json.resultFlag) {
				  output="<strong>"+json.data+"</strong>"
				}
				$("#findIdResult").html(output);
			},
			error: function (xhr) {
				alert("문제가 발생했습니다. 다시 시도 해주세요");
			}
		 });
		 
		 
			if($("#name").val()==""){
				$(".findAlert").show().fadeOut(5000);
				$("#name").focus();
				return ;
			}else if($("#email").val()==""){
				$(".findAlert").show().fadeOut(5000);
				$("#email").focus();
				return ;
			}else if($("#phone").val()==""){
				$(".findAlert").show().fadeOut(5000);
				$("#phone").focus();
				return ;
			}
			$("#findIdModal").modal("show");
			
		
			
		});//* 아이디 찾기 공백 확인 */
		
		
		var chkPass = RegExp(/^(?=.*?[A-Za-z])(?=.*?[0-9]).{8,}$/);
		
		 $("#passChk").focusout(function(){
			 
			if(!chkPass.test($("#passChk").val()) ){
				$("#passCon1").show().fadeOut(5000);
				$("#pass").val("").focus();
				$("#pass1").val("");
				return;
			}
			if($("#pass").val()!=($("#passChk").val())){
				$("#passCon2").show().fadeOut(5000);
				$("#pass").val("");
				$("#pass").focus();
			}
		});//* 비밀번호 확인 길이특문 확인  */ 
		
		 $("#pass").focusout(function(){
				if($("#passChk").val() !=""){ 
				 if($("#pass").val()!=($("#passChk").val())){
						$("#passCon2").show().fadeOut(5000);
						$("#passChk").val("");
						$("#passChk").focus();
					}
				}
				 
				if(!chkPass.test($("#pass").val())){
					$("#passCon1").show().fadeOut(5000);
					$("#pass").val("").focus();
					$("#passChk").val("");
					return;
				}
				
			});//* 비밀번호길이특문 확인  */ 

	 $("#passFindBtn").click(function(){
		 
		 
		 $.ajax({
				url:"find_pass.do",
				type:"post",
				data:"m_name="+$("#nameP").val()+"&m_email="+$("#emailP").val()+"&m_phone="+$("#phoneP").val()+"&m_id="+$("#idP").val(),
				dataType:"json",
				success: function(json) {
					var output="해당 회원정보의 비밀번호를 조회할 수 없습니다.";
					if (json.resultFlag) {
					  output="<strong>"+json.data+"</strong>"
					}
					$("#findPassResult").html(output+"로 이메일이 발송 되었습니다.");
					
					if(json.resultFlag==false){
					$("#findPassResult").html(output);
					location.href="";
					}
					},
				error: function (xhr) {
					alert("문제가 발생했습니다. 다시 시도 해주세요");
				}
			 });
		 
		 
			if($("#nameP").val()==""){
				$(".findAlert").show().fadeOut(5000);
				$("#name").focus();
				return ;
			}else if($("#userId").val()==""){
				$(".findAlert").show().fadeOut(5000);
				$("#userId").focus();
				return ;
			}else if($("#emailP").val()==""){
				$(".findAlert").show().fadeOut(5000);
				$("#emailP").focus();
				return ;
			}else if($("#phoneP").val()==""){
				$(".findAlert").show().fadeOut(5000);
				$("#phoneP").focus();
				return ;
			}
			$("#findPassModal").modal("show");
			 $("#confirmBtn").click(function() {
					
		         window.location.href="find_id_pass_frm.do"
		     });
/* 		 window.location.href="login.do" */

			
	 });//* 비밀번호 찾기 공백 확인 */	
		
		
	 $(".closeF").click(function() {
	
         window.location.href="login.do"
     });
		


			
		
});
</script>
</head>
<body style="background-color: #F0F0E1">
<div id="coffeWrap" style="background-color: #F0F0E1">
<div id="containerFind">
<div id="header">
	<div id="hContent" >
	  <a id="hTitle" class="navbar-brand" href="/final_prj/index.do" >
	    <img id="hLogo" src="http://localhost:8080/final_prj/common/memberImg/logo.png" class="d-inline-block align-center" alt="" >
	    Yul's Coffee  
	  </a>
	</div>   
</div>
<div id="containerFindFrm">
<!-- Tabs -->
<section id="tabs">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 ">
				<nav>
					<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
						<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">아이디 찾기</a>
						<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">비밀번호 찾기</a>
					</div>
				</nav>
				<div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					<form action="" class="findFrm" method="post">
					<p class="loginfFont">이름</p>
						<input class="form-control form-control-lg" type="text" placeholder="이름을 입력하세요." maxlength="20" id="name" name="m_name">
					<p class="loginfFont">이메일</p>
						<input class="form-control form-control-lg" type="text" placeholder="ex) example@example.com" maxlength="20" id="email" name="m_email">
					<p class="loginfFont">전화번호</p>
						<input class="form-control form-control-lg" type="text" placeholder="ex) 010-0000-0000" maxlength="13" id="phone" name="m_phone">
						<p class="findAlert">모든 정보를 입력해 주세요.</p>
						<button type="button" id="idFindBtn" class="btn btn-dark"  >확인</button>
					</form>
					</div>
					<!-- Modal -->
					<div class="modal fade" id="findIdModal" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="findIdModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="findIdModalLabel">아이디 찾기</h5>
					        <button type="button" class="close closeF" data-dismiss="modal" aria-label="Close" >
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body" style="text-align: center">
					       	<span>ID : </span><span id="findIdResult"></span>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-dark closeF" data-dismiss="modal" >Close</button>
					      </div>
					    </div>
					  </div>
					</div>
					
					<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
					<form action="" class="findFrm" method="post">
					<p class="loginfFont">이름</p>
					<input class="form-control form-control-lg" type="text" placeholder="이름을 입력하세요." maxlength="20" id="nameP" name="m_name">
					<p class="loginfFont">아이디</p>
					<input class="form-control form-control-lg" type="text" placeholder="아이디를 입력하세요" maxlength="50" id="idP" name="m_id">
					<p class="loginfFont">이메일</p>
					<input class="form-control form-control-lg" type="text" placeholder="ex) example@example.com" maxlength="20" id="emailP" name="m_email">
					<p class="loginfFont">전화번호</p>
					<input class="form-control form-control-lg" type="text" placeholder="ex) 010-0000-0000" maxlength="13" id="phoneP" name="m_phone">
					<p class="findAlert">모든 정보를 입력해 주세요.</p>
					
					<button type="button" id="passFindBtn"  class="btn btn-dark" >비밀번호 찾기</button>
					</form>
					<!-- Modal -->
					<div class="modal fade" id="findPassModal" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="findPassModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="findPassModalLabel">비밀번호 찾기 </h5>
					        <button type="button" class="close closeF" data-dismiss="modal" aria-label="Close" >
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body" style="text-align: center">
					       	<span id="findPassResult"></span>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-dark" data-dismiss="modal" id="confirmBtn">확인</button>
					      </div>
					    </div>
					  </div>
					</div>
					</div>
					
				</div>
			
			</div>
		</div>
	</div>
</section>
<!-- ./Tabs -->
</div>


</div>
</div>




</body>
</html>