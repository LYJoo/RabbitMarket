<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	        <form action="memberPwUpdate" method="post">
	        	<table id="changePw_table">
	                <tr>
	                    <th colspan="2"><span class="info_title">비밀번호 변경하기</span><br><br></th>
	                </tr>
	                <tr>
	                    <th>아이디</th>
	                    <td>test1-로그인세션값넘기기</td>
	                </tr>
	                <tr>
	                    <th>현재 비밀번호</th>
	                    <td><input type="password" name="currPw" id="currPw"></td>
	                </tr>
	                <tr>
	                    <th>변경 비밀번호</th>
	                    <td><input type="password" name="afterPw" id="afterPw"></td>
	                </tr>
	                <tr>
	                    <th>변경 비밀번호 확인</th>
	                    <td>
	                        <input type="password" id="confirmPw"><br>
	                        <span id="confirmMsg">비밀번호가 일치하지 않습니다.</span>
	                    </td>
	                </tr>
	                <tr>
	                    <td colspan="2">
	                    	<button class="btn-pw-update">저장</button>
	                    	<button class="btn-pw-update" type="button">취소</button>
	                    </td>
	                </tr>
            	</table>
	        </form>
        </div>  
    </body>
    <script type="text/javascript">
    	var msg = '${msg}';
    	if(msg != ""){
    		alert(msg);
    	}
    </script>
</html>
