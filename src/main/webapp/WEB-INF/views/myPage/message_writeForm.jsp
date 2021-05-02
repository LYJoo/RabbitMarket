<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../resources/css/hwi_css.css">
	    <style>
	         body{
	            margin-top: 100px;
	            font-family: 'Trebuchet MS', serif;
	            line-height: 1.6
	        }
	        #msgContainer{
	            width: 500px;
	            margin: 0 auto;
	        }
	    </style>
    </head>
    <body>
		<div id="msgContainer">
	        <div class="main-logo">
	            <img src="../resources/img/rabbit_logo.png" alt="">
	        </div>
			<form action="./writeMsg" method="post">
				<div class="msg-main_content">
		            <div class="msg-title">
						쪽지보내기
		            </div>
		            <div class="msg-detail-info">
		            	<c:if test="${receiver eq null }">
			                <span class="msg-detail-info-span">받을사람 : <input type="text" name="receiver" id="" style="width: 100px;"></span>
		            	</c:if>
		            	<c:if test="${receiver ne null }">
			                <span class="msg-detail-info-span">받을사람 : <input type="text" name="receiver" id="" style="width: 100px;" value="${receiver }"></span>
		            	</c:if>
		            </div>
		            <div id="msg-write">
		                <textarea name="msg_content" id="" cols="52" rows="20"></textarea>
		            </div>
		            <div class="msg-detail-btn">
		                <button class="msg-btn">보내기</button>
		                <button type="button" class="msg-btn" onclick="location.href='./mainPage'">목록</button>
		            </div>
	        	</div>
			</form>
    	</div>
    </body>
    <script type="text/javascript">
    	var msg = '${msg}';
    	if(mssg != ""){
    		alert(msg);
    	}
    </script>
</html>
