<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="containerSignupdate">
<form action="" id=memberUpdate method="post">

	<div class="form-group input-group" ><!-- 아이디가 이미 있을경우 alert -->
		<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/images/s_id.png" style="width: 35px">
		    </span>
		 </div>
        <input name="id" class="form-control" placeholder="아이디" type="text" maxlength="20">
    </div> <!-- form-group// -->
    	<p class="text-right" id="idCon">이미 사용중이거나 탈퇴한 아이디입니다.  </p><!-- 아이디가 이미 있을경우 alert -->
         <p class="text-right" id="idCon4">사용 가능한 아이디 입니다. </p><!-- 아이디가 이미 있을경우 alert -->
         <p class="text-right" id="idCon1">아이디는 특수문자(4글자 이하 12글자 이상)를 사용할 수 없습니다. </p><!-- 아이디가 이미 있을경우 alert -->
         <p class="text-right" id="idCon2">아이디는 필수 입력 사항입니다. </p><!-- 아이디가 이미 있을경우 alert -->

    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/images/s_password.png" style="width: 35px">
		     </span>
		</div>
        <input class="form-control" name="m_pass" id="pass" placeholder="비밀번호" type="password" maxlength="20">
    </div> <!-- form-group// -->
    <p class="text-right" id="passCon1">숫자,영문자가 한자리 이상 들어간 조합으로 8자리 이상 사용해야 합니다. </p><!-- 아이디가 이미 있을경우 alert -->
         <p class="text-right" id="passCon3">비밀번호는 필수 입력 사항입니다. </p><!-- 아이디가 이미 있을경우 alert -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		   <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/images/s_password.png" style="width: 35px">
		    </span>
		</div>
        <input class="form-control" placeholder="비밀번호 확인" type="password" maxlength="20">
    </div> <!-- form-group// -->      
     <p class="text-right" id="passCon2">비밀번호가 일치하지 않습니다. </p>    
                               
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text">
		    	<img src="http://localhost:8080/final_prj/common/images/s_nickname.png" style="width: 35px">
		     </span>
		 </div>
        <input name="m_nick" id="nickName" class="form-control" placeholder="닉네임" type="text" maxlength="10">
    </div> <!-- form-group// -->
    	 <p class="text-right" id="nickCon">특수문자는 사용하실 수 없습니다.</p><!-- 아이디가 이미 있을경우 alert -->
         <p class="text-right" id="nickCon1">닉네임은 필수 입력 사항입니다.</p><!-- 아이디가 이미 있을경우 alert -->
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/images/s_name.png" style="width: 35px">
		   </span>
		 </div>
        <input name="m_Name" id="cName" class="form-control" placeholder="이름" type="text" maxlength="20">
    </div> <!-- form-group// -->
    	<p class="text-right" id="nameCon">이름은 한글만 입력하실 수 있습니다.</p><!-- 아이디가 이미 있을경우 alert -->
        <p class="text-right" id="nameCon1">이름은 필수 입력 사항입니다.</p><!-- 아이디가 이미 있을경우 alert -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		   <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/images/s_email.png" style="width: 35px">
		   </span>
		 </div>
        <input name="email1" id="email1" class="form-control" placeholder="이메일" type="email">
        	<span style="font-size: 30px">@</span>
        <input name="email2" id="email2" class="form-control" placeholder="직접입력" type="email">
		<select class="custom-select" name="email3" id="email3" style="max-width: 200px; ">
		    <option selected="selected">직접입력</option>
		    <option value="1">daum.com</option>
		    <option value="2">naver.com</option>
		    <option value="3">gmail.com</option>
		</select>
		<input type="hidden" name="m_email" id="email">
    </div> <!-- form-group// -->
    	<p class="text-right" id="mailCon">이메일 형식대식대로 작성해주세요</p><!-- 이메일가 -->
        <p class="text-right" id="mailCon1">이메일은 필수 입력 사항입니다.</p><!-- 이메일가 -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/images/s_phon.png" style="width: 35px">
		  </span>
		</div>
		<input name="m_phone" id="phone" class="form-control" placeholder="핸드폰번호 (ex) 010-0000-0000" type="text" maxlength="13">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/images/s_gender.png" style="width: 35px">
		    </span>
		</div>
		<select class="custom-select" style="max-width: 500px;" name="m_gender">
		    <option selected="selected" value="n">성별</option>
		    <option value="F">여자</option>
		    <option value="M">남자</option>
		</select>
    </div> <!-- form-group// -->
    <label >생년월일</label>
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> 
		    	<img src="http://localhost:8080/final_prj/common/images/s_birth.png" style="width: 35px">
		     </span>
		</div>
		<select class="form-control" id="bYear" name="bYear">
		</select>
		<select class="form-control" id="bMonth" name="bMonth">
		</select>
		<select class="form-control" id="bDay" name="bDay">
		</select>
		<input type="hidden" name="m_birth" id="birth">
	</div> <!-- form-group end.// -->
		<p class="text-right" id="birthCon">생년월일은 필수 입력 사항입니다.</p><!-- 아이디가 이미 있을경우 alert -->
        <p class="text-right" id="birthCon1">생년월일은 필수 입력 사항입니다.</p><!-- 아이디가 이미 있을경우 alert -->

	<div class="form-group">
	<label for="cardNumber">카드번호</label>
	<div class="input-group">
		<div class="input-group-prepend">
			<span class="input-group-text"><img src="http://localhost:8080/final_prj/common/images/s_card.png" style="width: 35px"></span>
		</div>
		  <input name="card_num1" id="cardNum1" class="form-control" placeholder="" type="text" maxlength="4">
        <input name="card_num2" id="cardNum2" class="form-control" placeholder="" type="text" maxlength="4">
         <input name="card_num3" id="cardNum3" class="form-control" placeholder="" type="text" maxlength="4">
          <input name="card_num4" id="cardNum4" class="form-control" placeholder="" type="text" maxlength="4">
	</div> <!-- input-group.// -->
			<p class="text-right" id="cardCon1">카드번호는 필수 입력 사항입니다.</p><!-- 카드번호 -->
	        <p class="text-right" id="cardCon4">카드번호는 숫자(4자)만 입력하실 수 있습니다.</p><!-- 카드번호 -->
	        <p class="text-right" id="cardCon5">카드번호는 필수 입력 사항입니다.</p><!-- 카드번호 -->
	</div> <!-- form-group.// -->
		 <div class="form-group input-group">
		<select class="custom-select" id="cardC">
		    <option selected="selected">카드사 선택</option>
			<c:forEach var="COM_NAME" items="${cardData}">
			<option value="${COM_NAME}"><c:out value="${COM_NAME}"/></option>
			</c:forEach>
		</select>
    </div> <!-- form-group// -->
		<p class="text-right" id="cardCon2">카드사는 필수 선택 사항입니다.</p>
	<div class="row">
	    <div class="col-sm-8">
	        <div class="form-group">
	            <label><span class="hidden-xs">유효기간</span> </label>
	        	<div class="form-inline">
	        		<select class="form-control" id="cMonth" name="card_month" style="width:45%">
					</select>
		            <span style="width:10%; text-align: center" > / </span>
		            <select class="form-control" id="cYear" name="card_year" style="width:45%">
					</select>
	        	</div>
	        </div>
	    </div>
	    <div class="col-sm-4">
	        <div class="form-group">
	            <label data-toggle="tooltip" title="" data-original-title="3 digits code on back side of the card">CVV <i class="fa fa-question-circle"></i></label>
	            <input class="form-control" name="card_cvc" required="" type="text" maxlength="3" id="cvc">
	        </div> <!-- form-group.// -->
	   	</div>
	   		<p class="text-right" id="cardCon3">cvc는 숫자(3자)를 입력해야 합니다.</p><!-- 아이디가 이미 있을경우 alert -->
	        <p class="text-right" id="cardCon6">유효기간(cvc)은 필수 입력 사항입니다.</p><!-- 아이디가 이미 있을경우 alert -->
	</div> <!-- row.// -->
    <div class="form-group">
       <button type="button" id="btnComJoin" name="btnComJoin" class="btn btn-dark btn-block">정보 수정</button>
    </div> <!-- form-group// -->      
	</form>
	</div>


