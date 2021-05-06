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
      	height: 8px;
        width: 8px;
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

    .sale_state_1{
            background-color: #F79646;
            float: right;
            padding: 5px;
            border-radius: 3px;
            color: white;
            font-size: small;
            margin-bottom: 3px;
        }
        
        .sale_state_2{
            background-color: white;
            float: right;
            padding: 3px 5px;
            border: 1px solid #F79646;
            border-radius: 3px;
            color: #F79646;
            font-size: small;
            margin-bottom: 3px;
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
        height: 60px;
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
		<c:forEach items="${fileList}" var="file">
			<div class="mySlides fade1">
        		<c:if test="${detail.code_num eq 3001}">
        			<div class="sale_state_1">
        			판매중
        			</div>
        		</c:if>
        		<c:if test="${detail.code_num eq 3002}">
        			<div class="sale_state_2">
        			거래중
        			</div>
        		</c:if>
        		<c:if test="${detail.code_num eq 3003}">
        			<div class="sale_state_3">
        			거래완료
        			</div>
        		</c:if>
        	
        		<c:if test="${file.ext eq 'jpg'}">
        			<img src="/saleFile/${file.newFileName}" style="width:100%">
        		</c:if>
        		<c:if test="${file.ext eq 'mp4'}">
	                <video width="100%"controls>
	                    <source src="/saleFile/${file.newFileName}" type="video/mp4">
	                </video>
        		</c:if>
        	</div>
		</c:forEach>
        
    	<c:if test="${detail.fileCnt ne 1}">
    		<a class="prev" onclick="plusSlides(-1)"><i class="fas fa-chevron-left"></i></a>
        	<a class="next" onclick="plusSlides(1)"><i class="fas fa-chevron-right"></i></a>
    	</c:if>
        
    </div>
    <br>
	
	
    <div style="text-align:center">
    	<c:if test="${detail.fileCnt ne 1}">
    	<c:forEach begin="1" end="${detail.fileCnt}" var="num">
    		<span class="dot" onclick='currentSlide(+${num}+)'></span> 
    	</c:forEach>
    	</c:if>
    </div>
    
    <table id="product_content_area">
        <tr>
            <td rowspan="2" style="width: 100px;">
            	<c:if test="${detail.profileFileDto.newFileName ne null}">
            		<img src="/myProfile/${detail.profileFileDto.newFileName}" style="width: 100px; height: 100px;"/>
            	</c:if>
            	<c:if test="${detail.profileFileDto.newFileName eq null}">
            		<img src="/resources/img/default_profile.png" style="width: 100px; height: 100px;"/>
            	</c:if>
            </td>
            <td style="padding-top: 15px;">
                ${detail.seller_id}
                <img src="/resources/img/message_orange.png" style="width: 20px; cursor: pointer;"/>
            </td>
            <td rowspan="2"  style="width: 50%;">
                <p style="margin: 0;">매너지수</p>
                <div style="width: 100%; text-align: center;">
                    <p style="font-size: 10px; margin: 0;">첫매너지수 50%</p>
                    <i class="fas fa-long-arrow-alt-down"></i>
                </div>
                <div class="progress">
                    <div class="progress-bar bg-secondary" style="width: ${detail.memberDto.manner_percent}%;">${detail.memberDto.manner_percent}%</div>
                </div>
            </td>
        </tr>
        <tr>
            <td style="padding-bottom: 15px;">${detail.sale_location}</td>
        </tr>

        <tr>
            <td colspan="2" style="padding: 10px 0 0 0">
                <div style="display: flex; align-items: center;">
                    <div style="padding-right: 5px;">${detail.sale_subject}</div>
                    <div>
                    <c:if test="${sessionScope.loginId ne null && sessionScope.loginId ne detail.seller_id}">
	                    <c:if test="${chWish eq 0}"> <!-- 위시리스트에 전혀 존재하지 않는상태 / 빈하트-->
	                    	<i class="far fa-heart" onclick="wishPlus1(${detail.product_idx})"></i>
	                    </c:if>
	                    <c:if test="${chWish eq 1 && chWishDel eq 1}"> <!-- 위시리스트에 존재하지만 삭제된 상태  / 빈하트-->
	                    	<i class="far fa-heart" onclick="wishPlus2(${detail.product_idx})"></i>
	                    </c:if>
	                    <c:if test="${chWish eq 1 && chWishDel eq 0}"> <!-- 위시리스트에 존재하고 삭제되지 않은 상태 / 색칠 하트 -->
	                    	<i class="fas fa-heart" onclick="wishMinus(${detail.product_idx})"></i>
	                    </c:if>
                    </c:if>
                    </div>
                </div>
                
            </td>
            <td rowspan="2" style="text-align: right;">
                <div class="select_box_cover">
                	<c:if test="${detail.seller_id eq sessionScope.loginId}">
	                	<c:if test="${detail.code_num eq 3001}">
	                		<select id="trade_state_select_box1" class="trade_state_select_box" onchange="value2(this.value,${detail.product_idx})">
		                        <option value="판매중">판매중</option>
		                        <option value="거래중">거래중</option>
		                    </select>
	                	</c:if>
                		<c:if test="${detail.code_num eq 3002}">
	                		<select id="trade_state_select_box2" class="trade_state_select_box" onchange="value3(this.value,${detail.product_idx})">
		                        <option value="거래중">거래중</option>
		                        <option value="거래취소">거래취소</option>
		                        <option value="거래완료">거래완료</option>
		                    </select>
	                	</c:if>
	                	<c:if test="${detail.code_num eq 3003}">	                	
	                		<b>거래완료</b>
	                	</c:if>
                	</c:if>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="padding-bottom: 10px;">
                <div style="font-size: 12px; color: gray; display: block; flex: auto;">
                    	<c:if test="${detail.s_category_idx eq 1}">
                    	 디지털/가전  ${detail.reg_date}
                    	</c:if>
                    	<c:if test="${detail.s_category_idx eq 2}">
                    	 가구/인테리어  ${detail.reg_date}
                    	</c:if>
                    	<c:if test="${detail.s_category_idx eq 3}">
                    	 유아동/유아도서  ${detail.reg_date}
                    	</c:if>
                    	<c:if test="${detail.s_category_idx eq 4}">
                    	 생활/가공식품  ${detail.reg_date}
                    	</c:if>
                    	<c:if test="${detail.s_category_idx eq 5}">
                    	 스포츠/레저  ${detail.reg_date}
                    	</c:if>
                    	<c:if test="${detail.s_category_idx eq 6}">
                    	 여성잡화  ${detail.reg_date}
                    	</c:if>
                    	<c:if test="${detail.s_category_idx eq 7}">
                    	 여성의류  ${detail.reg_date}
                    	</c:if>
                    	<c:if test="${detail.s_category_idx eq 8}">
                    	 남성패션/잡화  ${detail.reg_date}
                    	</c:if>
                    	<c:if test="${detail.s_category_idx eq 9}">
                    	 게임/취미  ${detail.reg_date}
                    	</c:if>
                    	<c:if test="${detail.s_category_idx eq 10}">
                    	 뷰티/미용  ${detail.reg_date}
                    	</c:if>
                    	<c:if test="${detail.s_category_idx eq 11}">
                    	 반려동물용품  ${detail.reg_date}
                    	</c:if>
                    	<c:if test="${detail.s_category_idx eq 12}">
                    	 도서/티켓/음반  ${detail.reg_date}
                    	</c:if>
                    	<c:if test="${detail.s_category_idx eq 13}">
                    	 식물  ${detail.reg_date}
                    	</c:if>
                    	<c:if test="${detail.s_category_idx eq 14}">
                    	 기타중고물품  ${detail.reg_date}
                    	</c:if>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="padding: 10px 0;">
                <div>
                    <c:if test="${detail.negotiation eq false}">
                    	가격제안불가능
                    </c:if>
                    <c:if test="${detail.negotiation eq true}">
                    	가격제안가능
                    </c:if>
                </div>
                <div>
                    <b>${detail.price}원</b>
                </div>
            </td>
        </tr>

        <tr>
            <td colspan="3" style="padding: 20px 0;">${detail.sale_content}</td>
        </tr>

        <tr>
            <td colspan="3" style="padding: 10px 0; font-size: 14px;">
                관심 ${detail.wishCnt} 조회 ${detail.bHit}
            </td>
        </tr>
    </table>

    <div class="product_update_cover">
        <div class="product_update">
        	<c:if test="${detail.seller_id eq sessionScope.loginId and detail.pull_up eq false}">
        		
        	</c:if>
        </div>
        <div class="product_update">
        	<c:if test="${detail.seller_id eq sessionScope.loginId}">
        		<a style="cursor: pointer;" onclick="pDel(${detail.product_idx})">삭제</a>
        	</c:if>
        	<c:if test="${detail.seller_id ne sessionScope.loginId && sessionScope.loginId ne null}">
        		 <a style="cursor: pointer;"  onclick="report(${detail.product_idx},1001,'${detail.seller_id}')">신고</a>
        	</c:if>
        </div>
    </div>

    <div class="product_sale_detail_btn_cover">
        <div class="product_sale_detail_btn" onclick="location.href='/sale/main'">
        목록
        </div>
    </div>  



    <table id="comment_area">
        <tr>
            <td colspan="4" style="font-size: 26px;"><b>댓글</b></td>
        </tr>
        <tr>
            <td colspan="3" style="padding: 30px 0;">
            <input id="comment_content" type="text" class="underline" name="comment_content" placeholder="댓글 내용"/>
            </td>
            <td class="comment_write_btn_td">
                <div class="comment_write_btn" onclick="commentWrite(${detail.product_idx})">
                    작성
                </div>
            </td>
        </tr>
		
		<c:forEach items="${commentList}" var="list">
			<tr>
            <td rowspan="2" class="comment_profile">
            	<c:if test="${list.profileFileDto.newFileName ne null}">
                	<img class="comment_profile" src="/myProfile/${list.profileFileDto.newFileName}"/>
            	</c:if>
            	<c:if test="${list.profileFileDto.newFileName eq null}">
                	<img class="comment_profile" src="/resources/img/default_profile.png"/>
            	</c:if>
            </td>
            <td class="comment_writer_id" colspan="2">
                ${list.member_id} ${list.reg_date}
            </td>
            <td rowspan="2" class="comment_update_btn">
	        	<c:if test="${detail.seller_id eq sessionScope.loginId}">
	        		<a style="cursor: pointer;" onclick="cUpdateForm(${list.comment_idx})">수정</a> |
	        		<a style="cursor: pointer;" onclick="cDel(${list.comment_idx},${detail.product_idx})">삭제</a>
	        	</c:if>
	        	<c:if test="${detail.seller_id ne sessionScope.loginId && sessionScope.loginId ne null}">
	        		 <a style="cursor: pointer;"  onclick="report(${list.comment_idx},1002,'${list.member_id}')">신고</a>
	        	</c:if>
            </td>
        </tr>
        <tr>
           <td class="comment_content" colspan="2">
           		<span id="comment_content_value_${list.comment_idx}">${list.comment_content}</span>
           		<!-- 수정폼-->
           		<span id="comment_updateForm_${list.comment_idx}" style="align-items: center;display:none;">
           			<input type="text" id="comment_content_input_${list.comment_idx}"
           				name="comment_content" value="${list.comment_content}" 
           				style="width:80%;border:none;background-color:lightgray;"/>
           			&nbsp;
           			<a style="cursor: pointer;" onclick="cUpdate(${list.comment_idx},${detail.product_idx})">수정하기</a>
           		</span>
           		<div class="cocoment_write_btn" onclick="cocoment_write_input(${list.comment_idx})"> 답글</div>
           </td> 
        </tr>
        <tr id="cocoment_write_${list.comment_idx}" style="display: none;">
            <td></td>
            <td colspan="2">
                <input id="cocomment_content_${list.comment_idx}" type="text" class="underline" name="cocomment_content" placeholder="답글 내용"/>
            </td>
            <td class="comment_write_btn_td">
                <div  id="comment_write_btn_${list.comment_idx}"  class="comment_write_btn" onclick="cocommentWrite(${detail.product_idx},${list.comment_idx})">
               	 작성
                </div>
            </td>
        </tr>
        <tr id="cocommentList_${list.comment_idx}">
            <td></td>
            <td colspan="3">
                <p id="cocoment_btn_${list.comment_idx}" class="cocoment_btn" onclick="cocommentList(${list.comment_idx})">
                	<c:if test="${list.cocommentCnt ne 0}">
                	<i class="fas fa-sort-down"></i>
                		답글 ${list.cocommentCnt}개 보기
                	</c:if>
                </p>
                <p style="display: none" id="unCocoment_btn_${list.comment_idx}" class="cocoment_btn" onclick="cocommentUnList(${list.comment_idx},${list.cocommentCnt})">
                	<c:if test="${list.cocommentCnt ne 0}">
                	<i class="fas fa-sort-up"></i>
                		답글 ${list.cocommentCnt}개 숨기기
                	</c:if>
                </p>
            </td>
         </tr>
		</c:forEach>
    </table>
</body>
<script>
	jQuery.noConflict();
    $(".trade_state_select_box").select2();
	
    var msg = "${msg}";
    if(msg != ""){
    	alert(msg);
    }
    
    function value2(e, idx) {
    	console.log(e);
        if(e == '거래중'){
        	window.open('/sale/chTradeStateForm?idx='+idx,'chTradeStateForm','width=550, height=550, top=100, left=500');
        }
    }
    
    function value3(e,idx) {
    	if(e == '거래취소'){
    		$.ajax({
    			url:'/sale/tradeCancel'
    			,type: 'GET'
    			,data:{"product_idx": idx}
    			,success:function(data){
    				var ok = confirm(data.buyer_id+'님과의 거래를 취소하시겠습니까?');
    				if(ok){
    					window.open('/sale/tradeCancelReason?product_idx='+idx,'tradeCancel','width=550, height=550, top=100, left=500');
    				}else{
    					window.location.reload();
    				}
    			},
    			error: function(error){
    				console.log(error);
    			}
    		});
        }
        else if(e == '거래완료'){
        	$.ajax({
    			url:'/sale/tradeEnd'
    			,type: 'POST'
    			,data:{"product_idx": idx}
    			,success:function(data){
    				var msg = data.msg;
    				if(msg != ""){
    					alert(msg);
    					window.location.reload();
    				}
    				if(data.success == 1){
    					var trade_idx = data.trade_idx;
    					alert('거래가 완료되었습니다.');
    					window.open('/sale/directBuyerEstimation?product_idx='+idx+'&trade_idx='+trade_idx,'directBuyerEstimation','width=550, height=700, top=100, left=500');
    					window.location.reload();
    				}
    			},
    			error: function(error){
    				console.log(error);
    			}
    		});
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
    
    function cocommentList(num){
    	
    	$.ajax({
			url:'/sale/cocommentList'
			,type: 'GET'
			,data:{"comment_idx": num}
			,success:function(data){
				console.log(data.list);
				drawCocomment(data.list);
			},
			error: function(error){
				console.log(error);
			}
		});
    }
    
    function drawCocomment(data){
    	loginId = "${sessionScope.loginId}";
    	for (var i = 0; i < data.length; i++) {
    		var content = "";
        	
        	content += "<tr class='deleteCocomment'>";
    		content += "<td></td>";
        	content += "<td rowspan='2' class='comment_profile'>";
        	if(data[i].profileFileDto == null){
        		content += "<img class='comment_profile' src='/resources/img/default_profile.png'>";
        	}else if(data[i].profileFileDto != null){
        		content += "<img class='comment_profile' src='/myProfile/"+data[i].profileFileDto.newFileName+"'/>";
        	}
        	content += "</td>";
        	content += "<td class='comment_writer_id'>"+data[i].member_id +"  "+ data[i].reg_date+"</td>";
        	content += "<td rowspan='2' class='comment_update_btn'>";
        	if(data[i].member_id == loginId){
        		content += "<a style='cursor: pointer;' onclick='ccUpdateForm("+data[i].cocomment_idx+","+${detail.product_idx}+")'>수정</a> | ";
        		content += "<a style='cursor: pointer;' onclick='ccDel("+data[i].cocomment_idx+","+${detail.product_idx}+")'>삭제</a>";
        	}else if(data[i].member_id != loginId && loginId != null){
        		content += "<a style='cursor: pointer;'  onclick='cocoReport("+data[i].cocomment_idx+",1003)'>신고</a>";
        
        	}
        	content += "</td>";
        	content += "</tr>";
        	content += "<tr class='deleteCocomment'>";
        	content += "<td></td>";
        	content += "<td class='comment_content'><span id='cocomment_content_value_"+data[i].cocomment_idx+"'>"
        																		+data[i].cocomment_content+"</span>"
        						+"<span id='cocomment_updateForm_"+data[i].cocomment_idx+"' style='align-items:center;display:none;'>"
        						+"<input type='text' id='cocomment_content_input_"+data[i].cocomment_idx
        								+"' name='cocomment_content' value='"+data[i].cocomment_content
        								+"' style='width:80%;border:none;background-color:lightgray;'/>"
        								+"<a style='cursor: pointer;'  onclick='ccUpdate("+data[i].cocomment_idx+")'>수정하기</a>"
        						+"</span>"
        						+"</td>";
        	
        	
        	content += "</tr>";
        	
           	$('#cocommentList_'+data[i].comment_idx).after(content);
		}
    	$('#cocoment_btn_'+data[0].comment_idx).css({'display':'none'});
    	$('#unCocoment_btn_'+data[0].comment_idx).css({'display':''});	
    }
    
    function cocommentUnList(num, cnt){
    	console.log(cnt);
    	for (var i = 0; i < cnt*2; i++) {
    		$('#cocommentList_'+num).next().remove();
		}
    	$('#cocoment_btn_'+num).css({'display':''});
    	$('#unCocoment_btn_'+num).css({'display':'none'});	
    }
    
    function commentWrite(product_idx){
    	var chLogin = "${sessionScope.loginId}";
    	if(chLogin == ""){
    		alert('로그인해주세요.');
    		location.href='/sale/main';
    	}else{
	    	var comment_content = $('#comment_content').val();
	    	console.log(comment_content);
	    	   	$.ajax({
				url:'/sale/commentWrite'
				,type: 'POST'
				,data:{"product_idx" : product_idx,
					"comment_content": comment_content}
				,success:function(data){
					alert('댓글이 등록되었습니다.');
					location.href='/sale/detail?product_idx='+product_idx;
				},
				error: function(error){
					console.log(error);
				}
			});  	
    	}
    }
    
    function cocommentWrite(product_idx, comment_idx){
    	var chLogin = "${sessionScope.loginId}";
    	if(chLogin == ""){
    		alert('로그인해주세요.');
    		location.href='/sale/main';
    	}else{
	    	var cocomment_content = $('#cocomment_content_'+comment_idx).val();
	    	console.log(comment_content);
	    	   	$.ajax({
				url:'/sale/cocommentWrite'
				,type: 'POST'
				,data:{"comment_idx" : comment_idx,
					"cocomment_content": cocomment_content}
				,success:function(data){
					if(data.success == 1){
						alert('대댓글이 등록되었습니다.');
						location.href='/sale/detail?product_idx='+product_idx;
					}
				},
				error: function(error){
					console.log(error);
				}
			});  	
    	}
    }
    
    function report(idx, codeNum, target){
    	window.open('/sale/reportForm?idx='+idx+'&codeNum='+codeNum+'&target='+target,'report','width=500, height=500, top=300, left=500');
    }
    function cocoReport(idx, codeNum){
    	window.open('/sale/cocoReportForm?idx='+idx+'&codeNum='+codeNum,'cocoReport','width=500, height=500, top=300, left=500');
    }
    
    function pDel(idx){
    	location.href='/sale/pDel?idx='+idx;
    }
    
	function cDel(idx, product_idx){
		location.href='/sale/cDel?idx='+idx+'&product_idx='+product_idx;
    }
	
	function ccDel(idx, product_idx){
		location.href='/sale/ccDel?idx='+idx+'&product_idx='+product_idx;
    }
	
	function cUpdateForm(idx){
		$('#comment_content_value_'+idx).css({'display':'none'});
		$('#comment_updateForm_'+idx).css({'display':'flex'});
    }
	
	function cUpdate(idx){
		var comment_idx = idx;
		var comment_content = $('#comment_content_input_'+idx).val();
		
	   	$.ajax({
			url:'/sale/commentUpdate'
			,type: 'POST'
			,data:{"comment_idx" : comment_idx,
				"comment_content": comment_content}
			,success:function(data){
				if(data.success == 1){
					alert('댓글이 수정되었습니다.');
					$('#comment_content_value_'+idx).html(comment_content);
					$('#comment_content_value_'+idx).css({'display':''});
					$('#comment_updateForm_'+idx).css({'display':'none'});
				}
			},
			error: function(error){
				console.log(error);
			}
		});
		
    }
	
	//대댓글 수정
	function ccUpdateForm(idx){
		$('#cocomment_content_value_'+idx).css({'display':'none'});
		$('#cocomment_updateForm_'+idx).css({'display':'flex'});
    }
	
	function ccUpdate(idx){
		var cocomment_idx = idx;
		var cocomment_content = $('#cocomment_content_input_'+idx).val();
		console.log(cocomment_idx+"/"+cocomment_content);
		
	   	$.ajax({
			url:'/sale/cocommentUpdate'
			,type: 'POST'
			,data:{"cocomment_idx" : cocomment_idx,
				"cocomment_content": cocomment_content}
			,success:function(data){
				if(data.success == 1){
					alert('대댓글이 수정되었습니다.');
					$('#cocomment_content_value_'+idx).html(cocomment_content);
					$('#cocomment_content_value_'+idx).css({'display':''});
					$('#cocomment_updateForm_'+idx).css({'display':'none'});
				}
			},
			error: function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
		});
		
    }
	
	
	function wishPlus1(idx){ // 위시리스트에 전혀 존재하지 않는상태 / 빈하트
		location.href="/sale/wishPlus1?idx="+idx;
	}
	
	function wishPlus2(idx){ //위시리스트에 존재하지만 삭제된 상태  / 빈하트
		location.href="/sale/wishPlus2?idx="+idx;
	}
	
	function wishMinus(idx){ //위시리스트에 존재하고 삭제되지 않은 상태  / 색칠하트
		location.href="/sale/wishMinus?idx="+idx;
	}
</script>