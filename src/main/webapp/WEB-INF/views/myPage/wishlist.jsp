<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>위시리스트</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			.list{
				background-color: white;
				border: 1px solid black;
				border-radius: 3px;
				position: relative;
				top: 40px;
				margin: 0 auto;
				width: 800px;
				margin-top: 20px;
				text-align: center;
			}
		
			.list table, .list tr, .list th, .list td{
				padding: 5px 10px;
			}
		</style>
	</head>
	<body>
	<!-- 네비 포함시켜야한다.
	<jsp:include page="top.jsp"/>
	<jsp:include page="navi.jsp"/>
	 -->
	 
	<jsp:include page="../include/topNavigation.jsp"></jsp:include>
   	<jsp:include page="../include/myPageNavigation.jsp"></jsp:include>
   
   	<div class="our_content_area">
	
	<!-- 리스트에 아무것도 없을때 -->
		<div id="wish">
			<c:if test="${salelist eq '[]'}">
				<div class="nonelist">
					<p>위시리스트에 등록된 상품이 없어요~</p>
				</div>
			</c:if>
		</div>
	
	
		<div class="list">
			<table>
				<tr>
					<th>게시물</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
				
				<!-- 사진 경로(위치랑 컬럼명 파악) 수정해야함 리스트명도 다시 확인 -->
				<c:forEach items="${wishlist}" var="row">
					<tr align="center">
						<td><img src="${path}/images/${row.imgae}" width="100" height="100"></td>
						<td>${row.sale_subject}</td>
						<td>${row.reg_date}</td>
						<td>
							<input type="button" value="삭제" onclick="deletelist(${row.wish_idx})" class="del"/>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	
	</body>
	<script>
	   var msg = "${msg}";
	   if (msg != "") {
	      alert(msg);
	   }
	   
	   //위시리스트 삭제
	   function deletelist(wish_idx){
		  console.log(wish_idx);
		  if(confirm("삭제하시겠습니까?")){
			  location.href="wishUpdate?wish_idx="+wish_idx+"&type="+type;
		  }else{
			  loaction.href="wishlist";
		  }
	   };
	</script>
</html>