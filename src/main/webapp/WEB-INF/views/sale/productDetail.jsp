<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/css/select2.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <title>토끼마켓 상품 상세</title>
    <script src="https://kit.fontawesome.com/abf52b8f21.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/resources/js/select2.js" charset="utf-8"></script>
	<style>
* {
        box-sizing: border-box
    }
    body {
        font-family: Verdana, sans-serif;
    }
    .mySlides {
        display: none
    }
    img {
        vertical-align: middle;
    }

    .slideshow-container {
        max-width: 400px;
        position: relative;
        margin: auto;
    }

    .prev, .next {
        cursor: pointer;
        position: absolute;
        top: 50%;
        width: auto;
        padding: 16px;
        margin-top: -22px;
        color: white;
        font-weight: bold;
        font-size: 18px;
        transition: 0.6s ease;
        border-radius: 0 3px 3px 0;
    }

    .next {
        right: 0;
        border-radius: 3px 0 0 3px;
    }

    .prev:hover, .next:hover {
        background-color:rgb(241, 234, 234);
    }

    .dot {
        cursor: pointer;
        height: 15px;
        width: 15px;
        margin: 0 2px;
        background-color: #bbb;
        border-radius: 50%;
        display: inline-block;
        transition: background-color 0.6s ease;
    }

    .active, .dot:hover {
        background-color: #717171;
    }

    .fade1 {
        -webkit-animation-name: fade;
        -webkit-animation-duration: 1.5s;
        animation-name: fade;
        animation-duration: 1.5s;
    }

    @-webkit-keyframes fade {
        from {opacity: .4} 
        to {opacity: 1}
    }

    @keyframes fade {
        from {opacity: .4} 
        to {opacity: 1}
    }

    @media only screen and (max-width: 300px) {
        .prev, .next,.text {font-size: 11px}
    }

    .sale_state{
        background-color: #F79646;
        padding: 5px;
        border-radius: 3px;
        color: white;
        font-size: small;
        margin-bottom: 3px;
        width: 60px;
        text-align: center;
    }
    
    table{
        width: 70%;
        font-size: 15px;
        margin: auto;
    }
    
    .product_sale_detail_btn_cover{
        width: 100%;
        height: 100px;
        padding: 10px;
        text-align: center;
        margin: 10px;
    }

    .product_sale_detail_btn{
        width: 80px;
        background-color: #F79646;
        padding: 7px;
        border-radius: 3px;
        cursor: pointer;
        color: white;
        font-weight: 600;
        text-align: center;
        margin: 10px;
        display: inline-block;
    }
    .fa-heart{
        color: red;
        font-size: 30px;
        cursor: pointer;
    }

    .product_update_cover{
        width: 70%;
        text-align: right;
        margin: auto;
    }

    .product_update{
        margin: 10px;
    }

    a:hover,
    a:link,
    a:active,
    a:visited{
        text-decoration: none;
        color: black;
    }

    input[type='text']{
        width: 100%;
        height: 40px;
        font-size: 15px;
    }

    input.underline {
        border-left-width:0;
        border-right-width:0;
        border-top-width:0;
        border-bottom-width:1px;
        outline: none;
    }
    .comment_write_btn{
        width: 70px;
        background-color: #F79646;
        padding: 7px;
        border-radius: 3px;
        cursor: pointer;
        color: white;
        font-weight: 600;
        text-align: center;
        float: right;
    }

    .trade_state_select_box{
        width: 100px;
        text-align: center;
    }

    #comment_area{
        margin-bottom: 30px;
    }
    .comment_update_btn{
        text-align: right;
    }
    .comment_profile{
        width: 60px;
    }

    .comment_writer_id{
        padding-top: 10px;
    }

    .comment_content{
        padding-bottom: 10px;
    }
    .cocoment_btn{
        cursor: pointer; 
        margin:0;
    }
    .comment_write_btn_td{
        width: 15%;
    }

    #product_content_area{
        margin-top: 30px;
    }

    .cocoment_write_btn{
        font-weight: 600;
        cursor: pointer;
    }
	</style>
