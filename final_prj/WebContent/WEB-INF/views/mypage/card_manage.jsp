<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레몬 내역</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Staatliches&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">

<style type="text/css">


	/* 사이드메뉴 시작 */
	@import url("http://localhost:8080/final_prj/common/header_footer.css");
	@import url("http://localhost:8080/final_prj/common/side_menu.css");
	/* 사이드메뉴 끝 */
	
	/* 메인뷰 시작 */
	#container{
		min-height: 800px;
	    margin-top: 2%;
	    margin-bottom: 2%;
	    margin-left: auto;
	    margin-right: auto;
	    max-width: 1200px;
	}
	#mainView{width: 900px; float:left; min-height: 500px;}
	.imgSize{height: 40px}
	.table{ border-bottom: 1px solid #DBDBDF}
	html,body{margin:0; padding:0;width:100%; height:100%}
	#class4Wrap{display: flex;min-height: 100vh;flex-direction: column;}
	#container{	flex: 1;}
	/* 메인뷰 끝 */
	/* 컨텐츠 컨테이너 */
	section { padding: 30px 0;}
	section .section-title {
	    text-align: center;
	    color: #007b5e;
	    margin-bottom: 50px;
	    text-transform: uppercase;
	}
	#tabs{background: white;}
	#tabs h6.section-title{color: #eee;}
	
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
	    color:#141A1D ;
	    font-size: 20px;
	}
	.nav-tabs{
		border-bottom: 1px solid #D5CEC6;
	}
	.cardFrm{min-width: 800px; padding-left: 10px; padding-right: 10px; padding-top: 50px}
	.btn{
	width: 100%; 
	margin-top:40px;
	margin-bottom: 5%;
	background-color: #141A1D;
	color: #F0F0E2;
	 font-weight: bold;
	}
	.btn:hover{
	background-color: #F0F0E2;
	 color: #141A1D;
	 font-weight: bold;
	 border-color: #141A1D;
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
	.table .thead-dark th { background-color: #DBDBDF; color: #141A1D; border-color: #DBDBDF}
 	/*  */
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
	#orderTable{margin-left: 10%; margin-top: 30px; width: 800px; font-family: GoyangIlsan;  }
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
<script type="text/javascript">
$(function() {
		/*툴팁  */
		$('[data-toggle="tooltip"]').tooltip()
		
		$("#cardDeleteBtn").click(function(){
			var temp=document.getElementById('deleteFlag');
			var cCode=$("#c_code").val();
			if(temp.checked){
				$("#deleteFrm").submit();
				
			}
		});
		
		var date= new Date();
		var year="";
		var op_year= date.getFullYear();
		var chkCvc= RegExp(/^[0-9]{3}$/);
		
		
		$("#insertCardBtn").click(function(){
			if($("#cardNum1").val().trim()==""){
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
			
			$("#insertCardFrm").submit();
		});
				
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
		
		
});
</script>
</head>
<body style="height: 100%">
<div id="class4Wrap"  >
	
<div id="header">
 <c:import url="/WEB-INF/views/common_d/header_login.jsp"/>
</div><!-- header -->

<div id="container"  >

<div id="mypageSide" class="menuFont">
 <c:import url="/WEB-INF/views/mypage/mypage_menu.jsp"/>
</div>

<div id="mainView">
<div id="order_title">
카드 관리
</div>
<div id="orderTable" style="height: 500px">
<div id="containerFindFrm">
<!-- Tabs -->
<section id="tabs">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 ">
				<nav>
					<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
						<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">카드 목록</a>
						<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">카드 등록</a>
					</div>
				</nav>
				<div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
					<div class="tab-pane fade show active cardFrm" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					<table class="table">
					  <thead class="thead-dark">
					    <tr>
					      <th scope="col">#</th>
					      <th scope="col">카드사</th>
					      <th scope="col">카드번호</th>
					      <th scope="col">삭제</th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach var="cl" items="${cardList}">
						  <tr>
						   	<th><c:out value="${cl.num}"/></th>
						   	<td><c:out value="${cl.cname}"/></td>
						   	<td><c:out value="${cl.num1}"/>-****-****-****</td>
	 				      	<td><input type="checkbox" id="deleteFlag" name="deleteFlag"></td>
						  </tr>
						  <form id="deleteFrm" action="card_delete.do" method="post">
	 				      	<input type="hidden" id="c_code" name="code" value="${cl.code}">
						  </form>
					  </c:forEach>
					  </tbody>
					</table>
					<input type="button" id="cardDeleteBtn" class="btn btn-dark" value="삭제">
					</div>
					<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
					
					<form action="card_insert.do" class="cardFrm" id="insertCardFrm" method="post">
					<p class="loginfFont">카드사 선택</p>
					 <div class="form-group input-group">
						<select class="custom-select" id="cardC" name="com_name">
						    <option selected="selected">카드사 선택</option>
						   	<c:forEach var="cc" items="${cardCom}">
						   		<option value="${cc}"><c:out value="${cc}"/></option>
						   	</c:forEach>
						</select>
   					 </div> 
					<p class="loginfFont">카드번호</p>
					<div class="form-group">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><img src="http://localhost:8080/final_prj/common/images/s_card.png" style="width: 35px"></span>
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
				</div> <!-- row.// -->
					<input type="button" id="insertCardBtn" class="btn btn-dark" value="확인">
					</form>
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


</div><!-- container DIV end -->
<div id="footer">
	<c:import url="/WEB-INF/views/common_d/footer.jsp"/>	
</div>
  </div><!-- wrap -->



</body>
</html>