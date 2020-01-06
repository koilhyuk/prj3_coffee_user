<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>query board</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Staatliches&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">

<style type="text/css">
	@import url("http://localhost:8080/final_prj/main_page/header_footer.css");

	#mainMenuBar{ height:69px; background-color:#323C51; }
	
	#boardWrap{ width:1000px;  margin:1% auto 5% auto;padding:15px; }
	#boardHeader{ font-family: 'Eoe_Zno_EB', sans-serif; font-weight:nomal; font-size:36px;}
	#content{ margin-top:21px; }
	#boardTab{ }
	
	#boardFooter{}
	#boardButtons{ text-align:right; padding-top:16px; padding-bottom:21px; }
	#searchBoard{ text-align:center; margin-top:44px; }
	#field{ margin:0px auto; }
	#listButtons{ width:1000px; height:100px; text-align:center; }
	
	#mainFooter{ height:110px; background-color:#323C51; }
	
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

<div id="mainMenuBar">
	<jsp:include page="../common_d/header_login.jsp"/>
</div>

<div id="boardWrap">

	<div id="boardHeader">
		문의내역
	</div>
	<hr/>
	
	<div id="content">
		
		<table id="boardTab" class="table table-sm">
		  <thead>
		    <tr>
		      <th scope="col" style="width:50px">No.</th>
		      <th scope="col" style="width:700px">제목</th>
		      <th scope="col" style="width:250px">문의일</th>
		      <th scope="col" style="width:100px">답변여부</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">1</th>
		      <td>카페라떼에 샷이 몇개가 들어갈까요^.^?</td>
		      <td>2019.11.17 15:57</td>
		      <td style="text-align:center;">N</td>
		    </tr>
		    <tr>
		      <th scope="row">2</th>
		      <td>따뜻한 율리치노 파나여~~?</td>
		      <td>2019.11.17 15:57</td>
		      <td style="text-align:center;">Y</td>
		    </tr>
		  </tbody>
		</table>
		
	</div> <!-- content -->
	
	<div id="boardFooter">
	
		<div id="boardButtons">
			<button type="button" id="writeBtn" class="btn btn-secondary">글쓰기</button>
		</div>
		
		<form>
		<div id="searchBoard" class="form-row">
		    <div class="form-group col-mb-2" style="padding-left:360px;">
		 	<select id="field" name="field" class="form-control">
		        <option>제목</option>
		        <option>내용</option>
		    </select>
		    </div>
		    <div class="form-group col-mb-2">
		       <input type="text" class="form-control"/>
		    </div> 
		    <div class="form-group col-mb-2">
		       <input type="button" class="btn btn-secondary" value="검색"/>
		    </div> 
		</div>
		</form>
		
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
		
</div> <!-- boardWrap -->

<div id="mainFooter">
	<jsp:include page="../common_d/footer.jsp"/>
</div>

</body>
</html>