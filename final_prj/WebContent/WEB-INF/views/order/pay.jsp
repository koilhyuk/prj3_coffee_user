<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.domain.LemonCnt"%>
<%@page import="kr.co.sist.vo.PayPriceVO"%>
<%@page import="kr.co.sist.domain.Card"%>
<%@page import="kr.co.sist.vo.CartListVO"%>
<%@page import="kr.co.sist.domain.PayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payment</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Staatliches&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">

<style type="text/css">
	@import url("http://localhost:8080/final_prj/common/header_footer.css");

	#mainMenuBar{ height:69px; background-color:#323C51; }
	
	#payWrap{ width:1000px; margin:0px auto; padding:15px; }
	
	/* header */
	#payHeader{ font-family: 'Eoe_Zno_EB', sans-serif; font-weight:nomal; font-size:36px;}
	
	/* content */
	#payroll{ width:1000px; margin:0px auto; padding-top:20px;padding-left: 30px }
	.categoryFont{ font-family: 'Eoe_Zno_EB', sans-serif; font-weight:nomal; font-size:27px; }
	#payrollTab{ width:1000px; border:1px solid #CCC; }
	
	#payHeader{border-left: 4px solid;  padding-left: 10px;}
	
	#payButtons{ height:77px; text-align:center; margin-top:60px; margin-bottom:10px; }
	#couponBtn{ width:270px; }
	#cardBtn{ width:270px; vertical-align:middle; }
	
	#cardInfo{ width:1000px; text-align:center; }
	#cardTab{ margin:0px auto; border-spacing:50px; }
	
	#paySummary{ width:1000px; margin:0px auto; padding-top:70px; }
	#paySummaryTab{ width:1000px; background-color:#DFDDDD; text-align:right; color: #141A1D}
	.clickable:hover{
	background-color: #dee2e6;
	}
	.tbody{
	border-bottom: 1px solid red;
	}
	.table td, .table th {
    padding: .5rem;
    vertical-align: top;
    border-top: 0px;
    border-bottom : 1px solid #dee2e6;
    }
	/* footer */
	#payFooter{ width:1000px; padding-top:30px; padding-bottom:40px; text-align:right; }
	
	#mainFooter{ height:110px; background-color:#323C51; }

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
<%  List<CartListVO> payList=(List)request.getAttribute("payList");
	List<Card> cardInfo=(List)session.getAttribute("cardInfo");
	List<PayPriceVO> payPrice=(List)request.getAttribute("payPrice"); 
	List<LemonCnt> lemonCnt=(List)request.getAttribute("lemonCnt");
%>
$(function () {
	$("#couponBtn").click(function(){
		
		$("#lemonFrm").submit();
		
	});
	$("#exampleFormControlSelect1").click(function(){
		var bank=$("#exampleFormControlSelect1 option:selected").val();
	<% 
	JSONObject tempCardInfo=new JSONObject();
	JSONArray jsonArrCard=new JSONArray();
	JSONObject temp=null;
	if( cardInfo != null){
	for(int i=0; i<cardInfo.size(); i++){
		temp=new JSONObject();
		temp.put("num1", cardInfo.get(i).getNum1());
		temp.put("num2", cardInfo.get(i).getNum2());
		temp.put("num3", cardInfo.get(i).getNum3());
		temp.put("num4", cardInfo.get(i).getNum4());
		temp.put("year", cardInfo.get(i).getYear());
		temp.put("month", cardInfo.get(i).getMonth());
		temp.put("cvc", cardInfo.get(i).getCvc());
		jsonArrCard.add(temp);
	}//end for
		tempCardInfo.put("data", jsonArrCard);
	%>
	var temp=<%= tempCardInfo %>;
		var idx=document.getElementById("exampleFormControlSelect1");
	
		$("#num1").val(temp.data[idx.selectedIndex].num1);
		$("#num2").val(temp.data[idx.selectedIndex].num2);
		$("#num3").val(temp.data[idx.selectedIndex].num3);
		$("#num4").val(temp.data[idx.selectedIndex].num4);
		$("#year").val(temp.data[idx.selectedIndex].year);
		$("#month").val(temp.data[idx.selectedIndex].month);
		$("#cvc").val(temp.data[idx.selectedIndex].cvc);
		
		<% } //end if%>
	});
	
	$("#pass").blur(function(){
		var pass=$("#pass").val();
		if(pass!=""){
			alert("비밀번호 일치");
		}
	});
	
	$("#payBtn").click(function(){
		
		   $("#payFrm").submit();	
		   	
		   
	});//click
	
	$("#cancleBtn").click(function(){
		window.location.href="payCancle.do"
	});
	
});

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

