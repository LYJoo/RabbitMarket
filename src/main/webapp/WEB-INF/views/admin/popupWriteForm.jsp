<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin_popup_write</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- lyj_style -->
    <link rel="stylesheet" type="text/css" href="/resources/css/lyj_css.css">
</head>
<body>
	<div id="top_navi_contain_box">
		<jsp:include page="../include/topNavigation.jsp"></jsp:include>
	</div>
	<div id="side_bar_contain_box">
	<div style="display: contents;">
		<jsp:include page="../include/adminNavigation.jsp"></jsp:include>
	</div>
    <div id="body_content">
        <div class="flex_box">
            <h2>팝업관리</h2>
            <span>등록하기</span>
        </div>
        <form action="./writePopup" method="post" onsubmit="return check();" name="form">
            <table id="other_table">
                <tr>
                    <th>제목</th>
                    <td>
                        <input type="text" id="subject" placeholder="제목을 입력하세요." 
                            name="popup_subject" value=""/>
                    </td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>
                        ${sessionScope.adminId}
                        <input type="hidden" id="admin_id"
                            name="admin_id" value="${sessionScope.adminId}" readonly/>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td id="content_td"><textarea id="content" cols="100" rows="20"
                        name="popup_content"></textarea></td>
                </tr>
                <tr>
                    <th>노출여부</th>
                    <td>
                        <input type='radio' name='islook' value='1'>Y
                        <input type='radio' name='islook' value='0' checked>N
                    </td>
                </tr>
                <tr>
                    <th colspan="2" id="btn_area">
                        <button class="btn">등록</button>
                    </th>
                </tr>
            </table>
        </form>
    </div>
    </div>
</body>
</html>
<script>
    /*form submit 제어*/
    function check(){
        if($('#subject').val().trim()==""){
            alert("제목을 입력하세요!");
            $('#subject').focus();
            return false;
        } else if($('#admin_id').val().trim()==""){
            alert("작성자가 없어요!");
            return false;
        } else if($('#content').val().trim()==""){
            alert("내용을 입력하세요!");
            $('#content').focus();
            return false;
        }
        return true;
    }
    /*글자수제한*/
    $('#subject').on('keyup', function() {
        checkLength($(this), 100);
    });
    $('#content').on('keyup', function() {
        checkLength($(this), 500);
    });
    function checkLength(obj,len){
        if(obj.val().length > len){
            obj.val(obj.val().substring(0, len));
            alert(len+" 자 이상 입력불가");
        }
    }
</script>