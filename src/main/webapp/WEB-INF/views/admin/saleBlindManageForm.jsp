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
	                <span class="msg-detail-info-span">판매글번호 : ${product.product_idx}</span>
	            </div>
	            <p>게시글 내용</p>
	            <div class="msg-detail-content">
	            	글제목 : ${product.sale_subject }
	            	<br><br>
	            	<img alt="" src="${path }">
	            	<br><br>
	            	내용 : ${product.sale_content }
				</div>
	            <div class="msg-detail-btn">
	            	<c:if test="${product.isBlind eq false }">
	            		<button class="msg-btn" onclick="setBlind(${product.product_idx})">블라인드</button>
	            	</c:if>
	            	<c:if test="${product.isBlind eq true }">
	            		<button class="msg-btn" onclick="setUnBlind(${product.product_idx })" >블라인드취소</button>
	            	</c:if>
	               <button class="msg-btn" onclick="self.close()">닫기</button>
	            </div>
	        </div>
	    </div>
    </body>
    <script type="text/javascript">
    	function setBlind(product_idx) {
    		$.ajax({
    			url:'/admin/updateSetBlind/'+product_idx,
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
    	
    	function setUnBlind(product_idx) {
    		$.ajax({
    			url:'/admin/updateSetUnBlind/'+product_idx,
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
