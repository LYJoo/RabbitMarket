<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>회원가입 폼</title>
    <style>
	
	html {
		height: 100%;
	}
	
	body {
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 50px;
  		padding-bottom: 40px;
  		background-repeat: no-repeat;
	}
	
    .card {
        margin: 0 auto; 
        float: none; 
        margin-bottom: 10px;
	}

    #btn-Yes,#btn_login{
        background-color: rgb(250, 164, 3);
        border: none;
        width: 30rem;
        margin: auto;
        
    }
	
	.form-control {
  		
  		height: 40px;
  		width: 400px;
  		padding: 10px;
  		font-size: 16px;
          margin: auto;
       
	}
    
    .card-title{
       
        text-align: center;
    }

    .text{
       margin-left: 100px;
    }

    </style>
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%">

	<div class="card" style="width:40rem;">
		<div class="card-title" style="margin-top:30px;">
            
			<h2 class="card-title" style="color:#e4932b;"><img src="resources/img/rabbit_logo.png"/></h2>
		</div>
		<div class="card-body">
      <form class="form-signin" method="POST" >
        <p class="text">아이디</p>
        <input type="text" name="member_id" class="form-control"  autofocus><BR>
        <p class="text">비밀번호</p>
        <input type="password" name="pw" class="form-control" ><br>
        <p class="text">비밀번호 확인</p>
        <input type="password" name="pw2" class="form-control" ><br>
        <p class="text">이름</p>
        <input type="text" name="name" class="form-control" ><br>
        <p class="text">생년월일</p>
        <input type="date" name="birthday" class="form-control" ><br>
        <p class="text">주소</p>
            <input type="text" class="text" id="sample4_postcode" placeholder="우편번호"readonly="readonly">
            <input type="button" onclick="execPostCode()" value="우편번호 찾기"><br>
            <input type="text" class="form-control" id="sample4_jibunAddress" name="address" placeholder="지번주소"readonly="readonly">
            <span id="guide" style="color:#999;display:none"></span>
            <br/>
        <p class="text">이메일</p>
        <input type="email" name="email" class="form-control" ><br>
        <p class="text">전화번호</p>
        <input type="number" name="phone" class="form-control" ><br><br>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit"><b>회 원 가 입</b></button>
        <br>
        <button id="btn_login" class="btn btn-lg btn-primary btn-block" type="button" onclick="location.href = './' "><b>로그인하러가기</b></button>
      </form>
        
		</div>
       
	</div>
   
  </body>
  <script>
   
      function execPostCode(){
    new daum.Postcode({
        oncomplete: function(data) {
        
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
               

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   data.bname;
                }
               

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
          
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
               

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ') '+' 주소를 다시 선택해주세요';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        
    }).open();
   
}

</script>
</html>