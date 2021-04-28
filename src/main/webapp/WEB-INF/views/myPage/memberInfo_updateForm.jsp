<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../resources/css/hwi_css.css">
    </head>
    <body>
        <jsp:include page="../include/topNavigation.jsp"></jsp:include>
        <div id="main_content">
	        <jsp:include page="../include/myPageNavigation.jsp"></jsp:include>
			<form action="memberInfoUpdate" method="post">
				<table id="table-mypageUpdate">
					<tr>
						<th colspan="2"><span class="info_title">회원 정보 수정하기</span><br>
						<br></th>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${dto.member_id } <input type="hidden" name="member_id" value="${dto.member_id }"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="" value="${dto.name }"></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>
							<input type="date" name="birth_date" id="" value="${dto.birth_date}" >
						</td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td><input type="text" name="phone" id="" value="${dto.phone }"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="email" id="" value="${dto.email }"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<table style="margin-left: auto; margin-right: auto; width: 80px;">
								<tr>
									<td><div id="addr1" style="font-size: 13px; text-align: center;">주소변경은 찾기를 통해서 가능합니다.</div></td>
									<td rowspan="2"><button type="button" onclick="findAddress()">주소찾기</button><br></td>
								</tr>
								<tr>
									<td>
										<input type="text" id="address" name="address" style="width: 250px;" value="${dto.address }">
										<input type="text" id="location" name="location" value="${dto.location }">
									</td>
								</tr>
							</table> 
						</td>
					</tr>
					<tr>
						<th>프로필사진</th>
						<td>
							<table id="profile-table">
								<tr>
									<td colspan="2">
										<p id="editable">
											<img src="${path }" alt="" style="width: 150px; height: 150px;" id="profileImg" class="">
										</p>
											<input type="hidden" name="oriFileName" id="getOri" value="${profileName1.oriFileName }">
											<input type="hidden" name="newFileName" id="getNew" value="${profileName1.newFileName }">
										
									</td>
								</tr>
								<tr>
									<td><button type="button" class="profile-btn" onclick="profileUp()">사진등록</button></td>
									<td><button type="button"  class="profile-btn">사진삭제</button></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button" class="btn-info-update" onclick="submitUpdate()">저장</button>
	                		<button type="button" class="btn-info-update">취소</button>
						</td>
					</tr>
				</table>
			</form>
        </div>  
    </body>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">
	    function profileUp(){
			window.open('profileUploadForm', 'file upload', 'width=400, height=100');
		}
	    
	    $('#addr2').focusout(function(){
			if($('#addr').val() == ""){
				$('#addr').val($('#addr1').text()+" "+$('#addr2').val());
			}
		});

	    function findAddress() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = ''; // 주소 변수

	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                document.getElementById("address").value = addr;
	                document.getElementById("location").value = data.sido+" "+data.sigungu;
	            }
	        }).open();
	    }
	    
	    function submitUpdate(){
	    	var profileImg = $("#profileImg").attr('class');
	    	var profileArr = profileImg.split('?');
	    	if(profileImg != ""){
	    		$('#getOri').val(profileArr[0]);
	    		$('#getNew').val(profileArr[1]);
	    	}
	    	$('form').submit();
	    }
    </script>
</html>
