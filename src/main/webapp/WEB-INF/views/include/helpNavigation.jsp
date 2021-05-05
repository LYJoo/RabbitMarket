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
    .helpPage_left_nav_group{
        width: 100%;
    }
    div li{
        list-style: none;
        padding: 10px;
    }
    .helpPage_nav_title{
        cursor: pointer;
        font-size: 17px;
    }
    .helpPage_left_nav li span{
        color: #F79646;
    }
    .helpPage_left_nav a:active,
    .helpPage_left_nav a:hover,
    .helpPage_left_nav a:link,
    .helpPage_left_nav a:visited{
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
    	margin-left: 50px; 
    	margin-top: 80px; 
    }
</style>

<body>
<div class="our_navigation_area">
    <div class="helpPage_left_nav_group">
    <ul class="helpPage_left_nav">
        <li>
            <a href="/help/noticeMain">
                <span class="helpPage_nav_title" onclick="nav_textBold(this)">공지사항</span>
            </a>
        </li>
        <li>
            <a href="/help/helpFrequentlyMain">
                <span  class="helpPage_nav_title" onclick="nav_textBold(this)">자주묻는질문</span>
            </a>
        </li>
        <li>
            <a href="/help/helpQuestionMain">
                <span  class="helpPage_nav_title" onclick="nav_textBold(this)">1:1문의</span>
            </a>
        </li>
        
    </ul>
    </div>
    </div>
</body>
<script type="text/javascript">
jQuery.noConflict();
    $(".mypage_nav_title").click(function(){
        var submenu = $(this).next("ul");
        var other_submenu = $('.helpPage_nav_title');

        if( submenu.is(":visible") ){
            submenu.slideUp();
        }else{
           var sub_hide_menu = $('.helpPage_nav_title');
            sub_hide_menu.slideUp();  
            submenu.slideDown();
        }
    });

    function nav_textBold(elem){
        var title_menu = document.getElementsByClassName('helpPage_nav_title');

        for (var i = 0; i < title_menu.length; i++) {
            title_menu[i].style.fontWeight = "400";
        }
        elem.style.fontWeight = "900";
    }

</script>
    