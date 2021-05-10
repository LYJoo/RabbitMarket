<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>운송장번호 입력</title>
		<!-- 제이쿼리(부트스트랩보다 위에있어야함) -->
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="../resources/css/hwi_css.css">   
		<style type="text/css">
			.btn{
				margin: 10px;
			}
			input[type='text']{
				text-align:center;
				padding: 5px;
			}
		</style>
	</head>
	<body>
		<div class="main-logo">
            <img src="../resources/img/rabbit_logo.png" alt="">
        </div>
        <div style="text-align:center;margin:auto;">
			<h2>운송장 번호 등록하기</h2>
			<div>
				<input type="text" id="package_company" name="package_company" placeholder="택배사를 입력해주세요.";'/>
				<br/>
				<input type="text" id="tracking_number" placeholder="운송장번호를 입력해주세요."/>
			</div>
	        <div class="btn">
		    	<input type="button" value="등록" onclick="registTrackingNum()"/>	        
	        </div>
        </div>
	</body>
	<script>
		function registTrackingNum(){
			var package_company = $('#package_company').val();
			var tracking_number = $('#tracking_number').val();
			var trade_idx = ${trade_idx};
	    	$.ajax({
				url:'/myPage/registTrackingNum'
                ,contentType: "application/json; charset=UTF-8"
				,type: 'GET'
				,data:{"package_company": package_company
					,"tracking_number":tracking_number
					,"trade_idx":trade_idx}
				,success:function(data){
					if(data.success==1){
						alert('운송장 번호가 완료되었습니다.');
						self.close();
					}
				},
				error: function(error){
					console.log(error);
				}
			});
			
		}
	</script>
</html>