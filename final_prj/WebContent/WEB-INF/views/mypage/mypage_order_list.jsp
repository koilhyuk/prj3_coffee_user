<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 내역</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Staatliches&display=swap" rel="stylesheet"><!-- 폰트 넣으삼 -->
<style type="text/css">
	@import url("http://localhost:8080/final_prj/common/header_footer.css");/* 이것도 */
	/* 사이드메뉴 시작 */
	@import url("http://localhost:8080/final_prj/common/side_menu.css");/* 이것도 */
	/* 사이드메뉴 끝 */
	
	/* 메인뷰 시작 *//* <!-- ^^ --> */
	#container{    min-height: 800px;
    margin-top: 2%;
    margin-bottom: 2%;
    margin-left: auto;
    margin-right: auto;
    max-width: 1200px;
	}
	#mainView{width: 900px; float:left; min-height: 800px;}
	.imgSize{height: 40px}
	.table{ border-bottom: 1px solid #DBDBDF}
	/* 메인뷰 끝 *//* <!-- ^^ --> */
		
	/* footer시작 *//* <!-- ^^ 푸터 wrap안으로 넣으세요--> */
	#footer{clear: both;}
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
	}/* <!-- ^^ --> */
	/* footer끝 */
	#order_title{margin-top: 25px;padding-left: 25px; font-size: 40px;  margin-bottom: 30px; font-family: locus_sangsang; border-left: 5px solid #DBDBDF;}
	#orderCalc{max-width : 800px; height:80px;font-size: 25px;  background-color: #DBDBDF; padding-top: 2%;padding-bottom: 2%; margin-left: 10%; font-family: Eoe_Zno_EB}
	.calcContent{float: right;width : 400px ;text-align: center;font-size: 25px; font-weight: bold; text-align: center;}
	/* #editTable{margin-left: 10%; margin-top: 30px; width: 600px; font-family: GoyangIlsan}  */
	
	@font-face { font-family: 'Eoe_Zno_EB'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/Eoe_Zno_EB.woff') format('woff'); font-weight: normal; font-style: normal; }
	/* .calcContent{float: left;width : 320px ;margin-left: 43px;margin-top: 20px;text-align: center;font-size: 25px; font-weight: bold;} */
	#orderTable{margin-left: 100px; margin-top: 30px; width: 800px}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	
});
</script>
</head>
<body style="height: 100%"><!-- ^^ -->
<div id="class4Wrap">
	
<div id="header">
 <c:import url="/WEB-INF/views/common_d/header_login.jsp"/>
</div><!-- header -->

<div id="container" >

<div id="mypageSide" class="menuFont">
<c:import url="/WEB-INF/views/mypage/mypage_menu.jsp"/> 
</div>

<div id="mainView">
<div id="order_title">
결제 내역
</div> 
<div id="orderCalc">
<div class="calcContent">이달의 결제 건수 <c:out value="${orderCount.monthlyOrder}"/>건</div><div class="calcContent">총 결제건수 ${orderCount.totalOrder}건</div>

</div>
<div id="orderTable">
<table class="table">
  <thead>
    <tr>
      <th scope="col">결제일</th>
      <th scope="col">주문내역</th>
      <th scope="col">주문금액</th>
      <th scope="col">결제수단</th>
    </tr>
  </thead>
  <tbody>
   <c:forEach var="oh" items="${orderList}">
   	<tr>
   		<td><c:out value="${oh.orderDate}"/></td><td><c:out value="${oh.gdName}"/></td><td><c:out value="${oh.price}"/></td>
   		<td><c:out value="${oh.payment eq 'N'?'카드':'레몬'}"/></td>
   	</tr>
   </c:forEach>
  </tbody>
</table>

</div>
<div id="boardIndexList">
	
	<div style="margin: 0px auto;width:250px">
	<nav aria-label="Page navigation example">
	  <ul class="pagination">
		<c:out value="${indexList}" escapeXml="false"/>
	  
	  </ul>
	</nav>
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