<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>admin_notice</title>
    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- 반응형 디자인을 위한 css/js 라이브러리 -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>   
    <!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야 함) -->
    <script src="/resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
    <!-- lyj_style -->
    <link rel="stylesheet" type="text/css" href="/resources/css/lyj_css.css">
<style type="text/css">
	table{
		text-align: center;
		table-layout:fixed;
	}
	
	#w{
		word-break:break-all;
		white-space:pre-wrap;
	}
	
	#e{
		white-space: nowrap;
	}
</style>
</head>
<body>
	<jsp:include page="../include/topNavigation.jsp"></jsp:include>
    <div id="list_content">
        <div class="flex_box btn_flex">
            <h2>공지사항</h2>
        </div>
        <table id="list_table">
            <thead>
                <tr>
                    <th>글번호</th>
                    <th id="list_subject">제목</th>
                    <th colspan="2">작성자</th>
                    <th>공지날짜</th>
                </tr>
            </thead>
            <tbody id="list">
                <!-- 불러온 데이터 뿌리는 영역 -->
                <tr>
                    <td>00</td>
                    <td><a href="">로드중...</a></td>
                    <td  colspan="2">토끼마켓</td>
                    <td>0000-00-00</td>
                </tr>
            </tbody>
            <tr>
				<td id="paging" colspan="5">  
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
	jQuery.noConflict();
	
    var showPage = 1;//첫시작시에 보여줄 페이지 1
    var pagePerNum = 10;//보여줄갯수

    //몇개를 보여줄 것인지/몇페이지
    listCall(showPage);//시작하자 마자 이 함수를 호출
    
    function listCall(reqPage){	//페이지 요청 함수
        var reqUrl ='/admin/noticeList/'+pagePerNum+'/'+reqPage; // /list/보여줄갯수/페이지
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
            content +="<td >"+list[i].notice_idx+"</td>";
            content +="<td id='w' colspan='2' ><a href='./detailNotice/"+list[i].notice_idx+"'>"+list[i].subject+"</a></td>";
            content +="<td id='e'>"+list[i].admin_id+"</td>";
            
            //java 에서 가끔 날짜가 milliseconds 로 나올 경우...
            var date = new Date(list[i].reg_date);
            content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>";
            
            content +="</tr>";
        }
        $('#list').empty();//원래 있던 리스트들을 비워준다.
        $('#list').append(content);
    }
</script>
</html>