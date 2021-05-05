<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <link rel="stylesheet" type="text/css" href="/resources/css/hwi_css.css">
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
	            <img src="/resources/img/rabbit_logo.png" alt="">
	        </div>
	        <div class="msg-main_content">
	            <div class="msg-title">
					블라인드처리창
	            </div>
	            <div class="msg-detail-info">
	                <span class="msg-detail-info-span">신고사유 : ${report.report_reason}</span>
	                <span class="msg-detail-info-span">댓글번호 : ${comment.comment_idx}</span>
	            </div>
	            <p>게시글 내용</p>
	            <div class="msg-detail-content">
	            	댓글내용 : ${comment.comment_content }
	            	<br><br>
	            	작성자 : ${comment.member_id }
				</div>
	            <div class="msg-detail-btn">
	            	<c:if test="${comment.isBlind eq false }">
	            		<button class="msg-btn" onclick="setBlind(${comment.comment_idx})">블라인드</button>
	            	</c:if>
	            	<c:if test="${comment.isBlind eq true }">
	            		<button class="msg-btn" onclick="setUnBlind(${comment.comment_idx })" >블라인드취소</button>
	            	</c:if>
	               <button class="msg-btn" onclick="self.close()">닫기</button>
	            </div>
	        </div>
	    </div>
    </body>
    <script type="text/javascript">
    	function setBlind(comment_idx) {
    		$.ajax({
    			url:'/admin/updateCommentSetBlind/'+comment_idx,
    			type:'GET',
    			data:{},
    			dataType:'JSON',
    			success:function(data){
    				console.log(data.success);
    				window.location.reload();
    			},
    			error:function(e){
    				console.log(e);
    			}
    		});
		}
    	
    	function setUnBlind(comment_idx) {
    		$.ajax({
    			url:'/admin/updateCommentSetUnBlind/'+comment_idx,
    			type:'GET',
    			data:{},
    			dataType:'JSON',
    			success:function(data){
    				console.log(data.success);
    				window.location.reload();
    			},
    			error:function(e){
    				console.log(e);
    			}
    		});
		}
    
    </script>
</html>
