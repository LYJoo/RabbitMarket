<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <link rel="stylesheet" type="text/css" href="resources/css/hwi_css.css">
    </head>
    <body>
        <jsp:include page="../include/topNavigation.jsp"></jsp:include>
        <div id="main_content">
	        <jsp:include page="../include/myPageNavigation.jsp"></jsp:include>
			<table id="table-mypageUpdate">
				<tr>
					<th colspan="2"><span class="info_title">회원 정보 수정하기</span><br>
					<br></th>
				</tr>
				<tr>
					<th>아이디</th>
					<td>test1 <input type="hidden" name="member_id"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" id="" value="홍길동"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" name="birth_date" id=""
						value="1993.01.01"></td>
				</tr>
				<tr>
					<th>핸드폰번호</th>
					<td><input type="text" name="phone" id="" value="010-1111-2222"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" id=""
						value="test@naver.com"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<table style="margin-left: auto; margin-right: auto; width: 80px;">
							<tr>
								<td><div id="addr1" style="font-size: 12px;">주소를
										입력해주세요.</div></td>
								<td rowspan="2"><input type="button" onclick="findAddress()"
									value="주소 찾기"><br></td>
							</tr>
							<tr>
								<td><input type="text" id="addr2" placeholder="상세주소"
									style="width: 120px;"></td>
							</tr>
						</table> <input type="hidden" id="addr" name="address"> <input
						type="hidden" id="location" placeholder="시군구">
					</td>
				</tr>
				<tr>
					<th>프로필사진</th>
					<td>
						<table id="profile-table">
							<tr>
								<td colspan="2"><p>
										<img src="1.png" alt="" style="width: 150px; height: 150px;">
									</p></td>
							</tr>
							<tr>
								<td><input type="button" value="사진등록" class="profile-btn"></td>
								<td><input type="button" value="사진삭제" class="profile-btn"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button class="btn-info-update">저장</button>
                		<button class="btn-info-update">취소</button>
					</td>
				</tr>
			</table>
        </div>  
    </body>
    <script type="text/javascript"></script>
</html>
