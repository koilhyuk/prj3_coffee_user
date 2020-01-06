<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	/* 헤더 푸터 폰트 css*/
	 @import url("http://localhost:8080/final_prj/main_page/header_footer.css");
	/* 컨테이너 시작 */
	/* 점보트론 시작*/
	#containerJumbo{background-color: #141A1D; height: 370px ;height: auto; }
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
 <c:import url="/WEB-INF/views/common_d/header_login.jsp"/>
</div>
<div id="containerJumbo">
	<div class="jumbotron" id="jumbotronB" style="text-align: center; border-radius: 0px;">
	<div >
	  <h1 class="display-4" id="">Yul's Coffee!</h1>
	  <p class="lead">바로지금 홈페이지에서 주문가능!</p>
	  <a class="btn btn-dark btn-lg" href="#" role="button" id="orderBtn" style="font-family:'Staatliches', cursive; font-size: 43px">Order Now</a>
	</div>
</div>
</div><!-- 점보트론 끝 -->
<div class="container" id="containerContent"  ><!-- 컨텐츠 컨테이너 시작 -->
  <div class="row" id="innerContent" style="height: 350px; /* border: 1px solid #333; */" ><!--row 이너 컨텐츠 -->
    <div class="col-12 col-md-9" id="monthMenu" ><!-- 추천 메뉴 시작 -->
    <div class="contentName">추천 메뉴</div>
    <div class="card-deck">
	  <div class="card">
	  <a href="#void">
	    <img src="images/americano.png" class="card-img-top" alt="...">
	    <div class="card-body">
	      <h5 class="card-title">아메리카노</h5>
	    </div>
	  </a>
	  </div>
	  <div class="card">
	  <a href="#void">
	    <img src="images/hotchoco.png" class="card-img-top" alt="...">
	    <div class="card-body">
	      <h5 class="card-title">핫초코</h5>
	    </div>
	    </a>
	  </div>
	  <div class="card">
	  <a href="#void">
	    <img src="images/gtlatte.png" class="card-img-top" alt="...">
	    <div class="card-body">
	      <h5 class="card-title">그린티라떼</h5>
	    </div>
	    </a>
	  </div>
	</div>
    </div><!-- 추천메뉴 끝 -->
    <div class="col-6 col-md-3" >
  	 <div  class="contentName">위치</div>
  	 <a href="#void">
  	  <div class="card">
   		 <img src="images/location1.png" class="card-img" height="100%" alt="...">
 	 </div>
   	</a>
    </div><!-- 위치끝 -->
    <div class="col-12" style="margin-top:25px;min-height: 250px; ">
    <div class="contentName">공지사항 및 이벤트</div>
    <div id="noticeTable">
    <table class="table table-borderless" >
	  <tbody>
	    <tr>
	      <th scope="row" ><a href="#void">으아아아아아아아공지입니다아아아아</a></th>
	      <td style="padding-right: 5%; font-size: 15px;" >게시일</td>
	    </tr>
	    <tr>
	      <th scope="row" ><a href="#void" >제목</a></th>
	      <td style="padding-right: 5%; font-size: 15px;">게시일</td>
	    </tr>
	  </tbody>
	</table>
    </div>
    </div><!-- 공지사항이벤트 끝 -->
    
	</div><!--row 이너 컨텐츠 -->
</div><!-- 컨텐츠 컨테이너 끝 -->
<div id="footer">
 	<c:import url="http://localhost:8080/final_prj/main_page/footer.jsp"/>
</div>



</div>



</body>
</html>