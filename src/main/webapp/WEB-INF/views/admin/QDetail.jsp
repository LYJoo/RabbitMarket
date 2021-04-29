<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin_question_detail</title>
    <!-- lyj_style -->
    <link rel="stylesheet" type="text/css" href="/resources/css/lyj_css.css">
    <style></style>
</head>
<body>
    <div id="body_content">
        <div class="flex_box">
            <h2>1:1문의하기</h2>
            <span>상세보기</span>
        </div>
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
                <td style="white-space: pre-line;">${dto.answer}</td>
            </tr>
            <tr>
                <th>답변자</th>
                <td>${dto.admin_id}</td>
            </tr>
            <tr>
                <th colspan="2" id="btn_area">
                    <button onclick="location.href='/admin/callQList'" class="btn">목록으로</button>
                </th>
            </tr>
        </table>
    </div>
</body>
</html>