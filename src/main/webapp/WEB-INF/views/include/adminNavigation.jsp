<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <title>Page Title</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<style>
    .adminPage_left_nav_group{
        width: 100%;
    }
    div li{
        list-style: none;
        padding: 10px;
    }
    .adminPage_nav_title{
        cursor: pointer;
    }
    .adminPage_left_nav li span{
        color: #F79646;
    }
    .adminPage_nav_bar_hide{
        display:none;
    }
    .adminPage_left_nav a:active,
    .adminPage_left_nav a:hover,
    .adminPage_left_nav a:link,
    .adminPage_left_nav a:visited{
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
    <div class="adminPage_left_nav_group">
    <ul class="adminPage_left_nav">
        <li class="adminPage_nav_bar">
            <span class="adminPage_nav_title" onclick="nav_textBold(this, $('#adminPage_nav_bar_hide1'),$('#adminPage_nav_bar_hide2'),$('#adminPage_nav_bar_hide3'),$('#adminPage_nav_bar_hide4'),$('#adminPage_nav_bar_hide5'),$('#adminPage_nav_bar_hide6'),$('#adminPage_nav_bar_hide7'),$('#adminPage_nav_bar_hide8'),$('#adminPage_nav_bar_hide9'))">
                <a href="#">회원 관리</a>
            </span>
            <ul class="adminPage_nav_bar_hide">
              <li id="adminPage_nav_bar_hide1" onclick="submenuTextBold(this, $('#adminPage_nav_bar_hide2'),$('#adminPage_nav_bar_hide3'))">
               	<a href="callMemberList">일반회원</a>
               </li>

              <li id="adminPage_nav_bar_hide2" onclick="submenuTextBold(this, $('#adminPage_nav_bar_hide1'),$('#adminPage_nav_bar_hide3'))">
               <a href="callBlackList">블랙리스트</a>
               </li>
               
              <li id="adminPage_nav_bar_hide3" onclick="submenuTextBold(this, $('#adminPage_nav_bar_hide1'),$('#adminPage_nav_bar_hide2'))">
               <a href="callWithdrawList">탈퇴회원</a>
               </li>
            </ul>
        </li>

        <li class="adminPage_nav_bar">
            <span class="adminPage_nav_title" onclick="nav_textBold(this, $('#adminPage_nav_bar_hide4'),$('#adminPage_nav_bar_hide1'),$('#adminPage_nav_bar_hide2'),$('#adminPage_nav_bar_hide3'),$('#adminPage_nav_bar_hide5'),$('#adminPage_nav_bar_hide6'),$('#adminPage_nav_bar_hide7'),$('#adminPage_nav_bar_hide8'),$('#adminPage_nav_bar_hide9'))">
                <a href="#">신고 관리</a>
            </span>
            <ul class="adminPage_nav_bar_hide">
              <li id="adminPage_nav_bar_hide4" onclick="submenuTextBold(this, $('#adminPage_nav_bar_hide5'),$('#adminPage_nav_bar_hide6'))">
              		<a href="/admin/saleReportList">신고된 글</a>
              </li>
              <li id="adminPage_nav_bar_hide5" onclick="submenuTextBold(this, $('#adminPage_nav_bar_hide4'),$('#adminPage_nav_bar_hide6'))">
              		<a href="/admin/commentReportList">신고된 댓글</a>
              </li>
            </ul>
        </li>

        <li>
            <a href="/admin/callSaleCategory">
                <span class="adminPage_nav_title" onclick="nav_textBold2(this, $('#adminPage_nav_bar_hide1'),$('#adminPage_nav_bar_hide2'),$('#adminPage_nav_bar_hide3'),$('#adminPage_nav_bar_hide4'),$('#adminPage_nav_bar_hide5'),$('#adminPage_nav_bar_hide6'),$('#adminPage_nav_bar_hide7'),$('#adminPage_nav_bar_hide8'),$('#adminPage_nav_bar_hide9'))">카테고리 관리</span>
            </a>
        </li>
       
        <li class="adminPage_nav_bar">
            <span class="adminPage_nav_title" onclick="nav_textBold(this, $('#adminPage_nav_bar_hide7'),$('#adminPage_nav_bar_hide1'),$('#adminPage_nav_bar_hide2'),$('#adminPage_nav_bar_hide3'),$('#adminPage_nav_bar_hide4'),$('#adminPage_nav_bar_hide5'),$('#adminPage_nav_bar_hide6'),$('#adminPage_nav_bar_hide8'),$('#adminPage_nav_bar_hide9'))">
                고객센터 관리
            </span>
            <ul class="adminPage_nav_bar_hide">
                <li id="adminPage_nav_bar_hide7" onclick="submenuTextBold(this, $('#adminPage_nav_bar_hide8'),$('#adminPage_nav_bar_hide9'))">
                	<a href="/admin/callNoticeList">공지사항</a>
                </li>
                <li id="adminPage_nav_bar_hide8" onclick="submenuTextBold(this, $('#adminPage_nav_bar_hide7'),$('#adminPage_nav_bar_hide9'))">
                	<a href="/admin/callFaqList">자주묻는질문</a>
                </li>
                <li id="adminPage_nav_bar_hide9" onclick="submenuTextBold(this, $('#adminPage_nav_bar_hide7'),$('#adminPage_nav_bar_hide8'))">
                	<a href="/admin/callQList">1:1문의</a>
                </li>
            </ul>
        </li>

        <li>
            <a href="/admin/callPopupList">
                <span class="adminPage_nav_title" onclick="nav_textBold2(this, $('#adminPage_nav_bar_hide1'),$('#adminPage_nav_bar_hide2'),$('#adminPage_nav_bar_hide3'),$('#adminPage_nav_bar_hide4'),$('#adminPage_nav_bar_hide5'),$('#adminPage_nav_bar_hide6'),$('#adminPage_nav_bar_hide7'),$('#adminPage_nav_bar_hide8'),$('#adminPage_nav_bar_hide9'))">팝업관리</span>
            </a>
        </li>
        <li>
            <a href="/admin/callMannerQ">
                <span class="adminPage_nav_title" onclick="nav_textBold2(this, $('#adminPage_nav_bar_hide1'),$('#adminPage_nav_bar_hide2'),$('#adminPage_nav_bar_hide3'),$('#adminPage_nav_bar_hide4'),$('#adminPage_nav_bar_hide5'),$('#adminPage_nav_bar_hide6'),$('#adminPage_nav_bar_hide7'),$('#adminPage_nav_bar_hide8'),$('#adminPage_nav_bar_hide9'))">매너질문관리</span>
            </a>
        </li>
       
        <li>
            <a href="/admin/callAdminList">
                <span class="adminPage_nav_title" onclick="nav_textBold2(this, $('#adminPage_nav_bar_hide1'),$('#adminPage_nav_bar_hide2'),$('#adminPage_nav_bar_hide3'),$('#adminPage_nav_bar_hide4'),$('#adminPage_nav_bar_hide5'),$('#adminPage_nav_bar_hide6'),$('#adminPage_nav_bar_hide7'),$('#adminPage_nav_bar_hide8'),$('#adminPage_nav_bar_hide9'))">관리자관리</span>
            </a>
        </li>
    </ul>
    </div>
    </div>
</body>
<script>
	jQuery.noConflict();
    
	$(".adminPage_nav_title").click(function(){
        var submenu = $(this).next("ul");
        var other_submenu = $('.adminPage_nav_title');

        if( submenu.is(":visible") ){
            submenu.slideUp();
        }else{
           var sub_hide_menu = $('.adminPage_nav_bar_hide');
            sub_hide_menu.slideUp();  
            submenu.slideDown();
        }
    });

    function nav_textBold(elem,elem1,elem2,elem3,elem4,elem5,elem6,elem7,elem8,elem9){
        var title_menu = document.getElementsByClassName('adminPage_nav_title');

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
        elem8.css({'font-weight':'400'});
        elem9.css({'font-weight':'400'});
    }

    function nav_textBold2(elem,elem1,elem2,elem3,elem4,elem5,elem6,elem7,elem8,elem9){
        var title_menu = document.getElementsByClassName('adminPage_nav_title');

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
        elem8.css({'font-weight':'400'});
        elem9.css({'font-weight':'400'});
    }

    function submenuTextBold(elem, elem2, elem3){
        elem.style.fontWeight = "900";
        elem2.css({'font-weight':'400'});
        elem3.css({'font-weight':'400'});
    }

</script>
    