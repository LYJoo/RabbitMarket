<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- 제이쿼리(부트스트랩보다 위에있어야함) -->
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<!-- 반응형 디자인을 위한 CSS/JS 라이브러리 -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
		<!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야 함) -->
		<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
		<style>
		
		</style>
	</head>
	<body>
		<jsp:include page="../include/topNavigation.jsp"></jsp:include>
   		<jsp:include page="../include/myPageNavigation.jsp"></jsp:include>
   
   		<div class="our_content_area">
   			
   			<table>
   				<tr>
   					<th>게시물</th>
   					<th>제목</th>
   					<th colspan="2">판매상태</th>
   					<th>작성일</th>
   				</tr>
   				<c:if test="${salelistFile.size()>0}">
				<tr>
					<td>
						<ul>
						<!-- 마지막에 / 가없으면 . 이후 확장자가 생략되어 버린다. -->
							<c:forEach items="${salelistFile}" var="file">
								<li><a href="/main/download/${file.oriFileName}/${file.newFileName}/">${file.oriFileName}</a></li>
							</c:forEach>
						</ul>
					</td>
				</tr>
				</c:if>
   				<tr>
   					<td>${salelistlist.sale_subject}</td>
   					<td>
   						<select id="sale_select" name="sale_select">
   							<option value="trading">거래중</option>
   							<option value="traded">거래완료</option>
   							<option value="cancel_trade">거래취소</option>
   						</select>
   						${salelistlist.code_num}
   					</td>
   					<td><a href="location.href='/거래상세보기페이지'">거래상세보기</a></td>
   					<td>${salelistlist.reg_date}</td>
   				</tr>
   			</table>
   		</div>
	</body>
	<script>
	
	var showPage = 1;
	
	//몇개를 보여줄 것인지 / 몇페이지
	listCall(showPage);//시작하자마자 이 함수를 호출 (20개씩 1페이지씩 보여줘라)
	
	$("#pagePerNum").change(function(){//select box의 값을 변경 할 때 마다 실행
		$("#pagination").twbsPagination('destroy');//이 구문이 없으면 페이지당 갯수 조정시 페이징 변경이 일어나지 않는다.
		listCall(showPage);
	});
	
	function listCall(reqPage){
		//restful service 는 ajax 를 통해 호출하여 사용하는 경우가 많지만
		//그렇다고 restful service == ajax 라고 생각해서는 안된다.
		var reqUrl = './list/'+$("#pagePerNum").val()+"/"+reqPage;
		$.ajax({
			url:reqUrl,
			Type:'GET',
			data:{},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				showPage = data.currPage;
				listPrint(data.list);
				//pagePrint(data.range);//플러그인 미사용 페이징 처리
				//플러그인 사용
				$("#pagination").twbsPagination({//옵션들이 들어감
					startPage:data.currPage,//시작페이지
					totalPages:data.range,//생성 가능 최대 페이지
					visiblePages:5,//5개씩 보여주겠다 (1~5)
					onPageClick:function(evt,page){//각 페이지를 눌렀을 경우
						//console.log(evt);
						//console.log(page);
						listCall(page);
					}
				});
			},
			error:function(error){
				console.log(error);
			}
		});
		
	}
	
	function listPrint(list){
		var content="";
		
		for(var i=0;i<list.length;i++){
			content += "<tr>"
			content += "<td>"+list[i].boardIdx+"</td>"
			content += "<td>"+list[i].subject+"</td>"
			content += "<td>"+list[i].id+"</td>"
			//java 에서 가끔 날짜가 milliseconds 로 나올 경우...
			var date = new Date(list[i].reg_date)
			content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"
			content += "<td>"+list[i].bHit+"</td>"
			content += "</tr>"
		}
		$("#list").empty();
		$("#list").append(content);
	}
	
	//정석적인 방법(요즘 잘 안씀)
	function pagePrint(range){
		console.log("생성가능 페이지 : "+range);
		console.log("현재 페이지 : "+showPage);
		var content="";
		var start = 1;
		var end = range>=5 ? 5 : range;
		console.log(end);
		
		//이전(5페이지가 넘어갔을때 나타나는 녀석)
		if(showPage>5){
			end = Math.ceil(showPage/5)*5			
			
			if(end>range){
				end = range;
			}
			
			start = end-4;
			console.log(end);
			content += " <a href='#' onclick='listCall("+(start-1)+")'>이전</a> |"
		}
		
		//1~5
		for(var i=start; i<=end; i++){
			if(i==showPage){
				content += "<b style='color:red'>"+i+"</b>";
			}else{
				content += "<a href='#' onclick='listCall("+i+")'>"+i+"</a>";//페이지 링크처리 및 나타내기
			}
		}
		
		//다음(ragne 가 현재 마지막 페이지(5) 보다 더있을 경우 나타나는 녀석)
		if(end<range){
			content += "| <a href='#' onclick='listCall("+(end+1)+")'>다음</a>"//다음 페이지로 넘어가기위해 end+1 , 즉 6페이지로 넘어감
		}
		
		$("#paging").empty();
		$("#paging").append(content);
	}
	</script>
</html>