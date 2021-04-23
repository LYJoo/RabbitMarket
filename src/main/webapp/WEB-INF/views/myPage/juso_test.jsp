<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <style type="text/css"></style>
    </head>
    <body>
		<input type="button" onclick="findAddress()" value="우편번호 찾기"><br>
		<div id="addr1"></div>
		<input type="text" id="addr2" placeholder="상세주소">
		<input type="text" id="addr" value="">
		<input type="text" id="sample6_sigungu" placeholder="시군구">
		
		

    </body>
    <script type="text/javascript"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
		$('#addr2').focusout(function(){
			if($('#addr').val() == ""){
				$('#addr').val($('#addr1').text()+" "+$('#addr2').val());
			}
		});
		 
		function findAddress() {
			$('#addr').val("");
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById("addr1").innerHTML = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("addr2").focus();
							document.getElementById("sample6_sigungu").value = data.sigungu
									+ " " + data.bname;
						}
					}).open();
		}
	</script>
</html>
