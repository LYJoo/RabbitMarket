<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>토끼마켓 물건 올리기</title>
    <link rel="stylesheet" type="text/css" href="resources/css/select2.css"/>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="resources/js/select2.js" charset="utf-8"></script>
    <script src="https://kit.fontawesome.com/abf52b8f21.js"></script>
	<style>
    table {
        width: 80%;
        font-size: 13px;
        margin: auto;
    }
    
    table, td, th {
        border-top: 1px solid lightgray;
        border-radius: 1px solid lightgray;
        border-collapse: collapse;
        padding: 10px;
        font-size: 15px;
    }
    input[type='text']{
        width: 100%;
        height: 40px;
        font-size: 15px;
    }
    textarea{
        width: 100%;
        height: 300px;
        font-size: 15px;
        resize: none;
        border: none;
        outline: none;
    }
    .fas{
        font-size: 40px;
        color: #F79646;
    }
    .far{
        cursor: pointer;
        font-size: 30px;
    }
    .file_cover{
        width: 100%;
        text-align: center;
    }
    #seller_location{
        width: 100%;
        cursor: default;
    }
    .product_check{
        float: left;
    }
    .check_mean{
        padding-top: 6px;
        padding-left: 40px;
        font-size: 15px;
    }
    .chosen{
        height: 40px;
    }
    .productSelectBox{
        width: 80%;
        float: right;
    }

    input.underline {
        border-left-width:0;
        border-right-width:0;
        border-top-width:0;
        border-bottom-width:0;
        outline: none;
    }

    .product_sale_write_btn_cover{
        width: 100%;
        height: 100px;
        padding: 10px;
        text-align: center;
        margin: 10px;
    }

    .product_sale_write_btn{
        width: 70px;
        background-color: #F79646;
        padding: 7px;
        border-radius: 3px;
        cursor: pointer;
        color: white;
        font-weight: 600;
        text-align: center;
        margin: 30px;
        display: inline-block;
    }

    .location_search_btn{
        width: 45px;
        background-color: #F79646;
        padding: 7px;
        border-radius: 3px;
        cursor: pointer;
        color: white;
        font-weight: 600;
        text-align: center;
        float: left;
    }

    .file_upload_btn{
        width: 70px;
        border:1px solid #F79646;
        cursor: pointer;
        padding: 5px 0px;
        margin: 10px;
        display: inline-block;
        clear: left;
    }

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
        padding-top: 30px;
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

    .text {
        color: #f2f2f2;
        font-size: 15px;
        padding: 8px 12px;
        position: absolute;
        bottom: 8px;
        width: 100%;
        text-align: center;
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

    .fade {
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
	</style>
</head>
<body>
	<jsp:include page="../include/topNavigation.jsp"></jsp:include>
	
    <div class="slideshow-container">

	    <div class="mySlides fade">
	      <img src="/photo/16187543239120.jpg" style="width:100%">
	      <div class="text">사진1</div>
	    </div>
	    
	    <div class="mySlides fade">
	      <img src="/photo/16187543239141.jpg" style="width:100%">
	      <div class="text">사진2</div>
	    </div>
	    
	    <div class="mySlides fade">
	      <img src="/photo/dog2.jpg" style="width:100%">
	      <div class="text">사진3</div>
	    </div>
	
	    <div class="mySlides fade">
	        <img src="/photo/dog2.jpg" style="width:100%">
	        <div class="text">사진4</div>
	      </div>
	
	      <div class="mySlides fade">
	        <img src="/photo/dog2.jpg" style="width:100%">
	        <div class="text">사진5</div>
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
	
	         
	    <div class="file_cover">
	        <div>
	        	<input type="file" id="product_file" multiple hidden/>
	        </div>
	        <label for="product_file">
		        <div class="file_upload_btn">
		            <div>
		                <i class="fas fa-camera"></i>
		            </div>
		            <div>
		                <span>0/5</span>
		            </div>
		        </div>
	        </label>
    	</div>

    <table>
        <tr>
            <td colspan="2">
                <input type="text" class="underline" placeholder="글 제목"/>
            </td>
            <td style="width: 30%;">
                <select name="categoryBox" id="categoryBox" class="productSelectBox">
                    <option value="디지털/가전">카테고리선택</option>
                    <option value="디지털/가전">디지털/가전</option>
                    <option value="가구/인테리어">가구/인테리어</option>
                    <option value="유아동/유아도서">유아동/유아도서</option>
                    <option value="생활/가공식품">생활/가공식품</option>
                    <option value="스포츠/레저">스포츠/레저</option>
                    <option value="여성잡화">여성잡화</option>
                    <option value="여성의류">여성의류</option>
                    <option value="남성패션/잡화">남성패션/잡화</option>
                    <option value="게임/취미">게임/취미</option>
                    <option value="뷰티/미용">뷰티/미용</option>
                    <option value="반려동물용품">반려동물용품</option>
                    <option value="도서/티켓/음반">도서/티켓/음반</option>
                    <option value="식물">식물</option>
                    <option value="기타중고물품">기타중고물품</option>
                </select>

            </td>
        </tr>
            
        <tr>
            <td colspan="3">
                <input type="text" class="underline" placeholder="가격"/>
            </td>
        </tr>

        <tr>
            <td colspan="3">
                <textarea placeholder="내용"></textarea>
            </td>
        </tr>

        <tr>
            <td>
                <input id="seller_location" class="underline" type="text" placeholder="판매위치(선택한 위치의/시/군/구로 설정)" readonly/>
            </td>
            <td style="width: 40%;">
                <div class="location_search_btn">
                    검색
                </div>
            </td>
            <td>

            </td>
        </tr>

        <tr>
            <td colspan="3">
                <input type="text" class="underline" placeholder="검색 키워드(1개 입력가능)"/>
            </td>
        </tr>
        <tr>
            <td>
                <div class="product_check">
                    <i class="far fa-check-circle"></i>
                </div>
                <div class="check_mean">
                    가격제안불가
                </div>
            </td>
            <td >
                <div class="product_check">
                    <i class="far fa-check-circle"></i>
                </div>
                <div class="check_mean">
                    미성년자거래불가
                </div>
            </td>
            <td>
            </td>
        </tr>

    </table>

    <div class="product_sale_write_btn_cover">
        <div class="product_sale_write_btn">
        저장
        </div>
        <div class="product_sale_write_btn">
        취소
        </div>
    </div>  

</body>

<script>
	jQuery.noConflict();
    $(".productSelectBox").select2();
    
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

</script>

</html>