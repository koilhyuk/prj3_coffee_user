<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Staatliches&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">

<style type="text/css">
	@import url("http://localhost:8080/final_prj/common/header_footer.css");

	#mainMenuBar{ height:69px; background-color:#323C51; }
	
	.menuFont{ font-family: 'locus_sangsang'; font-weight:nomal;}

	#coffeeWrap{ width:1300px; margin:0px auto; }

	/* menuBar */
	#menuLeftBar{ width:300px; min-height:1000px; /* background-color:#494242; */ color:#F0F0E2; padding:15px; float:left;}
	
	#beverage{ height:70px; font-size:40px}
	#mCoffee{ height:50px; font-size:27px}
	#mTea{ height:50px; font-size:27px}
	#mYuliccino{ height:60px; font-size:27px}
	
	#dessert{ font-size:40px}
	
	#menuContent{ width:1100px; padding:15px; float:right; margin-top: 40px}
	/* menuBar */
	#menuLeftBar{ width:280px; /* background-color:#494242; */ color:#494242; padding-top:50px; padding-left:50px; float:left;}
	
	#beverage{ height:70px; font-size:40px;color:#141A1D; }

	
	#card1, #card2, #card3, #card4{color:#494242;border:0px; }

	
	#coffee{ font-size:27px; color:#141A1D; }
	#tea{ font-size:27px; color:#141A1D; }
	#yuliccino{ font-size:27px; color:#141A1D; }
	.mFont{ color:#141A1D; }
	.mFont:hover{ color:#141A1D; }
	
	#dessert{ font-size:40px; color:#141A1D;}
	
	#menuContent{ width:1000px; float:right;}
	
	#mainFooter{ height:110px; background-color:#323C51; clear:both; }
	.card-body{margin-left: 10%;}
	.card-header{
	background-color: white;
	border-bottom: 0px;
	}
	/* Content-Table */
	table{ text-align:center; }
	tr{ height:300px;}
	td{ width:250px;}
	
	#menuTab{ }
	#eachMenuTab{ padding:10px; }

	#mainFooter{ height:110px; background-color:#323C51; clear:both; }

	/* 번외 */
	a{ color:#141A1D; }
	a:hover { color:#141A1D; }
	
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript">
$(function(){
	$('[data-toggle="tooltip"]').tooltip();
	$("#menuLeftBar").css("height", $("#menuContent").css("height"));
	
	$("#coffee").click(function(){
		window.location.href="menu.do?categoryName=커피";
	});
	$("#tea").click(function(){
		window.location.href="menu.do?categoryName=티";
	});
	$("#yuliccino").click(function(){
		window.location.href="menu.do?categoryName=율리치노";
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

<div id="coffeeWrap" class="menuFont">

<div id="menuLeftBar" >

	<div id="beverage" >음료</div>
	
	  <div class="card" id="card1">
	    <div class="card-header" id="headingOne">
	        <button id="coffee" class="btn btn-link" type="button" >
	          	커피
	        </button>
	   </div>
 	</div>
	  <div class="card" id="card2">
	    <div class="card-header" id="headingTwo">
	        <button id="tea" class="btn btn-link collapsed" type="button" >
	          	티	
	        </button>
	    </div>
	  </div>
	  <div class="card" id="card3">
	    <div class="card-header" id="headingThree">
	        <button id="yuliccino" class="btn btn-link collapsed" type="button" >
	          	율리치노
	        </button>
	    </div>
	  </div>
	
	<div id="dessert"><a href="menu.do?categoryName=디저트">디저트</a></div>
	
</div> <!-- menuLeftBar -->

<div id="menuContent" >
	<table id="menuTab">
	
	<tr>
	<c:forEach var="menuData" items="${ menuData }" begin="0" end="${ fn:length(menuData) }" step="1" varStatus="status">
		<td>
			<table id="eachMenuTab" style="border-spacing:10px; border-collapse:separate; ">
	<c:set var="cnt" value="${ cnt+1 }"/>
			<tr style="height:200px; ">
				<td style="border-bottom:1px solid #D5CEC6;">
				<a href="menu_detail.do?gdName=${ menuData.gdName }&categoryName=${ menuData.categoryName }">
				<img alt="엥 왜 안보일까?" src="http://localhost:8080/final_prj/common/menuImg/${ menuData.categoryName }/${ menuData.gdImg }" style="width:200px; height: 200px">
				</a>
				</td>
			</tr>
			<tr style="height:50px;background-color: #F0F0E1; "><td style="border-radius: 0 0 5px 5px ">${ menuData.gdName }</td></tr>			
			</table>
		</td>
	<c:if test="${ cnt%4 eq 0 }" >
	</tr>
	<tr>	
	</c:if>
	</c:forEach>
	</tr>
	
	</table>
</div> <!-- menuContent -->

</div> <!-- coffeeWrap -->

<div id="mainFooter">
	<jsp:include page="../common_d/footer.jsp"/>
</div>

</body>
</html>