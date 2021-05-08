<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <title>Page Title</title>
    <script  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<style>
    .myPage_left_nav_group{
        width: 100%;
    }
    div li{
        list-style: none;
        padding: 10px;
    }
    .myPage_nav_title{
        cursor: pointer;
    }
    .myPage_left_nav li span{
        color: #F79646;
    }
    .myPage_nav_bar_hide{
        display:none;
    }
    .myPage_left_nav a:active,
    .myPage_left_nav a:hover,
    .myPage_left_nav a:link,
    .myPage_left_nav a:visited{
        color:  #F79646;
        text-decoration: none;
    }
    
    .our_content_area{
    	position: relative; 
    	margin-left: 20%; 
    	margin-top: 10px; 
    	margin-right: 5%;
    }
    
    .our_navigation_area{
    	position: relative; 
    	float: left; 
    	width: 20%;
    }
</style>

<body>
<div class="our_navigation_area">
    <div class="myPage_left_nav_group">
    <ul class="myPage_left_nav">
        <li class="myPage_nav_bar">
            <span class="myPage_nav_title" onclick="nav_textBold(this, $('#myPage_nav_bar_hide1'),$('#myPage_nav_bar_hide2'),$('#myPage_nav_bar_hide3'),$('#myPage_nav_bar_hide4'),$('#myPage_nav_bar_hide5'),$('#myPage_nav_bar_hide6'),$('#myPage_nav_bar_hide7'))">
                <a href="#">회원정보</a>
            </span>
            <ul class="myPage_nav_bar_hide">
                
                    <li id="myPage_nav_bar_hide1" onclick="submenuOneTextBold(this, $('#myPage_nav_bar_hide2'),$('#myPage_nav_bar_hide3'),$('#myPage_nav_bar_hide4'))">
                		<a href="/myPage/memberInfo">회원정보</a>
                    </li>
                    <li id="myPage_nav_bar_hide2" onclick="submenuOneTextBold(this, $('#myPage_nav_bar_hide1'),$('#myPage_nav_bar_hide3'),$('#myPage_nav_bar_hide4'))">
                    	<a href="/myPage/memberInfoUpdateForm">회원정보 수정</a>
                   	</li>
                    <li id="myPage_nav_bar_hide3" onclick="submenuOneTextBold(this, $('#myPage_nav_bar_hide1'),$('#myPage_nav_bar_hide2'),$('#myPage_nav_bar_hide4'))">
                    	<a href="/myPage/memberPwUpdateForm">비밀번호 변경</a>
                    </li>
                    <li id="myPage_nav_bar_hide4" onclick="submenuOneTextBold(this, $('#myPage_nav_bar_hide1'),$('#myPage_nav_bar_hide2'),$('#myPage_nav_bar_hide3'))">
                    	<a href="/myPage/memberWithdrawForm">회원탈퇴</a>
                    </li>
            </ul>
        </li>
        <li>
            <a href="/myPage/keywordList">
                <span class="myPage_nav_title" onclick="nav_textBold2(this, $('#myPage_nav_bar_hide1'),$('#myPage_nav_bar_hide2'),$('#myPage_nav_bar_hide3'),$('#myPage_nav_bar_hide4'),$('#myPage_nav_bar_hide5'),$('#myPage_nav_bar_hide6'),$('#myPage_nav_bar_hide7'))">키워드</span>
            </a>
        </li>
        <li>
            <a href="/myPage/salelist">
                <span  class="myPage_nav_title" onclick="nav_textBold2(this, $('#myPage_nav_bar_hide1'),$('#myPage_nav_bar_hide2'),$('#myPage_nav_bar_hide3'),$('#myPage_nav_bar_hide4'),$('#myPage_nav_bar_hide5'),$('#myPage_nav_bar_hide6'),$('#myPage_nav_bar_hide7'))">판매내역</span>
            </a>
        </li>
        <li>
            <a href="/myPage/myBuyList"><!-- 구매내역 -->
                <span  class="myPage_nav_title" onclick="nav_textBold2(this, $('#myPage_nav_bar_hide1'),$('#myPage_nav_bar_hide2'),$('#myPage_nav_bar_hide3'),$('#myPage_nav_bar_hide4'),$('#myPage_nav_bar_hide5'),$('#myPage_nav_bar_hide6'),$('#myPage_nav_bar_hide7'))">구매내역</span>
            </a>
        </li>
        <li>
            <a href="/myPage/wishlist">
                <span  class="myPage_nav_title" onclick="nav_textBold2(this, $('#myPage_nav_bar_hide1'),$('#myPage_nav_bar_hide2'),$('#myPage_nav_bar_hide3'),$('#myPage_nav_bar_hide4'),$('#myPage_nav_bar_hide5'),$('#myPage_nav_bar_hide6'),$('#myPage_nav_bar_hide7'))">위시리스트</span>
            </a>
        </li>
        <li>
            <a href="/myPage/alarmList">
                <span class="myPage_nav_title" onclick="nav_textBold2(this, $('#myPage_nav_bar_hide1'),$('#myPage_nav_bar_hide2'),$('#myPage_nav_bar_hide3'),$('#myPage_nav_bar_hide4'),$('#myPage_nav_bar_hide5'),$('#myPage_nav_bar_hide6'),$('#myPage_nav_bar_hide7'))">알림</span>
            </a>
        </li>
        <li>
            <a href="/myPage/blockList">
                <span class="myPage_nav_title" onclick="nav_textBold2(this, $('#myPage_nav_bar_hide1'),$('#myPage_nav_bar_hide2'),$('#myPage_nav_bar_hide3'),$('#myPage_nav_bar_hide4'),$('#myPage_nav_bar_hide5'),$('#myPage_nav_bar_hide6'),$('#myPage_nav_bar_hide7'))">차단목록</span>
            </a>
        </li>
        <li>
            <span class="myPage_nav_title" onclick="nav_textBold(this, $('#myPage_nav_bar_hide5'),$('#myPage_nav_bar_hide1'),$('#myPage_nav_bar_hide2'),$('#myPage_nav_bar_hide3'),$('#myPage_nav_bar_hide4'),$('#myPage_nav_bar_hide6'),$('#myPage_nav_bar_hide7'))">
                <a href="#">신고내역</a>
            </span>
            <ul  class="myPage_nav_bar_hide">
                    <li id="myPage_nav_bar_hide5" onclick="submenuTwoTextBold(this, $('#myPage_nav_bar_hide6'),$('#myPage_nav_bar_hide7'))">
                    	<a href="/myPage/saleReportList">판매글</a></li>
                    <li id="myPage_nav_bar_hide6" onclick="submenuTwoTextBold(this, $('#myPage_nav_bar_hide5'),$('#myPage_nav_bar_hide7'))">
                    	<a href="/myPage/commentReportList">댓글</a></li>
                    <li id="myPage_nav_bar_hide7" onclick="submenuTwoTextBold(this, $('#myPage_nav_bar_hide5'),$('#myPage_nav_bar_hide6'))">
                    	<a href="/myPage/cocommentReportList">대댓글</a></li>
            </ul>
        </li>
        <li>
            <a href="/myPage/questionList">
                <span class="myPage_nav_title" onclick="nav_textBold2(this, $('#myPage_nav_bar_hide1'),$('#myPage_nav_bar_hide2'),$('#myPage_nav_bar_hide3'),$('#myPage_nav_bar_hide4'),$('#myPage_nav_bar_hide5'),$('#myPage_nav_bar_hide6'),$('#myPage_nav_bar_hide7'))">1:1문의내역</span>
            </a>
        </li>
    </ul>
    </div>
    </div>
