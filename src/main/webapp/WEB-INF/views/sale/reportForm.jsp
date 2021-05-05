<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>클린한 토끼마켓을 위하여! 게시물 신고</title>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
</head>
<style>
    .report_title_cover{
        width: 100%;
        display: flex;
        align-items: center;
        font-weight: 600;
        font-size: 20px;
    }

    .report_title{
        margin-left: 50px;
    }

    .report_save_btn{
        width: 40px;
        background-color: #F79646;
        padding: 5px;
        border-radius: 3px;
        cursor: pointer;
        color: white;
        font-weight: 600;
        text-align: center;
        margin: 25px;
        display: inline-block;
    }
    textarea{
        width: 200px;
        height: 100px;
        resize: none;
        border: 1px solid #F79646;
        outline: none;
    }

    .report_window_cover{
        width: 300px;
        border: 1px solid #F79646;
        text-align: center;
        margin: auto;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);
    }
</style>
<body>
    <div>
<div class="report_window_cover">
    <div class="report_title_cover">
        <div class="report_title">신고사유</div>
        <div class="report_title"><img style="width: 100px;" src="/resources/img/rabbit.jpg"/></div>
    </div>
    <div class="report_new_window">
        <textarea id="report_reason"></textarea>
        <div class="report_save_btn_cover">
            <div class="report_save_btn" onclick="save()">
            저장
            </div>
            <div class="report_save_btn" onclick="cancel()">
            취소
            </div>
        </div>  
    </div>
</div>
</div>
</body>
<script>
	check()
	function check(){
		var chReport = "${chReport}";
		if(chReport == 1){
			alert('이미 신고한 글 입니다.');
			self.close();
		}
	}
	
	function cancel(){
		var cancelCheck = confirm('정말 취소하시겠습니까?');
		if(cancelCheck){
			self.close();
		}
	}
	
	function save(){
		var idx = "${idx}";
		var codeNum = "${codeNum}";
		var target = "${target}";
		var report_reason = $('#report_reason').val();
		console.log(report_reason);
		
		$.ajax({
			url: '/sale/report'
			,type: 'post'
			,data:{"idx": idx
				,"codeNum" : codeNum
				,"target" : target
				,"report_reason" : report_reason}
			,dataType: 'json'
			,success: function(d){
				console.log(d);
				if(d.success == 1){
					alert('신고되었습니다.');
					self.close();
				}else{
					alert('신고가 정상적으로 처리되지 않았습니다. 잠시후 다시 시도해주세요.');
				}
			}
			,error: function(e){
				console.log(e);
			}
		});
	}
</script>
</html>