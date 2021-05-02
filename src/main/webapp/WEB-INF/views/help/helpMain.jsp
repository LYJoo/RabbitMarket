<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<title>Insert title here</title>
<style>
	table{
		border-top: 2px solid black;
		border-bottom: 2px solid black;
		border-collapse: collapse;
		width : 100%;
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
	

</style>
</head>
<body>
<jsp:include page="../include/topNavigation.jsp"></jsp:include>
   <jsp:include page="../include/helpNavigation.jsp"></jsp:include>
   
   <div class="our_content_area">
  
   <table>
		<tr>
			<th>순번</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<tr>
			<td>1</td>
			<td><a href="notice_detail">공지사항입니다</a></td>
			<td>네오</td>
			<td>2021.04.25</td>
		</tr>
	<tr>
	<c:forEach items="${list}" var="notice">
			<td>${notice.notice_idx}</td>
			<td><a href="notice_detail?idx=${notice.notice_idx}">${notice.subject}</a>${notice.subject}</td>
			<td>${notice.admin_id}</td>
			<td>${notice.reg_date}</td>
	</c:forEach>
		</tr>
		<tr>
			<td>2</td>
			<td><a href=#>공지사항입니다</a></td>
			<td>네오</td>
			<td>2021.04.24</td>
		</tr>
	
   </table>
   </div>
  
</body>
<script>



</script>
</html>