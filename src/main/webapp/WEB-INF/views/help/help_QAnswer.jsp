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
		border-collapse: collapse;
		width : 100%;
		margin-top : 30px;
		border-bottom: 3px solid black;
		
	}
	th,td{
	   	border-top: 1px solid black;
		padding : 10px;
		text-align: left;
	}
	th{
		padding-left:50px;
	}
	
	#btn2{
      color: white;
      font-size: 20px;
      background-color: #ff8e32;
      width: 90px;
      border-style: none;
      height: 50px;
     
    }
	div#btn{
		text-align: center;
		margin-top : 20px;
		margin-right: 20px;
	}
	.select{
		width:100px;
	}
	
	#editable{
		width: 95%;
		height: 300px;
		border: 1px solid gray;
		text-align: left;
		overflow: auto;
		margin:5px;
		padding:10px;
		
	}
	#subject{
		width:500px;
		
	}
	.flex_box{
		display: flex;
		padding-left: 150px;
	}

</style>
</head>
<body>
<jsp:include page="../include/topNavigation.jsp"></jsp:include>
   <jsp:include page="../include/helpNavigation.jsp"></jsp:include>

   <div class="our_content_area">
   <div class="flex_box">
  <form action="helpwrite" method="post">
   <table>
    
		<tr>
			<th>제목</th>
			<td><input type="text" id="subject" name="subject" required></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" id="member_id" name="member_id" value="${sessionScope.loginId}" readonly="readonly"></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<th>카테고리</th>
			<td>
				<select class ="select" name="question_category" required="required">
				    <option value="1">판매글</option>
				    <option value="2">신고</option>
				    <option value="3">사기</option>
				    <option value="4">기타</option>
				</select>
			</td>
			<th>공개여부</th>
			<td>
				<label><input type="radio" id="isPw" name="isPw" value="0" required checked> 공개</label>
				 &nbsp; &nbsp;
				<label><input type="radio"  id="isPw" name="isPw" value="1" required> 비공개</label>
			
			</td>
				<td id="check">
					
				</td>
		</tr>
		<tr>
			
		</tr>
		<tr>
			<td colspan="5">
				<!-- div 에 있는 녀석은 서버로 보낼 수 없다. -->
				<div id="editable" contenteditable="true"></div>
				<input id="content" type="hidden" name="content" value=""/>
			</td>
		</tr>
		
	
   </table>
   <div id="btn"><br/>
   <input id="btn2"type="button" value="등록"/>
   </form>
    &nbsp; &nbsp; &nbsp; 
   <button id="btn2" onclick="btn_clear()">취소</button>
   </div>
   </div>
  
</body>
<script>

//글 등록시 오는 경고창
	var check = "${help_write_msg}";
if(check != ""){
 	alert(check);
}

$("#btn2").click(function(){
	//editable 에 있는 내용을 content  의  value 에 넣기
	$("#content").val($("#editable").html());
	$("form").submit();
});
	function btn_clear(){
		 if (confirm("작성한 내용은 모두 지워집니다. 정말 취소 하시겠습니까?") == true){    //확인
			location.href="javascript:history.back()";

		 }else{   //취소
			 return ;
		 }
	};
	
	var mode = $('input[name="isPw"]:checked').val();
	console.log(mode);
	if(mode != "0"){
		#
	}

</script>
</html>