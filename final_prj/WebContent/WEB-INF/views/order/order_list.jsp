<%@page import="kr.co.sist.vo.CartFrmVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.sist.domain.BasicRecipe"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order</title>
<link href="https://fonts.googleapis.com/css?family=Titillium+Web:700&display=swap" rel="stylesheet">
<style type="text/css">
@font-face { font-family: 'Eoe_Zno_EB'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/Eoe_Zno_EB.woff') format('woff'); font-weight: normal; font-style: normal; }

	#orderCoffeeWrap{ width:700px;}
	
	#orderHeader{ text-align:center; padding-bottom:44px; }
	/* info */
	#ciclePhoto{ box-sizing:border-box; margin:55px auto; width:170px; height:170px; border-radius:50%; background-color:#A78F85; }
	#menuName{ font-family: 'locus_sangsang';  font-size:27px; padding-bottom:4px; }
	#menuPrice{ font-size:21px; font-family: 'locus_sangsang'; }
	
	#content{ margin-top:50px; font-family: 'Eoe_Zno_EB', sans-serif; font-weight:nomal; font-size:21px; }
	#orderList{}
	#orderTab{ text-align:center; }
	tr{ height:150px; font-family: 'Titillium Web', sans-serif; border-bottom: 1px solid #DBDEE3;}
	td{ width:170px; font-family: 'Titillium Web', sans-serif;}
	.orderListDetail{
	border-top: 1px solid #DBDEE3;
	}
	/* 수량 */
	#quantityDiv{}
	#quantity{ width:50px; height:50px; text-align:center; vertical-align:top; font-size: 40px; border:0px; }
	/* 사이즈 */
	
	/* 컵선택 */
	#selectCupBtn{ width:210px; background-color: #D5CEC6}
	#whatCup{ font-family:sans-serif; }
	#cups{ font-family:sans-serif; background-color:#494342; }
	#cups:hover{ background-color:#494342; }
	#warnWindow{ font-family:sans-serif; font-size:12px; color:RED; display:block; }
	
	/* 타입 */
	#iceBtn{ width:170px; }
	#hotBtn{ width:170px; }
	/* 에스프레소 샷 */
	#espressoDiv{}
	#espresso{ width:50px; height:50px; text-align:center; vertical-align:top; font-size: 40px; border:0px; }
	/* 우유 */
	
	/* 시럽 */
	
	/* 휘핑크림 */
	#cream{ width:50px; height:50px; text-align:center; vertical-align:top; font-size: 40px; border:0px; }
	/* 토핑 */
	
	#orderFooter{ padding-top:30px; padding-bottom:40px; text-align:right; }
	
	
	/* 버튼 색깔 토글 */
	.chosen{ background-color:#333C50; color:#F0F0E2; }

</style>

<script type="text/javascript">

$(function(){
	
	$('[data-toggle="tooltip"]').tooltip();
//수량/////
	$("#quantityMinus").click(function(){
		if($("#quantity").val()==0){
			alert("수량이 음수가 가능하겠냐^.^");
			return;
		}//end if
		var quantity=Number($("#quantity").val())-1;
		$("#quantity").val(quantity);
	});
	
	$("#quantityPlus").click(function(){
		if($("#quantity").val()==10){
			alert("10개까지만 주문할 수 있눈뎅^.^");
			return;
		}//end if
		var quantity=Number($("#quantity").val())+1;
		$("#quantity").val(quantity);
	});
	
	
//사이즈/////
 	var toggleS=false;
	var toggleM=false;
	var toggleL=false;
	
	$("#cupSizeS").click(function(){
		switch(toggleS){
		case true:
			$("#small").removeClass("chosen");
			break;
		case false:
			$("#medium").removeClass("chosen");
			if(toggleM==true){
				toggleM=!toggleM;
			}//end if
			$("#large").removeClass("chosen");
			if(toggleL==true){
				toggleL=!toggleL;
			}//end if
			$("#small").addClass("chosen");
			break;
		}//end switch
		toggleS=!toggleS;
	});
	$("#small").click(function(){
		switch(toggleS){
		case true:
			$("#small").removeClass("chosen");
			break;
		case false:
			$("#medium").removeClass("chosen");
			if(toggleM==true){
				toggleM=!toggleM;
			}//end if
			$("#large").removeClass("chosen");
			if(toggleL==true){
				toggleL=!toggleL;
			}//end if
			$("#small").addClass("chosen");
			break;
		}//end switch
		toggleS=!toggleS;
	});	
	
	$("#cupSizeM").click(function(){
		switch(toggleM){
		case true:
			$("#medium").removeClass("chosen");
			break;
		case false:
			$("#small").removeClass("chosen");
			if(toggleS==true){
				toggleS=!toggleS
			}//end if
			$("#large").removeClass("chosen");
			if(toggleL==true){
				toggleL=!toggleL
			}//end if
			$("#medium").addClass("chosen");
			break;
		}//end switch
		toggleM=!toggleM;
	});
	$("#medium").click(function(){
		switch(toggleM){
		case true:
			$("#medium").removeClass("chosen");
			break;
		case false:
			$("#small").removeClass("chosen");
			if(toggleS==true){
				toggleS=!toggleS
			}//end if
			$("#large").removeClass("chosen");
			if(toggleL==true){
				toggleL=!toggleL
			}//end if
			$("#medium").addClass("chosen");
			break;
		}//end switch
		toggleM=!toggleM;
	});	
	
	$("#cupSizeL").click(function(){
		switch(toggleL){
		case true:
			$("#large").removeClass("chosen");
			break;
		case false:
			$("#small").removeClass("chosen");
			if(toggleS==true){
				toggleS=!toggleS
			}//end if
			$("#medium").removeClass("chosen");
			if(toggleM==true){
				toggleM=!toggleM
			}//end if
			$("#large").addClass("chosen");
			break;
		}//end switch
		toggleL=!toggleL;
	});
	$("#large").click(function(){
		switch(toggleL){
		case true:
			$("#large").removeClass("chosen");
			break;
		case false:
			$("#small").removeClass("chosen");
			if(toggleS==true){
				toggleS=!toggleS
			}//end if
			$("#medium").removeClass("chosen");
			if(toggleM==true){
				toggleM=!toggleM
			}//end if
			$("#large").addClass("chosen");
			break;
		}//end switch
		toggleL=!toggleL;
	});	

	
//컵 선택/////
var cupClicked;
	$("#takeout").click(function(){
		$("#whatCup").text("일회용컵(테이크아웃용)");
		$("#warnWindow").text("*일회용컵 선택시 매장내에 계실 수 없습니다.");
		cupClicked;
		cupClicked="o";
	});
	$("#tumbler").click(function(){
		$("#whatCup").text("텀블러");	
		$("#warnWindow").text("");
		cupClicked;
		cupClicked="t";
	});
	$("#mug").click(function(){
		$("#whatCup").text("머그(매장용)");
		$("#warnWindow").text("*머그컵을 매장밖으로 가져가실 수 없습니다.");
		cupClicked;
		cupClicked="m";
	});
	

//타입/////
var typeClicked;
	$("#iceBtn").click(function(){
		typeClicked;
		typeClicked="i";
	});
	$("#hotBtn").click(function(){
		typeClicked;
		typeClicked="h";
	});

//에스프레소 샷/////
	$("#espressoMinus").click(function(){
		if($("#espresso").val()==0){
			alert("뭐, 카페인을 원하지 않는다면야^.^");
			return;
		}//end if
		var espresso=Number($("#espresso").val())-1;
		$("#espresso").val(espresso);
	});
	
	$("#espressoPlus").click(function(){
		if($("#espresso").val()==5){
			alert("5샷까지만 넣을 수 있눈뎅^.^");
			return;
		}//end if
		var espresso=Number($("#espresso").val())+1;
		$("#espresso").val(espresso);
	});

	
//우유/////
	var toggleMilk=false;
	var toggleRF=false;
	var toggleSoy=false;
	
	$("#milkPic").click(function(){
		switch(toggleMilk){
		case true:
			$("#milk").removeClass("chosen");
			break;
		case false:
			$("#ractoFree").removeClass("chosen");
			if(toggleRF==true){
				toggleRF=!toggleRF;
			}//end if
			$("#soy").removeClass("chosen");
			if(toggleSoy==true){
				toggleSoy=!toggleSoy;
			}//end if
			$("#milk").addClass("chosen");
			break;
		}//end switch
		toggleMilk=!toggleMilk;
	});
	$("#milk").click(function(){
		switch(toggleMilk){
		case true:
			$("#milk").removeClass("chosen");
			break;
		case false:
			$("#ractoFree").removeClass("chosen");
			if(toggleRF==true){
				toggleRF=!toggleRF;
			}//end if
			$("#soy").removeClass("chosen");
			if(toggleSoy==true){
				toggleSoy=!toggleSoy;
			}//end if
			$("#milk").addClass("chosen");
			break;
		}//end switch
		toggleMilk=!toggleMilk;
	});	
	
	$("#ractoFreePic").click(function(){
		switch(toggleRF){
		case true:
			$("#ractoFree").removeClass("chosen");
			break;
		case false:
			$("#milk").removeClass("chosen");
			if(toggleMilk==true){
				toggleMilk=!toggleMilk
			}//end if
			$("#soy").removeClass("chosen");
			if(toggleSoy==true){
				toggleSoy=!toggleSoy
			}//end if
			$("#ractoFree").addClass("chosen");
			break;
		}//end switch
		toggleRF=!toggleRF;
	});
	$("#ractoFree").click(function(){
		switch(toggleRF){
		case true:
			$("#ractoFree").removeClass("chosen");
			break;
		case false:
			$("#milk").removeClass("chosen");
			if(toggleMilk==true){
				toggleMilk=!toggleMilk
			}//end if
			$("#soy").removeClass("chosen");
			if(toggleSoy==true){
				toggleSoy=!toggleSoy
			}//end if
			$("#ractoFree").addClass("chosen");
			break;
		}//end switch
		toggleRF=!toggleRF;
	});	
	
	$("#soyPic").click(function(){
		switch(toggleSoy){
		case true:
			$("#soy").removeClass("chosen");
			break;
		case false:
			$("#milk").removeClass("chosen");
			if(toggleMilk==true){
				toggleMilk=!toggleMilk
			}//end if
			$("#ractoFree").removeClass("chosen");
			if(toggleRF==true){
				toggleRF=!toggleRF
			}//end if
			$("#soy").addClass("chosen");
			break;
		}//end switch
		toggleSoy=!toggleSoy;
	});
	$("#soy").click(function(){
		switch(toggleSoy){
		case true:
			$("#soy").removeClass("chosen");
			break;
		case false:
			$("#milk").removeClass("chosen");
			if(toggleMilk==true){
				toggleMilk=!toggleMilk
			}//end if
			$("#ractoFree").removeClass("chosen");
			if(toggleRF==true){
				toggleRF=!toggleRF
			}//end if
			$("#soy").addClass("chosen");
			break;
		}//end switch
		toggleSoy=!toggleSoy;
	});	


//시럼/////
	var toggleBanilla=false;
	var toggleMoca=false;
	var toggleCaramel=false;
	
	$("#banillaPic").click(function(){
		switch(toggleBanilla){
		case true:
			$("#banilla").removeClass("chosen");
			break;
		case false:
			$("#moca").removeClass("chosen");
			if(toggleMoca==true){
				toggleMoca=!toggleMoca;
			}//end if
			$("#caramel").removeClass("chosen");
			if(toggleCaramel==true){
				toggleCaramel=!toggleCaramel;
			}//end if
			$("#banilla").addClass("chosen");
			break;
		}//end switch
		toggleBanilla=!toggleBanilla;
	});
	$("#banilla").click(function(){
		switch(toggleBanilla){
		case true:
			$("#banilla").removeClass("chosen");
			break;
		case false:
			$("#moca").removeClass("chosen");
			if(toggleMoca==true){
				toggleMoca=!toggleMoca;
			}//end if
			$("#caramel").removeClass("chosen");
			if(toggleCaramel==true){
				toggleCaramel=!toggleCaramel;
			}//end if
			$("#banilla").addClass("chosen");
			break;
		}//end switch
		toggleBanilla=!toggleBanilla;
	});	
	
	$("#mocaPic").click(function(){
		switch(toggleMoca){
		case true:
			$("#moca").removeClass("chosen");
			break;
		case false:
			$("#banilla").removeClass("chosen");
			if(toggleBanilla==true){
				toggleBanilla=!toggleBanilla;
			}//end if
			$("#caramel").removeClass("chosen");
			if(toggleCaramel==true){
				toggleCaramel=!toggleCaramel
			}//end if
			$("#moca").addClass("chosen");
			break;
		}//end switch
		toggleMoca=!toggleMoca;
	});
	$("#moca").click(function(){
		switch(toggleMoca){
		case true:
			$("#moca").removeClass("chosen");
			break;
		case false:
			$("#banilla").removeClass("chosen");
			if(toggleBanilla==true){
				toggleBanilla=!toggleBanilla;
			}//end if
			$("#caramel").removeClass("chosen");
			if(toggleCaramel==true){
				toggleCaramel=!toggleCaramel
			}//end if
			$("#moca").addClass("chosen");
			break;
		}//end switch
		toggleMoca=!toggleMoca;
	});	
	
	$("#caramelPic").click(function(){
		switch(toggleCaramel){
		case true:
			$("#caramel").removeClass("chosen");
			break;
		case false:
			$("#banilla").removeClass("chosen");
			if(toggleBanilla==true){
				toggleBanilla=!toggleBanilla;
			}//end if
			$("#moca").removeClass("chosen");
			if(toggleMoca==true){
				toggleMoca=!toggleMoca;
			}//end if
			$("#caramel").addClass("chosen");
			break;
		}//end switch
		toggleCaramel=!toggleCaramel;
	});
	$("#caramel").click(function(){
		switch(toggleCaramel){
		case true:
			$("#caramel").removeClass("chosen");
			break;
		case false:
			$("#banilla").removeClass("chosen");
			if(toggleBanilla==true){
				toggleBanilla=!toggleBanilla;
			}//end if
			$("#moca").removeClass("chosen");
			if(toggleMoca==true){
				toggleMoca=!toggleMoca;
			}//end if
			$("#caramel").addClass("chosen");
			break;
		}//end switch
		toggleCaramel=!toggleCaramel;
	});	
	

//휘핑크림/////
	$("#creamMinus").click(function(){
		if($("#cream").val()==0){
			alert("뭐, 왜 부드러운 휘핑크림을 싫어하세요^.^");
			return;
		}//end if
		var cream=Number($("#cream").val())-1;
		$("#cream").val(cream);
	});
	
	$("#creamPlus").click(function(){
		if($("#cream").val()==5){
			alert("5까지만 쌓을 수 있눈뎅^.^");
			return;
		}//end if
		var cream=Number($("#cream").val())+1;
		$("#cream").val(cream);
	});

	
//토핑/////
	var toggleAlmond=false;
	var toggleWalnut=false;
	var toggleCashew=false;
	
	$("#almondPic").click(function(){
		switch(toggleAlmond){
		case true:
			$("#almond").removeClass("chosen");
			break;
		case false:
			$("#walnut").removeClass("chosen");
			if(toggleWalnut==true){
				toggleWalnut=!toggleWalnut;
			}//end if
			$("#cashew").removeClass("chosen");
			if(toggleCashew==true){
				toggleCashew=!toggleCashew;
			}//end if
			$("#almond").addClass("chosen");
			break;
		}//end switch
		toggleAlmond=!toggleAlmond;
	});
	$("#almond").click(function(){
		switch(toggleAlmond){
		case true:
			$("#almond").removeClass("chosen");
			break;
		case false:
			$("#walnut").removeClass("chosen");
			if(toggleWalnut==true){
				toggleWalnut=!toggleWalnut;
			}//end if
			$("#cashew").removeClass("chosen");
			if(toggleCashew==true){
				toggleCashew=!toggleCashew;
			}//end if
			$("#almond").addClass("chosen");
			break;
		}//end switch
		toggleAlmond=!toggleAlmond;
	});	
	
	$("#walnutPic").click(function(){
		switch(toggleWalnut){
		case true:
			$("#walnut").removeClass("chosen");
			break;
		case false:
			$("#almond").removeClass("chosen");
			if(toggleAlmond==true){
				toggleAlmond=!toggleAlmond;
			}//end if
			$("#cashew").removeClass("chosen");
			if(toggleCashew==true){
				toggleCashew=!toggleCashew;
			}//end if
			$("#walnut").addClass("chosen");
			break;
		}//end switch
		toggleWalnut=!toggleWalnut;
	});
	$("#walnut").click(function(){
		switch(toggleWalnut){
		case true:
			$("#walnut").removeClass("chosen");
			break;
		case false:
			$("#almond").removeClass("chosen");
			if(toggleAlmond==true){
				toggleAlmond=!toggleAlmond;
			}//end if
			$("#cashew").removeClass("chosen");
			if(toggleCashew==true){
				toggleCashew=!toggleCashew;
			}//end if
			$("#walnut").addClass("chosen");
			break;
		}//end switch
		toggleWalnut=!toggleWalnut;
	});	
	
	$("#cashewPic").click(function(){
		switch(toggleCashew){
		case true:
			$("#cashew").removeClass("chosen");
			break;
		case false:
			$("#almond").removeClass("chosen");
			if(toggleAlmond==true){
				toggleAlmond=!toggleAlmond;
			}//end if
			$("#walnut").removeClass("chosen");
			if(toggleWalnut==true){
				toggleWalnut=!toggleWalnut;
			}//end if
			$("#cashew").addClass("chosen");
			break;
		}//end switch
		toggleCashew=!toggleCashew;
	});
	$("#cashew").click(function(){
		switch(toggleCashew){
		case true:
			$("#cashew").removeClass("chosen");
			break;
		case false:
			$("#almond").removeClass("chosen");
			if(toggleAlmond==true){
				toggleAlmond=!toggleAlmond;
			}//end if
			$("#walnut").removeClass("chosen");
			if(toggleWalnut==true){
				toggleWalnut=!toggleWalnut;
			}//end if
			$("#cashew").addClass("chosen");
			break;
		}//end switch
		toggleCashew=!toggleCashew;
	});	
		
	
//디저트 포장/////
	var packClicked;
	$("#eatBtn").click(function(){
		packClicked;
		packClicked="N";
	});
	$("#packBtn").click(function(){
		packClicked;
		packClicked="Y";
	});
	
//기본 레시피 쀼려주기/////
//우유
<%  List<BasicRecipe> test=(List)request.getAttribute("basicRecipe");
	  if(test.get(0).getMilk()!=null && "우유".equals(test.get(0).getMilk())){
	  %>
		$("#milk").addClass("chosen"); 
	<%}//end if%>

//시럽
<%	if(test.get(0).getSyrup()!=null){
		switch(test.get(0).getSyrup()){
		case "모카" :%> $("#moca").addClass("chosen");<%break;%><%
		case "바닐라" :%> $("#banilla").addClass("chosen");<%break;%><%
		default :%> $("#caramel").addClass("chosen");<% 
		}//end switch
	}//end if
%>	

//토핑
<%	if(test.get(0).getTopping()!=null){
		switch(test.get(0).getTopping()){
		case "아몬드" :%> $("#almond").addClass("chosen");<%break;%><%
		case "호두" :%> $("#walnut").addClass("chosen");<%break;%><%
		default :%> $("#cashew").addClass("chosen");<% 
		}//end switch
	}//end if
%>

//타입
<%	if("I".equals(test.get(0).getBrType())){%>
		$("#hotBtn").attr('disabled',true);
<%  }else if("H".equals(test.get(0).getBrType())){%>
		$("#iceBtn").attr('disabled',true);
<%	}//end if%>

//장바구니/////
$("#cartBtn").click(function(){
	
	/* 주문창에서 선택되어진 주문들의 배열 만들기 */

	//사이즈
	var objSize=" ";
if("rgb(240, 240, 226)"===($("#small").css("color"))){
	objSize="S";
}else if("rgb(240, 240, 226)"===($("#medium").css("color"))){
	objSize="M";
}else if("rgb(240, 240, 226)"===($("#large").css("color"))){
	objSize="L";
}//end else

//컵
	var objCup=" ";
if("o"=== cupClicked){
	objCup=$("#takeout").val();
}else if("t"=== cupClicked){
	objCup=$("#tumbler").val();
}else if("m"=== cupClicked){
	objCup=$("#mug").val();
}//end else

//타입
	var objType=" ";
if("i"=== typeClicked){
	objType="ICE";
}else{
	objType="HOT";
}//end else

	
//우유
	var objMilk=" ";
if("rgb(240, 240, 226)"===($("#milk").css("color"))){
	objMilk="우유";
}else if("rgb(240, 240, 226)"===($("#ractoFree").css("color"))){
	objMilk="락토프리 우유";
}else if("rgb(240, 240, 226)"===($("#soy").css("color"))){
	objMilk="두유";
}//end else
	
//시럽
	var objSyrup=" ";
if("rgb(240, 240, 226)"===($("#moca").css("color"))){
	objSyrup="모카";
}else if("rgb(240, 240, 226)"===($("#banilla").css("color"))){
	objSyrup="바닐라";
}else if("rgb(240, 240, 226)"===($("#caramel").css("color"))){
	objSyrup="카라멜";
}//end else
	
//토핑
	var objTopping=" ";
if("rgb(240, 240, 226)"===($("#almond").css("color"))){
	objTopping="아몬드";
}else if("rgb(240, 240, 226)"===($("#walnut").css("color"))){
	objTopping="호두";
}else if("rgb(240, 240, 226)"===($("#cashew").css("color"))){
	objTopping="캐슈넛";
}//end else


//포장
	var objPack=" ";
if("Y"=== packClicked){
	objPack="매장";
}else if("N"=== packClicked){
	objPack="포장";
}//end else
	

	var obj=document.orderFrm;
	
	obj.gdName.value="<%=test.get(0).getGdName()%>";
	obj.gdPrice.value="<%=test.get(0).getGdPrice()%>";
	obj.quantity.value= $("#quantity").val();
	
	obj.size.value= objSize;
	obj.cup.value= objCup;
	obj.brType.value= objType;
	obj.shot.value= $("#espresso").val();
	obj.milk.value= objMilk;
	obj.syrup.value= objSyrup;
	obj.cream.value= $("#cream").val();
	obj.topping.value= objTopping;
	
	obj.pack.value= objPack;
	
	$("#orderFrm").submit();
		
});//장바구니




//결제하기/////
$("#orderBtn").click(function(){
	window.location.href="pay.do";
});//결제

}); //ready


</script>
</head>
<body>

<div id="orderCoffeeWrap" style="padding-right: 20px; ">


	<div id="orderHeader" style="height:300px;">
		
		<div><img id="ciclePhoto" src="http://localhost:8080/final_prj/common/menuImg/<%= test.get(0).getCategoryName() %>/<%=test.get(0).getGdImg()%>"/></div>
		<div id="menuName"><%= test.get(0).getGdName() %></div>
		<div id="menuPrice"><%= test.get(0).getGdPrice() %>원</div>
	
	</div>
	<div id="content">
	
		<div id="orderList">
		
			<form action="cart.do" name="orderFrm" id="orderFrm" method="post">
			
			<input type="hidden"name="category" value="<%= test.get(0).getCategoryName() %>"/>
			<input type="hidden"name="gdName"/>
			<input type="hidden"name="gdPrice"/>
			<input type="hidden"name="quantity"/>
			
			<input type="hidden"name="size"/>
			<input type="hidden"name="cup"/>
			<input type="hidden"name="brType"/>
			
			<input type="hidden"name="shot"/>
			<input type="hidden"name="milk"/>
			<input type="hidden"name="syrup"/>
			<input type="hidden"name="cream"/>
			<input type="hidden"name="topping"/>
			
			<input type="hidden"name="pack"/>
			
			</form>

			
			<table id="orderTab" style="margin:auto; border-collapse:separate ; border-spacing: 0px 15px" >
				<tr >
					<td style="font-family: locus_sangsang; border-radius: 10px 0 0 10px; background-color: #DBDEE3;">수량</td>
					<td colspan="3" class="orderListDetail" style="width:510px; border-bottom: 1px solid #DBDEE3">
<!-- style="width:510px;border-bottom: 1px solid #DBDEE4;border-top: 1px solid #DBDEE4;border-right: 1px solid #DBDEE4;border-radius: 10px;" -->
					<div id="quantityDiv" >
					<img style="height: 30px; padding-top: 10px" src="http://localhost:8080/final_prj/common/orderImg/minus.png" id="quantityMinus">
					<input type="text" value="1" name="quantity" id="quantity" readonly="readonly">
					<img style="height: 30px; padding-top: 10px" src="http://localhost:8080/final_prj/common/orderImg/plus.png"  id="quantityPlus">
					</div>
					
					</td>
				</tr>
	<c:if test="${ param.category eq 'coffee' or  param.category eq 'tea' or param.category eq 'yuliccino'}">
				<tr >
					<td style="font-family: locus_sangsang ;border-radius: 10px 0 0 10px; background-color: #DBDEE3;">사이즈</td>
					<td class="orderListDetail">
						<table>
							<tr style="height:120px">
								<td >
								<img style="height: 100px" src="http://localhost:8080/final_prj/common/orderImg/S.png"  id="cupSizeS">										
								</td>
							</tr>
							<tr style="height:30px;">
								<td id="small">
								SMALL
								</td>
							</tr>
						</table>
					</td>
					<td class="orderListDetail">
						<table >
							<tr style="height:120px">
								<td>
								<img style="height: 100px" src="http://localhost:8080/final_prj/common/orderImg/m.png"  id="cupSizeM">										
								</td>
							</tr>
							<tr style="height:30px;">
								<td id="medium">
								MEDIUM
								</td>
							</tr>
						</table>
					</td>
					<td class="orderListDetail">
						<table >
							<tr style="height:120px">
								<td>
								<img style="height: 100px" src="http://localhost:8080/final_prj/common/orderImg/L.png"  id="cupSizeL">										
								</td>
							</tr>
							<tr style="height:30px;">
								<td id="large">
								LARGE
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="orderListName" style="font-family: locus_sangsang;border-radius: 10px; border-radius: 10px 0 0 10px;; background-color: #DBDEE3;">컵선택</td>
					<td colspan="3" class="orderListDetail" style="border-bottom: 1px solid #DBDEE3">
					
					<div class="btn-group">
					  <button type="button" id="selectCupBtn" class="btn btn-light dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    	<div id="whatCup" style="font-family: GoyangIlsan;">컵을 선택해주세요 ^0^</div>
					  </button>
					  <div class="dropdown-menu dropdown-menu-right" id="cups">
					    <button class="dropdown-item" id="takeout" type="button" value="일회용컵(테이크아웃용)">일회용컵(테이크아웃용)</button>
					    <button class="dropdown-item" id="tumbler" type="button" value="텀블러">텀블러</button>
					    <button class="dropdown-item" id="mug" type="button" value="머그컵(매장용)">머그컵(매장용)</button>
					  </div>
					</div>
					<div id="warnWindow"></div>
					
					</td>
				</tr>
				
	<!-- 기본 레시피 뿌려주기 여기부터 -->			
				<tr>
					<td style="font-family: locus_sangsang;border-radius: 10px 0 0 10px; background-color: #DBDEE3;">타입</td>
					<td colspan="3"class="orderListDetail" style="border-bottom: 1px solid #DBDEE3">
						<button type="button" id="iceBtn" class="btn btn-primary">ICE</button>
						<button type="button" id="hotBtn" class="btn btn-danger">HOT</button>
					</td>
				</tr>
	</c:if>
	<c:if test="${ param.category eq 'coffee' or param.category eq 'yuliccino'}">
				<tr>
					<td style="font-family: locus_sangsang;border-radius: 10px 0 0 10px; background-color: #DBDEE3;">에스프레소 샷</td>
					<td colspan="3" class="orderListDetail" style="border-bottom: 1px solid #DBDEE3">

					<div id="espressoDiv">
					<img style="height: 30px; padding-top: 10px" src="http://localhost:8080/final_prj/common/orderImg/minus.png" id="espressoMinus">
					<input type="text" value="<%= test.get(0).getShot() %>" name="espresso" id="espresso" readonly="readonly">
					<img style="height: 30px; padding-top: 10px" src="http://localhost:8080/final_prj/common/orderImg/plus.png"  id="espressoPlus">
					</div>
					
					</td>
				</tr>
				<tr >
					<td style="font-family: locus_sangsang;border-radius: 10px 0 0 10px; background-color: #DBDEE3;">우유</td>
					<td class="orderListDetail">
						<table >
							<tr style="height:120px">
								<td>
								<img style="height: 120px" src="http://localhost:8080/final_prj/common/orderImg/milk.png" id="milkPic">										
								</td>
							</tr>
							<tr style="height:30px;">
								<td id="milk">
								MILK
								</td>
							</tr>
						</table>
					</td>
					<td class="orderListDetail">
						<table >
							<tr style="height:120px">
								<td>
								<img style="height: 120px" src="http://localhost:8080/final_prj/common/orderImg/lactosefreemilk.png" id="ractoFreePic">										
								</td>
							</tr>
							<tr style="height:30px;">
								<td id="ractoFree">
								LACTOSE FREE
								</td>
							</tr>
						</table>
					</td>
					<td class="orderListDetail">
						<table >
							<tr style="height:120px">
								<td>
								<img style="height: 120px" src="http://localhost:8080/final_prj/common/orderImg/soy_milk.png" id="soyPic">										
								</td>
							</tr>
							<tr style="height:30px;">
								<td id="soy">
								SOY
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="font-family: locus_sangsang;border-radius: 10px 0 0 10px; background-color: #DBDEE3;">시럽</td>
					<td class="orderListDetail">
						<table >
							<tr style="height:120px">
								<td>
								<img style="height:120px" src="http://localhost:8080/final_prj/common/orderImg/vanilla.png" id="banillaPic">										
								</td>
							</tr>
							<tr style="height:30px;">
								<td id="banilla">
								VANILLA
								</td>
							</tr>
						</table>
					</td>
					<td class="orderListDetail">
						<table >
							<tr style="height:120px">
								<td>
								<img style="height:120px" src="http://localhost:8080/final_prj/common/orderImg/mocha.png" id="mocaPic">										
								</td>
							</tr>
							<tr style="height:30px;">
								<td id="moca">
								MOCHA
								</td>
							</tr>
						</table>
					</td>
					<td class="orderListDetail">
						<table >
							<tr style="height:120px">
								<td>
								<img style="height:120px" src="http://localhost:8080/final_prj/common/orderImg/caramel.png" id="caramelPic">										
								</td>
							</tr>
							<tr style="height:30px;">
								<td id="caramel">
								CARAMEL
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="font-family: locus_sangsang;border-radius: 10px 0 0 10px; background-color: #DBDEE3;">휘핑크림</td>
					<td colspan="3" class="orderListDetail" style="border-bottom: 1px solid #DBDEE3">

					<div id="quantityDiv" >
					<img style="height: 30px; padding-top: 10px" src="http://localhost:8080/final_prj/common/orderImg/minus.png" id="creamMinus">
					<input type="text" value="<%= test.get(0).getCream() %>" name="cream" id="cream" readonly="readonly">
					<img style="height: 30px; padding-top: 10px" src="http://localhost:8080/final_prj/common/orderImg/plus.png"  id="creamPlus">
					</div>
					
					</td>
				</tr>
				<tr>
					<td style="font-family: locus_sangsang;border-radius: 10px 0 0 10px; background-color: #DBDEE3;">토핑</td>
					<td class="orderListDetail">
						<table >
							<tr style="height:120px">
								<td>
								<img style="height:120px" src="http://localhost:8080/final_prj/common/orderImg/almond.png" id="almondPic">										
								</td>
							</tr>
							<tr style="height:30px;">
								<td id="almond">
								ALMOND
								</td>
							</tr>
						</table>
					</td>
					<td class="orderListDetail">
						<table >
							<tr style="height:120px">
								<td>
								<img style="height:120px" src="http://localhost:8080/final_prj/common/orderImg/walnut.png" id="walnutPic">										
								</td>
							</tr>
							<tr style="height:30px;">
								<td id="walnut">
								WALNUT
								</td>
							</tr>
						</table>
					</td>
					<td class="orderListDetail">
						<table >
							<tr style="height:120px">
								<td>
								<img style="height:120px" src="http://localhost:8080/final_prj/common/orderImg/cashew.png" id="cashewPic">										
								</td>
							</tr>
							<tr style="height:30px;">
								<td id="cashew">
								CASHEW NUTS
								</td>
							</tr>
						</table>
					</td>
				</tr>
	</c:if>
	
	
	<c:if test="${ param.category eq 'dessert' }">
				<tr>
					<td style="font-family: locus_sangsang;border-radius: 10px 0 0 10px; background-color: #DBDEE3;">포장</td>
					<td colspan="3" class="orderListDetail" style="border-bottom: 1px solid #DBDEE3">

					<div id="packingDiv">
					<button type="button" id="eatBtn" class="btn btn-secondary">매장</button>
					<button type="button" id="packBtn" class="btn btn-danger">포장</button>
					</div>
					
					</td>
				</tr>
	</c:if>
			</table>
		</div>
	
	</div>
	<div id="orderFooter">
		
		<div id="orderButtons">
			<button type="button" id="cartBtn" class="btn btn-secondary">장바구니</button>
		</div>
		
	</div>

</div> <!-- orderCoffeeWrap -->

</body>
</html>