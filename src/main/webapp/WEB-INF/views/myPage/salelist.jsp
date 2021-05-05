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
   					<td>${salelistlist.code_num}</td>
   					<td>${salelistlist.sale_subject}</td>
   					<td>${salelistlist.reg_date}</td>
   				</tr>
   			</table>
   		</div>
	</body>
	<script></script>
</html>