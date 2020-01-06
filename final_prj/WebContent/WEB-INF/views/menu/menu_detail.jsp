<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu Detail</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Staatliches&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">

<style type="text/css">
	@import url("http://localhost:8080/final_prj/common/header_footer.css");

	#mainMenuBar{ height:69px; background-color:#323C51; margin-bottom:30px; }
	
	#menuDetailWrap{ position:relative; width:500px;  margin:5% auto 5% auto; text-align:center; }
	
	#menuPhoto{ height:360px; margin-bottom: 20px }
	#menuImg{ position: absolute; top:0; left:0; width: 100%; height:360px; }
	#menuName{ font-family: 'locus_sangsang'; font-weight:bold; font-size:36px;  }
	
	#menuInfo{}
	
	#infoTitle{ font-family: 'locus_sangsang'; font-weight:nomal; font-size:27px; text-align:left; padding-bottom:21px; }
	
	#infoTab{ font-size:13px; padding-bottom:21px;font-family: 'GoyangIlsan'; font-weight: bold} }
	tr{ height:28px; }
	td{ width:100px; }
	
	#info{ text-align:left; font-family: 'GoyangIlsan';}
	
	#mainFooter{ height:110px; background-color:#323C51; clear:both; }
	
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript">
$(function() {
	
	$("#directOrderBtn").click(function() {
		var gdName =$("#hiddenGdName").val().trim();
		location.href='../order/order_menu.do?gdName='+gdName ;
		
	});//click
	

});//ready
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

<div id="menuDetailWrap">

	<c:forEach var="menuInfoData" items="${ menuInfoData }">
	<input type="hidden" id="hiddenGdName" name="hiddenGdName" value="${ menuInfoData.gdName }">
	<div id="menuPhoto">
		<img src="http://localhost:8080/final_prj/common/menuImg/${ menuInfoData.categoryName }/${ menuInfoData.gdImg }" alt="엑박" id="menuImg"/>
	</div>
	<div id="menuName">${ menuInfoData.gdName }</div>
	<hr/>
	<div id="menuInfo">
		<div id="infoTitle">영양정보</div>
		<div id="infoTab">
			
			<table style="margin:auto; border-bottom: 1px solid #dee2e6" class="table table-sm" >
				<tr style="font-weight:900; background-color: #F0F0E1 ;color: #141A1D">
					<th>1회 제공량(kal)</th>
					<th>카페인(mg)</th>
					<th>나트륨(mg)</th>
					<th>당류(g)</th>					
				</tr>
				<tr>
					<td>${ menuInfoData.gdKal }</td>
					<td>${ menuInfoData.gdCaffein }</td>
					<td>${ menuInfoData.gdSalt }</td>
					<td>${ menuInfoData.gdSugar }</td>
				</tr>
			</table>
			
		</div>
		
		<div id="info">${ menuInfoData.gdInfo }</div>
		<div>
			<button type="button" id="directOrderBtn" name="directOrderBtn" class="btn btn-primary" style="height: 40px; width: 130px; margin-top: 50px">바로주문</button>
		</div>
	</div>

	</c:forEach>
	
</div> <!-- menuDetailWrap -->

<div id="mainFooter">
	<jsp:include page="../common_d/footer.jsp"/>
</div>

</body>
</html>