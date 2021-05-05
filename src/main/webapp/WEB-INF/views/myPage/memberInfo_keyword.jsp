<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../resources/css/hwi_css.css">
        <style type="text/css">
        	.keyword{
            border: 1px solid black;
            color: black;
            padding: 5px 10px;
            margin: 10px;
	        }
	        #keyword_content{
	        padding : 20px;
	     	margin: 30px;
	        }
	        #keyword_title{
	            font-size: 20px;
	            background-color: #F79646;
	            color: white;
	            margin:10px;
	            margin-top:50px;
	            padding:3px 15px;
	        }
	        #keyword_input{
	        	margin: 10px;
	            display: inline-block;
	        }
	        #keyword-div{
	            text-align: left;
	            margin:10px;
	            padding: 10px;
	        }
	        #btn-keyword-reg{
	        	width:70px;
	        	height:30px;
	        	background-color: #F79646;
	            color: white;
	            border:none;
	            cursor: pointer;
	        }
        </style>
    </head>
    <body>
        <jsp:include page="../include/topNavigation.jsp"></jsp:include>    
        <div id="main_content">
	        <jsp:include page="../include/myPageNavigation.jsp"></jsp:include>
			<span class="info_title">내 알림 키워드</span>
			<div id="keyword_content">
				<span id="keyword_title">알림받을 키워드 설정 (최대 5개)</span><br>
				<div id="keyword_input">
					<input type="text" name="keyword" id="inputKeyword" style="width: 330px; height: 30px;">&nbsp;&nbsp;
					<button id="btn-keyword-reg" onclick="registKeyword()">등록</button>
				</div>
			</div>
			<div id="keyword-div">
			
			</div>
		</div>
    </body>
    <script type="text/javascript">
		listCall();
		
		function listCall(){
			$.ajax({
				url:'./callKeywords',
				type:'GET',
				data:{},
				dataType:'JSON',
				success:function(data){
					console.log(data.keywords);
					printKeywords(data.keywords);
				},
				error:function(e){
					console.log(e);
				}
			});
		}
		
		function printKeywords(list){
			var content="";
			
			for(var i=0; i<list.length; i++){
				content += "<span class='keyword' id='"+list[i].keyword_idx+"'>"+list[i].keyword+"&nbsp;&nbsp;<a onclick='delKeyword($(this).parent())'>X</a></span> ";
			}
			$('#keyword-div').empty();
			$('#keyword-div').append(content);
		}
		
		function delKeyword(elem){
			$.ajax({
				url:'./delKeyword/'+elem[0].getAttribute('id'),
				type:'GET',
				data:{},
				dataType:'JSON',
				success:function(data){
					console.log(data.success);
					listCall();
				},
				error:function(e){
					console.log(e);
				}
			});
		}
		
		function registKeyword() {
			
			if($('#keyword-div').children().length == 5){
				alert("키워드는 5개를 초과할 수 없습니다.");
			}else{
				$.ajax({
					url:'./writeKeyword/'+$('#inputKeyword').val(),
					type:'GET',
					data:{},
					dataType:'JSON',
					success:function(data){
						console.log(data.success);
						$('#inputKeyword').val('');
						listCall();
					},
					error:function(e){
						console.log(e);
					}
				});
			}
		}
	</script>
</html>
