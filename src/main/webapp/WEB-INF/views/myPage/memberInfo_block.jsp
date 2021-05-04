<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../resources/css/hwi_css.css">
        <style type="text/css"></style>
    </head>
    <body>
        <jsp:include page="../include/topNavigation.jsp"></jsp:include>    
        <div id="main_content">
        	<jsp:include page="../include/myPageNavigation.jsp"></jsp:include>
			<table id="table-block">
				<thead>
					<tr>
						<th colspan="3"><span class="info_title">차단 목록</span><br>
						<br></th>
					</tr>
				</thead>
				<tbody id="blockList">

				</tbody>
				<tr>
					<td id="paging" colspan="3">◁ 1 2 3 4 5 ▷</td>
				</tr>
			</table>
		</div>
    </body>
    <script type="text/javascript">
	    var showPage = 1;
		listCall(showPage);
		
		function listCall(reqPage){
			$.ajax({
				url:'./blockList/'+reqPage,
				type:'GET',
				data:{},
				dataType:'JSON',
				success:function(data){
					console.log(data.blockList);
					console.log(data.path);
					printBlockList(data.blockList, data.path);
				},
				error:function(e){
					console.log(e);
				}
			});
		}
		
		function printBlockList(list, path){
			var content="";
			
	
			for(var i=0; i<list.length; i++){
				content += "<tr>";
				content += "<td class='td-block-img'><p><img src='"+path+list[i].profilefileDto.newFileName+"' class='block-img'/></p></td>"
				content += "<td class='td-block-id'>"+list[i].target_id+"</td>"
				content += "<td><a onclick='delBlock("+list[i].block_idx+")' class='a-del' style='color:white;'>차단해제</a></td>";
				content += "</tr>";
				
			}
			$('#blockList').empty();
			$('#blockList').append(content);
		}
		
 		 function delBlock(block_idx){
			$.ajax({
				url:'./delBlock/'+block_idx,
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
