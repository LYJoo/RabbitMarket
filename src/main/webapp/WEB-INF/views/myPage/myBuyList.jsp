<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MySaleList</title>
		<!-- 제이쿼리(부트스트랩보다 위에있어야함) -->
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<!-- 반응형 디자인을 위한 CSS/JS 라이브러리 -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
		<!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야 함) -->
		<script src="/resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
		<style>
            table{
                width: 80%;
                border-collapse: separate;
                border-spacing: 1px;
                text-align: center;
                line-height: 1.5;
                border-top: 1px solid #ccc;
                margin : 10px 0px;
			}
			table th{
                padding: 10px;
                font-weight: bold;
                text-align: center;
                vertical-align: center;
                border-bottom: 1px solid #ccc;
            }
            table td{
                padding: 10px;
                vertical-align: center;
                border-bottom: 1px solid #ccc;
            }
			.rightLine{
                border-right: 1px solid #ccc;
            }
		</style>
	</head>
	<body>
		<jsp:include page="../include/topNavigation.jsp"></jsp:include>
        <jsp:include page="../include/myPageNavigation.jsp"></jsp:include>

        <div class="our_content_area">
        	<select id="sale_select_state" name="sale_select" onchange="selectState()">
                <option value="전체" selected>전체</option>
                <option value="거래중">거래중</option>
                <option value="거래완료">거래완료</option>
                <option value="거래취소">거래취소</option>
            </select>
            <table>
                <thead>
                    <tr>
                        <th colspan="2" class="rightLine">구매글</th>
                        <th colspan="2" class="rightLine">구매상태</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody id="list">
                    <!-- 불러온 데이터 뿌리는 영역 -->
                    
                </tbody>
                <tr>
                    <td id="paging" colspan="5">  
                        <!-- 플러그인 사용 -->
                        <div class="container">
                            <nav aria-label="page navigation" style="text-align:center">
                                <ul class = "pagination" id="pagination"></ul>
                            </nav>
                        </div>
                        <!-- 플러그인 사용 -->
                    </td>
                </tr>
            </table>
        </div>
	</body>
	<script>
	jQuery.noConflict();
	
	var showPage = 1;
    var pagePerNum = 10;//몇개를 보여줄 것인지
	
	listCall('전체', showPage);//시작하자마자 이 함수를 호출
	
	function selectState() {
		var selectedState = $('#sale_select_state').val();
		listCall(selectedState, showPage);//시작하자마자 이 함수를 호출
	}
	
	function listCall(selectedState, reqPage){
		$.ajax({
			url:'./myBuyList/'+selectedState+'/'+reqPage,
			Type:'GET',
			data:{},
			dataType:'JSON',
			success:function(data){
				console.log(data.myBuyList);
				showPage = data.currPage;
				listPrint(data.myBuyList);
				//플러그인 사용
				$("#pagination").twbsPagination({//옵션들이 들어감
					startPage:data.currPage,//시작페이지
					totalPages:data.range,//생성 가능 최대 페이지
					visiblePages:5,//5개씩 보여주겠다 (1~5)
					onPageClick:function(evt,page){//각 페이지를 눌렀을 경우
						listCall(page);
					}
				});
			},
			error:function(error){
				console.log(error);
			}
		});
		
	}
	
	function listPrint(list){
		var content="";

		for(var i=0;i<list.length;i++){
			content += "<tr>";
			content += '<td><p><img src="/saleImg/'+list[i].saleFileDto.newFileName+'" alt="" style="width: 150px; height: 150px;"></p></td>';
			content += '<td class="rightLine">['+list[i].trade_idx+']'+list[i].saleDto.sale_subject+'</td>';
			content += '<td><select id="sale_select" name="sale_select" onchange="">';
			if(list[i].trade_state == '거래취소'){
				content += '<option value="거래중">거래중</option><option value="거래완료">거래완료</option><option value="거래취소" selected>거래취소</option>';
			}else if (list[i].trade_state == '거래중'){
				content += '<option value="거래중" selected>거래중</option><option value="거래완료">거래완료</option><option value="거래취소">거래취소</option>';
			}else if(list[i].trade_state == '거래완료'){
				content += '<option value="거래중">거래중</option><option value="거래완료" selected>거래완료</option><option value="거래취소">거래취소</option>';
			}
			content += '</select></td>';
			content += "<td class="rightLine"><a href='#' onclick='Opendetail("+list[i].saleDto.product_idx+")'>거래상세보기</a></td>";
			content += '<td>'+list[i].trade_start_date+'</td>';
			content += "</tr>";
		}
		$("#list").empty();
		$("#list").append(content);
	}
	
	/*거래상세보기 오픈*/
	function Opendetail(idx){
		window.open('/myPage/buylistdetail/'+idx, 'salelistdetail', 'width=1000, height=1000');
	}
	
    function selectChage2(e,idx) {
    	if(e == '거래취소'){
    		$.ajax({
    			url:'/sale/tradeCancel'
    			,type: 'GET'
    			,data:{"product_idx": idx}
    			,success:function(data){
    				var ok = confirm(data.buyer_id+'님과의 거래를 취소하시겠습니까?');
    				if(ok){
    					window.open('/sale/tradeCancelReason?product_idx='+idx,'tradeCancel','width=550, height=550, top=100, left=500');
    				}else{
    					window.location.reload();
    				}
    			},
    			error: function(error){
    				console.log(error);
    			}
    		});
        }
        else if(e == '거래완료'){
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
    					alert('거래가 완료되었습니다.');
    					window.open('/sale/directBuyerEstimation?product_idx='+idx+'&trade_idx='+trade_idx,'directBuyerEstimation','width=550, height=700, top=100, left=500');
    					window.location.reload();
    				}
    			},
    			error: function(error){
    				console.log(error);
    			}
    		});
        }
    }
	
	
	</script>
</html>