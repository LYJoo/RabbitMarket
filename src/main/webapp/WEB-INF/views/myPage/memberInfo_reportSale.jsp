<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../resources/css/hwi_css2.css">
        <style type="text/css"></style>
    </head>
    <body>
        <jsp:include page="../include/topNavigation.jsp"></jsp:include>    
        <div id="main_content">
        	<jsp:include page="../include/myPageNavigation.jsp"></jsp:include> 
        	<table class="type04">
        		<thead>
	        		<tr>
						<th colspan="4"><span class="info_title">판매글 신고 내역</span><br>
						<br></th>
					</tr>
	                <tr>
	                    <th scope="row">제목</th>
	                    <th scope="row">사유</th>
	                    <th scope="row">처리상태</th>
	                    <th scope="row">신고일</th>
	                </tr>
                </thead>
                <tbody id="saleReportList">
                
                </tbody>
                <tr>
                    <td colspan="4" id="paging">◁ 1 2 3 4 5 ▷</td>
                </tr>
            </table>
        </div>
    </body>
    <script type="text/javascript">
	    var showPage = 1;
		listCall(showPage);
		
		function listCall(reqPage){
			$.ajax({
				url:'./saleReportList/'+reqPage,
				type:'GET',
				data:{},
				dataType:'JSON',
				success:function(data){
					console.log(data.saleReportList);
					printSaleReportList(data.saleReportList);
				},
				error:function(e){
					console.log(e);
				}
			});
		}
		
		function printSaleReportList(list){
			var content="";
			
			for(var i=0; i<list.length; i++){
				content += "<tr>";
				content += "<td>"+list[i].saleDto.sale_content+"</td>";
				content += "<td>"+list[i].report_reason+"</td>"
				content += "<td>"+list[i].report_state+"</td>"
				content += "<td>"+list[i].reg_date+"</td>"
				content += "</tr>";
				
			}
			$('#saleReportList').empty();
			$('#saleReportList').append(content);
		}
    </script>
</html>
