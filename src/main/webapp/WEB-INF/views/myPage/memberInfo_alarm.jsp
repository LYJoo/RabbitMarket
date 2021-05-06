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
        <link rel="stylesheet" type="text/css" href="/resources/css/hwi_css.css">
        <style type="text/css"></style>
    </head>
    <body>
        <jsp:include page="../include/topNavigation.jsp"></jsp:include>    
        <div id="main_content">
	        <jsp:include page="../include/myPageNavigation.jsp"></jsp:include>
			<table id="table-alarm">
				<thead>
					<tr>
						<th colspan="2"><span class="info_title">알림목록</span><br><br></th>
					</tr>
				</thead>
				<tbody id="alarmList">
				
				</tbody>
				<tr>
					<td colspan="2" id="paging">
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
	    jQuery.noConflict();	
	    var showPage = 1;
		listCall(showPage);
		
		function listCall(reqPage){
			$.ajax({
				url:'./alarmList/'+reqPage,
				type:'GET',
				data:{},
				dataType:'JSON',
				success:function(data){
					console.log(data.alarmList);
					printAlarmList(data.alarmList);
					console.log(data.range);
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
		
		function printAlarmList(list){
    		var content="";

    		for(var i=0; i<list.length; i++){
    			content += "<tr>";
    			if(!(list[i].isCheck)){	//아직 읽은적 없는 메시지면 제목 진하게
	    			content += "<td><b>"+list[i].reg_date+"   "+list[i].alarm_content+"</b></td>";
    			}else{							//읽은적 있으면 그대로
    				content += "<td>"+list[i].reg_date+"   "+list[i].alarm_content+"</td>";
    			}
    			content += "<td><a onclick='delAlarm("+list[i].alarm_idx+")' class='a-del' style='color:white;'>지우기</a></td>";
    			content += "</tr>";
    			
    		}
    		$('#alarmList').empty();
    		$('#alarmList').append(content);
    	}
		
		function delAlarm(alarm_idx){
			$.ajax({
				url:'./delAlarm/'+alarm_idx,
				type:'GET',
				data:{},
				dataType:'JSON',
				success:function(data){
					console.log('삭제여부 : '+data.success);
					listCall(1);
				},
				error:function(e){
					console.log(e);
				}
			});
		}
    </script>
</html>
