<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../resources/css/hwi_css.css">
        <style type="text/css"></style>
    </head>
    <body>
        <jsp:include page="../include/topNavigation.jsp"></jsp:include>    
        <div id="main_content">
        	<jsp:include page="../include/myPageNavigation.jsp"></jsp:include> 
            <div id="main_content">
            	<form action="memberWithdraw" method="post">
            		<table id="withdraw_table">
		                <tr>
		                    <th colspan="2"><span class="info_title">회원탈퇴</span><br><br></th>
		                </tr>
		                <tr>
		                    <th>아이디</th>
		                    <td>test1-로그인세션</td>
		                </tr>
		                <tr>
		                    <th>비밀번호</th>
		                    <td><input type="password" name="currPw" id=""></td>
		                </tr>
		                <tr>
		                    <th>비밀번호 확인</th>
		                    <td>
		                        <input type="password" id=""><br>
		                        <span id="confirmMsg">비밀번호가 일치하지 않습니다.</span>
		                    </td>
		                </tr>
		                <tr>
		                    <td colspan="2">
		                    	<p id="withdraw_notice">※탈퇴시 현재 아이디는 재가입 및 재사용이 불가합니다.<br>※실수로 탈퇴하지 않게 유의하세요!!</p>
		                    </td>
		                </tr>
		                <tr>
		                    <td colspan="2">
		                    	<button class="btn-info">탈퇴하기</button>
		            			<button class="btn-info">취소</button>
		                    </td>
		                </tr>
            		</table>
            	</form>
        	</div>
        </div>
    </body>
    <script type="text/javascript">
	    var msg = '${msg}';
		if(msg != ""){
			alert(msg);
		}
    </script>
</html>
