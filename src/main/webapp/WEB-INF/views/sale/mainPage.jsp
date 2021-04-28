<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>토끼마켓</title>
    <script  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://kit.fontawesome.com/abf52b8f21.js"></script>
	    <style>
        .main_title{
	        text-align: center;
        }

        .main_list {
            width: 1400px;
            margin: 0 auto;
        }

        .list_start {
            text-align: center;
        }

        .list_detail {
            display: inline-block;
            width: 250px;
            height: 370px;
            margin: 30px;
        }

        .list_detail img{
            width: 100%;
        }

        .list_detail div{
            float: left;
            cursor: default
        }

        .list_detail p{
            text-align: left;
            margin: 0;
        }

        .list_detail a{
            text-decoration: none;
            color: black;
        }

        input[type='text']{
            width: 40%;
            border: none;
            font-size: large;
            height: 30px;
            text-align: center;
            color: transparent;
            text-shadow: 0 0 0 black;
        }
        
        i{
        	 font-size: 25px; 
        }

        .write_area_cover{
            height: 36px;
            padding: 10px;
            margin-right: 3%;
        }

        .write_area{
            background-color: #F79646;
            float: right;
            padding: 7px;
            border-radius: 3px;
            cursor: pointer;
            color: white;
            font-weight: 600;
        }

        .sale_state{
            background-color: #F79646;
            float: right;
            padding: 5px;
            border-radius: 3px;
            color: white;
            font-size: small;
            margin-bottom: 3px;
        }

    </style>
</head>
<body>
	<jsp:include page="../include/topNavigation.jsp"></jsp:include>

       <div class="main_list">

        <div class="list_start">
            <div style="display: inline">
                <input type="text" placeholder="검색어를 입력하세요">
                <span><i class="fas fa-search"></i></span>
            </div>
        </div>

        <div class="write_area_cover">
            <div class="write_area">
            글 올리기
            </div>
        </div>

        
        <div class="list_start">

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
                </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
             <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

            <div class="list_detail">
                <div class="sale_state">
                    판매중
                </div>
                <a href="#">
                <img src="/resources/img/food.jpg"/>
                <p>떡볶이 팔아요</p>
                <p>30,000원</p>
                <p>1시간전</p>
                <p>관심 8 조회수 10</p>
            </a>
            </div>

        </div>

    </div>
</body>
<script>
	var msg = '${msg}';
	if(msg != ""){
		alert(msg);
	}
</script>
</html>