<div id="payWrap">

	<div id="payHeader">
		결제하기
	</div>

	<div id="payroll">
		<span class="categoryFont">&nbsp;음료</span>
		
		
		<div style="padding-bottom:15px;" >
		
			<table class="table table" >
			<thead>
				<tr >
			      <th>메뉴</th>
			      <th>수량</th>
			      <th>가격</th>
			    </tr>
		  	</thead>
		  	<tbody>
		  	<% for(int i=0; i<payList.size(); i++){
		  		if(payList.get(i).getMenuName().contains("음료")){
		  	%>
				<tr data-toggle="collapse"  data-target="#accordion" class="clickable">
					<td style="width:55%;"><%=payList.get(i).getGdName() %></td>
					<td style="width:22%;"><%=payList.get(i).getQuantity() %></td>
					<td style="width:22%;"><%=payList.get(i).getTotalPrice() %>원</td>
				</tr>
				<tr>
					<td colspan="3" id="accordion" class="collapse">
					
				<div class="payDetail">
					<table style="width: 100%;" class="payDetail table-sm" >
						<thead>
						<tr>
				      		<th style="width:56%; padding: 0px"></th>
				      		<th style="width:22%; padding: 0px"></th>
				      		<th style="width:22%; padding: 0px"></th>
				    	</tr>
			  			</thead>
						<tr>
							<td><%=payList.get(i).getType() %>/<%=payList.get(i).getSize() %>/<%=payList.get(i).getCup() %></td>
							<td><%=payList.get(i).getQuantity() %></td>
							<td><%=payList.get(i).getSizeAddedPrice() %>원</td>
						</tr>
						<tr>
							<td>에스프레소 샷 추가</td>
							<td><%=payList.get(i).getShotPlus() %></td>
							<td><%=payList.get(i).getShotAddedPrice() %></td>
						</tr>
						<tr>
							<td><%=payList.get(i).getMilk() %> 선택</td>
							<td></td>
							<td><%=payList.get(i).getMilkAddedPrice() %></td>
						</tr>
						<tr>
							<td>[<%=payList.get(i).getSyrup() %>]시럽 선택</td>
							<td></td>
							<td><%=payList.get(i).getSyrupAddedPrice() %>원</td>
						</tr>
						<tr>
							<td>휘핑크림 추가</td>
							<td><%=payList.get(i).getCreamPlus() %></td>
							<td><%=payList.get(i).getCreamAddedPrice() %>원</td>
						</tr>
						<tr>
							<td>[<%=payList.get(i).getTopping() %>]토핑 추가</td>
							<td></td>
							<td><%=payList.get(i).getToppingAddedPrice() %>원</td>
						</tr>
					</table>
					
				</div>
					</td>
				</tr>
				<%
		  			}//end if
		  		}//end for
				%>
			</tbody>
			</table>
				
		</div>
	
		
		<span class="categoryFont">&nbsp;디저트</span>
		
			<div>
			
				<table class="table table" >
				<thead>
					<tr >
				      <th>메뉴</th>
				      <th>수량</th>
				      <th>가격</th>
				    </tr>
			  	</thead>
		  	<tbody>
		  	<%for(int i=0; i<payList.size(); i++){ 
		  		if(payList.get(i).getMenuName().contains("디저트")){
		  	%>
				<tr data-toggle="collapse"  data-target="#accordion2" class="clickable">
					<td style="width:56%"><%=payList.get(i).getGdName() %></td>
					<td style="width:22%;"><%=payList.get(i).getQuantity() %></td>
					<td style="width:22%;"><%=payList.get(i).getTotalPrice() %>원</td>
				</tr>
				
				<tr>
					<td colspan="3" id="accordion2" class="collapse" >
					
					<div>
					
					<table style="width: 100%;" class="table-sm">
					<thead>
					<tr>
			      		<th style="width:56%; padding: 0px"></th>
			      		<th style="width:22%; padding: 0px"></th>
			      		<th style="width:22%; padding: 0px"></th>
			    	</tr>
		  			</thead>
					<tr >
						<td><%=payList.get(i).getPack() %></td>
						<td><%=payList.get(i).getQuantity() %></td>
						<td><%=payList.get(i).getTotalPrice() %>원</td>
					</tr>
				   </table>
				   	
					</div>
					
					</td>
				</tr>
			<%
		  			}//end if
		  	}//end for
			%>
				</tbody>
			</table>
		
			</div>
	
			
			<div id="payButtons">
				
				<button type="button" id="couponBtn" class="btn btn-outline-warning">쿠폰 사용하기</button>
				<button type="button" id="cardBtn" class="btn btn-outline-dark">카드 결제하기</button>
				
			</div>
			
			<div id="cardInfo">
			
				<table id="cardTab" >
					<tr style="height:50px;">
						<td style="width:100px;">카드종류</td>
						<td colspan="4" style="width:300px;">
							 <div class="form-group">
							   <select class="form-control" id="exampleFormControlSelect1" style="width:284px;">
							      <% //그렇다면!!
							      if( cardInfo != null){
							      for(int i=0; i<cardInfo.size(); i++) {%>
							      <option><%=cardInfo.get(i).getComName() %></option>
							      <%}//end for 
							      }%>
							   </select>
							 </div>
						</td>
					</tr>
					<tr style="height:50px;">
						<td>카드번호</td>
						<td><input class="form-control" type="text" style="width:60px" id="num1"></td>
						<td><input class="form-control" type="text" style="width:60px" id="num2"></td>
						<td><input class="form-control" type="text" style="width:60px" id="num3"></td>
						<td><input class="form-control" type="text" style="width:60px" id="num4"></td>
					</tr>
					<tr style="height:50px;">
						<td>유효기간</td>
						<td colspan="2"><input class="form-control" type="text" style="width:136px" id="year"></td>
						<td colspan="2"><input class="form-control" type="text" style="width:136px" id="month"></td>
					</tr>
					<tr style="height:50px;">
						<td>CVC</td>
						<td colspan="4"><input class="form-control" type="text" style="width:284px" id="cvc"></td>
					</tr>
					<tr style="height:50px;">
						<td>비밀번호</td>
						<td colspan="4"><input class="form-control" type="password" style="width:284px" id="pass"></td>
					</tr>
				</table>
			
			</div>
			
			<div id="paySummary">
				
				<table id="paySummaryTab"   class="table table-sm">
					<tr>
						<td scope="row" style="font-weight: bold">주문금액</td>
						<td ><%=payPrice.get(0).getBeforeUseLemon() %>원</td>
					</tr>
					<tr>
						<td scope="row" style="font-weight: bold">사용 레몬 수</td>
						<td><%=lemonCnt.get(0).getUseLemon() %>개</td>
					</tr>
					<tr>
						<td scope="row" style="font-weight: bold">적립 레몬 수</td>
						<td>
						<%if(lemonCnt.get(0).getUseLemon()==0){ %>
						<%=payList.size() %>
						<%}//end if %>
						개
						
						</td>
					</tr>
					<tr>
						<td scope="row" style="font-weight: bold">할인 금액</td>
						<td style="color:#BC3B52;">-<%=payPrice.get(0).getBeforeUseLemon()-payPrice.get(0).getAfterUseLemon() %>원</td>
					</tr>
					<tr>
						<td scope="row" style="font-weight: bold ;background-color: #F0F0E1; border-bottom: 0px">총 결제 금액</td>
						<td style="background-color: #F0F0E1; "><%=payPrice.get(0).getAfterUseLemon() %>원</td>
					</tr>
				</table>
				
			</div>
			
	</div> <!-- payroll -->
	<form action="payBtn.do" method="post" id="payFrm">
	<%
		for( int i= 0 ; i < payList.size() ; i++){
		%>
		<input type="hidden" name="cartCode" value="<%=payList.get(i).getCartCode() %>"/>
		<input type="hidden" name="quantity" value="<%=payList.get(i).getQuantity() %>"/>
		<input type="hidden" name="totalPrice" value="<%=payList.get(i).getTotalPrice() %>"/>
		<%
		}//end for
	
	%>
	</form>
	<form action="coupon.do" method="get" id="lemonFrm">
	<%
		for( int i= 0 ; i < payList.size() ; i++){
		%>
		<input type="hidden" name="cartCodeLemon" value="<%=payList.get(i).getCartCode() %>"/>
		<input type="hidden" name="quantityLemon" value="<%=payList.get(i).getQuantity() %>"/>
		<%
		}//end for
	
	%>
	</form>
	
	<div id="payFooter">
		<div id="paymentButtons">
			<button type="button" id="cancleBtn" class="btn btn-light">취소할래</button>
			<button type="button" id="payBtn" class="btn btn-dark">결제할래</button>
		</div>
	</div>

</div> <!-- payWrap -->

<div id="mainFooter">
	<jsp:include page="../common_d/footer.jsp"/>
</div>

</body>
</html>