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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Staatliches&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">

<style type="text/css">

	/* 헤더 푸터 css */
	 @import url("http://localhost:8080/final_prj/common/header_footer.css");
	/* 헤더 푸터 css 끝 */
	/* 컨테이너 시작 */
 	#mapInfo{margin-right: auto; margin-left: auto; max-width: 1500px; margin-top: 5%; margin-bottom: 5%} 
 	#mapCon{}
	.row{
		max-width: 1300px;
		margin-left: auto;
		margin-right: auto;
	}
	.col-12{
	padding-right:0px;
	}
	.col-6{
	padding-right:0px;
	padding-left: 0px
	}
	html,body{ margin:0; padding:0; width:100%; height:100% }
	#coffeWrap{ display: flex; min-height: 100vh; flex-direction: column; }
	#containerLoc{ flex: 1; } 
	
	/* 컨테이너 끝 */
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript">
$(function() {
		/*툴팁  */
		$('[data-toggle="tooltip"]').tooltip();
});

</script>
</head>
<body >
<div id="coffeWrap" >
<div id="header">
<c:choose>
<c:when test="${not empty sessionScope.id}">
 <c:import url="/WEB-INF/views/common_d/header_login.jsp"/>
</c:when>
<c:otherwise>
 <c:import url="/WEB-INF/views/common_d/header.jsp"/>
</c:otherwise>
</c:choose>
</div>
<div id="containerLoc" >
<div id="mapInfo" >
	 <div class="row">
	 	
	  <div class="col-12 col-md-7">
		<div id="map" style="width:100%;height:700px; border-top-left-radius:10px; border-bottom-left-radius:10px"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e4bdcc1fb70d973afd14f2b64b6b7cd"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.49932297018342 , 127.03320846700835 ), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(37.49932297018342 , 127.03320846700835 ); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		var iwContent = '<div style="padding:5px;width:300px;">Yul\'s&nbsp;Coffee(율스커피)<br><a href="https://map.kakao.com/link/map/율스커피(서울시 강남구 테헤란로 132),37.49932297018342,127.03320846700835" style="color:blue" target="_blank">서울특별시 강남구 테헤란로 132</a> <a href="https://map.kakao.com/link/to/Yul\'s&nbsp;Coffee(율스커피),37.49932297018342,127.03320846700835" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new kakao.maps.LatLng(37.49932297018342 , 127.03320846700835 ); //인포윈도우 표시 위치입니다
		
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
		</script>
      </div>
      <div class="col-6 col-md-5" style="border-top-right-radius:10px;border-bottom-right-radius:10px;background-color: #DBDBDF">
      <div style="margin-top: 10%;margin-left: 20px;margin-right: 20px;">
     
      <div style="margin-bottom: 40px; border-bottom: 2px solid white">
		<h4 style="font-family: Eoe_Zno_EB;  ">매장 제공 서비스</h4>
		<img  src="http://localhost:8080/final_prj/common/infoImg/mapInfo.png" style="height: 50px;margin-bottom: 30px">
      </div>
      <div style="margin-bottom: 30px">
		<h4 style="font-family: Eoe_Zno_EB; margin-bottom: 10px">주소</h4>
		<span style="font-size: 20px;font-family: GoyangIlsan;">서울특별시 서울시 강남구 테헤란로 132 (Yul's Coffee)</span>
      </div>
      <div style="margin-bottom: 30px">
		<h4 style="font-family: Eoe_Zno_EB; margin-bottom: 10px">찾아오시는 길</h4>
		<span style="font-size: 20px ;font-family: GoyangIlsan;">지하철 : [2호선 역삼역] 3번출구 도보3분 거리</span><br/>
		<span style="font-size: 20px">버스 : [역삼역 하차] 146, 341, 360, 740, 6000, 6020, 1100</span>
      </div>
      <div style="margin-bottom: 30px">
		<h4 style="font-family: Eoe_Zno_EB; margin-bottom: 10px">전화번호</h4>
		<span style="font-size: 20px ;font-family: GoyangIlsan;">02-3482-4632~5</span>
      </div>
      <div style="margin-bottom: 30px">
		<h4 style="font-family: Eoe_Zno_EB; margin-bottom: 10px">영업시간</h4>
		<span style="font-size: 20px;font-family: GoyangIlsan;">08:00 ~ 23:00</span>
      </div>
       </div>
      </div>
      </div>
	</div>
    </div>
</div>
<div id="footer">
 <c:import url="/WEB-INF/views/common_d/footer.jsp"/>
</div>





</body>
</html>