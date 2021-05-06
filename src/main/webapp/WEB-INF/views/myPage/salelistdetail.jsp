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
			
			table{
				border: 1px solid black;
                width: 700px;
                margin: 0 auto;
			}
			
			div.btn{
				text-align: center;
			}

        </style>
    </head>
    <body>
        
	        <div class="main-logo">
	            <img src="../resources/img/rabbit_logo.png" alt="">
	        </div>
	        <div>
	        	<table>
	        		<tr>
                        <th rowspan="4"><p><img src="${path }" alt="" style="width: 150px; height: 150px;"></p></th>
	        			<th>제목</th>
	        			<td>${saledetail.sale_subject}</td>
	        			<th>거래상태</th>
	        			<td>${tradedetail.trade_state}</td>
	        		</tr>
	        		<tr>
	        			<th rowspan="3">금액</th>
	        			<td rowspan="3">${saledetail.price}</td>
	        		</tr>
                    <tr>
                        <th>판매자</th>
                        <td><a href="판매자프로필" id="">${tradedetail.seller_id}</a></td>
                    </tr>
                    <tr>
                        <th>구매자</th>
                        <td><a href="구매자프로필" id="">${tradedetail.buyer_id}</a></td>
                    </tr>
	        	</table>
	        	<table>
	        		<tr>
	        			<th>거래유형</th>
	        			<td>${tradedetail.trade_type}</td>
	        			<!-- 택배거래시 -->
                        <c:if test="${tradedetail.trade_type eq '택배'}">
                        	<th>운송장번호</th>
                        	<!-- 운송장번호가 없을경우 -->
                        	<c:if test="${tradedetail.tracking_Number eq null}">
                        		<td><a href="tracking_number">운송장번호를 입력해주세요.</a></td>
                        	</c:if>
                        	<!-- 운송장번호가 있을경우 -->
                        	<c:if test="${tradedetail.tracking_Number ne null}">
                        		<td>${tradedetail.tracking_Number}</td>
                        	</c:if>
                        </c:if>
                        <!-- 직거래시 -->
                        <c:if test="${tradedetail.trade_type ne '택배'}">
                        	<th>직거래시간</th>
                        	<td>${tradedetail.trade_time}</td>
                        </c:if>
	        		</tr>
	        	</table>
                <table>
                    <tr>
                        <th>거래시작일</th>
                        <td>${tradedetail.trade_start_date}</td>
                        <th rowspan="2">거래평가여부 이부분 다시해야합니다</th>
                        <c:if test="${tradedetail.seller_manner eq 1}">
	                        <td rowspan="2">Y</td>                        	
                        </c:if>
                        <c:if test="${tradedetail.seller_manner ne 1}">
                        	<td rowspan="2"><a href="구매자평가페이지">N</a></td>
                        </c:if>
                    </tr>
                    <tr>
                        <th>거래종료일</th>
                        <td>${tradedetail.trade_end_date}</td>
                    </tr>
                </table>
	        </div>
	        <br/>
	        <div class="btn">
		    	<input type="button" value="창닫기" onClick="window.close()"/>	        
	        </div>
    </body>
    <script>
    	
    </script>
</html>