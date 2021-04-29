<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>토끼마켓</title>
    <script  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
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
            height: 70%
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
        
        .location{
        	 margin-left: 8%;
        	 color: #F79646;
        	 font-weight: 500;
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
        <c:if test="${sessionScope.loginId ne null}">
        	 <div class="write_area" onclick="writeForm()">
            	글 올리기
            </div>
        </c:if>
           
        </div>
		
		<div class="location">${location}
		</div>
		
        <div id="product_list" class="list_start">
        </div>
        
		<!-- 플러그인 사용 (부트스트랩 사용할때는 지정해둔 이름 써야함)-->
		<div class="container">
			<nav aria-label="page navigation" style="text-align: center">
				<ul class="pagination" id="pagination"></ul>
			</nav>
		</div>
		<!-- 플러그인 사용  -->
       	
    </div>
</body>
<script>
	jQuery.noConflict();

	var showPage = 1;
	listCall(showPage);

	var msg = '${msg}';
	if(msg != ""){
		alert(msg);
	}
	
	function writeForm(){
		location.href="/sale/writeForm";
	}
	
	
	
	function listCall(reqPage){
		var reqUrl = "/sale/main/"+reqPage;
		
		$.ajax({
			url:reqUrl
			,type: 'GET'
			,data:{}
			,success:function(data){
				showPage = data.currPage;
				listPrint(data.list);
				
				$('#pagination').twbsPagination({
					startPage:data.currPage, //들어가는 옵션들 - 시작페이지
					totalPages:data.range, //생성 가능 최대 페이지 수
					visiblePages:10,//몇개의 페이지를 보여주겠는가? 1~5까지
					onPageClick:function(evt,page){ //각 페이지를 눌렀을 경우
						console.log(evt);
						console.log(page);
						listCall(page);
					}
				});
			},
			error: function(error){
				console.log(error);
			}
		});
	}
	
	function listPrint(list){
		var content = "";
		for(var i = 0; i<list.length; i++){
			content += "<div class='list_detail'>";
			if(list[i].code_num == 3001){
			content += "<div class='sale_state_1'>";
				content += "판매중";
			}else if(list[i].code_num == 3002){
				content += "<div class='sale_state_2'>";				
				content += "거래중";
			}
			content += "</div>";
			content += "<a href='#''>"
			content += "<img src='/saleFile/"+list[i].saleFileDto.newFileName+"'/>"
			content += "<p>"+list[i].sale_subject+"</p>"
			content += "<p>"+list[i].price+"원</p>"
			content += "<p>"+list[i].reg_date+"</p>"
			content += "<p>관심 "+ list[i].wishCnt +"  조회수 "+ list[i].bHit+"</p>"
			content += "</a>"
			content += "</div>"
		}
		$('#product_list').html(content);
	}
</script>
</html>