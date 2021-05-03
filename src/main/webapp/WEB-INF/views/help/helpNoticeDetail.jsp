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
		border-top: 3px solid black;
		border-collapse: collapse;
		width : 100%;
		margin-top : 40px
		
		
	}
	th{
		text-align: left;
		padding : 10px;
	}
   td{
	   	border-top: 1px solid black;
	   	text-align: left;
	   padding : 10px;
   }
	
	.title{
		font-weight: 600;
		
	}
	.content {
		text-align: left;
	}
	button{
      color: white;
      font-size: 20px;
      background-color: #ff8e32;
      width: 90px;
      border-style: none;
      height: 50px;
     
    }
	div#btn{
		text-align: center;
		border-top: 3px solid black;
		margin-top : 20px;
	}

</style>
</head>
<body>
<jsp:include page="../include/topNavigation.jsp"></jsp:include>
   <jsp:include page="../include/helpNavigation.jsp"></jsp:include>
   
   <div class="our_content_area">
  
   <table>
		<tr>
			<td class="title">제목</td>
			<td>공지사항입니다</td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td class="title">작성자</td>
			<td >네오</td>
			<td class="title">작성일</td>
			<td>2021.04.25</td>
		</tr>
		<tr>
			
		</tr>
		<tr>
			<td colspan="4">
			<div class="content">
				<br/>안녕하세요?<br/>
				(주)당근마켓 서비스를 이용해 주셔서 감사합니다. 지역 정보 모바일 서비스를 제공하는 당근마켓이 아래 준비한 약관을 읽어주시면 감사드리겠습니다.<br/><br/><br/>
				계정 관련<br/><br/>
				당근마켓은 모바일 서비스 특성상 별다른 비밀번호 없이 휴대전화 번호만으로 계정을 생성하실 수 있습니다. 다만, 실제 휴대전화의 소유주임을 확인하기 위해서 가입 당시 인증 절차를 거치게 됩니다. 또한, 다른 모바일 기기에서 서비스 사용을 연속하기 위해서는 기존에 가입하고 인증했던 휴대전화 번호로 재인증을 해야 합니다. 아래의 경우에는 계정 생성을 승인하지 않을 수 있습니다.
				</div>
			</td>
		</tr>
	<tr>
	<c:forEach items="${list}" var="notice">
			<td>${notice.subject}</td>
			<td>${notice.admin_id}</td>
			<td>${notice.reg_date}</td>
			<td>${notice.content}</td>
	</c:forEach>
		</tr> 
		
	
   </table>
   
   <div id="btn"><br/>
   <button onclick="location.href = '/help/noticeMain' ">목록</button>
   </div>
   </div>
  
</body>
<script>



</script>
</html>