</head>
<body>
	<jsp:include page="../include/topNavigation.jsp"></jsp:include>
	
    <div class="slideshow-container">

        <div class="mySlides fade1">
        <div class="sale_state">판매중</div>
        <img src="/photo/16187543239120.jpg" style="width:100%">
        </div>
        
        <div class="mySlides fade1">
        <div class="sale_state">판매중</div>
        <img src="/photo/16187543239141.jpg" style="width:100%">
        </div>
        
        <div class="mySlides fade1">
            <div class="sale_state">판매중</div>
        <img src="/photo/dog2.jpg" style="width:100%">
        </div>

        <div class="mySlides fade1">
            <div class="sale_state">판매중</div>
            <img src="/photo/dog2.jpg" style="width:100%">
        </div>

        <div class="mySlides fade1">
            <div class="sale_state">판매중</div>
            <img src="/photo/dog2.jpg" style="width:100%">
        </div>
        
        <a class="prev" onclick="plusSlides(-1)"><i class="fas fa-chevron-left"></i></a>
        <a class="next" onclick="plusSlides(1)"><i class="fas fa-chevron-right"></i></a>
    
    </div>
    <br>

    <div style="text-align:center">
        <span class="dot" onclick="currentSlide(1)"></span> 
        <span class="dot" onclick="currentSlide(2)"></span> 
        <span class="dot" onclick="currentSlide(3)"></span> 
        <span class="dot" onclick="currentSlide(4)"></span> 
        <span class="dot" onclick="currentSlide(5)"></span> 
    </div>
    
    <table id="product_content_area">
        <tr>
            <td rowspan="2" style="width: 100px;">
                <img src="/photo/16187554570321.jpg" style="width: 100px; height: 100px;"/>
            </td>
            <td style="padding-top: 15px;">
                lololo
                <img src="/photo/message_orange.png" style="width: 20px; cursor: pointer;"/>
            </td>
            <td rowspan="2"  style="width: 50%;">
                <p style="margin: 0;">매너지수</p>
                <div style="width: 100%; text-align: center;">
                    <p style="font-size: 10px; margin: 0;">첫매너지수 50%</p>
                    <i class="fas fa-long-arrow-alt-down"></i>
                </div>
                <div class="progress">
                    <div class="progress-bar bg-secondary" style="width: 70%;">70%</div>
                </div>
            </td>
        </tr>
        <tr>
            <td style="padding-bottom: 15px;">인천시 남동구</td>
        </tr>

        <tr>
            <td colspan="2" style="padding: 10px 0 0 0">
                <div style="display: flex; align-items: center;">
                    <div style="padding-right: 5px;">에어팟프로 팔아요</div>
                    <div><i class="far fa-heart"></i>
                </div>
                
            </td>
            <td rowspan="2" style="text-align: right;">
                <div class="select_box_cover">
                    <select class="trade_state_select_box" onchange="value2(this,this.value,$('.select_box_cover'))">
                        <option value="판매중">판매중</option>
                        <option value="거래중">거래중</option>
                    </select>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="padding-bottom: 10px;">
                <div style="font-size: 12px; color: gray; display: block; flex: auto;">
                    디지털/가전 3시간전
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="padding: 10px 0;">
                <div>
                    가격제안불가능
                </div>
                <div>
                    <b>30,000원</b>
                </div>
            </td>
        </tr>

        <tr>
            <td colspan="3" style="padding: 20px 0;">실사용횟수는 10회 미만입니다. 생활기스 있어요~</td>
        </tr>

        <tr>
            <td colspan="3" style="padding: 10px 0; font-size: 14px;">
                관심 8 조회 339
            </td>
        </tr>
    </table>

    <div class="product_update_cover">
        <div class="product_update">
            <a href="#">끌어올리기</a> 
        </div>
        <div class="product_update">
            <a href="#">수정</a> <a href="#">삭제</a> <a href="#">신고</a>
        </div>
    </div>

    <div class="product_sale_detail_btn_cover">
        <div class="product_sale_detail_btn">
        목록
        </div>
    </div>  



    <table id="comment_area">
        <tr>
            <td colspan="4" style="font-size: 26px;"><b>댓글</b></td>
        </tr>
        <tr>
            <td colspan="3" style="padding: 30px 0;">
            <input type="text" class="underline" placeholder="댓글 내용"/>
            </td>
            <td class="comment_write_btn_td">
                <div class="comment_write_btn">
                    작성
                </div>
            </td>
        </tr>

        <tr>
            <td rowspan="2" class="comment_profile">
                <img class="comment_profile" src="/photo/dog2.jpg"/>
            </td>
            <td class="comment_writer_id" colspan="2">
                jujuju 2시간전
            </td>
            <td rowspan="2" class="comment_update_btn">
                <a href="#">수정</a> <a href="#">삭제</a> <a href="#">신고</a>
            </td>
        </tr>
        <tr>
           <td class="comment_content" colspan="2">이거제가살게요!<span class="cocoment_write_btn" onclick="cocoment_write_input(1)"> 답글</span></td> 
        </tr>
        <tr id="cocoment_write_1" style="display: none;">
            <td></td>
            <td colspan="2">
                <input type="text" class="underline" placeholder="답글 내용"/>
            </td>
            <td class="comment_write_btn_td">
                <div class="comment_write_btn">
                작성
                </div>
            </td>
        </tr>
        <tr>
            <td></td>
            <td colspan="3">
                <p class="cocoment_btn"><i class="fas fa-sort-down"></i>답글 5개 보기</p>
            </td>
         </tr>


         <tr>
             <td></td>
             <td rowspan="2" class="comment_profile">
                 <img class="comment_profile" src="/photo/dog2.jpg"/>
             </td>
             <td class="comment_writer_id">jojojo 1시간전</td>
             <td rowspan="2" class="comment_update_btn">
                <a href="#">수정</a> <a href="#">삭제</a> <a href="#">신고</a>
            </td>
         </tr>
         <tr>
             <td></td>
             <td class="comment_content">네 쪽지드릴게요</td>
         </tr>


         <tr>
            <td></td>
            <td rowspan="2" class="comment_profile">
                <img class="comment_profile" src="/photo/dog2.jpg"/>
            </td>
            <td class="comment_writer_id">jojojo 1시간전</td>
            <td rowspan="2" class="comment_update_btn">
               <a href="#">수정</a> <a href="#">삭제</a> <a href="#">신고</a>
           </td>
        </tr>
        <tr>
            <td></td>
            <td class="comment_content">네 쪽지드릴게요</td>
        </tr>


        <tr>
            <td rowspan="2" class="comment_profile">
                <img class="comment_profile" src="/photo/dog2.jpg"/>
            </td>
            <td class="comment_writer_id" colspan="2">
                jujuju 2시간전
            </td>
            <td rowspan="2" class="comment_update_btn">
                <a href="#">수정</a> <a href="#">삭제</a> <a href="#">신고</a>
            </td>
        </tr>
        <tr>
           <td class="comment_content" colspan="2">이거제가살게요! <span class="cocoment_write_btn" onclick="cocoment_write_input(2)"> 답글</span></td> 
        </tr>
        <tr id="cocoment_write_2" style="display: none;">
            <td></td>
            <td colspan="2">
                <input type="text" class="underline" placeholder="답글 내용"/>
            </td>
            <td class="comment_write_btn_td">
                <div class="comment_write_btn">
                작성
                </div>
            </td>
        </tr>
        <tr>
            <td></td>
            <td colspan="3">
                <p class="cocoment_btn"><i class="fas fa-sort-down"></i>답글 5개 보기</p>
            </td>
         </tr>
    </table>

</body>

<script>
	jQuery.noConflict();
    $(".trade_state_select_box").select2();

    function value2(elem,e,div) {
        if(e = '거래중'){
            elem.innerHTML="<option value='거래완료'>거래완료</option><option value='거래취소'>거래취소</option>";
        }else if(e = '거래완료'){
            div.innerHTML = "거래완료";
            elem.remove();
        }
        else if(e = '거래취소'){
            elem.innerHTML="<option value='판매중'>판매중</option><option value='거래중'>거래중</option>";
        }
    }
    

    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");

        if (n > slides.length) {slideIndex = 1}
        if (n < 1) {slideIndex = slides.length}
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }

        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }

        slides[slideIndex-1].style.display = "block";
        dots[slideIndex-1].className += " active";
    }

    function cocoment_write_input(num){
        console.log(num);
        var display = $('#cocoment_write_'+num).css('display');
        if(display == 'table-row'){
            $("#cocoment_write_"+num).css({'display':'none'});
        }else{
            $("#cocoment_write_"+num).css({'display':''});
        }
    }
</script>