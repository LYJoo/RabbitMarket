<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <link rel="stylesheet" type="text/css" href="resources/css/hwi_css.css">
        <style type="text/css"></style>
    </head>
    <body>
        <jsp:include page="../include/topNavigation.jsp"></jsp:include>    
        <div id="main_content">
        	<jsp:include page="../include/myPageNavigation.jsp"></jsp:include> 
            <div id="profile">
                <a href="">내 프로필 보기</a>
            </div>
            <table id="table-mypage">
                    <tr>
                        <td colspan="2"><p><img src="${path }" alt="" style="width: 150px; height: 150px;"></p></td>
                    </tr>
                    <tr>
                        <th>아이디</th>
                        <td>${dto.member_id }</td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>${dto.name }</td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td>
                        	${dto.birth_date}
                        </td>
                    </tr>
                    <tr>
                        <th>핸드폰번호</th>
                        <td>${dto.phone }</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>${dto.email }</td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>${dto.address }</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                        	<button class="btn-info">회원정보수정</button>
                			<button class="btn-info">비밀번호변경</button>
                			<button class="btn-info">회원탈퇴</button>
                        </td>
                    </tr>
                </table>
        </div>
    </body>
    <script type="text/javascript">
    	var msg = '${msg}';
    	if(msg != ""){
    		alert(msg);
    	}
    </script>
</html>
