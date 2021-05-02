<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>토끼마켓 물건 올리기</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/select2.css"/>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/resources/js/select2.js" charset="utf-8"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
        font-size: 13px;
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
    
    .cover{
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

    .text {
        color: #f2f2f2;
        font-size: 15px;
        padding: 8px 12px;
        position: absolute;
        bottom: 0px;
        width: 100%;
        text-align: center;
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
	
	.file_del_btn{
		width: 45px;
        background-color: #F79646;
        padding: 1px 7px;
        border-radius: 3px;
        cursor: pointer;
        color: white;
        font-weight: 600;
        text-align: center;
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
	<div class="cover">
		<div class="slideshow-container">
		</div>
		<div class="next_prev_btn">
		</div>
	</div>
	<br>
	    
    <div class="dot-slide" style="text-align:center"> 
    </div>
	
	         
	    <div class="file_cover">
        <div>
        <input type="file" name="sale_file" id="product_file" onchange="fileUpload()" multiple hidden/>
        </div>
        <label for="product_file">
        <div class="file_upload_btn">
            <div>
                <i class="fas fa-camera"></i>
            </div>
            <div class="fileCnt">
                <span>0/5</span>
            </div>
        </div>
        </label>
    </div>

    <table>
        <tr>
            <td colspan="2">
                <input type="text" id="sale_subject" name="sale_content" class="underline" placeholder="글 제목"/>
            </td>
            <td style="width: 30%;">
                <select name="s_category_idx" id="s_category_idx" class="productSelectBox">
                    <option value="default">카테고리 선택</option>
                    <c:forEach items="${saleCategory}" var="saleCategory">
	                    <option value="${saleCategory.s_category_idx}">${saleCategory.s_category_name}</option>
                    </c:forEach>
                </select>

            </td>
        </tr>
            
        <tr>
            <td colspan="3">
                <input type="text" id="price" name="price" class="underline" placeholder="가격"/>
            </td>
        </tr>

        <tr>
            <td colspan="3">
                <textarea id="sale_content" name="sale_content" placeholder="내용"></textarea>
            </td>
        </tr>

        <tr>
            <td>
                <input id="sale_location" name="sale_location" class="underline" type="text" placeholder="판매위치(선택한 위치의/시/군/구로 설정)" readonly/>
            </td>
            <td style="width: 35%;">
                <div class="location_search_btn" onclick="getLocation()">
                    검색
                </div>
            </td>
            <td>

            </td>
        </tr>

        <tr>
            <td colspan="3">
                <input type="text" id="keyword" name="keyword" class="underline" placeholder="검색 키워드(1개 입력가능)"/>
            </td>
        </tr>
        <tr>
            <td>
                <div class="product_check">
                    <i class="far fa-check-circle" onclick="isNegotiationCheck(this)"></i>
                </div>
                <div class="check_mean">
                    가격제안불가
                </div>
            </td>
            <td >
                <div class="product_check">
                    <i class="far fa-check-circle" onclick="isMinorCheck(this)"></i>
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
        <div class="product_sale_write_btn" onclick="save()">
        저장
        </div>
        <div class="product_sale_write_btn" onclick="cancel()">
        취소
        </div>
    </div>  

</body>

<script>
	jQuery.noConflict();
    $(".productSelectBox").select2();
 
    var slideIndex = 1;

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

    var isNegotiation = true;
    var isMinor = true;
    
    function isNegotiationCheck(elem){
    	var fontColor = elem.style.color;
    	if(fontColor == ''){
    		isNegotiation = false;
    		elem.style.color='#F79646';
    	}else{
    		elem.style.color = '';
    		isNegotiation = true;
    	}
    }
    
    function isMinorCheck(elem){
    	var fontColor = elem.style.color;
    	if(fontColor == ''){
    		isMinor = false;
    		elem.style.color='#F79646';
    	}else{
    		elem.style.color = '';
    		isMinor = true;
    	}
    }
    
    
    function getLocation(){
    	 new daum.Postcode({
    	        oncomplete: function(data) {
    	        	var location = '';
    	        	location += data.sido+' ';
    	        	location += data.sigungu;
					document.getElementById('sale_location').value = location;
    	        }
    	    }).open();
    }
    
    var dotCnt = 0;
    var totalFileListSize = 0;
	var file_cnt = 0;
	function fileUpload(){
		var formData = new FormData();
		var inputFile = $('input[name="sale_file"]');
		var files = inputFile[0].files;
		var new_file_cnt = 0;
		
		for (var i = 0; i < files.length; i++) {
			var fileExt = files[i].name.substring(files[i].name.lastIndexOf('.'),files[i].name.length).toLowerCase();
			console.log(fileExt);
			
			if(fileExt == '.jpg' || fileExt == '.mp4'){
				new_file_cnt++;
				file_cnt++;
				if(file_cnt > 5){
					file_cnt -= new_file_cnt;
					console.log("현재 파일 갯수"+file_cnt);
					alert("파일은 5개까지만 등록 가능합니다.");
					return;
				}else{			
					formData.append('sale_file', files[i]);
				}
			}else{
				alert(".jpg, .png, .mp4 파일만 업로드 가능합니다.");
				return;
			}
		}
		
		$.ajax({			
			url: '/sale/fileUpload',
			type: 'POST',
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			data: formData,
			success: function(e){
				if(e.success == 1){
					console.log(e.saleFileList);
					drawFile(e.saleFileList);
				}else{
					alert("파일 업로드가 실패하였습니다. 잠시 후 다시 시도해주세요.")
				}
			},
			error: function(e){
				console.log(e);
			}
		});
	};
	
	function drawFile(saleFileList){
		var content = "";
		var dotContent = "";
		var btnContent = "";
		
		var fileListSize = Object.keys(saleFileList).length;
		var fileListKey = Object.keys(saleFileList)[0];
		var fileListValue = saleFileList[fileListKey];

		totalFileListSize =  totalFileListSize+fileListSize;
		
		for (var i = 0; i < fileListSize; i++) {
			dotCnt = dotCnt+1;
			var newFileName = Object.keys(saleFileList)[i];
			var oriFileName = saleFileList[Object.keys(saleFileList)[i]];
			var fileExt = newFileName.substring(newFileName.lastIndexOf('.'),newFileName.length);
			if(fileExt == '.mp4'){
				content += "<div class='mySlides fade "+newFileName+"'>";
				content += "<div id='"+newFileName+"' class='file_del_btn' onclick='delSaleFile(this," +dotCnt+ ")'>삭제</div>"
	      		content += "<video width='100%' controls>";
                content += "<source src='/saleFile/"+ newFileName +"' type='video/mp4'>";
            	content += "</video>";
	      		content += "<div class='text'>"+ oriFileName +"</div>";
	    		content += "</div>";
	    		dotContent += "<span id='"+dotCnt+"' class='dot' onclick='currentSlide(" + dotCnt + ")''></span>"
			}else{
				content += "<div class='mySlides fade "+newFileName+"'>";
				content += "<div id='"+newFileName+"' class='file_del_btn' onclick='delSaleFile(this,"+ dotCnt +")'>삭제</div>"
		        content += "<img src='/saleFile/"+ newFileName +"' style='width:100%''>";
		        content += "<div class='text'>"+oriFileName+"</div>";
		        content += "</div>";
		        dotContent += "<span id='"+dotCnt+"' class='dot' onclick='currentSlide("+ dotCnt +")''></span>"
			}
		}
		$('.slideshow-container').append(content);
		$('.dot-slide').append(dotContent);

		var isClassExist = $('.next_prev_btn a').hasClass('prev');
		console.log(isClassExist);
		if(isClassExist==false){
			btnContent += "<a class='prev' onclick='plusSlides(-1)'><i class='fas fa-chevron-left'></i></a>";
			btnContent += "<a class='next' onclick='plusSlides(1)'><i class='fas fa-chevron-right'></i></a>";
			$('.next_prev_btn').append(btnContent);
		}
		$('.fileCnt').html("<span>"+totalFileListSize+"/5</span>");
		showSlides(slideIndex);
	}
   
	
	function delSaleFile(elem,dotNum){
		console.log(elem);
		var delFileName = elem.id;
		console.log(delFileName);
		
		//1. 실제 파일 삭제 요청
		$.ajax({
			url: '/sale/delFile'
			,type: 'get'
			,data:{"delFileName": delFileName}
			,dataType: 'json'
			,success: function(d){
				if(d.success == 1){
					file_cnt = file_cnt-1;
					dotCnt = dotCnt-1;
					totalFileListSize = totalFileListSize-1;
					
					if(dotNum == 1 && 1==totalFileListSize){
						$('.prev').remove();
						$('.next').remove();
					}
					
					var dotNewContent = "";
					for (var i = 1; i <= totalFileListSize; i++) {
						dotNewContent += "<span id='"+i+"' class='dot' onclick='currentSlide("+ i +")''></span>"
					}
					$('.dot-slide').html(dotNewContent);
					$('.fileCnt').html("<span>"+totalFileListSize+"/5</span>");
					$(elem).parent().remove();
					showSlides(slideIndex);
				}else{
					alert('삭제에 실패했습니다. 잠시 후 다시 시도해주세요.');
				}
			}
			,error: function(e){
				console.log(e);
			}
		});
	}
	
	function save(){
		var seller_id = "${sessionScope.loginId}";
		var sale_subject = $('#sale_subject').val();
		var s_category_idx = $('#s_category_idx').val();
		//숫자가 아니면 에러 & , 넣기
		var price = $('#price').val();
		//개행문자 처리
		var sale_content = $('#sale_content').val();
		var sale_location = $('#sale_location').val();
		var keyword = $('#keyword').val();
		
		console.log(seller_id + sale_subject + s_category_idx + price + sale_content + sale_location + keyword);
	
		if(totalFileListSize == 0 ){
			alert('사진이나 동영상 파일을 첨부해주세요.');
		}else if(sale_content == ""){
			alert("제목을 입력하세요.");
		}else if(s_category_idx == "default"){
			alert('카테고리를 선택하세요');
		}else if(price == ""){
			alert('가격을 입력하세요.');
		}else if(sale_content == ""){
			alert('내용을 입력하세요.');
		}else if(sale_location == ""){
			alert('판매위치를 설정하세요.');
		}else if(keyword == ""){
			alert('검색키워드를 입력하세요.');
		}else{
			$.ajax({
				url: '/sale/save'
				,type: 'POST'
				,data:{
					"seller_id" : seller_id
					,"sale_subject" : sale_subject
					,"s_category_idx": s_category_idx
					,"price": price
					,"sale_content": sale_content
					,"sale_location" : sale_location
					,"keyword" : keyword
					,"negotiation" : isNegotiation
					,"minor" : isMinor
				}
				,dataType: 'json'
				,success: function(d){
					if(d.success == 1){
						alert('판매글 작성 성공');
						location.href="/sale/main";
					}else{
						alert('판매글 작성에 실패했습니다. 잠시 후 다시 시도해주세요.');
					}
				}
				,error: function(e){
					console.log(e);
				}
			});
		}
		
	}
	
	function cancel(){
		var cancelCheck = confirm('정말 취소하시겠습니까?');
		if(cancelCheck){
			location.href="/sale/main";
		}
	}
	
</script>

</html>