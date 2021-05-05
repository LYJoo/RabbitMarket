<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <title>거래중으로 거래상태 변경</title>
    <style>
        p{
            margin: 8px 0;
        }

        table{
            text-align: center;
            width: 100%;
            margin: auto;
        }

        table,td,th{
            border-top: 1px solid #F79646;
            border-bottom: 1px solid #F79646;
            border-collapse: collapse;
        }
        td,th{
            padding: 10px 0;
        }

        table{
            border-bottom: 2px solid #F79646;
        }

        th{
            border-top: 2px solid #F79646;
            border-bottom: 2px solid #F79646;
        }
        .trade_state_change_btn_cover{
            width: 100%;
            text-align: center;
        }

        .trade_state_change_btn{
            width: 40px;
            background-color: #F79646;
            padding: 5px;
            border-radius: 3px;
            cursor: pointer;
            color: white;
            font-weight: 600;
            text-align: center;
            margin: 15px;
            display: inline-block;
        }

        .outer_cover{
            width: 350px;
            border: 1px solid #F79646;
            margin: auto;
            padding: 20px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
        }

        p,label{
            font-weight: 600;
        }

        img{
            width: 100px;
        }

        .trade_state_title_cover{
            width: 100%;
            display: flex;
            align-items: center;
            font-weight: 600;
            font-size: 20px;
        }

        .tarade_state_title{
            margin-left: 9px;
        }

        input[type='text']{
            margin-bottom: 10px;
            border: 1px solid #F79646;
            height: 20px;
            outline: none;
        }
	
		a:hover,
    	a:link,
   		a:active,
    	a:visited{
        	text-decoration: none;
        	color: black;
    	}
    
    </style>
</head>
<div class="outer_cover">
    <div class="trade_state_title_cover">
        <div class="tarade_state_title">
            <h4>거래중으로 판매상태 변경</h4>
        </div>
        <div class="tarade_state_title">
            <img src="/resources/img/rabbit.jpg"/>
        </div>
    </div>


    
    <div>
        <label for="buyer_id">거래자ID</label>
    </div>
    <div>
        <input type="text" id="buyer_id" name="buyer_id"/>
    </div>

    <span id="id_check_space"></span>

    <p>거래방식</p>
    <div>
        <input type="radio" name="trade_type" value="택배"/> 택배
        <input type="radio" name="trade_type" value="직거래"/> 직거래
    </div>

    <div class="trade_state_change_btn_cover">
        <div class="trade_state_change_btn" onclick="change()">
        변경
        </div>
        <div class="trade_state_change_btn" onclick="cancel()">
        취소
        </div>
    </div>  
</div>
</body>
<script>
function cancel(){
	var cancelCheck = confirm('정말 취소하시겠습니까?');
	if(cancelCheck){
		opener.$("#trade_state_select_box1 option:eq(0)").prop('selected', 'selected').change();
		self.close();
	}
}

function change(){
	var trade_type = $('input[name="trade_type"]:checked').val();
	var id = $("#buyer_id").val();
	var idx = "${idx}";
	console.log(trade_type + id);
	
	if(id == "" || trade_type == null){
		alert("빈칸없이 입력해주세요.");
	}else{
		$.ajax({
			url:'/sale/changeIng'
			,type: 'POST'
			,data:{"trade_type": trade_type
				,"id":id
				,"idx": idx}
			,success:function(data){
				if(data.existId == 0){
					$("#id_check_space").html('존재하지 않는 회원입니다.');
				}else if(data.success == 1){
					if(trade_type == '직거래'){
						location.href='/sale/enterMeetDate?trade_idx='+data.trade_idx
					}else{
						location.href='/sale/packageAlarm'
					}
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