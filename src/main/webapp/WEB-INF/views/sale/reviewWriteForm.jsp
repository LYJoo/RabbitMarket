<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>거래 후기 작성</title>
    <style>
        .review_title_cover{
            width: 100%;
            display: flex;
            align-items: center;
            font-weight: 600;
            font-size: 20px;
        }

        .review_title{
            margin-left: 50px;
        }

        .review_save_btn{
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
            width: 300px;
            height: 150px;
            resize: none;
            border: 1px solid #F79646;
            outline: none;
        }

        .review_window_cover{
            width: 400px;
            border: 1px solid #F79646;
            text-align: center;
            margin: auto;
            position: absolute;
            padding: 10px;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
    </style>
<body>
    <div>
<div class="review_window_cover">
    <div class="review_title_cover">
        <div class="review_title"><img style="width: 100px;" src="resources/img/rabbit.jpg"/></div>
        <div class="review_title">거래 후기 작성</div>
    </div>

    <p> use142r 님이 serre12 님에게 </p>

    <div class="review_new_window">
        <textarea placeholder="후기 내용 (100자 이하)"></textarea>
        <div class="review_save_btn_cover">
            <div class="review_save_btn">
            작성
            </div>
            <div class="review_save_btn">
            취소
            </div>
        </div>  
    </div>
</div>
</div>
</body>
<script>

</script>
</html>