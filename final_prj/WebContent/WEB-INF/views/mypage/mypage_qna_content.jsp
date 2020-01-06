<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내역 내용</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Staatliches&display=swap" rel="stylesheet">
<style type="text/css">

	@import url("http://localhost:8080/final_prj/common/header_footer.css");
	/* 사이드메뉴 시작 */
	@import url("http://localhost:8080/final_prj/common/side_menu.css");
	/* 사이드메뉴 끝 */
	
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
	
	#order_title{margin-top: 25px;padding-left: 25px; font-size: 30px; font-weight: bold; margin-bottom: 15px;}
	#orderCalc{margin-left:100px; width : 800px; height:80px;font-size: 30px; font-weight: bold; background-color: #EAEAEA ;}
	.calcContent{float: left;width : 320px ;margin-left: 43px;margin-top: 20px;text-align: center;font-size: 25px; font-weight: bold;}
	
	@font-face { font-family: 'Eoe_Zno_EB'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/Eoe_Zno_EB.woff') format('woff'); font-weight: normal; font-style: normal; }
	#orderTable{margin-left: 100px; margin-top: 30px; margin-bottom:30px; width: 800px; border-bottom: 2px #DEE2E6 solid;}
	
	#answerTitle{margin-top: 25px;padding-left: 25px; font-size: 30px; font-weight: bold; margin-bottom: 15px;}
	#answerContent{margin-left: 100px; margin-top: 30px; margin-bottom:30px; width: 800px;}
	#btnUpd{position: absolute; padding-left: 780px}
	#btn{position: absolute; padding-left: 850px}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	$("#qnaList").click(function(){
		location.href='mypage_qna.do';
	});//click
	
	$("#qnaUpdate").click(function(){
		$("#frm").submit();
		
	});//click
});
</script>
</head>
<body>
<div id="class4Wrap">
	
<div id="header">
 <c:import url="/WEB-INF/views/common_d/header_login.jsp"/>
</div><!-- header -->

<div id="container">
<div id="mypageSide" class="menuFont">
	<c:import url="/WEB-INF/views/mypage/mypage_menu.jsp"/>
</div>
<div id="mainView">
<div id="order_title" class="menuFont">
문의 내역
</div>
<div id="orderTable" >
<table class="table">
  <thead>
    <tr>
      <th scope="col" style="width: 650px"><c:out value="${qnaDetail.subject}"/></th>
      <th scope="col"><c:out value="${qnaDetail.writeDate}"/></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"><c:out value="${qnaDetail.content}" escapeXml="false"/></td>
    </tr>
 
  </tbody>
</table>
<form id="frm" action="qna_update.do" method="post">
<input type="hidden" name="content" value="${qnaDetail.content}"/>
<input type="hidden" name="subject" value="${qnaDetail.subject}"/>
<input type="hidden" name="code" value="${qnaCode}"/>
</form>
</div>

<div id="answerTitle" class="menuFont">
->  답변
</div>

<div id="answerContent">
	<div class="form-group">
    <textarea class="form-control" id="exampleFormControlTextarea1" style="background-color: white;" readonly="readonly" rows="3">
    <c:if test="${!empty qnaDetail.answer}">
    	<c:out value="${qnaDetail.answer}"/>
    </c:if>
    </textarea>
  </div>
</div>
<div id="btn">
	<button type="button" id="qnaList" class="btn btn-primary">목록</button>
</div>
<c:if test="${empty qnaDetail.answer}">
<div id="btnUpd">
	<button type="button" id="qnaUpdate" class="btn btn-primary">수정</button>
</div>
</c:if>

</div>

</div><!-- container DIV end -->

<div id="footer">
	<c:import url="/WEB-INF/views/common_d/footer.jsp"/>
</div>

</div><!-- wrap -->

</body>
</html>