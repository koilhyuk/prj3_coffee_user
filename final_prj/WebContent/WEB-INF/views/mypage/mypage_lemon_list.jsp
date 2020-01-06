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
	#container{    min-height: 800px;
    margin-top: 2%;
    margin-bottom: 2%;
    margin-left: auto;
    margin-right: auto;
    max-width: 1200px;
}
	#mainView{width: 900px; float:left; min-height: 500px;}
	.imgSize{height: 40px}
	.table{ border-bottom: 1px solid #DBDBDF}
	/* 메인뷰 끝 */
 	
	/* footer시작 */
	
	#footer{clear:both;}
	
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
	/* footer끝 */
	#order_title{margin-top: 25px;padding-left: 25px; font-size: 40px;  margin-bottom: 30px; font-family: locus_sangsang; border-left: 5px solid #DBDBDF;}
	#orderCalc{max-width : 800px; height:80px;font-size: 25px;  background-color: #DBDBDF; padding-top: 2%;padding-bottom: 2%; margin-left: 10%; font-family: Eoe_Zno_EB}
	.calcContent{float: right;width : 400px ;text-align: center;font-size: 25px; font-weight: bold; text-align: center;}
	#orderTable{margin-left: 10%; margin-top: 30px; width: 800px; font-family: GoyangIlsan;  overflow-y:auto;}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
<script type="text/javascript">


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
레몬 적립
</div>
<div id="orderCalc">
<div class="calcContent"><img class="imgSize" src="http://localhost:8080/final_prj/common/images/lemon2.png">총 레몬 <c:out value="${lemonCount.totalLemon}"/>건</div>
<div class="calcContent"><img class="imgSize" src="http://localhost:8080/final_prj/common/images/lemon.png"> 이달의 적립 레몬 <c:out value="${lemonCount.monthlyLemon}"/> 건</div>
</div>
<div id="orderTable" style="height: 500px">
<table  class="table table-fixed"  >
  <thead>
    <tr>
      <th scope="col">구분</th>
      <th scope="col">이용 내역</th>
      <th scope="col">유효기간</th>
    </tr>
  </thead>
  <tbody>
   <c:forEach var="ll" items="${lemonList}">
   	<tr>
   		<th><c:out value="${ll.status eq 'N' ?'적립':'사용'}"/></th>
   		<th><c:out value="${ll.status eq 'N' ?'적립':'사용'}"/></th>
   		<th><c:out value="${empty ll.useDate ?ll.expiredDate:''}"/></th>
   	</tr>
   </c:forEach>
  </tbody>
</table>

</div>



</div>


</div><!-- container DIV end -->
<div id="footer">
	<c:import url="/WEB-INF/views/common_d/footer.jsp"/>	
</div>
  </div><!-- wrap -->



</body>
</html>