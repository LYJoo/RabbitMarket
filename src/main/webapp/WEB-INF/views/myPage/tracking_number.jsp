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
		
		</style>
	</head>
	<body>
		<div class="main-logo">
            <img src="../resources/img/rabbit_logo.png" alt="">
        </div>
		<h1>운송장 번호 등록하기</h1>
		<div>
			<select id="tracking" name="tracking">
			<option value="">CJ대한통운</option>
			<option value="">우체국택배</option>
			<option value="">롯데택배</option>
		</select> <input type="text" id="tracking_number" placeholder="운송장번호를 '-' 없이 입력해주세요."/>
		</div>
        <div class="btn">
	    	<input type="button" value="등록" onClick=""/>	        
        </div>
	</body>
	<script>
	
	</script>
</html>