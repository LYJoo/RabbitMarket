<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>알림</title>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <style>
        .package_alarm_btn_cover{
            width: 100%;
            text-align: center;
        }

        .package_alarm_btn{
            width: 40px;
            background-color: #F79646;
            padding: 5px;
            border-radius: 3px;
            cursor: pointer;
            color: white;
            font-weight: 600;
            text-align: center;
            margin: 15px;
            display: inline-block;
        }

        .outer_cover{
            width: 430px;
            border: 1px solid #F79646;
            margin: auto;
            padding: 20px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
        }

        .package_alarm_title_cover{
            width: 100%;
            display: flex;
            align-items: center;
        }

        .package_alarm_title{
            margin-left: 60px;
        }
        
        img{
            width: 300px;
            margin-bottom: 50px;
        }

        p{
            margin-bottom: 70px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="outer_cover">
        <div class="tpackage_alarm_title_cover">
            <div class="package_alarm_title">
                <img src="/resources/img/rabbit_logo.png"/>
            </div>
        </div>
        <div>
            <p>
                택배를 붙이신 후 발급된 운송장 번호를</br>
                <b>마이페이지>판매내역>거래상세보기>운송장번호 등록하기</b>에서 입력해주세요.
            </p>
        </div>
    
        <div class="package_alarm_btn_cover">
            <div class="package_alarm_btn" onclick="ok()">
            확인
            </div>
        </div>  
    </div>
</body>
<script>
	function ok(){
		opener.parent.parent.location.reload();
		self.close();
	}
</script>
</html>