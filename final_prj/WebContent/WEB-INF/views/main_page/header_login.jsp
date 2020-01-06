<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
%>
	<div id="hMenu" class="container d-flex justify-content-between" >
	<nav class="navbar navbar-expand-lg navbar-light" style="height: 69px; width: 100%" >
	<div id="hContent" >
	  <a id="hTitle" class="navbar-brand" href="#" >
	    <img id="hLogo" src="http://localhost:8080/final_prj/common/images/logo.png" class="d-inline-block align-top" alt="" >
	    Yul's Coffee  
	  </a>
	</div>   
	   <div class="collapse navbar-collapse"  id="navbarSupportedContent" > 
	    <ul class="navbar-nav" style="margin-left: 19%; margin-right: auto;">
	      <li class="nav-item dropdown" style="margin-left:5% ">
	       <a class="nav-link dropdown-toggle" href="#"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	         <span style="color: #F0F0E1"> 메뉴</span>
	       </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: #333C50" id="dropItem">
	          <a class="dropdown-item" href="#">커피</a>
	          <a class="dropdown-item" href="#">티</a>
	          <a class="dropdown-item" href="#">율리치노</a>
	          <a class="dropdown-item" href="#">디저트</a>
	        </div>
	      </li>
	      <li class="nav-item dropdown" style="margin-left:5% ">
	        <a class="nav-link dropdown-toggle" href="#"  role="button" data-toggle="dropdown" aria-haspopup="true">
	         <span style="color: #F0F0E1"> 공지사항</span>
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: #333C50" id="dropItem">
	          <a class="dropdown-item" href="#">공지사항 및 이벤트</a>
	        </div>
	      </li>
	      <li class="nav-item dropdown" style="margin-left:5% ">
	        <a class="nav-link dropdown-toggle" href="#"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          <span style="color: #F0F0E1">소개</span>
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: #333C50" id="dropItem">
	          <a class="dropdown-item" href="#">위치</a>
	  
	        </div>
	      </li>
	       <li class="nav-item dropdown" style="margin-right: 90%;margin-left:5% ">
	        <a class="nav-link dropdown-toggle" href="#"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          <span style="color: #F0F0E1">고객센터</span>
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: #333C50" id="dropItem">
	          <a class="dropdown-item" href="#">1:1 문의</a>
	        </div>
	      </li>
	    </ul>
	    <div class="nav-item" >
      		 <a class="nav-link" href="#" style="color: #F0F0E1; font-size: 22px">마이페이지
        	 </a>
      	</div>
	    <div class="nav-item" id="cart">
	        <span data-toggle="tooltip" data-placement="bottom"  title="장바구니" >
      		 <a class="nav-link" href="order/temp.do" style="color: #A9A19B;">
	       		<img src="http://localhost:8080/final_prj/common/images/cart.png" style="width: 35px" />
        	 </a>
	        </span>
      	</div>
	    <div class="nav-item" id="logOut">
	        <span data-toggle="tooltip" data-placement="bottom"  title="로그아웃" >
      		 <a class="nav-link" href="#" style="color: #A9A19B;">
	       		<img src="http://localhost:8080/final_prj/common/images/login.png" style="width: 30px" />
        	 </a>
	        </span>
      	</div>
 	  </div>
	</nav>  
	</div>



