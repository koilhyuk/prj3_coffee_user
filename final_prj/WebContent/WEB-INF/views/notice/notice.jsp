<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
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
	@import url("http://localhost:8080/final_prj/common/header_footer.css");
	/* 컨테이너 시작 */
	#container{width: 1500px; min-height: 800px; position: relative}
	/* 컨테이너 끝 */
	
	/* footer시작 */
	
	/* footer끝 */
	
	@font-face { font-family: 'Eoe_Zno_EB'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/Eoe_Zno_EB.woff') format('woff'); font-weight: normal; font-style: normal; }
	
	#container{margin: 0px auto}
	#noticeTitle{font-size: 32px;font-family: 'Eoe_Zno_EB', sans-serif; font-weight:normal;padding-left: 100px}
	#catDrop{margin-left: 10px}
	#catNotice{width : 100px;font-family: 'Eoe_Zno_EB', sans-serif; font-weight:normal; }
	#noticeTable{width : 1400px; padding-left: 100px; margin-top: 25px}
	#underWrap{position: absolute; left: 550px}
	#srchBox{}
	/* position: absolute; left: 550px */
	#paging{padding-left: 100px}
	#btn{margin-bottom: 1rem; margin-left: 10px}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	$("#srchBtn").click(function(){
		var obj=document.frm;
		obj.action="notice.do";
		obj.submit();
	});//click
});
</script>
</head>
<body>
<div id="class4Wrap">
	
<div id="header">
 <c:choose>
<c:when test="${empty sessionScope.id}">
 	<c:import url="/WEB-INF/views/common_d/header.jsp"/>
</c:when> 
 <c:otherwise>
 	<c:import url="/WEB-INF/views/common_d/header_login.jsp"/>
 </c:otherwise>
 </c:choose>
</div><!-- header -->

<div id="container">
	

<div id="noticeTitle" class="form-inline">
<a href="notice.do" class="menuFont" style="color:black;">공지사항 및 이벤트</a>
</div>


<div id="noticeTable">
    <table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col" width="60px">번호</th>
      <th scope="col">구분</th>
      <th scope="col">제목</th>
      <th scope="col">작성일</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="bl" items="${boardList}">
  	<tr>
  	<th><c:out value="${bl.num}"/></th>
  	<th><c:out value="${bl.category eq 'E' ? '이벤트':'공지사항'}"/></th>
  	<th><a href="notice_content.do?code=${bl.code}"><c:out value="${bl.subject}"/></a></th>
  	<th><c:out value="${bl.date}"/></th>
  	</tr>
  </c:forEach>
  </tbody>
</table>
</div>

<div id="underWrap">
<div class="form-inline" id="srchBox" style="margin: 0px auto;">
<form name="frm" id="frm" method="get">
	<div class="input-group mb-3" >
  <input type="text" name="keyword" id="inputKeyword" class="form-control" aria-label="Text input with dropdown button">
	<button type="button" class="btn btn-success" id="srchBtn" style=" margin-left: 10px">검색</button>
</div>
</form>
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