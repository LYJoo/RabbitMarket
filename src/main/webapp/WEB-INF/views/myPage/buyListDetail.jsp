<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <link rel="stylesheet" type="text/css" href="/resources/css/hwi_css.css">
        <style type="text/css">
			body{
	            margin: 50px 10px;
	            line-height: 1.6
	        }
			table,td,th{
			    border-collapse: collapse;
				border: 1px solid #ccc;
				padding: 10px;
                width: 700px;
                margin: 0 auto;
			}
			
			div.btn{
				text-align: center;
			}

        </style>
    </head>
    <body>
	        <div class="main-logo" style="text-align:center">
	            <img src="/resources/img/rabbit_logo.png" alt="">
	            <h3>거래 상세</h3>
	        </div>
	        <div>
	        	<table>
	        		<tr>
                        <th rowspan="4"><p><img src="/saleFile/${saleFile.newFileName}" alt="" style="width: 150px; height: 150px;overflow: hidden;object-fit: cover;"></p></th>
	        			<th>제목</th>
	        			<td>${saleInfo.sale_subject}</td>
	        			<th>거래상태</th>
	        			<td>${tradeInfo.trade_state}</td>
	        		</tr>
	        		<tr>
	        			<th rowspan="3">금액</th>
	        			<td rowspan="3">${saleInfo.price}</td>
	        		</tr>
                    <tr>
                        <th>판매자</th>
                        <td><a href="" id="sellerProfileA">${tradeInfo.seller_id}</a></td>
                    </tr>
                    <tr>
                        <th>구매자</th>
                        <td><a href="" id="buyerProfileA">${tradeInfo.buyer_id}</a></td>
                    </tr>
	        	</table>
	        	<table>
	        		<tr>
	        			<th>거래유형</th>
	        			<td>${tradeInfo.trade_type}</td>
	        			<!-- 택배거래시 -->
                        <c:if test="${tradeInfo.trade_type eq '택배'}">
                        	<th>운송장번호</th>
                        	<td>
	                        	<!-- 운송장번호가 없을경우 -->
	                        	<c:if test="${tradeInfo.package_company eq null}">
	                        		아직 운송장번호가 없습니다.
	                        	</c:if>
	                        	<!-- 운송장번호가 있을경우 -->
	                        	<c:if test="${tradeInfo.package_company ne null}">
	                        		[${tradeInfo.package_company}]
	                        		${tradeInfo.tracking_number}
	                        	</c:if>
                        	</td>
                        </c:if>
                        <!-- 직거래시 -->
                        <c:if test="${tradeInfo.trade_type ne '택배'}">
                        	<th>직거래시간</th>
                        	<td>${tradeInfo.trade_time}</td>
                        </c:if>
	        		</tr>
	        	</table>
                <table>
                    <tr>
                        <th>거래시작일</th>
                        <td>${tradeInfo.trade_start_date}</td>
                        <th rowspan="2">거래평가여부</th>
                        <c:if test="${tradeInfo.buyer_manner}">
	                        <td rowspan="2">Y</td>                        	
                        </c:if>
                        <c:if test="${!tradeInfo.buyer_manner}">
	                       <c:if test="${tradeInfo.trade_state eq '거래완료'}">
	                        	<td rowspan="2"><a href="#" onclick="openMannerQ();">평가하기</a></td>
	                       </c:if>
	                       <c:if test="${tradeInfo.trade_state eq '거래중'}">
	                        	<td rowspan="2">거래후 평가가능
	                        		<a href="#" onclick="tradeEnd();"> 거래완료하기</a>
	                        	</td>
	                       </c:if>
	                       <c:if test="${tradeInfo.trade_state eq '거래취소'}">
	                        	<td rowspan="2">취소된 거래입니다</td>
	                       </c:if>
                        </c:if>
                        
                    </tr>
                    <tr>
                        <th>거래종료일</th>
                        <td>
                        	${tradeInfo.trade_end_date}
                        </td>
                    </tr>
                </table>
	        </div>
	        <br/>
	        <div class="btn">
		    	<input type="button" value="창닫기" onClick="window.close()"/>	        
	        </div>
    </body>
    <script>
	/*거래 완료하기*/
	function tradeEnd(){
		var idx =${saleInfo.product_idx};
    	$.ajax({
			url:'/sale/tradeEnd'
			,type: 'POST'
			,data:{"product_idx": idx}
			,success:function(data){
				var msg = data.msg;
				if(msg != ""){
					alert(msg);
					window.location.reload();
				}
				if(data.success == 1){
					var trade_idx = data.trade_idx;
					var trade_type = "${tradeInfo.trade_type}";
					alert('거래가 완료되었습니다.');
					if(trade_type == "택배"){
						window.open('/percelSellerEstimation?product_idx='+idx+'&trade_idx='+trade_idx,'percelBuyerEstimation','width=550, height=700, top=100, left=500');				
					}else{
						window.open('/directSellerEstimation?product_idx='+idx+'&trade_idx='+trade_idx,'directBuyerEstimation','width=550, height=700, top=100, left=500');
					}
					window.location.reload();
				}
			},
			error: function(error){
				console.log(error);
			}
		});
	}
    
	/*매너질문 오픈*/
	function openMannerQ(idx){
		var trade_type = '${tradeInfo.trade_type}';
		var idx = ${saleInfo.product_idx};
		var trade_idx = ${tradeInfo.trade_idx};
		if(trade_type === "택배"){
			window.open('/percelSellerEstimation?product_idx='+idx+'&trade_idx='+trade_idx,'percelBuyerEstimation','width=550, height=700, top=100, left=500');				
		}else{
			window.open('/directSellerEstimation?product_idx='+idx+'&trade_idx='+trade_idx,'directBuyerEstimation','width=550, height=700, top=100, left=500');
		}
			window.location.reload();
	}
	
	$('#sellerProfileA').click(function(){
		var me = '${tradeInfo.seller_id}';
		window.open('/myPage/profile?member_id='+me, 'message', 'width=1200, height=800');
	});
	$('#buyerProfileA').click(function(){
		var me = '${tradeInfo.buyer_id}';
		window.open('/myPage/profile?member_id='+me, 'message', 'width=1200, height=800');
	});
	
	
	
    </script>
</html>