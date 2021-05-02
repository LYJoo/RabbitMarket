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
			body{
	            margin-top: 100px;
	            font-family: 'Trebuchet MS', serif;
	            line-height: 1.6
	        }
	        #msgContainer{
	            width: 500px;
	            margin: 0 auto;
	        }
	
	        ul.tabs{
	            margin: 0px;
	            padding: 0px;
	            list-style: none;
	            text-align: center;
	        }
	        ul.tabs li{
	            background: none;
	            color: #222;
	            display: inline-block;
	            cursor: pointer;
	        }
	
	        ul.tabs li.current{
	            color: #F79646;
	
	        }
	
	        ul.tabs li hr{
	            border: 2px solid gray;
	            width: 125px;
	        }
	
	        ul.tabs li hr.current{
	            border: 2px solid #F79646;
	            width: 125px;
	
	        }
	
	        .tab-content{
	            display: none;
	        }
	
	        .tab-content.current{
	            display: inherit;
	        }
	
	        table.type04 {
	            border-collapse: collapse;
	            border-spacing: 1px;
	            text-align: center;
	            line-height: 1.5;
	            border-top: 1px solid #ccc;
	            font-size: 13px;
	        }
	        table.type04 th {
	            width: 150px;
	            font-weight: bold;
	            border-bottom: 1px solid #ccc;
	        }
	        table.type04 td {
	            width: 350px;
	            padding: 10px;
	            vertical-align: top;
	            border-bottom: 1px solid #ccc;
	        }

	        .msg_paging{
	            text-align: center;
	        }
        </style>
    </head>
    <body>
        <div id="msgContainer">
	        <div class="main-logo">
	            <img src="../resources/img/rabbit_logo.png" alt="">
	        </div>
	        <ul class="tabs">
	            <li class="tab-link current" data-tab="tab-1">받은쪽지함<hr class="tab-hr current"></li>
	            <li class="tab-link" data-tab="tab-2">보낸쪽지함<hr class="tab-hr"></li>
	            <li class="tab-link" data-tab="tab-3">차단쪽지함<hr class="tab-hr"></li>
	        </ul>
	        <div id="tab-1" class="tab-content current">
	            <table class="type04" style="font-size: 13px">
	            	<thead>
		                <tr>
		                    <th scope="row">내용</th>
		                    <th scope="row">ID</th>
		                    <th scope="row">보낸날짜</th>
		                    <th scope="row">삭제</th>
		                </tr>
	            	</thead>
	            	<tbody id="receiveList">
	            	
	            	</tbody>
	              </table>
	              <!-- 페이지 -->
	              <div class="msg_paging"><span> ◁ 1 2 3 4 5 ▷ </span></div>
	        </div>
	        <div id="tab-2" class="tab-content">
	            <table class="type04" style="font-size: 13px">
	            	<thead>
		                <tr>
		                    <th scope="row">내용</th>
		                    <th scope="row">ID</th>
		                    <th scope="row">보낸날짜</th>
		                    <th scope="row">삭제</th>
		                </tr>
	            	</thead>
	            	<tbody id="sendList">
	            		
	            	</tbody>
	              </table>
	              <!-- 페이지 -->
	              <div class="msg_paging"><span> ◁ 1 2 3 4 5 ▷ </span></div>
	        </div>
	        <div id="tab-3" class="tab-content">
	            <table class="type04" style="font-size: 13px">
	            	<thead>
		                <tr>
		                    <th scope="row">내용</th>
		                    <th scope="row">ID</th>
		                    <th scope="row">보낸날짜</th>
		                    <th scope="row">삭제</th>
		                </tr>
	            	</thead>
	            	<tbody id="blockList">
	            	
	            	</tbody>
	              </table>
	              <!-- 페이지 -->
	              <div class="msg_paging"><span> ◁ 1 2 3 4 5 ▷ </span></div>
	        </div>
	        <div>
	            <button class="msg-btn" onclick="location.href='./writeForm'">글쓰기</button>
	        </div>
	    </div>
    </body>
    <script type="text/javascript">
    	var msg = '${msg}';
    	if(msg != ""){
    		alert(msg);
    	}
    
	    $(document).ready(function(){
	    	
	    	$('ul.tabs li').click(function(){
	    		var tab_id = $(this).attr('data-tab');
	
	    		$('ul.tabs li').removeClass('current');
	    		$('.tab-content').removeClass('current');
	            $('.tab-hr').removeClass('current');
	
	    		$(this).addClass('current');
	
	    		$("#"+tab_id).addClass('current');
	            $(this).find('hr').addClass('current');
	    	});
	    });
	    
	    var showPage = 1;
    	listCall(showPage);
    	
    	function listCall(reqPage){
    		$.ajax({
    			url:'./list/'+reqPage,
    			type:'GET',
    			data:{},
    			dataType:'JSON',
    			success:function(data){
    				printReceiveList(data.receiveMsgList);
    				printSendList(data.sendMsgList);
    				printBlockList(data.blockMsgList);
    				
    			},
    			error:function(e){
    				console.log(e);
    			}
    		});
    	}
    	
    	function printReceiveList(list){
    		var content="";
    		
    		for(var i=0; i<list.length; i++){
    			content += "<tr>";
    			if(!(list[i].read_boolean)){	//아직 읽은적 없는 메시지면 제목 진하게
	    			content += "<td><b><a href='./detailMsg?msg_idx="+list[i].msg_idx+"&msgType=receiveMsg'>"+list[i].msg_content+"</a></b></td>";
    			}else{							//읽은적 있으면 그대로
    				content += "<td><a href='./detailMsg?msg_idx="+list[i].msg_idx+"&msgType=receiveMsg'>"+list[i].msg_content+"</a></td>";
    			}
    			content += "<td>"+list[i].send_id+"</td>";
    			content += "<td>"+list[i].send_time+"</td>";
    			content += "<td><a href='./delMsg?msg_idx="+list[i].msg_idx+"&msgType=receiveMsg' class='a-del' style='color:white;'>삭제</a></td>";
    			content += "</tr>";
    			
    		}
    		$('#receiveList').empty();
    		$('#receiveList').append(content);
    	}
    	
    	function printSendList(list){
    		var content="";
    		
    		for(var i=0; i<list.length; i++){
    			content += "<tr>";
    			content += "<td><a href='./detailMsg?msg_idx="+list[i].msg_idx+"&msgType=sendMsg'>"+list[i].msg_content+"</a></td>";
    			content += "<td>"+list[i].member_id+"</td>";
    			content += "<td>"+list[i].send_time+"</td>";
    			content += "<td><a href='./delMsg?msg_idx="+list[i].msg_idx+"&msgType=sendMsg' class='a-del' style='color:white;'>삭제</a></td>";
    			content += "</tr>";
    			
    		}
    		$('#sendList').empty();
    		$('#sendList').append(content);
    	}
    	
    	function printBlockList(list){
    		var content="";
    		
    		for(var i=0; i<list.length; i++){
    			content += "<tr>";
    			if(!(list[i].read_boolean)){	//아직 읽은적 없는 메시지면 제목 진하게
    				content += "<td><b><a href='./detailMsg?msg_idx="+list[i].msg_idx+"&msgType=blockMsg'>"+list[i].msg_content+"</a></b></td>";
    			}else{							//읽은적 있으면 그대로
    				content += "<td><a href='./detailMsg?msg_idx="+list[i].msg_idx+"&msgType=blockMsg'>"+list[i].msg_content+"</a></td>";
    			}
    			content += "<td>"+list[i].send_id+"</td>";
    			content += "<td>"+list[i].send_time+"</td>";
    			content += "<td><a href='./delMsg?msg_idx="+list[i].msg_idx+"&msgType=receiveMsg' class='a-del' style='color:white;'>삭제</a></td>";
    			content += "</tr>";
    			
    		}
    		$('#blockList').empty();
    		$('#blockList').append(content);
    	}
    </script>
</html>













