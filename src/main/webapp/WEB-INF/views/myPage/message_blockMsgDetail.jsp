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
	        <div class="msg-main_content">
	            <div class="msg-title">
					받은쪽지 상세보기
	            </div>
	            <div class="msg-detail-info">
	                <span class="msg-detail-info-span">보낸사람 : ${dto.send_id }</span>
	                <span class="msg-detail-info-span">받은날짜 : ${dto.send_time }</span>
	            </div>
	            <div class="msg-detail-content">
	            	${dto.msg_content }
				</div>
	            <div class="msg-detail-btn">
	                <button class="msg-btn" onclick="location.href='./replyForm?receiver=${dto.send_id }'">답장</button>
	                <button class="msg-btn" onclick="location.href='./mainPage'">목록</button>
	            </div>
	        </div>
	    </div>
    </body>
    <script type="text/javascript"></script>
</html>
