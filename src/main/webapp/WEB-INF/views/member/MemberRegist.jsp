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
        border: none;
	}

    #btn-Yes,#btn_login{
        background-color: rgb(250, 164, 3);
        border: none;
        width: 25rem;
        margin: auto;
        
    }
	
	.form-control {
  		display: inline;
  		height: 40px;
  		width: 400px;
  		padding: 5px;
  		font-size: 16px;
        margin-left: 100px;
       
	}

    #member_id {
  		padding: 10px;
  		font-size: 16px;
  		width: 250px;
        margin-left: 100px;
	}
	#email{
		padding: 10px;
  		font-size: 16px;
  		width: 300px;
        margin-left: 100px;
	}
    .check{
    	font-size: 16px;
    	margin-left: 100px;
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
            
			<h2 class="card-title" style="color:#e4932b;"><img src="../resources/img/rabbit_logo.png"/></h2>
		</div>
		<div class="card-body">
		
      <form action="join" class="form-signin" method="POST" >
        <p class="text">아이디</p>
        <input type="text" name="member_id" id="member_id"  class="form-control" >
        &nbsp; &nbsp;
        <input type="button" id="overlay" onclick="overlay()" value="중복 체크"/><br/>
        <p id="idch" class="check"> </p><br/>
        <p class="text">비밀번호</p>
        <input type="password" name="pw" id="pw" class="form-control" ><br>
        <p id="pw2ch" class="check"> </p><br/>
        <p class="text">비밀번호 확인</p>
        <input type="password"  id="pw2" class="form-control" ><br>
       <p id="pwch" class="check"> </p><br/>
        <p class="text">이름</p>
        <input type="text" name="name" id="name" class="form-control" ><br>
        <p id="namech" class="check"> </p><br/>
        <p class="text">생년월일</p>
        <input type="text" name="birth_date" id="birth_date" class="form-control" placeholder="19001010 형식입니다."><br>
         <p id="birth_check" class="check"> </p><br/>
        <p class="text">주소</p>
            <input type="text" class="text" id="sample4_postcode" placeholder="우편번호"readonly="readonly">
            <input type="button" onclick="execPostCode()" value="우편번호 찾기"><br>
            <input type="text" class="form-control" id="sample4_jibunAddress" name="address" placeholder="지번주소"readonly="readonly">
            <span id="guide" style="color:#999;display:none"></span>
            <br/>
        <p class="text">이메일</p>
        <input type="email" name="email" id="email" class="form-control" >
         &nbsp; &nbsp;
        <input type="button" id="emoverlay" onclick="emoverlay()" value="중복 체크"/><br/>
        <p id="emch" class="check"> </p><br/>
        <p class="text">전화번호</p>
        <input type="text" name="phone" id="phone" class="form-control" placeholder="010-000-000형식"><br><br>
       <p id="phonech" class="check"> </p><br/>
        <button type="button" id="btn-Yes" class="btn btn-lg btn-primary btn-block"  onclick="regist()">회원가입</button>
        <br>
    </form>
    
    <button id="btn_login" class="btn btn-lg btn-primary btn-block" type="button" onclick="location.href = 'memberLogin' "><b>로그인하러가기</b></button>
        
		</div>
       
	</div>
   
  </body>
  <script>
  $(document).ready(function() { 
	  $('p.check').text('*필수 정보입니다.');
	  $('p.check').css('color', 'red');
  });

  var emoverChk = false;
	$("#emoverlay").click(function(){
		var email = $("#email").val();
			$.ajax({
				type:'post'
				,url:'emoverlay'
				,data:{'email' : email }
				,dataType:'JSON'
				,success:function(obj){
					console.log(obj);
					if(obj.use2 != 1){
						alert('사용할 수 있는 이메일 입니다.');
						emoverChk= true;
					}else{
						alert('이미 사용중인 이메일 입니다.');
						
					}
				}
				,error:function(e){
					console.log(e);
				}
			});				
		});	
	
	 var overChk = false;
		$("#overlay").click(function(){
			var id = $("#member_id").val();
				$.ajax({
					type:'post'
					,url:'overlay'
					,data:{'id' : id }
					,dataType:'JSON'
					,success:function(obj){
						console.log(obj);
						if(obj.use != 1){
							alert('사용할 수 있는 아이디 입니다.');
							overChk= true;
						}else{
							alert('이미 사용중인 아이디 입니다.');
							
						}
					}
					,error:function(e){
						console.log(e);
					}
				});				
			});	
	
			var idc = false;
		    var pwc = false;
		    var pwc2 = false;
		    var phonec = false;
		    var namec = false;
		    var emailc = false;
		    var birthJ = false;
		  
			  //모든 공백 체크 정규식
				var empJ = /\s/g;
				//아이디 정규식
				var idJ = /^[a-z0-9]{5,20}$/;
				// 비밀번호 정규식
				var pwJ = /^[a-z0-9]{6,20}$/; 
				// 이름 정규식
				var nameJ = /^[가-힣]{2,6}$/;
				// 휴대폰 번호 정규식
				var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
		

		   $("#member_id").focusout(function(){
			     if($('#member_id').val() == ""){
			         
			         alert('아이디를 입력해주세요');

				}else if(!idJ.test($(this).val())){
				$('#idch').text('5~20자의 영문 소문자, 숫자만 사용가능합니다')
				$('#idch').css('color', 'red') 

				}else if($(this).val().indexOf("admin") != -1){
				$('#idch').text('admin이 포함된 아이디는 사용할 수 없습니다.')
				$('#idch').css('color', 'red') 

		       }else{
			         idc = true;
			         $("#idch").hide();
			     }
			 });
		   
		  
		   
		   $("#pw").focusout(function(){
			     if($('#pw').val() == ""){
			         
			         alert('비밀번호를 입력해주세요');
			    }else if(!pwJ.test($(this).val())){
				$('#pw2ch').text('6~20자의 영문 소문자, 숫자만 사용가능합니다')
				$('#pw2ch').css('color', 'red') 
		       }else{
			         pwc2 = true;
			         $('#pw2ch').hide();
			     }
			 });
		
		$("#pw2").keyup(function(){
		   
		    if($(this).val()!=$("#pw").val()){
		        $("#pwch").html("비밀번호가 다릅니다");
		        $("#pwch").css("color",'red');
		        pwc = false;
		
		    }else{
		        $("#pwch").html("비밀번호가 일치합니다");
		        $("#pwch").css("color",'blue');
		        pwc = true;
		    }
		});
		
		$("#pw").keyup(function(){
			     
		    if($(this).val()!=$("#pw2").val()){
		        $("#pwch").html("비밀번호가 다릅니다");
		        $("#pwch").css("color",'red');
		        pwc = false;
		
		    }else{
		        $("#pwch").html("비밀번호가 일치합니다");
		        $("#pwch").css("color",'blue');
		        pwc = true;
		    }
		});
		
		$("#name").focusout(function(){
			   if($('#name').val() == ""){
			      
			       alert('이름을 입력해주세요');
			     
			   }else{
			       namec = true;
			   }
			});
			
			
		$("#email").focusout(function(){
			   if($('#email').val() == ""){
			      
			       alert('이메일을 입력해주세요');
			     
			   }else{
			       emailc = true;
			   }
			});
			
		$("#phone").focusout(function(){
		   if($('#phone').val() == ""){
		      
		       alert('전화번호를 입력해주세요');
		     
		   }else{
		       phonec = true;
		   }
		});
		
		
		
		$('#birth_date').blur(function(){
			var dateStr = $(this).val();		
		    var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
		    var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
		    var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
		    var today = new Date(); // 날짜 변수 선언
		    var yearNow = today.getFullYear(); // 올해 연도 가져옴
			
		    if (dateStr.length <=8) {
				// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
			    if (1900 > year || year > yearNow){
			    	
			    	$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red');
			    	
			    }else if (month<1 || month>12) {
			    		
			    	$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red'); 
			    
			    }else if (day<1 || day>31) {
			    	
			    	$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red'); 
			    	
			    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
			    	 
			    	$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red'); 
			    	 
			    }else if (month == 2) {
			    	 
			       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
			       	
			     	if (day>29 || (day==29 && !isleap)) {
			     		
			     		$('#birth_check').text('생년월일을 확인해주세요 :)');
						$('#birth_check').css('color', 'red'); 
			    	
					}else{
						$('#birth_check').text('');
						birthJ = true;
					}//end of if (day>29 || (day==29 && !isleap))
			     	
			    }else{
			    	
			    	$('#birth_check').text(''); 
					birthJ = true;
				}//end of if
				
				}else{
					//1.입력된 생년월일이 8자 초과할때 :  auth:false
					$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red');  
				}
			}); 
		
		
		
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
                document.getElementById("sample4_jibunAddress").value = data.sido+" "+data.sigungu;

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
      function regist(){
			
			
			var id = $("#member_id").val();
			var pw = $("#pw").val();
			var pw2 = $("#pw2").val();
			var phone = $("#phone").val();
			var name = $("#name").val();
			var email = $("#email").val();
			var addr = $("#sample4_jibunAddress").val();
			var birth = $("#birth_date").val();
			
				
	  if(idc == false || id === ""){
	      alert('아이디를 확인 해 주세요')
	  }else if(overChk == false){
	      alert('아이디 중복 검사를 해주세요')
	  }else if(addr == ""){
		  	alert('주소를 선택해주세요')
	  }else if(pwc == false|| pw2 === "" || pwc2 == false){
	      alert('비밀번호를 확인 해 주세요')
	  }else if(namec == false || name === ""){
	  	alert('이름을 입력해주세요')
	  }else if(emailc == false || email === ""){
	  	alert('이메일을 입력해주세요')
	  }else if(emoverChk == false){
	  	alert('이메일을 중복 검사를 해주세요')
	  }else if(phonec == false || phone === ""){
	      alert('전화번호를 입력해주세요.')
	  }else if( birth === ""){
		  	alert('생일을 입력해주세요')
	  }else if( birthJ === false){
		  	alert('생일을 다시 입력해주세요')
	
	  }else{
	      $('form').submit();
	  } 
	} ;
	



</script>
</html>