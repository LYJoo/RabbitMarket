<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin_mannerquestion</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- lyj_style -->
    <link rel="stylesheet" type="text/css" href="/resources/css/lyj_css.css">
</head>
<body>
    <div id="list_content">
        <div class="flex_box">
            <h2>매너질문관리</h2>
        </div>
        <div class="flex_box2">
            <table id="직거래/구매자" class="mannerq_table">
                <tr>
                    <th><div class="mannerq_type">직거래 | 구매자</div></th>
                </tr>
    	       <tbody ondrop="drop(event)" ondragover="dragEnter(event)">
	        	    <c:forEach items="${directBuyerList}" var="list" varStatus="status">
	                    <tr draggable="true" ondragstart="drag(event)" id="idx${list.manner_idx}" class="order${status.count}">
	                        <td><input type="text" value="${list.manner_content}"/> <a href="./delMannerQ/${list.manner_idx}">X</a></td>
	                    </tr>
	                </c:forEach>
                </tbody>
            </table>
            <table id="직거래/판매자" class="mannerq_table">
                <tr>
                    <th><div class="mannerq_type">직거래 | 판매자</div></th>
                </tr>
                <tbody ondrop="drop(event)" ondragover="dragEnter(event)">
	        	    <c:forEach items="${directSellerList}" var="list" varStatus="status">
	                    <tr draggable="true" ondragstart="drag(event)" id="idx${list.manner_idx}" class="order${status.count}">
	                        <td><input type="text" value="${list.manner_content}"/> <a href="./delMannerQ/${list.manner_idx}">X</a></td>
	                    </tr>
	                </c:forEach>
                </tbody>
            </table>
            <table id="택배/구매자" class="mannerq_table">
                <tr>
                    <th><div class="mannerq_type">택배 | 구매자</div></th>
                </tr>
                <tbody ondrop="drop(event)" ondragover="dragEnter(event)">
	        	    <c:forEach items="${deliveryBuyerList}" var="list" varStatus="status">
	                    <tr draggable="true" ondragstart="drag(event)" id="idx${list.manner_idx}" class="order${status.count}">
	                        <td><input type="text" value="${list.manner_content}"/> <a href="./delMannerQ/${list.manner_idx}">X</a></td>
	                    </tr>
	                </c:forEach>
                </tbody>
            </table>
            <table id="택배/판매자" class="mannerq_table">
                <tr>
                    <th><div class="mannerq_type">택배 | 판매자</div></th>
                </tr>
                <tbody ondrop="drop(event)" ondragover="dragEnter(event)">
	        	    <c:forEach items="${deliverySellerList}" var="list" varStatus="status">
	                    <tr draggable="true" ondragstart="drag(event)" id="idx${list.manner_idx}" class="order${status.count}">
	                        <td><input type="text" value="${list.manner_content}"/> <a href="./delMannerQ/${list.manner_idx}">X</a></td>
	                    </tr>
	                </c:forEach>
                </tbody>
            </table>
        </div>
        <div id="mannerq_input_box">
            <p>질문 등록하기(각 항목 당 5개 까지만 가능합니다!)</p>
            <form action="./writeMannerQ" method="post" onsubmit="return check()">
                <select name="trade_type" id="trade_type">
                    <option value="">거래방법</option>
                    <option value="직거래">직거래</option>
                    <option value="택배">택배</option>
                </select>
                <select name="target" id="target">
                    <option value="">질문대상자</option>
                    <option value="구매자">구매자</option>
                    <option value="판매자">판매자</option>
                </select>
                <input type="text" id="content" placeholder="질문을 입력하세요."
                    name="manner_content" value=""/>
                <button>등록</button>
            </form>
        </div>
    </div>
