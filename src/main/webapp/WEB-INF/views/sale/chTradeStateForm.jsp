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
            <img src="resources/img/rabbit.jpg"/>
        </div>
    </div>


    
    <div>
        <label for="buyer_id">거래자ID</label>
    </div>
    <div>
        <input type="text" id="buyer_id" name="buyer_id"/>
    </div>

    <span id="id_check_space"></span>

    <p>최근 쪽지 받은 회원</p>
    <table>
    
        <tr>
            <th>순번</th>
            <th>회원 ID</th>
        </tr>
        
        <tr>
	            <td>1</td>
	            
	             <td><a href="#">lololo</a></td>
        </tr>
        
        <tr>
	            <td>2</td>
	            
	            <td><a href="#">lololo</a></td>
        </tr>
        
        <tr>
            <td>3</td>
             <td><a href="#">lololo</a></td>
        </tr>
        <tr>
            <td>4</td>
             <td><a href="#">lololo</a></td>
        </tr>
        <tr>
            <td>5</td>
             <td><a href="#">lololo</a></td>
        </tr>
    </table>

    <p>거래방식</p>
    <div>
        <input type="radio" name="trade_type" value="택배"/> 택배
        <input type="radio" name="trade_type" value="직거래"/> 직거래
    </div>

    <div class="trade_state_change_btn_cover">
        <div class="trade_state_change_btn">
        변경
        </div>
        <div class="trade_state_change_btn">
        취소
        </div>
    </div>  
</div>
</body>
</html>