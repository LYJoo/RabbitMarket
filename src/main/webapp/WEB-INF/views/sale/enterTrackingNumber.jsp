<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>운송장번호 입력</title>
    <link rel="stylesheet" type="text/css" href="resources/css/select2.css"/>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="resources/js/select2.js" charset="utf-8"></script>
    <style>

    .enter_tracking_number_title_cover{
        width: 100%;
        display: flex;
        align-items: center;
        font-weight: 600;
        font-size: 20px;
    }

    .enter_tracking_number_title{
        margin-left: 90px;
        margin-bottom: 20px;
    }

    .tracking_number_btn_cover{
        align-content: center;
    }

    .tracking_number_btn{
        width: 40px;
        background-color: #F79646;
        padding: 5px;
        border-radius: 3px;
        cursor: pointer;
        color: white;
        font-weight: 600;
        text-align: center;
        margin: 30px;
        display: inline-block;
    }

    .outer_cover{
        width: 550px;
        border: 1px solid #F79646;
        margin: auto;
        padding: 10px;
        text-align: center;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);
    }
    
    img{
        width: 100px;
        margin-bottom: 30px;
    }

    input[type='text']{
        border: 1px solid #F79646;
        outline: none;
        height: 37px;
        border-radius: 3px;
    }

    .package_company{
        width: 200px;
    }

</style>
</head>
<body>
    <div>
		<div class="outer_cover">
		    <div class="enter_tracking_number_title_cover">
		        <div class="enter_tracking_number_title">
		            <img src="resources/img/rabbit.jpg"/>
		        </div>
		        <div class="enter_tracking_number_title">
		            <p>운송장번호 입력</p>
		        </div>
		    </div>
		    <div>
		        <select name="package_company" class="package_company1">
		            <option value="CJ대한통운">CJ대한통운</option>
		            <option value="우체국택배">우체국택배</option>
		            <option value="한진택배">한진택배</option>
		            <option value="롯데택배">롯데택배</option>
		            <option value="로젠택배">로젠택배</option>
		            <option value="대신택배">대신택배</option>
		        </select>
		        <input style="width: 300px;" id="tracking_number" type="text" name="tracking_number" placeholder="운송장 번호를 '-'없이 입력하세요."/>
		    </div>
		
		    <div class="tacking_number_btn_cover">
		        <div class="tracking_number_btn" onclick="enterTrackingNumber()">
		        등록
		        </div>
		    </div>  
		</div>
	</div>
</body>
<script>
    $('.package_company1').select2();

    function enterTrackingNumber() {
        var company = $(".package_company1 option:selected").val();
        var taracking_number = $('#tracking_number').val();
        //숫자가 아니면 한번 체크해야함
        confirm(company + ' - ' + taracking_number + '으로 등록하시겠습니까?');
    }
</script>
</html>