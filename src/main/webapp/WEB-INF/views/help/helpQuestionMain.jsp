<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>help_question</title>
    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- 반응형 디자인을 위한 css/js 라이브러리 -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>   
    <!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야 함) -->
    <script src="/resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
    <!-- lyj_style -->
    
 <style type="text/css">
 		table{
		border-top: 2px solid black;
		border-collapse: collapse;
		width : 100px;
		margin-top : 40px
		
		
	}
	th{
		text-align: center;
		padding : 10px;
	}
   td{
	   	border-top: 1px solid black;
	   	text-align: center;
	   padding : 10px;
   }
	button{
      color: white;
      font-size: 15px;
      background-color: #ff8e32;
      width: 120px;
      border-style: none;
      height: 50px;
      float: right;
      margin-right: 350px;
     
    }
	div#btn{
		text-align: right;
		margin-top : 20px;
	}


</style>
</head>
<body>
	<jsp:include page="../include/topNavigation.jsp"></jsp:include>
	 <jsp:include page="../include/helpNavigation.jsp" flush="true"></jsp:include>
    <div id="list_content">
     <br/><br/>
        <div class="flex_box btn_flex">
            <h2>1:1문의하기</h2>
        <button onclick="location.href='./help_QAnswer'" >문의글 작성</button>
        </div>
        <table id="list_table">
            <thead>
                <tr>
                    <th>질문번호</th>
                    <th>카테고리</th>
                    <th id="list_subject">제목</th>
                    <th>작성자</th>
                    <th style="width: 14%;max-width: 105px;">문의날짜</th>
                    <th>문의상태</th>
                </tr>
            </thead>
            <tbody id="list">
                <!-- 불러온 데이터 뿌리는 영역 -->
                <tr>
                    <td>00</td>
                    <td>...</td>
                    <td><a href="">로드중...</a></td>
                    <td>토끼마켓</td>
                    <td>0000-00-00</td>
                    <td>답변중</td>
                </tr>
            </tbody>
            <tr>
				<td id="paging" colspan="6">  
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
<script>
//글 등록시 오는 경고창
var check = "${help_write_msg}";
if(check != ""){
	alert(check);
}
	jQuery.noConflict();
    var showPage = 1;//첫시작시에 보여줄 페이지 1
    var pagePerNum = 10;//보여줄갯수

    //몇개를 보여줄 것인지/몇페이지
    listCall(showPage);//시작하자 마자 이 함수를 호출
    
    function listCall(reqPage){	//페이지 요청 함수
        var reqUrl ='./helpQuestionMain/'+pagePerNum+"/"+reqPage; //restful 로 요청 -> /list/보여줄갯수/페이지
        $.ajax({
            url:reqUrl
            ,type:'get'
            ,data:{}
            ,dataType:'JSON'
            ,success:function(data){
                console.log(data);
                showPage = data.currPage;//보여줄 페이지 = 현재페이지
                listPrint(data.list);//리스트 그리기
                //플러그인 사용
                $("#pagination").twbsPagination({
                    startPage:data.currPage,//시작페이지
                    totalPages:data.range,//생성 가능 최대 페이지
                    visiblePages:5,//5개씩 보여 주겠다.(1~5)
                    onPageClick:function(evt, page){//각 페이지를 눌렀을 경우
                        listCall(page);
                    }
                });
            }
            ,error:function(error){
                console.log(error);
            }
        });
    }
    
    //리스트 그리긔
    function listPrint(list){
        var content="";
        for(var i=0;i<list.length;i++){
            content +="<tr>";
            content +="<td>"+list[i].question_idx+"</td>";
            content +="<td>"+list[i].q_category_name+"</td>";
	        content +="<td><a href='/help/helpQuestionDetail/"+list[i].question_idx+"'>"+list[i].subject+"</a></td>";            	
            content +="<td>"+list[i].member_id+"</td>";
            
            //java 에서 가끔 날짜가 milliseconds 로 나올 경우...
            var date = new Date(list[i].reg_date);
            content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>";
            
            if(list[i].state == 1 ){//답변이 있을경우
            	content +="<td>답변완료</td>";
 	        } else{//답변이 없을 경우 
                content +="<td>답변중</td>";            	
 	        }
            content +="</tr>";
        }
        $('#list').empty();//원래 있던 리스트들을 비워준다.
        $('#list').append(content);
    }
</script>
</html>