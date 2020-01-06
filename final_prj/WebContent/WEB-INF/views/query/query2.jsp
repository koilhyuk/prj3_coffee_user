<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 query</title>
<style type="text/css">
@font-face { font-family: 'Eoe_Zno_EB'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/Eoe_Zno_EB.woff') format('woff'); font-weight: normal; font-style: normal; }

	#mainMenuBar{ height:69px; background-color:#323C51; }
	
	#queryWrap{ width:1000px; margin:0px auto; padding:15px; }
	#header{ font-family: 'Eoe_Zno_EB', sans-serif; font-weight:nomal; font-size:36px;}
	
	#queryTab{ text-align:center; padding:5px; }
	.tFont{ font-family: 'Eoe_Zno_EB', sans-serif; font-weight:nomal; font-size:21px; }
	
	#footer{}
	#queryButtons{ text-align:right; padding-top:16px; padding-bottom:21px; }
	#listButtons{ width:1000px; height:100px; text-align:center; }
	#nav{ padding-top:50px; }
	
	#mainFooter{ height:110px; background-color:#323C51; }

</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>
<body>

<div id="mainMenuBar">

</div>

<div id="queryWrap">

	<div id="header">
		고객문의
	</div>
	<hr/>
	
	<div>
		<table id="queryTab">
			<tr style="height:60px;">
				<td style="width:100px;" class="tFont">작성자</td>
				<td><input class="form-control" type="text" style="width:400px"></td>
				<td style="width:100px;" class="tFont">작성 일자</td>
				<td><input class="form-control" type="text" style="width:400px"></td>
			</tr>
			<tr style="height:60px;">
				<td style="width:100px;" class="tFont">제목</td>
				<td colspan="3"><input class="form-control" type="text" style="width:900px"></td>
			</tr>
			<tr style="height:360px;">
				<td></td>
				<td colspan="3"><textarea style="width:900px; height:300px;"></textarea></td>
			</tr>
			<tr style="height:110px;">
				<td class="tFont">답글</td>
				<td colspan="3"><textarea style="width:900px; height:100px;"></textarea></td>
			</tr>
		</table>
	</div>
	
	<div id="footer">
		
		<div id="queryButtons">
			<button type="button" id="deleteBtn" class="btn btn-secondary">삭제하기</button>
			<button type="button" id="writeBtn" class="btn btn-secondary">작성완료</button>
			<button type="button" id="listBtn" class="btn btn-secondary">목록으로</button>
		</div>
		
		<div id="listButtons">
			<nav id="nav" aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			      <a class="page-link" style="color:#141A1E;" href="#" tabindex="-1" aria-disabled="true">Previous</a>
			   	  <a class="page-link" style="color:#141A1E;" href="#">1</a>
			      <a class="page-link" style="color:#141A1E;" href="#">2</a>
			      <a class="page-link" style="color:#141A1E;" href="#">3</a>
			      <a class="page-link" style="color:#141A1E;" href="#">Next</a>
			  </ul>
			</nav>
		</div>
		
	</div>

</div> <!-- queryWrap -->

<div id="mainFooter">

</div>

</body>
</html>