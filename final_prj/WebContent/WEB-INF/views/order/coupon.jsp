<%@page import="kr.co.sist.domain.LemonCnt"%>
<%@page import="kr.co.sist.vo.CartListVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>coupon</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Staatliches&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">

<style type="text/css">
	@import url("http://localhost:8080/final_prj/common/header_footer.css");

	#mainMenuBar{ height:69px; background-color:#323C51; }
	
	#couponWrap{ width:1000px;  margin-left:auto;margin-right:auto; margin-bottom:5%;margin-top:5%; font-family: 'GoyangIlsan'; }
	#header{ font-family: 'Eoe_Zno_EB', sans-serif; font-weight:nomal; font-size:36px;}
	#couponInfo{}
	
	.categoryFont{ font-family: 'locus_sangsang', sans-serif; font-weight:nomal; font-size:27px; }
	#beverageCoupon{ padding-top:20px; padding-bottom:20px; }
	#dessertCoupon{ padding-top:20px; padding-bottom:20px; }
	.table-sm{border-bottom: 1px solid #dee2e6}
	#footer{ padding-top:44px; padding-bottom:44px; }
	#totalLemon{ padding-bottom:20px; }
	#lemonTab{ background-color:#D5CEC6; border-color:#EAEAEA; text-align:right; border-spacing:0px; border-radius: 5px }
	
	#couponButtons{ text-align:right; }
	
	#mainFooter{ height:110px; background-color:#323C51; }
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
<% List<CartListVO> couponList=(List)request.getAttribute("couponList"); 
   List<LemonCnt> lemonCnt=(List)request.getAttribute("lemonCnt");
%>

$(function(){
	$("#useBtn").click(function(){
		
		var checkArr = [];
		
		$('input[name="checkCoupon"]:checked').each(function(i){
			checkArr.push($(this).val());
		});
		
		var lemonCnt=0;
		var cnt=0;
		cnt=$("input:checkbox[name=checkCoupon]:checked").length;
		
		if(cnt == 0){
			alert("사용하실 쿠폰을 선택해주세요.");
			return;
		}
		
		var obj=document.couponFrm;
		obj.cartCode.value= checkArr;
		obj.checkCnt.value= cnt;
		$("#couponFrm").submit();
		
	});
	
	$("#cancleBtn").click(function(){
		//window.location.href="cancle.do"
		window.history.go(-1);
	});

	
});

function checkBoxClicked(){
	
	var cnt=$("input:checkbox[name=checkCoupon]:checked").length;
	
	if(<%=lemonCnt.get(0).getCurLemon()%><cnt){
		alert("사용할 수 있는 레몬한도를 초과 했습니당~~");
		$( 'input[name="checkCoupon"]' ).attr( 'checked', false );
		return;
	}//end if
	
		var curLemon=<%=lemonCnt.get(0).getCurLemon()%>;
	if($("input:checkbox[name='checkCoupon']").is(":checked") == true){
		var cnt=$("input:checkbox[name=checkCoupon]:checked").length;
		$("#useLemonCnt").text(cnt+"개");
		var calLemon=curLemon-cnt;
		$("#curLemon").text(calLemon+"개");
	}//end if
	
	if($("input:checkbox[name=checkCoupon]:checked").length==0){
		$("#useLemonCnt").text("");
		$("#curLemon").text(curLemon+"개");
	}//end if
	
}//checkBoxClicked

</script>
</head>
<body>

<div id="mainMenuBar">
<c:choose>
<c:when test="${not empty sessionScope.id}">
 	<c:import url="/WEB-INF/views/common_d/header_login.jsp"/>
</c:when>
<c:otherwise>
 <c:import url="/WEB-INF/views/common_d/header.jsp"/>
</c:otherwise>
</c:choose>
</div>

<div id="couponWrap">

	<form action="useLemon.do" name="couponFrm" id="couponFrm" method="get">
	
		<input type=hidden name="checkCnt"/>
		<input type=hidden name="cartCode"/>
	</form>

	<div id="couponHeader">
		쿠폰♡
	</div>
	<div id="couponInfo">
		<ul type="square">
		 <li>10건당 1개의 레몬이 적립됩니다.</li>
		 <li>레몬 1개당 음료 1잔 혹은 디저트 1개를 교환하실 수 있습니다.</li>
		 <li>레몬의 유효기간은 1년 입니당.</li>
		</ul>
	</div>
	
	<hr/>
	<div>
		<span class="categoryFont">&nbsp;음료</span>
		
		<div id="beverageCoupon">
			<table class="table table-sm" ">
			<%for(int i=0; i<couponList.size(); i++){ 
				if(couponList.get(i).getMenuName().contains("음료")){
				for(int j=0; j<couponList.get(i).getQuantity(); j++){
			%>
				<tr>
					<td style="width:50px;">
					
					<input type="checkbox" class="checkCoupon" name="checkCoupon" value="<%=couponList.get(i).getCartCode()%>" onclick="checkBoxClicked()"/></td>
					<td style="width:700px;"><%=couponList.get(i).getGdName() %></td>
					<td style="width:250px;"><%=couponList.get(i).getTotalPrice()/couponList.get(i).getQuantity() %>원</td>
				</tr>
			<%
				}//end for
				}//end if
			}//end for %>
			</table>
		</div>
		
		<span class="categoryFont">&nbsp;디저트</span>
		
		<div id="dessertCoupon">
			<table class="table table-sm">
			<%for(int i=0; i<couponList.size(); i++){ 
				if(couponList.get(i).getMenuName().contains("디저트")){
				for(int j=0; j<couponList.get(i).getQuantity(); j++){
			%>
				<tr>
					<td style="width:50px;">
					
					<input type="checkbox" class="checkCoupon"  name="checkCoupon" value="<%=couponList.get(i).getCartCode()%>" onclick="checkBoxClicked()"/></td>
					<td style="width:700px;"><%=couponList.get(i).getGdName() %></td>
					<td style="width:250px;"><%=couponList.get(i).getTotalPrice()/couponList.get(i).getQuantity() %>원</td>
				</tr>
			<%
				}//end for
				}//end if
			}//end for %>
			</table>
		</div>
	</div>
	
	<div id="couponFooter">
		
		<div id="totalLemon">
			<table id="lemonTab" >
				<tr >
					<td style="width:500px;padding-right: 10px; ">사용 레몬 수</td>
					<td style="width:500px;color:white;background-color: #333C50;padding-right: 10px "><span id="useLemonCnt"></span></td>
				</tr>
				<tr>
					<td style="padding-right: 10px;">현재 보유 레몬 수</td>
					<td style="background-color: #333C50;color:white;padding-right: 10px"><span id="curLemon"><%=lemonCnt.get(0).getCurLemon() %>개</span></td>
				</tr>
			</table>
		</div>
		
		<div id="couponButtons">
			<button type="button" id="cancleBtn" class="btn btn-secondary">취소하기</button>
			<button type="button" id="useBtn" class="btn btn-secondary">사용하기</button>
		</div>
		
	</div>

</div> <!-- couponWrap -->

<div id="mainFooter">
	<jsp:include page="../common_d/footer.jsp"/>
</div>

</body>
</html>