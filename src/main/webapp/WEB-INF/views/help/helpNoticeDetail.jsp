<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>help_notice_detail</title>
    <!-- lyj_style -->
    <link rel="stylesheet" type="text/css" href="/resources/css/lyj_css.css">
    <style>
    	#body_content{
    		padding-top: 60px;
    		padding-left: 100px;
    	}
    
    
    </style>
</head>
<body>
	<jsp:include page="../include/topNavigation.jsp"></jsp:include>
	<jsp:include page="../include/helpNavigation.jsp" flush="true"></jsp:include>
	
    <div id="body_content">
        <div class="flex_box">
            <h2>공지사항</h2>
        </div>
        <table id="other_table">
            <tr>
                <th>제목</th>
                <td>
                    ${dto.subject}
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
                <th>내용</th>
                <td id="content_td">${dto.content}</td>
            </tr>
            <tr>
                <th colspan="2" id="btn_area">
                    <button onclick="location.href='/help/noticeMain'" class="btn">목록으로</button>
                </th>
            </tr>
        </table>
    </div>
</body>
</html>