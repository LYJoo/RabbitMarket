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
</head>
<body>
	<div id="top_navi_contain_box">
		<jsp:include page="../include/topNavigation.jsp"></jsp:include>
	</div>
	<div id="side_bar_contain_box">
	<div style="display: contents;">
		<jsp:include page="../include/adminNavigation.jsp"></jsp:include>
	</div>
    <div id="list_content">
        <div class="flex_box btn_flex">
            <h2>글신고목록</h2>
            <button onclick="location.href='./writeFormNotice'" class="list_btn">글신고목록</button>
        </div>
        <table id="list_table">
            <thead>
                <tr>
                    <th>신고번호</th>
                    <th>신고사유</th>
                    <th>글작성자</th>
                    <th>신고자ID</th>
                    <th>처리상태</th>
                    <th>신고날짜</th>
                    <th>처리완료날짜</th>
                </tr>
            </thead>
            <tbody id="saleReportList">
                <!-- 불러온 데이터 뿌리는 영역 -->

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
    </div>
</body>
<script>
	//jQuery.noConflict();
	
    var showPage = 1;
    listCall(showPage);
    
    function listCall(reqPage){	//페이지 요청 함수
        $.ajax({
            url:'./saleReportList/'+reqPage
            ,type:'get'
            ,data:{}
            ,dataType:'JSON'
            ,success:function(data){
                console.log(data);
                showPage = data.currPage;//보여줄 페이지 = 현재페이지
                listPrint(data.saleReportList);//리스트 그리기
                console.log(data.saleReportList)
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
            content += "<td>"+list[i].report_idx+"</td>";
            content += "<td><a onclick='openSaleManage(this)' id='"+list[i].target_idx+"' class='"+list[i].report_idx+"' style='cursor:pointer;' >"+list[i].report_reason+"</a></td>";
            content += "<td>"+list[i].reporter+"</td>";
            content += "<td>"+list[i].target+"</td>";
            content += "<td>"+list[i].report_state+"</td>";
            content += "<td>"+list[i].reg_date+"</td>";
            if(list[i].report_state == "처리완료"){
            	content += "<td>"+list[i].complete_date+"</td>";            	
            }else{
            	content += "<td><a onclick='updateReportState(this)'id='"+list[i].report_idx+"/"+list[i].target+"' style='cursor:pointer;'>처리완료하기</a></td>";
            }
            content +="</tr>";
        }
        $('#saleReportList').empty();//원래 있던 리스트들을 비워준다.
        $('#saleReportList').append(content);
    }
    
    function updateReportState(elem){
    	var elem_str = elem.getAttribute('id');
    	var report_idx = elem_str.split('/')[0];
    	var target = elem_str.split('/')[1];

    	$.ajax({
			url:'./updateSaleReportState',
			type:'POST',
			data:{"report_idx":report_idx, "target":target},
			dataType:'JSON',
			success:function(data){
				console.log(data.success);
				listCall(1);
			},
			error:function(e){
				console.log(e);
			}
		});
    }
    
    function openSaleManage(elem) {
		window.open('./saleBlindManage/'+elem.getAttribute('id')+'/'+elem.getAttribute('class'), 'saleBlindManage', 'width=600, height=800');
	}
</script>
</html>