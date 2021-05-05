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
            <h2>판매 카테고리 관리</h2>
        </div>
        <div id="category_list_box">
        	<p style="color: lightcoral;"> &nbsp;번호 | 카테고리명 | 삭제</p>
       	    <c:forEach items="${saleCategoryList}" var="list" varStatus="status">
	            <div class="category_box">
	            	&nbsp;${list.s_category_idx}
	                |
	                <input type="text" class="s_category_name" id="idx${list.s_category_idx}"
	                    name="s_category_name" value="${list.s_category_name}"/>
	                |&nbsp;&nbsp;
	                <a href="./delSaleCategory/${list.s_category_idx}">X</a>
	                &nbsp;
	            </div>
	        </c:forEach>
        </div>
        <div id="mannerq_input_box">
            <p>카테고리 등록하기</p>
            <form action="./writeSaleCategory" method="post" onsubmit="return check()">
                <input type="text" id="s_category_idx" placeholder="카테고리번호"
                    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                    name="s_category_idx" value=""/>
                <input type="text" id="s_category_name" placeholder="추가할 카테고리 명을 입력하세요."
                    name="s_category_name" value=""/>
                <button>등록</button>
            </form>
        </div>
    </div>
</body>
</html>
<script>
    /*form submit 제어*/
    function check(){
        if($('#s_category_idx').val().trim()==""){
            alert("카테고리번호를 입력하세요!");
            $('#s_category_idx').focus();
            return false;
        } else if($('#s_category_name').val().trim()==""){
            alert("카테고리 명을 입력하세요!");
            $('#s_category_name').focus();
            return false;
        }
        return true;
    }
    /*글자수제한*/
    $('#s_category_idx').on('keyup', function() {
        checkLength($(this), 3);
    });
    $('#s_category_name').on('keyup', function() {
        checkLength($(this), 20);
    });
    function checkLength(obj,len){
        if(obj.val().length > len){
            obj.val(obj.val().substring(0, len));
            alert(len+" 자 이상 입력불가");
        }
    }

    /* 수정 ajax */
    $(".s_category_name").focusout(function(e){
        //만약에 값의 변경이 없다면 수정은 요청되지 않는다.
        var defaultVal = $(this).prop("defaultValue");
        console.log($(this).val()+ "==" +defaultVal);
        if($(this).val()!=defaultVal){
            console.log("수정요청 : " + $(this)[0]);
            reqUpdate($(this)[0]);
        }
    });

    function reqUpdate(elem){
        //필요한정보??? -> 어떤 컬럼을 어떤 값으로 변경?
        var s_category_idx = elem.id.substring(3);
        var val = elem.value;
        console.log("변경 : "+s_category_idx+"/"+val);

        var params = {
                "s_category_idx":s_category_idx
                ,"s_category_name":val
				}
        $.ajax({
            url:'./updateSaleCategory'
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