<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>거래취소 사유 입력</title>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
</head>
<style>
    .cancel_title_cover{
        width: 100%;
        display: flex;
        align-items: center;
        font-weight: 600;
        font-size: 20px;
    }

    .cancel_title{
        margin-left: 50px;
    }

    .cancel_save_btn{
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

    .cancel_window_cover{
        width: 350px;
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
<div class="cancel_window_cover">
    <div class="cancel_title_cover">
        <div class="cancel_title">거래취소사유</div>
        <div class="cancel_title"><img style="width: 100px;" src="/resources/img/rabbit.jpg"/></div>
    </div>
    <div class="cancel_new_window">
        <textarea id="cancel_reason"></textarea>
        <div class="cancel_save_btn_cover">
            <div class="cancel_save_btn" onclick="save()">
         저장
            </div>
            <div class="cancel_save_btn" onclick="cancel()">
           취소
            </div>
        </div>  
    </div>
</div>
</div>
</body>
<script>
	function cancel(){
		var cancelCheck = confirm('정말 취소하시겠습니까?');
		if(cancelCheck){
			opener.location.reload();
			self.close();
		}
	}
	
	function save(){
		var product_idx = "${product_idx}";
		var trade_idx = "${trade_idx}";
		var cancel_reason = $('#cancel_reason').val();
		console.log(cancel_reason);
		
		$.ajax({
			url: '/sale/saveCancelReason'
			,type: 'post'
			,data:{"product_idx":product_idx
				,"trade_idx": trade_idx
				,"cancel_reason" : cancel_reason}
			,dataType: 'json'
			,success: function(d){
				console.log(d);
				if(d.success == 1){
					alert('거래가 취소되었습니다.');
					opener.location.reload();
					self.close();
				}else{
					alert('거래가 취소가 실패했습니다. 잠시 후 다시 시도해주세요.');
				}
			}
			,error: function(e){
				console.log(e);
			}
		});
	}
</script>
</html>