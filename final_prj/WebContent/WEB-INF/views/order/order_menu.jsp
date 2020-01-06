<%@page import="kr.co.sist.domain.MenuBar"%>
<%@page import="kr.co.sist.domain.BasicRecipe"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	.menuFont{ font-family: 'locus_sangsang', sans-serif; font-weight:nomal;}

	#coffeeWrap{ width:1300px; margin:0px auto; font-family: 'locus_sangsang', sans-serif;}

	/* menuBar */
	#menuLeftBar{ width:280px; /* background-color:#494242; */ color:#494242; padding-top:50px; padding-left:50px; float:left;}
	
	#beverage{ height:70px; font-size:40px;color:#141A1D; }

	
	#card1, #card2, #card3, #card4{color:#494242;border:0px; }

	#headingOne{ color:#141A1D; }
	#headingTwo{ color:#141A1D;}
	#headingThree{ color:#141A1D;}
	#headingFour{ color:#141A1D; }
	
	#collapseOne{ color:#141A1D; }
	#collapseTwo{ color:#141A1D; }
	#collapseThree{ color:#141A1D; }
	#collapseFour{ color:#141A1D; }
	
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
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


<script type="text/javascript">
$(function(){
	$("#dessert").click(function(){
		$("#divToggle").toggle();
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
<% List<MenuBar> menuBar=(List)request.getAttribute("menuBar"); %>
<div id="menuLeftBar" >
	<div id="beverage" >음료</div>
	
	<div class="accordion" id="accordionExample">
	
	<div class="card" id="card1">
	    <div class="card-header" id="headingOne">
	      <h2 class="mb-0">
	        <button id="coffee" class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
	          	커피	
	        </button>
	      </h2>
	    </div>
	   
	    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
	     <%for(int i=0; i<menuBar.size(); i++){
			if(menuBar.get(i).getCategory().contains("커피")){%>
	      <div class="card-body">
	       	<a class="mFont" href="order_menu.do?gdName=<%=menuBar.get(i).getGdName()%>"><%=menuBar.get(i).getGdName()%></a>
	      </div>
	      <% }//end if
		}//end for %>
	    </div>
	    
	  </div>
	  
	   
	  <div class="card" id="card2">
	    <div class="card-header" id="headingTwo">
	      <h2 class="mb-0">
	        <button id="tea" class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	          	티	
	        </button>
	      </h2>
	    </div>
	   
	    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
	      <%for(int i=0; i<menuBar.size(); i++){
			if(menuBar.get(i).getCategory().contains("티")){%>
	      <div class="card-body">
	       	<a class="mFont" href="order_menu.do?gdName=<%=menuBar.get(i).getGdName()%>"><%=menuBar.get(i).getGdName()%></a>
	      </div>
	      <% }//end if
			}//end for %>
	    </div>
	    
	  </div>
	  
	  
	  <div class="card" id="card3">
	    <div class="card-header" id="headingThree">
	      <h2 class="mb-0">
	        <button id="yuliccino" class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
	          	율리치노
	        </button>
	      </h2>
	    </div>
	    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
	      <%for(int i=0; i<menuBar.size(); i++){
			if(menuBar.get(i).getCategory().contains("율리치노")){%>
	      <div class="card-body">
	        	<a class="mFont" href="order_menu.do?gdName=<%=menuBar.get(i).getGdName()%>"><%= menuBar.get(i).getGdName() %></a>
	      </div>
	      <% }//end if
			}//end for %>
	    </div>
	  </div>
	</div> <!-- 아코디언 -->
	
	<div id="dessert">디저트</div>
	
	<div id="divToggle" style="display:none">
		<div class="accordion" id="accordionExample">
		  <div class="card" id="card4">
		    <div class="card-header" id="headingFour">
		      <h2 class="mb-0" style="margin-left:7%">
	<%for(int i=0; i<menuBar.size(); i++){
			if(menuBar.get(i).getCategory().contains("디저트")){%>
		        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
		          	<a style="color:#494242;" href="order_menu.do?gdName=<%=menuBar.get(i).getGdName()%>"><%= menuBar.get(i).getGdName() %></a>
		        </button>
	<% }//end if
		}//end for
	%>
		      </h2>
		    </div>
		  </div> 
		</div>
	</div>
	
</div> 

<div id="menuContent" >

<% List<BasicRecipe> test=(List)request.getAttribute("basicRecipe");%>
<!-- 끼워넣기 -->
	<jsp:include page="order_list.jsp" >
		<jsp:param value="<%=test.get(0).getCategoryName() %>" name="category"/>
	</jsp:include>

</div>

</div> <!-- coffeeWrap -->

<div id="mainFooter">
	<jsp:include page="../common_d/footer.jsp"/>
</div>

</body>
</html>