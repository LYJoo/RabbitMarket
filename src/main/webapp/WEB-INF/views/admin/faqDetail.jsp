<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin_faq_detail</title>
    <!-- lyj_style -->
    <link rel="stylesheet" type="text/css" href="/resources/css/lyj_css.css">
    <style></style>
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
            <h2>자주묻는질문</h2>
            <span>상세보기</span>
        </div>
        <table id="other_table">
            <tr>
                <th>질문</th>
                <td>
                    ${dto.fq_question}
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
                <td id="content_td">${dto.fq_answer}</td>
            </tr>
            <tr>
                <th colspan="2" id="btn_area">
                    <button onclick="location.href='/admin/updateFormFaq/${dto.frequently_idx}'" class="btn">수정하기</button>
                    <button onclick="location.href='/admin/callFaqList'" class="btn">목록으로</button>
                </th>
            </tr>
        </table>
    </div>
    </div>
</body>
</html>