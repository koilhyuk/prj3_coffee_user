<%@page import="kr.co.sist.domain.MainComGoodsDomain"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Staatliches&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">

<style type="text/css">
	
	/* 헤더 푸터 폰트 css*/
	 @import url("http://localhost:8080/final_prj/common/header_footer.css");
	 @font-face { font-family: 'S-CoreDream-9Black'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-9Black.woff') format('woff'); font-weight: normal; font-style: normal; }
	/* 컨테이너 시작 */
	/* 점보트론 시작*/
	#containerJumbo{ height: 370px ;height: auto; }
	/* #jumbotronB{ background-image: url(http://localhost:8080/ui_prj3/main_page/images/jumbo.png); border-radius:0px; background-color: #080D07; margin: 0px auto;  width: 1500px;  height: 370px}*/
	
	#orderBtn{width: 300px; height: 80px; margin-top: 70px}
	.btn-dark, .btn-dark:hover, .btn-dark:active, .btn-dark:visited{
    background-color: #141A1D;
    border-color: #141A1D;
	}
	.btn-dark:hover{
	background-color: white;
	border-color: white;
	color: #141A1D;
	}
	.jumboFont{
	font-family: 'S-CoreDream-9Black'
	}
	/* 점보트론  끝*/
	
	/* 컨텐츠 컨테이너 시작 */
	#containerContent{max-width: 1300px; /* border: 1px solid red; */ min-height: 600px;margin-bottom: 30px }
	.contentName{
	font-family:Eoe_Zno_EB;
	font-size: 25px;
	color: #141A1D;
	padding: 10px;
	}
	#monthMenu{ /* border: 1px solid blue; */}
	.card{
	height: 290px;
	}
	.card-title{
	font-family:Eoe_Zno_EB;
	font-size: 20px;
	color: #141A1D;
	margin:auto;
	text-align: center;
	}
	.card-img-top{
	height: 250px;
	}
	
	.card-body{
	padding: 5px;
	}
	th{
	width: 80%; 
	font-size: 15px;
	}
	.table th, .table td{
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left: 2%;
	}
	a{
	color: #141A1D;
	}
	html,body{ margin:0; padding:0; width:100%; height:100% }
	#coffeWrap{ display: flex; min-height: 100vh; flex-direction: column; }
	.container{ flex: 1; } 

	/* 컨텐츠 컨테이너 끝 */
	/* 컨테이너 끝 */

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">

$(function() {
		/*툴팁  */
		$('[data-toggle="tooltip"]').tooltip()
		
});
</script>
</head>
<body>
<div id="coffeWrap">
 
<div id="header">
 <c:import url="/WEB-INF/views/common_d/header.jsp"/>
</div>
<div id="containerJumbo">
	<div class="jumbotron" id="jumbotronB" style="text-align: center; border-radius: 0px;">
	<div >
	  <h1 class="display-4 jumboFont" id="">YUL'S COFFEE!</h1>
	  <p class="lead jumboFont">지금 홈페이지에서 주문가능!</p>
	  <a class="btn btn-dark btn-lg" href="/final_prj/order/order_menu.do?gdName=아메리카노" role="button" id="orderBtn" style="font-family:'Staatliches', cursive; font-size: 43px">Order Now</a>
	</div>
</div>
</div><!-- 점보트론 끝 -->

<% List<MainComGoodsDomain> listData  = (List<MainComGoodsDomain>)request.getAttribute("comGoodsList");
String listOneImg=listData.get(0).getGcName()+"/"+listData.get(0).getGdImg();
String listTwoImg=listData.get(1).getGcName()+"/"+listData.get(1).getGdImg();
String listThreeImg=listData.get(2).getGcName()+"/"+listData.get(2).getGdImg();
%>
<div class="container" id="containerContent"  ><!-- 컨텐츠 컨테이너 시작 -->
  <div class="row" id="innerContent" style="height: 350px; /* border: 1px solid #333; */" ><!--row 이너 컨텐츠 -->
    <div class="col-12 col-md-9" id="monthMenu" ><!-- 추천 메뉴 시작 -->
    <div class="contentName">추천 메뉴</div>
    <div class="card-deck">
	  <div class="card">
	  <a href="/final_prj/menu/menu_detail.do?gdName=<%=listData.get(0).getGdName()%>">
	    <img src="http://localhost:8080/final_prj/common/menuImg/<%=listOneImg %>" class="card-img-top" alt="...">
	    <div class="card-body">
	      <h5 class="card-title"><%=listData.get(0).getGdName() %></h5>
	    </div>
	  </a>
	  </div>
	  <div class="card">
	  <a href="/final_prj/menu/menu_detail.do?gdName=<%=listData.get(1).getGdName()%>">
	    <img src="http://localhost:8080/final_prj/common/menuImg/<%=listTwoImg %>" class="card-img-top" alt="...">
	    <div class="card-body">
	      <h5 class="card-title"><%=listData.get(1).getGdName() %></h5>
	    </div>
	    </a>
	  </div>
	  <div class="card">
	  <a href="/final_prj/menu/menu_detail.do?gdName=<%=listData.get(2).getGdName()%>">
	    <img src="http://localhost:8080/final_prj/common/menuImg/<%=listThreeImg %>" class="card-img-top" alt="...">
	    <div class="card-body">
	      <h5 class="card-title"><%=listData.get(2).getGdName() %></h5>
	    </div>
	    </a>
	  </div>
	</div>
    </div><!-- 추천메뉴 끝 -->
    <div class="col-6 col-md-3" >
  	 <div  class="contentName">위치</div>
  	 <a href="info/location.do">
  	  <div class="card">
   		 <img src="http://localhost:8080/final_prj/common/images/location1.png" class="card-img" height="100%" alt="...">
 	 </div>
   	</a>
    </div><!-- 위치끝 -->
    <div class="col-12" style="margin-top:25px;min-height: 250px; ">
    <div class="contentName">공지사항 및 이벤트</div>
    <div id="noticeTable">
    <table class="table table-borderless" >
	  <tbody>
	    <c:forEach var="nl" items="${noticeList}">
	    	<tr>
	    		<td><c:out value="${nl.nSubject}"/></td>
	    		<td><c:out value="${nl.ntType eq 'E' ? '이벤트':'공지사항'}"/></td>
	    		<td><c:out value="${nl.nDate}"/></td>
	    		<td><input type="hidden" id="nCode" name="nCode" value="${nl.nCode}"/></td>
	    	</tr>
	    </c:forEach>
	  </tbody>
	</table>
    </div>
    </div><!-- 공지사항이벤트 끝 -->
    
	</div><!--row 이너 컨텐츠 -->
</div><!-- 컨텐츠 컨테이너 끝 -->

<div id="footer">
 	<c:import url="/WEB-INF/views/common_d/footer.jsp"/>
</div>

</div>



</body>
</html>