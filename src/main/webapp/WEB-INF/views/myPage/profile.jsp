<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset='utf-8'>
    <title>Page Title</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- 반응형 디자인을 위한 css/js 라이브러리 -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>   
    <!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야 함) -->
    <script src="/resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/hwi_css.css">
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
            width: 650px;
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
            text-align: center;
            
        }
        table.type04 th {
            width: 100px;
            font-weight: bold;
            vertical-align: top;
            border-bottom: 1px solid #ccc;
            text-align: center;
        }
        table.type04 td {
            width: 100px;
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
            margin-top:30px;
            text-align: center;
        }
        
        #profile, #profile th, #profile td{
        	padding:10px 5px;
        }
        
        .profileList{
        	width:200px;
        	height: 100px;
        	display: inline-block;
        	border:1px solid #F79646;
        	margin:5px;
        	text-align: center;
        }
        .profileList td{
        	text-align: center;
        }
        .price{
        	font-size: 12px;
        
        }
        .subject{
        	font-weight: 600;
        }
        button{
        	text-align: center;
		    padding: 10px;
		    margin: 10px;
		    width: 100px;
		    height: 50px;
		    cursor: pointer;
		    font-size: 17px;
		    background-color: #F79646;
		    color: white;
		    font-weight: 600;
		    border: none;
        }
    </style>
</head>
<body>
	<jsp:include page="../include/topNavigation.jsp"></jsp:include>

	<div class="our_content_area">
    <div id="content">
        <table id="profile">
        <!-- 이부분 사진경로 설정 -->
        	<tr>
            	<td colspan="2">
            		<img src="${path }" alt="" style="width: 150px; height: 150px;">
	            	<c:set var="loginId" value="${sessionScope.loginId }"></c:set>
	            	<c:if test="${member.member_id ne loginId}">
	            		<c:if test="${isBlocking eq false }">
			            	<button onclick="location.href='./blockMember?member_id=${member.member_id}'">차단하기</button>            				            		
	            		</c:if>
	            		<c:if test="${isBlocking eq true }">
	            			<button onclick="location.href='./unblockMember?member_id=${member.member_id}'">차단해제</button>
	            		</c:if>
	            	</c:if>
            	</td>
            </tr>
            <tr>
            	<th>매너지수</th>
                <td>${member.manner_percent}</td>
            </tr>
            <tr>
            	<th>아이디</th>
                <td>${member.member_id}</td>
            </tr>
            <tr>
            	<th>주소</th>
                <td>${member.address}</td>
            </tr>
        </table>
    </div>


    <div id="msgContainer">
        <ul class="tabs">
            <li class="tab-link current" data-tab="tab-1">판매물품<hr class="tab-hr current"></li>
            <li class="tab-link" data-tab="tab-2">거래후기<hr class="tab-hr"></li>
        </ul>
        <div id="tab-1" class="tab-content current">
        	<table>
        		<tbody id="profileSaleList">
	 
        		</tbody>
		        <tr>
					<td colspan="1" id="paging">
						<!-- 플러그인 사용 -->
						<div class="container">
							<nav aria-label="page navigation" style="text-align:left;">
								<ul class = "pagination" id="sale_pagination"></ul>
							</nav>
						</div>
						<!-- 플러그인 사용 -->
					</td>
				</tr>
        	</table>
        </div>
        <div id="tab-2" class="tab-content">
            <table class="type04">
	            <thead>
	                <tr>
	                    <th>아이디</th>
	                    <th>후기내용</th>
	                    <th>작성일</th>
	                </tr>
                </thead>
                <tbody id="profileReviewList">
	                
                </tbody>
                <tr>
					<td colspan="3" id="paging">
						<!-- 플러그인 사용 -->
						<div class="container">
							<nav aria-label="page navigation" style="text-align:left;">
								<ul class = "pagination" id="review_pagination"></ul>
							</nav>
						</div>
						<!-- 플러그인 사용 -->
					</td>
				</tr>
			</table>
        </div>
    </div>
	</div>
</body>
<script>
	jQuery.noConflict();
	
	var msg = '${msg}';
	if(msg != ""){
		alert(msg);
	}
	
	listCall(1)
    $(document).ready(function(){
		
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');
	
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
	        $('.tab-hr').removeClass('current');
	
			$(this).addClass('current');
	
			$("#"+tab_id).addClass('current');
	        $(this).find('hr').addClass('current');
		});
	
	});
    
    function listCall(reqPage){
		$.ajax({
			url:'./profileList/${member.member_id}/'+reqPage,
			type:'GET',
			data:{},
			dataType:'JSON',
			success:function(data){
				console.log(data.profileSaleList);
				console.log(data.profileReviewList);
				printSaleList(data.profileSaleList);
				printReviewList(data.profileReviewList);
				//플러그인 사용
                $("#sale_pagination").twbsPagination({
                    startPage:data.currPage,//시작페이지
                    totalPages:data.rangeSale,//생성 가능 최대 페이지
                    visiblePages:5,//5개씩 보여 주겠다.(1~5)
                    onPageClick:function(evt, page){//각 페이지를 눌렀을 경우
                        listCall(page);
                    }
                });
                $("#review_pagination").twbsPagination({
                    startPage:data.currPage,//시작페이지
                    totalPages:data.rangeReview,//생성 가능 최대 페이지
                    visiblePages:5,//5개씩 보여 주겠다.(1~5)
                    onPageClick:function(evt, page){//각 페이지를 눌렀을 경우
                        listCall(page);
                    }
                });
			},
			error:function(e){
				console.log(e);
			}
		});
	}
    
    function printSaleList(list){
		var content="";

		for(var i=0; i<list.length; i++){
			content += '<table class="profileList">';
			content += "<tr>";
			content += '<td rowspan="2"><img alt="" src="/saleImg/'+list[i].saleFileDto.newFileName+'" style="width:60px; height:75px;"></td>';
			content += '<td class="subject">'+list[i].sale_subject+'</td>';
			content += "</tr>";
			content += "<tr>";
			content += '<td class="price">'+list[i].price+'원</td>';
			content += "</tr>";
			content += '</table>';	
		}
		$('#profileSaleList').empty();
		$('#profileSaleList').append(content);
	}
    
    function printReviewList(list){
		var content="";
      
		for(var i=0; i<list.length; i++){
			content += "<tr>";
			content += "<td>"+list[i].write_id+"</td>";
			content += "<td>"+list[i].review_content+"</td>";
			content += "<td>"+list[i].review_content+"</td>";
			content += "</tr>";
		}
		$('#profileReviewList').empty();
		$('#profileReviewList').append(content);
	}
    


</script>
</html>