<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="menuLeftBar" >
	<div id="user">
		<img id="userImg" src="http://localhost:8080/final_prj/common/images/pro.png"/>
		<span><c:out value="${sessionScope.id}"/> 님</span>
	</div>

	<div id="mypageWrap">
	<div id="mypage" >마이페이지</div>
	</div>

	  <div class="card" id="card1">
	    <div class="card-header" id="headingOne">
	      <h2 class="mb-0">
	        <div><a id="orderList" href="mypage.do">결제내역</a></div>
	      </h2>
	    </div>
	

	   </div>
	  <div class="card" id="card2">
	    <div class="card-header" id="headingTwo">
	      <h2 class="mb-0">
	        <div><a id="lemon" href="mypage_lemon.do">레몬 적립</a></div>
	      </h2>
	    </div>
	  </div>
	  
	  <div class="card" id="card3">
	    <div class="card-header" id="headingThree">
	      <h2 class="mb-0">
	        <div><a id="qna" href="mypage_qna.do">문의 내역</a></div>
	      </h2>
	    </div>
	  </div>
	  
	  <div class="card" id="card4">
	    <div class="card-header" id="headingFour">
	      <h2 class="mb-0">
	        <div><a id="memberEdit" href="mypage_member_edit.do">회원 정보 변경</a></div>
	      </h2>
	    </div>
	  </div>

	  <div class="card" id="card5">
	    <div class="card-header" id="headingFive">
	      <h2 class="mb-0">
	        <div><a id="cardManage" href="mypage_card_manage.do">카드관리</a></div>
	      </h2>
	    </div>
	  </div>

	

	
</div> 