<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin_faq_update</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- lyj_style -->
    <link rel="stylesheet" type="text/css" href="/resources/css/lyj_css.css">
    <style>
    </style>
</head>
<body>
    <div id="body_content">
        <div class="flex_box">
            <h2>자주묻는질문</h2>
            <span>수정하기</span>
        </div>
        <form action="/admin/updateFaq" method="POST" onsubmit="return check()" name="form">
            <table id="other_table">
                <tr>
                    <th>질문</th>
                    <td>
                        <input type="text" id="subject" placeholder="제목을 입력하세요." 
                            name="fq_question" value="${dto.fq_question}"/>
                    </td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${dto.admin_id}</td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>${dto.reg_date}</td>
                </tr>
                <tr>
                    <th>대답</th>
                    <td id="content_td"><textarea id="content" cols="100" rows="20"
                        name="fq_answer">${dto.fq_answer}</textarea></td>
                </tr>
                <tr>
                    <th colspan="2" id="btn_area">
                        <input type="hidden" name="frequently_idx" value="${dto.frequently_idx}"/>
                        <button class="btn">수정</button>
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
        if($('#subject').val().trim()==""){
            alert("제목을 입력하세요!");
            $('#subject').focus();
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
        checkLength($(this), 200);
    });
    $('#content').on('keyup', function() {
        checkLength($(this), 1500);
    });
    function checkLength(obj,len){
        if(obj.val().length > len){
            obj.val(obj.val().substring(0, len));
            alert(len+" 자 이상 입력불가");
        }
    }
</script>