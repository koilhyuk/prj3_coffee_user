<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 query</title>

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
	#empty1{color:#FF0000; font-weight: bold; display: none; }
</style>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 
<!--  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(function () {
	
	$("#writeBtn").click(function(){
		if($("#subject1").val().trim()==""){
			$("#empty1").show().fadeOut(5000);
			$("#subject1").focus();
			return;
		}else if($("#summernote").val()==""){
			$("#empty1").show().fadeOut(5000);
			$("#summernote").focus();
			return;
		}
		if (confirm("1:1 문의를 등록하시겠습니까 ")) {
		$(".qnaFrm").submit();
		document.form.reset();
		alert("완료");
		}//if
	});
	$("#listBtn").click(function(){
		
		location.replace('/final_prj/mypage/mypage_qna.do')
	});
	
	
	
	$('#summernote').summernote({focus:true, height: 300, width: 900, placeholder:"문의할 내용은?"});
		
	
	
});
</script>
</head>
<body>
<div id="queryWrap">

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
<div id="containerQnA">

	<div id="queryHeader">
		1:1문의
	</div>
	<form action="qnA_process.do" class="qnaFrm" method="post">
	<div>
	
		<table id="queryTab">
			<tr style="height:60px;">
				<td style="width:100px;" class="tFont">작성자</td>
				<td><input class="form-control" type="text" style="width:900px" value="${sessionScope.id}" readonly="readonly"  name="m_id"></td>
				</tr>
			<tr style="height:60px;">
				<td style="width:100px;" class="tFont">제목</td>
				<td colspan="3"><input class="form-control" type="text" style="width:900px" name="q_subject" id="subject1"></td>
			</tr>
			<tr style="height:360px;">
				<td></td>
				<td colspan="3"><textarea id="summernote" style="width:900px; height:300px;" name="q_content" ></textarea></td>
			</tr>
		</table>
	</div>
	
	<div id="queryFooter">
		
		<div id="queryButtons">
		<p id="empty1">모든 빈칸(제목, 내용)을 채워주세요.</p>
			<button type="button" id="writeBtn" class="btn btn-secondary"> 작성완료</button>
			<button type="button" id="listBtn" class="btn btn-secondary" >목록으로</button>
		</div>
	</div>
	</form>
		
		
		
</div>

<div id="mainFooter">
	<jsp:include page="../common_d/footer.jsp"/>
</div>
</div> <!-- queryWrap -->

</body>
</html>