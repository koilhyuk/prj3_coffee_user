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
<title>장바구니</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Staatliches&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">

<style type="text/css">
	@import url("http://localhost:8080/final_prj/common/header_footer.css");
	
	#main_pageMenuBar{ height:69px; background-color:#323C51; }
	
	#cartWrap{ width:1000px; margin:0px auto; padding:50px 15px 100px 15px; }
	
	#cartHeader{ font-family: 'Eoe_Zno_EB', sans-serif; font-weight:nomal; font-size:36px;}
	#cartButtons{ padding-left: 780px;}
	#content{margin: 20px;}
	#totalPrice{text-align: right;}
	.categoryFont{ font-family: 'Eoe_Zno_EB', sans-serif; font-weight:nomal; font-size:27px; }
	.circlePhoto{ box-sizing:border-box; margin:0px auto; width:120px; height:120px; border-radius:50%; background-color:#A78F85; }
	.orderDetailList{ width:700px; border:1px solid #CCC; }
	.orderList .border-0{cursor:pointer; }
    .orderList .orderwrap{display:none;}
    .orderList{border-bottom: 5px solid #dee2e6}
	.mb-5{margin-bottom: 0px;}
	.row{margin-top: 20px;}
	.table td{padding: .35rem;}
	
	.quantityBr{ width:33px; height:30px; text-align:center; vertical-align:top; font-size: 21px; border:0px; }
	.quantityD{ width:33px; height:30px; text-align:center; vertical-align:top; font-size: 21px; border:0px; }
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript">
<%
	List<CartListVO> cartList=(List)request.getAttribute("cartList");

	int cnt=0;
	int superPrice=0;
	for(int i=0; i<cartList.size(); i++) {
		cnt+=cartList.get(i).getQuantity();		
		superPrice+=cartList.get(i).getTotalPrice();
	}//end for
	
%>
	var cnt=<%=cnt%>;
	var superPrice=<%=superPrice%>;
	


//수량 변경/////
function setQuantity(id, flag,  code, price, priceId, quantity){
	var cnt=$("#"+id).val();
	var totalPrice=$("#"+price).val();
	var oneprice=totalPrice/$("#"+quantity).val();
	if(flag=="-"){
		if(cnt==1){
			alert("삭제버튼을 눌러주세요");
			return;
		}//end if
		cnt--;
		quantity-=1;
		superPrice-=oneprice*1;
	}else{
		if(cnt==10){
			alert("10개까지만 주문할 수 있눈뎅^.^");
			return;
		}//end if
		cnt++;
		quantity+=1;
		superPrice+=oneprice*1;
	}//end if
	
	var calPrice=oneprice*cnt;
	$("#"+id).val(cnt);
	$("#"+priceId).text(calPrice);
	
	var param="modifyQuantity="+$("#"+id).val()+"&modifyCartCode="+code;
	$.ajax({
           url: "modify_cart.do",
           type: "GET",
           data: param,
           dataType : "json",
           success: function( jsonArr){
        	   	var quantity=0;
        	   	var totPrice=0;
        	   	$.each(jsonArr, function(i, jsonObject){
           		 quantity +=jsonObject.quantity;
           		totPrice += jsonObject.totalPrice;
        	   	})//each
			    
			$("#cnt").text("총 "+ quantity +"개");
		    $("#superPrice").text("총 "+ superPrice +"원");
			   	
           },	 
           error: function(){
           }
       });//ajax
        
}//setQuantity


var deleteCodeArr=new Array();

function deleteOrder( checkboxId, code, category, deletePrice, deleteQuantity ){
	
	if($("#"+checkboxId).is(":checked")){
	
	if(confirm("메뉴를 삭제하시겠습니까?")){
		var checkArr = [];
		
		$('input[name="checkDelete"]:checked').each(function(i){
			checkArr.push($(this).val());
		});
		
		var objParams = { 
				"deleteCode" : checkArr
		};
		
		$.ajax({
	           url: "delete_cart.do",
	           type: "GET",
	           data: objParams,
	           dataType : "json",
	           success: function(data){
	        	   
	        	 if("음료"==category){  
	        	   $("#"+checkboxId).parent().parent().next().remove();
	        	   $("#"+checkboxId).parent().parent().next().remove();
	        	   $("#"+checkboxId).parent().parent().next().remove();
	        	   $("#"+checkboxId).parent().parent().next().remove();
	        	   $("#"+checkboxId).parent().parent().next().remove();
	        	   $("#"+checkboxId).parent().parent().next().remove();
	        	   $("#"+checkboxId).parent().parent().remove();
	        	 }else{
	        	   $("#"+checkboxId).parent().parent().next().remove();
	        	   $("#"+checkboxId).parent().parent().remove();
	        	 }//end else
	        		 
	        	
	        	superPrice-=$("#"+deletePrice).val();
	        	cnt-=$("#"+deleteQuantity).val();
	        	if(cnt!=0){
	        	 $("#cnt").text("총 "+cnt+"개");
	        	 $("#superPrice").text("총 "+ superPrice +"원");
	        	}//end if
	        		$("#cnt").text("총 0개");
		        	$("#superPrice").text("총 0원");
	        	
	        		 
	        		 
	        		 
	           },
	           error: function(){
	        	   alert("실패");
	           }
	       });//ajax
	      
		<%-- $("#cnt").text("총 <%=cnt %>개");
	    $("#superPrice").text("총 <%=superPrice %>원"); --%>
	       
	}//end if
		
	
}//deleteOrder
	/* var deleteCode=new Object();
		
	deleteCode.deletCode=code;
	deleteCodeArr.push(deleteCode);
	}else{
		for(var i=0; i<deleteCodeArr.length; i++){
			if(deleteCodeArr[i].deletCode == code){
				delete deleteCodeArr[i]['deletCode'];
			}//end if
		}//end for
	}//end else */
}//deleteOrder

$(function () {
	$('[data-toggle="tooltip"]').tooltip();
	
	
	<%for(int i=0; i<cartList.size(); i++){
		  if(cartList.get(i).getMenuName().contains("음료")){
	%>
		$("#brPrice<%=i%>").text(<%=cartList.get(i).getTotalPrice()%>);
	<% }else{%>
		$("#dPrice<%=i%>").text(<%=cartList.get(i).getTotalPrice()%>);
	<% }//end if
	}//end for%>
	
	
	$("#cnt").text("총 "+cnt+"개");
	$("#superPrice").text(superPrice+"원");
	
	$("#deleteBtn").click(function(){
		var checkArr = [];
		
		$('input[name="checkDelete"]:checked').each(function(i){
			checkArr.push($(this).val());
		});
		
		var objParams = { 
				"deleteCode" : checkArr
		};
		
		$.ajax({
	           url: "delete_cart.do",
	           type: "GET",
	           data: objParams,
	           dataType : "json",
	           success: function(data){
	        	   alert(data);
	           },
	           error: function(){
	        	   alert("실패");
	           }
	       });//ajax
	      
	    for(var i=0; i<checkArr.length; i++){
	    	$(".table tr>td:last>input[id="+checkArr[i]+"]").parent().parent().remove();
	    	
	    }//end for
	    
		
	});//click
	
	
	$("#orderBtn").click(function(){
		window.location.href="pay.do"
	});//결제
});



</script>
</head>
<body>

<div id="main_pageMenuBar">
<c:choose>
<c:when test="${not empty sessionScope.id}">
 	<c:import url="/WEB-INF/views/common_d/header_login.jsp"/>
</c:when>
<c:otherwise>
 <c:import url="/WEB-INF/views/common_d/header.jsp"/>
</c:otherwise>
</c:choose>
</div>


<div id="cartWrap">

		<form action="cart.do" name="cartFrm" id="cartFrm" method="post">
			
			<input type="hidden"name="orderList"/>
			
		</form>



	<div id="cartHeader">
		장바구니
	</div>
	<div id="content">
	
	
<input type="checkbox" value="beverage"/><span class="categoryFont">&nbsp;음료</span>
	<div id="beverageOrder">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 bg-white ">
          <!-- Shopping cart table -->
          <div class="table-responsive">
          
          <form action="" name="brFrm" id="brFrm">
            <table class="table"  >
              <thead>
                <tr align="center">
                  <th scope="col" class="border-0 bg-light">
                    <div class="p-2 px-3 text-uppercase">메뉴</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">가격</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">수량</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">삭제</div>
                  </th>
                </tr>
              </thead>
              <tbody class="orderList" >
              <%for(int i=0; i<cartList.size(); i++){
            	  if(cartList.get(i).getMenuName().contains("음료")){%>
            	  
                <tr>
                  <td scope="row" class="border-0" id="orderItem">
                    <div class="p-2">
                      <img src="images/americano.png"  alt="" width="100" class="img-fluid">
                      <div class="ml-3 d-inline-block align-middle rounded shadow-sm">
                        <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block align-middle"><%=cartList.get(i).getGdName() %></a></h5><span class="text-muted font-weight-normal font-italic d-block">Category: <%=cartList.get(i).getCategory() %></span>
                      </div>
                    </div>
                  <td class="border-0 align-middle" align="center"><strong><span id="brPrice<%=i%>"></span></strong></td>
                  <td class="border-0 align-middle" align="center"> 
                  <img  src="http://localhost:8080/final_prj/common/orderImg/minus.png" style="width: 15px; "  onclick="setQuantity('q<%=i%>','-','<%= cartList.get(i).getCartCode() %>','price<%=i%>','brPrice<%=i%>','brQ<%=i%>')">
                  <input type="text" value="<%=cartList.get(i).getQuantity() %>" name="q<%=i%>" id="q<%=i%>" class="quantityBr" readonly="readonly" style="padding: 5px">
                  <input type="hidden" value="<%=cartList.get(i).getTotalPrice() %>" id="price<%=i%>"/>
                  <input type="hidden" value="<%=cartList.get(i).getQuantity() %>" id="brQ<%=i%>"/>
                  <img  src="http://localhost:8080/final_prj/common/orderImg/plus.png" style="width: 15px; " onclick="setQuantity('q<%=i%>','+','<%= cartList.get(i).getCartCode() %>','price<%=i%>','brPrice<%=i%>','brQ<%=i%>')"></td>
                  <td class="border-0 align-middle" align="center"><input type="checkbox" id="<%= cartList.get(i).getCartCode() %>" value="<%= cartList.get(i).getCartCode() %>" name="checkDelete" onclick="deleteOrder('<%=cartList.get(i).getCartCode()%>','<%=cartList.get(i).getCartCode()%>','음료','price<%=i%>','brQ<%=i%>')"/></td>
              </tr>
                 			<tr class="orderDetail" >
								<td ><%=cartList.get(i).getType()%>/<%=cartList.get(i).getSize() %>/<%=cartList.get(i).getCup() %></td>
								<td align="center"><%=cartList.get(i).getSizeAddedPrice() %>원</td>
								<td ></td>
								<td ></td>
							</tr >
							<tr class="orderDetail">
								<td >에스프레소 추가</td>
								<td align="center"><%=cartList.get(i).getShotAddedPrice() %>원</td>
								<td align="center"><%=cartList.get(i).getShotPlus() %></td>
								<td ></td>
							</tr>
							<tr class="orderDetail" >
								<td  ><%=cartList.get(i).getMilk() %> 선택</td>
								<td  align="center"><%=cartList.get(i).getMilkAddedPrice() %>원</td>
								<td  ></td>
								<td  ></td>
							</tr>
							<tr class="orderDetail" >
								<td  >[<%=cartList.get(i).getSyrup() %>]시럽 선택</td>
								<td  align="center"><%=cartList.get(i).getSyrupAddedPrice() %>원</td>
								<td  ></td>
								<td  ></td>
							</tr>
							<tr class="orderDetail" >
								<td  >휘핑크림 추가</td>
								<td  align="center"><%=cartList.get(i).getCreamAddedPrice() %>원</td>
								<td   align="center"><%=cartList.get(i).getCreamPlus() %></td>
								<td   ></td>
							</tr>
							<tr class="orderDetail" >
								<td  >[<%=cartList.get(i).getTopping() %>]토핑 추가</td>
								<td  align="center"><%=cartList.get(i).getToppingAddedPrice() %>원</td>
								<td   ></td>
								<td   ></td>
							</tr>
              
              
              <%
            	  }//end while
            	  }//end for %>
              </tbody>
              
            </table>
            </form>
            
            
          </div>
          <!-- End -->
        </div>
      </div>
		</div>
		<hr>
		<input type="checkbox" value="dessert"/><span class="categoryFont">&nbsp;디저트</span>
		<div class="row">
        <div class="col-lg-12 bg-white">
          <!-- Shopping cart table -->
          <div class="table-responsive">
            <table class="table" >
              <thead>
                <tr align="center">
                  <th scope="col" class="border-0 bg-light">
                    <div class="p-2 px-3 text-uppercase">메뉴</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">가격</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">
                   		
                   		수량
                    </div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">삭제</div>
                  </th>
                </tr>
              </thead>
              <tbody class="orderList" >
              <%for(int i=0; i<cartList.size(); i++){
            	  if(cartList.get(i).getMenuName().contains("디저트")){%>
                <tr>
                  <td scope="row" class="border-0" id="orderItem">
                    <div class="p-2">
                      <img src="images/americano.png"  alt="" width="100" class="img-fluid rounded shadow-sm">
                      <div class="ml-3 d-inline-block align-middle">
                        <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block align-middle"><%=cartList.get(i).getGdName() %></a></h5><span class="text-muted font-weight-normal font-italic d-block">Category: 디저트</span>
                      </div>
                    </div>
                  </td>
                  <td class="border-0 align-middle" align="center"><strong><span id="dPrice<%=i%>"></span></strong></td>
                  <td class="border-0 align-middle" align="center">
                  <div >
                  <img  src="http://localhost:8080/final_prj/common/orderImg/minus.png" style="width: 15px;" class="quantityMinusD" onclick="setQuantity('d<%=i%>','-','<%= cartList.get(i).getCartCode() %>','priceD<%=i%>','dPrice<%=i%>','dQ<%=i%>')">
                  <input type="text" value="<%=cartList.get(i).getQuantity() %>" name="quantityD" id="d<%=i%>" class="quantityD" readonly="readonly" style="padding: 5px">
                  <input type="hidden" value="<%=cartList.get(i).getTotalPrice() %>" id="priceD<%=i%>"/>
                  <input type="hidden" value="<%=cartList.get(i).getQuantity() %>" id="dQ<%=i%>"/>
                  <img  src="http://localhost:8080/final_prj/common/orderImg/plus.png" style="width: 15px;" class="quantityPlusD" onclick="setQuantity('d<%=i%>','+','<%= cartList.get(i).getCartCode() %>','priceD<%=i%>','dPrice<%=i%>','dQ<%=i%>')">
                  </div>
                  </td>
                  <td class="border-0 align-middle" align="center"><input type="checkbox" id="<%= cartList.get(i).getCartCode() %>" value="<%= cartList.get(i).getCartCode() %>" name="checkDelete" onclick="deleteOrder('<%=cartList.get(i).getCartCode()%>','<%=cartList.get(i).getCartCode()%>','디저트','priceD<%=i%>','brQ<%=i%>')"/></td>
                </tr>
              	<tr class="orderDetail" >
					<td align="center"><%=cartList.get(i).getPack() %></td>
					<td align="center"><%=cartList.get(i).getBasicPrice() %>원</td>
					<td colspan="2"></td>
				</tr>
							
               <%
            	  }//end while
            	  }//end for %>
              </tbody>
            </table>
          </div>
          <!-- End -->
        </div>
      </div>
	</div>
	</div>
	<div id="cartFooter">
	
		<div id="totalPrice" ">
			<table class="table table-sm">
			  <thead>
			    <tr >
			      <th scope="col"><span id="cnt"></span></th>
			      <th scope="col"><span id="superPrice"></span></th>
			    </tr>
			  </thead>
			</table>
		</div>
		
		<div id="cartButtons" style="text-align: left;">
			<button type="button" id="orderBtn" class="btn btn-secondary">주문하기</button>
		</div>
	
	</div>

</div> <!-- cartWrap -->

<div id="main_pageFooter">
	<jsp:include page="../common_d/footer.jsp"/>
</div>

</body>
</html>