<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="주문 시 로그인을 안했을때"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <link href="https://fonts.googleapis.com/css?family=Staatliches&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">
 <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<style type="text/css">
	@import url("http://localhost:8080/final_prj/common/header_footer.css"); 

	#mainMenuBar{ height:69px; background-color:#323C51; }
	
/* 	#queryWrap{ width:1000px; height:100vh; margin:0px auto; padding:15px; } */
	#queryHeader{ border-left: 5px solid #DBDBDF;padding-left: 25px;font-family: 'Eoe_Zno_EB', sans-serif; font-weight:nomal; font-size:36px; margin: 20px 0 20px 0}

	#queryTab{ text-align:center; padding:5px; }
	.tFont{ font-family: 'Eoe_Zno_EB', sans-serif; font-weight:nomal; font-size:21px; }
	
	#queryFooter{}
	#queryButtons{ text-align:right; padding-top:16px; padding-bottom:21px; }
	#listButtons{ width:1000px; height:100px; text-align:center; }
	#nav{ padding-top:50px; }
	
	#mainFooter{ height:110px; background-color:#323C51; }
	html,body{ margin:0; padding:0; width:100%; height:100% }
	#queryWrap{ display: flex; min-height: 100vh; flex-direction: column; }
	#containerQnA{ flex: 1; margin:0px auto; } 
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<script type="text/javascript">
$(function () {

	var message = '${msg}'; 
	var returnUrl = '${url}'; 
/* 	swal(message); */
	alert(message);
	document.location.href = returnUrl; 	
	
	
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


	
</body>
</html>