</body>
</html>
<script>
    /*form submit 제어*/
    function check(){
        if($('#trade_type').val()==""){
            alert("거래방법을 선택하세요!");
            $('#trade_type').focus();
            return false;
        } else if($('#target').val()==""){
            alert("대상자를 선택하세요!");
            $('#target').focus();
            return false;
        } else if($('#content').val().trim()==""){
            alert("질문을 입력하세요!");
            $('#content').focus();
            return false;
        }
        return true;
    }
    /*글자수제한*/
    $('#content').on('keyup', function() {
        checkLength($(this), 200);
    });
    function checkLength(obj,len){
        if(obj.val().length > len){
            obj.val(obj.val().substring(0, len));
            alert(len+" 자 이상 입력불가");
        }
    }

    /*드래그 앤 드롭*/
    function dragEnter(ev) {
        ev.preventDefault();
    }

    function drag(ev) {
        ev.dataTransfer.setData("trId", ev.target.id);
        ev.dataTransfer.setData("trClassName", ev.target.className);  
        ev.dataTransfer.setData("tableId", ev.target.closest('table').id);      
    }

    function drop(ev) {
        ev.preventDefault();
        var idx = ev.dataTransfer.getData("trId");//이동 id
        var drag_order = ev.dataTransfer.getData("trClassName").substring(5);//이동 class - 순서
        var drag_table_id = ev.dataTransfer.getData("tableId");//이동해 온 테이블 id

        var target_tr = ev.target.closest('tr');//타겟 tr
        var target_table_id = target_tr.closest('table').id;//타겟 테이블 id
        var target_order = target_tr.className.substring(5);//타겟 class - 순서
        var target_table_tr = target_tr.closest('table').getElementsByTagName('tr');//타겟 table_tr들
        
        if(target_table_tr.length == 6 && target_table_id !== drag_table_id){
            alert("5 개 이상 추가 불가");
        } else{

            if(target_order >= drag_order){//타겟 테이블로 이동 view
                target_tr.after(document.getElementById(idx));
            } else{
                target_tr.before(document.getElementById(idx));
            }

            var trade_type = "";
            var target = "";
            if(target_table_id !== drag_table_id){
                console.log(drag_table_id+"->"+target_table_id);
                trade_type = target_table_id.substring(0, target_table_id.indexOf("/"));
                target = target_table_id.substring(target_table_id.indexOf("/")+1);
                console.log("변경:"+trade_type+"/"+target);
            }

            for(var i=1;i<=target_table_tr.length;i++){//순서재정렬
                target_table_tr[i].className="order"+i;
                var manner_idx = target_table_tr[i].id.substring(3);
                var look_order = target_table_tr[i].className.substring(5);
                console.log("변경idx:"+manner_idx+"/순서:"+look_order);
                /*ajax : 순서 업데이트 : 거래 방식이 달라 졌다면 변경*/
                var params = {
				                        "manner_idx":manner_idx
				                        ,"trade_type":trade_type
				                        ,"target":target
				                        ,"look_order":look_order
				                    }
                $.ajax({
                    url:'./updateMannerQ'
                    ,contentType: "application/json; charset=UTF-8"
                    ,type:'post'
                    ,data:JSON.stringify(params)
                    ,dataType:'JSON'
                    ,success:function(data){
                        console.log(data);
                    }
                    ,error:function(error){
                        console.log(error);
                        alert('수정에 실패 했습니다.'+i);
                    }
                });
            }

        }
    }

    /* 수정 ajax */
    $("input[type='text']").focusout(function(e){
        //만약에 값의 변경이 없다면 수정은 요청되지 않는다.
        var defaultVal = $(this).prop("defaultValue");
        console.log($(this).val()+ "==" +defaultVal);
        if($(this).val()!=defaultVal){
            console.log("수정요청 : " + $(this)[0]);
            reqUpdate($(this)[0]);
        }
    });

    function reqUpdate(elem){
        //UPDATE  MannerQuestion SET  manner_content = '' WHERE manner_idx = ;
        //필요한정보??? -> 어떤 컬럼을 어떤 값으로 변경?
        var manner_idx = elem.closest('tr').id.substring(3);
        var val = elem.value;
        console.log("변경 : "+manner_idx+"/"+val);
        
        var params = {
			                "manner_idx":manner_idx
			                ,"manner_content":val
							}
        
        $.ajax({
            url:'./updateMannerQ'
            ,contentType: "application/json; charset=UTF-8"
            ,type:'post'
            ,data:JSON.stringify(params)
            ,dataType:'JSON'
            ,success:function(data){
                console.log(data);
                elem.defaultValue=elem.value;//defaultValue 수정
            }
            ,error:function(error){
                console.log(error);
                alert('수정에 실패 했습니다.');
                elem.value = elem.defaultValue;//이전 값으로 복원
            }
        });
        
    }
    
</script>