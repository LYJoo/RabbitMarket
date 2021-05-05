<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>help_question_answer</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- lyj_style -->
    <link rel="stylesheet" type="text/css" href="/resources/css/lyj_css.css">
    <style></style>
</head>
<body>
	<jsp:include page="../include/topNavigation.jsp"></jsp:include>
	<jsp:include page="../include/helpNavigation.jsp" flush="true"></jsp:include>
	
    <div id="body_content">
        <div class="flex_box">
            <h2>1:1문의하기</h2>
            <span>답변하기</span>
            
        </div>
        <form action="../anwerQ" method="post" onsubmit="return check();" name="form">
            <table id="other_table">
                <tr>
                    <th>문의제목</th>
                    <td>${dto.subject}</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${dto.member_id}</td>
                </tr>
                <tr>
                    <th>문의내용</th>
                    <td style="white-space: pre-line;">${dto.content}</td>
                </tr>
                <tr>
                    <th>대답</th>
                    <td id="content_td"><textarea id="content" cols="100" rows="20"
                        name="answer"></textarea></td>
                </tr>
                <tr>
                    <th>답변자</th>
                    <td>
                        ${sessionScope.adminId}
                        <input type="hidden" id="admin_id"
                            name="admin_id" value="${sessionScope.adminId}" readonly/>
                    </td>
                </tr>
                <tr>
                    <th colspan="2" id="btn_area">
                    	<input type="hidden" name="question_idx" value="${dto.question_idx}" readonly/>
                        <button class="btn">답변</button>
                    </th>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
<script>
    /*form submit 제어*/
    function check(){
        if($('#admin_id').val().trim()==""){
            alert("작성자가 없어요!");
            return false;
        } else if($('#content').val().trim()==""){
            alert("답변을 입력하세요!");
            $('#content').focus();
            return false;
        }
        return true;
    }
    /*글자수제한*/
    $('#content').on('keyup', function() {
        checkLength($(this), 1000);
    });
    function checkLength(obj,len){
        if(obj.val().length > len){
            obj.val(obj.val().substring(0, len));
            alert(len+" 자 이상 입력불가");
        }
    }
</script>