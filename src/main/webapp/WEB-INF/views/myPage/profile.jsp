<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset='utf-8'>
    <title>Page Title</title>
    <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="hwi_css.css">
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

        ul.tabs{
            margin: 0px;
            padding: 0px;
            list-style: none;
            text-align: center;
        }
        ul.tabs li{
            background: none;
            color: #222;
            display: inline-block;
            cursor: pointer;
        }

        ul.tabs li.current{
            color: #F79646;

        }

        ul.tabs li hr{
            border: 2px solid gray;
            width: 125px;
        }

        ul.tabs li hr.current{
            border: 2px solid #F79646;
            width: 125px;

        }

        .tab-content{
            display: none;
        }

        .tab-content.current{
            display: inherit;
        }

        table.type04 {
            border-collapse: separate;
            border-spacing: 1px;
            text-align: center;
            line-height: 1.5;
            border-top: 1px solid #ccc;
        }
        table.type04 th {
            width: 150px;
            font-weight: bold;
            vertical-align: top;
            border-bottom: 1px solid #ccc;
        }
        table.type04 td {
            width: 350px;
            padding: 10px;
            vertical-align: top;
            border-bottom: 1px solid #ccc;
        }
        .msg_paging{
            text-align: center;
        }
        #content{
            text-align: center;
        }
        #profile{
            margin: auto;
            text-align: center;
        }
    </style>
</head>
<body>
    <div id="content">
        <span>내 프로필</span>

        </div>
        <table id="profile">
        	<tr>
            	<td colspan="2"><p><img src="${path }" alt="" style="width: 150px; height: 150px;"></p></td>
            </tr>
            <tr>
            	<th>매너지수 들어가야함</th>
                <td>${member.manner_percent}</td>
            </tr>
            <tr>
            	<th>아이디 들어가야함</th>
                <td>${member.member_id}</td>
            </tr>
            <tr>
            	<th>주소 들어가야함</th>
                <td>${member.address}</td>
            </tr>
        </table>
    </div>


    <div id="msgContainer">
        <div class="main-logo">
            <img src="main_logo.png" alt="">
        </div>
        <ul class="tabs">
            <li class="tab-link current" data-tab="tab-1">판매물품<hr class="tab-hr current"></li>
            <li class="tab-link" data-tab="tab-2">거래후기<hr class="tab-hr"></li>
        </ul>
        <div id="tab-1" class="tab-content current">
            <table class="type04">
                <tr>
                    <td>내용</td>
                    <td>ID</td>
                    <td>받은날짜</td>
                </tr>
                <tr>
                  <th scope="row">항목명</th>
                  <td>내용이 들어갑니다.</td>
                  <td>내용이 들어갑니다.</td>
                </tr>
                <tr>
                  <th scope="row">항목명</th>
                  <td>내용이 들어갑니다.</td>
                  <td>내용이 들어갑니다.</td>
                </tr>
              </table>
              <!-- 페이지 -->
              <div class="msg_paging"><span> ◁ 1 2 3 4 5 ▷ </span></div>
        </div>
        <div id="tab-2" class="tab-content">
            <table class="type04">
                <tr>
                    <td>게시글제목</td>
                    <td>아이디</td>
                    <td>주소</td>
                    <td>작성일</td>
                </tr>
                <tr>
                  <th scope="row">${sale.sale_subject}</th>
                  <td>${sale.seller_id}</td>
                  <td>으앙</td>
                  <td>으엉</td>
                </tr>
              </table>
              <!-- 페이지 -->
              <div class="msg_paging"><span> ◁ 1 2 3 4 5 ▷ </span></div>
        </div>
    </div>
</body>
<script>
    $(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');
        $('.tab-hr').removeClass('current');

		$(this).addClass('current');

		$("#"+tab_id).addClass('current');
        $(this).find('hr').addClass('current');
	})

})
</script>
</html>