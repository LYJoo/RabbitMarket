<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>직거래시간 입력</title>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <style>
    .enter_meet_date_title_cover{
        width: 100%;
        display: flex;
        align-items: center;
        font-weight: 600;
        font-size: 20px;
    }

    .enter_meet_date_title{
        margin-left: 40px;
    }

    .meet_date_btn_cover{
        align-content: center;
    }

    .meet_date_btn{
        width: 40px;
        background-color: #F79646;
        padding: 5px;
        border-radius: 3px;
        cursor: pointer;
        color: white;
        font-weight: 600;
        text-align: center;
        margin: 30px;
        display: inline-block;
    }

    .outer_cover{
        width: 400px;
        border: 1px solid #F79646;
        margin: auto;
        padding: 20px;
        text-align: center;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);
    }
    
    img{
        width: 100px;
        margin-bottom: 30px;
    }

    input[type='date'],
    input[type='time']{
        border: 1px solid #F79646;
        outline: none;
        height: 30px;
        border-radius: 3px;
        margin: 0 10px;
    }
    

</style>
</head>
<body>
	<div>
		<div class="outer_cover">
		    <div class="enter_meet_date_title_cover">
		        <div class="enter_meet_date_title">
		            <img src="/resources/img/rabbit.jpg"/>
		        </div>
		        <div class="enter_meet_date_title">
		            <p>직거래 시간 입력</p>
		        </div>
		    </div>
		    <div>
		        <input id="date" type="date">
		        <input id="time" type="time">
		    </div>
		
		    <div class="meet_date_btn_cover">
		        <div class="meet_date_btn" onclick="enterMeetTime()">
		        등록
		        </div>
		    </div>  
		</div>
	</div>
</body>
<script>
    function enterMeetTime() {
        var date = $('#date').val();
        var time = $('#time').val();
		var meetDate2 = date + " " +  time;
		console.log(meetDate2);
        
        if(date == '' || time == ''){
            alert('날짜와 시간 모두 입력해주세요.')
        }else{
            var dateArray = date.split('-');
            var timeArray = time.split(':');   

            var nowDate = new Date();
            var meetDate = new Date(dateArray[0], dateArray[1]-1, dateArray[2], timeArray[0], timeArray[1]);
            
            if(nowDate.getTime() > meetDate.getTime()){
                alert('현재 시간보다 이후를 지정해주세요.');
            }else{
                var ok = confirm(meetDate+" 해당시각으로 등록하시겠습니까?");
                if(ok){
                	var trade_idx = "${trade_idx}";
                	$.ajax({
            			url:'/sale/setMeetDate'
            			,type: 'POST'
            			,data:{"trade_idx": trade_idx
            				,"meetDate":meetDate2}
            			,success:function(data){
            				if(data.success == 1){
            					alert('직거래시간이 등록되었습니다.');
            					opener.parent.parent.location.reload();
            					self.close();
            				}else{
            					alert('직거래 시간등록에 실패했습니다. 잠시후 다시 시도해주세요.');
            				}
            			},
            			error: function(error){
            				
            			}
            		});
                }
            }
        }    
    }
</script>
</html>