<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <!-- 반응형 디자인을 위한 css/js 라이브러리 -->
    	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>   
    	<!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야 함) -->
    	<script src="/resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="/resources/css/hwi_css2.css">
    </head>
    <body>
        <jsp:include page="../include/topNavigation.jsp"></jsp:include>    
        <div id="main_content">
        	<jsp:include page="../include/myPageNavigation.jsp"></jsp:include> 
        	<table class="type04">
        		<thead>
	        		<tr>
						<th colspan="4"><span class="info_title">내 1:1 문의 내역</span><br>
						<br></th>
					</tr>
					<tr>
	                    <th scope="row">분류</th>
	                    <th scope="row">제목</th>
	                    <th scope="row">답변여부</th>
	                    <th scope="row">작성일</th>
	                </tr>
                </thead>
                <tbody id="questionList">
                
                </tbody>
                <tr>
                    <td colspan="4" id="paging">
						<!-- 플러그인 사용 -->
						<div class="container">
							<nav aria-label="page navigation" style="text-align:center">
								<ul class = "pagination" id="pagination"></ul>
							</nav>
						</div>
						<!-- 플러그인 사용 -->
					</td>
                </tr>
            </table>
        </div>
    </body>
    <script type="text/javascript">
	    var showPage = 1;
		listCall(showPage);
		
		function listCall(reqPage){
			$.ajax({
				url:'./questionList/'+reqPage,
				type:'GET',
				data:{},
				dataType:'JSON',
				success:function(data){
					console.log(data.questionList);
					printQuestionList(data.questionList);
					//플러그인 사용
	                $("#pagination").twbsPagination({
	                    startPage:data.currPage,//시작페이지
	                    totalPages:data.range,//생성 가능 최대 페이지
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
		
		function printQuestionList(list){
			var content="";
			
			for(var i=0; i<list.length; i++){
				content += "<tr>";
				content += "<td>"+list[i].question_category+"</td>";
				content += "<td>"+list[i].subject+"</td>"
				if(list[i].state == 0){
					content += "<td style='color:red;'>미답변</td>"
				}else{
					content += "<td style='color:green;'>답변완료</td>"
				}
				content += "<td>"+list[i].reg_date+"</td>"
				content += "</tr>";
				
			}
			$('#questionList').empty();
			$('#questionList').append(content);
		}
    
    </script>
</html>
