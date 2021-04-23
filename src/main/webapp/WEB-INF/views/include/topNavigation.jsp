<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>메인</title>
    <style>
        body { 
            font-family: 'Noto Sans KR', sans-serif; 
        }

        #login_bar {
            height: 35px;
            margin-top: 1%;
            margin-right: 5%;
            text-align: right;
        }
        #login_bar_list img{
            padding-right: 30px;
            width: 30px;
        }

        #login_bar_unmember {
            height: 35px;
            margin-top: 1%;
            margin-right: 5%;
            text-align: right;
        }

        #login_bar_unmember_list img{
            padding-right: 30px;
            width: 30px;
            vertical-align: middle;
        }

        #login_bar_unmember_list a{
            font-weight: 500;
        }

        #login_bar_unmember a:hover,
        #login_bar_unmember a:link,
        #login_bar_unmember a:visited,
        #login_bar_unmember a:active{
            color: black;
            text-decoration: none;
        }

        #login_bar_unmember img{
            width: 30px;
        }

        .profile_circle_box {
            width: 30px;
            height: 30px; 
            border-radius: 70%;
            overflow: hidden;
            float: right;
            cursor: pointer;
        }
        #profile_img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            margin-right: 5%;
        }

        #logout_div{
            height: 70px;
        }

        #logout_div_cover{
            border-radius: 3px;
            width: 100px;
            margin-right: 5%;
            float: right;
            font-size: medium;
            visibility: hidden;
            background-color: rgb(241, 234, 234);
            
        }

        .top_down_menu{
            border-radius: 3px;
            padding: 5px;
        }

        .top_down_menu a{
            font-weight: 500;
        }

        #logout_div a:hover,
        #logout_div a:link,
        #logout_div a:visited,
        #logout_div a:active{
            color: black;
            text-decoration: none;
        }

        #login_bar a:hover,
        #login_bar a:link,
        #login_bar a:visited,
        #login_bar a:active{
            color: black;
            text-decoration: none;
        }

        .logo_area{
            width: 100%;
            text-align: center;
        }
        .rabbit_logo{
            width: 300px;
            display: inline-block;
        }
        .rabbit_logo img{
            width: 100%;
        }
    </style>
</head>
<body>

<c:if test="${sessionScope.loginId ne null}">
<div id="login_bar">
    <span id="login_bar_list">
        <a href="#"><img src="resources/img/callcenter.png" alt="고객센터"></a>
        <a href="#"><img src="resources/img/message.png" alt="쪽지"></a> 
        <a href="#"><img src="resources/img/bell.png" alt="알림"></a>
        
        <div class="profile_circle_box" onclick="logout_link_visibility()">
            <img id="profile_img"src="resources/img/dog.jpg" alt="프로필사진"><!-- 나중에 프로필 사진 가져오기 -->
        </div>
    </span>
</div>

<div id="logout_div">
    <div id="logout_div_cover">
        <div class="top_down_menu" onmouseover="logout_link_color(this,$('.top_down_a_tag')[0])" onmouseout="logout_link_uncolor(this,$('.top_down_a_tag')[0])">
            <a class="top_down_a_tag" href="#">
                마이페이지
            </a>
        </div>
        
        <div class="top_down_menu" onmouseover="logout_link_color(this,$('.top_down_a_tag')[1])" onmouseout="logout_link_uncolor(this,$('.top_down_a_tag')[1])">
            <a class="top_down_a_tag" href="#">
                로그아웃
            </a>
        </div>
    </div>
</div>
</c:if>

 <c:if test="${sessionScope.loginId eq null && sessionScope.adminId eq null}">
    <div id="login_bar_unmember">
        <sapn id="login_bar_unmember_list">
            <a href="#"><img src="resources/img/callcenter.png" alt="고객센터"></a>
            <a href="#">로그인</a>
        </sapn>
    </div>
    <div id="logout_div">
    </div>
</c:if>

<c:if test="${sessionScope.loginId eq null && sessionScope.adminId ne null}">
<div id="login_bar">
    <span id="login_bar_list">
        <a href="#"><img src="resources/img/callcenter.png" alt="고객센터"></a>
        
        <div class="profile_circle_box" onclick="logout_link_visibility()">
            <img id="profile_img"src="resources/img/default_profile.png" alt="프로필사진"> <!-- 관리자는 기본 이미지 -->
        </div>
    </span>
</div>

<div id="logout_div">
    <div id="logout_div_cover">
        <div class="top_down_menu" onmouseover="logout_link_color(this,$('.top_down_a_tag')[0])" onmouseout="logout_link_uncolor(this,$('.top_down_a_tag')[0])">
            <a class="top_down_a_tag" href="#">
                관리자페이지
            </a>
        </div>
        
        <div class="top_down_menu" onmouseover="logout_link_color(this,$('.top_down_a_tag')[1])" onmouseout="logout_link_uncolor(this,$('.top_down_a_tag')[1])">
            <a class="top_down_a_tag" href="#">
                로그아웃
            </a>
        </div>
    </div>
</div>
</c:if>

    <div class="logo_area">
        <a href="#">
            <div class="rabbit_logo">
                <img src="resources/img/rabbit_logo.png" alt="토끼마켓 로고">
            </div>
        </a>  
    </div>
    
</body>
<script>
    var flag = 0;
    var logout_visibility = ['visible','hidden'];
    
    function logout_link_visibility(){
        if(flag == logout_visibility.length){
            flag = 0;
        }
        document.getElementById("logout_div_cover").style.visibility=logout_visibility[flag];
        flag =  flag + 1;
    }

    function logout_link_color(elem, elem2){
        elem.style.background = "#F79646";
        elem2.style.color = "white";
    }

    function logout_link_uncolor(elem, elem2){
        elem.style.background = "rgb(241, 234, 234)";
        elem2.style.color = "black";
    }

</script>
</html>