</body>
<script>
jQuery.noConflict();

    $(".myPage_nav_title").click(function(){
        var submenu = $(this).next("ul");
        var other_submenu = $('.myPage_nav_title');

        if( submenu.is(":visible") ){
            submenu.slideUp();
        }else{
           var sub_hide_menu = $('.myPage_nav_bar_hide');
            sub_hide_menu.slideUp();  
            submenu.slideDown();
        }
    });

    function nav_textBold(elem,elem1,elem2,elem3,elem4,elem5,elem6,elem7){
        var title_menu = document.getElementsByClassName('myPage_nav_title');

        for (var i = 0; i < title_menu.length; i++) {
            title_menu[i].style.fontWeight = "400";
        }
        elem.style.fontWeight = "900";
        elem1.css({'font-weight':'900'});
        elem2.css({'font-weight':'400'});
        elem3.css({'font-weight':'400'});
        elem4.css({'font-weight':'400'});
        elem5.css({'font-weight':'400'});
        elem6.css({'font-weight':'400'});
        elem7.css({'font-weight':'400'});
    }

    function nav_textBold2(elem,elem1,elem2,elem3,elem4,elem5,elem6,elem7){
        var title_menu = document.getElementsByClassName('myPage_nav_title');

        for (var i = 0; i < title_menu.length; i++) {
            title_menu[i].style.fontWeight = "400";
        }
        elem.style.fontWeight = "900";
        elem1.css({'font-weight':'400'});
        elem2.css({'font-weight':'400'});
        elem3.css({'font-weight':'400'});
        elem4.css({'font-weight':'400'});
        elem5.css({'font-weight':'400'});
        elem6.css({'font-weight':'400'});
        elem7.css({'font-weight':'400'});
    }

    function submenuOneTextBold(elem, elem2, elem3, elem4){
        elem.style.fontWeight = "900";
        elem2.css({'font-weight':'400'});
        elem3.css({'font-weight':'400'});
        elem4.css({'font-weight':'400'});
    }

    function submenuTwoTextBold(elem, elem2, elem3){
        elem.style.fontWeight = "900";
        elem2.css({'font-weight':'400'});
        elem3.css({'font-weight':'400'});
    }

</script>
    