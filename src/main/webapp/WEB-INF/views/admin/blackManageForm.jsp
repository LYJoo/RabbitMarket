<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>블랙리스트 등록</title>
		<style>
		</style>
	</head>
	<body>
		<table>
			<tr>
				<td>블랙리스트 등록 사유를 입력해주세요.</td>				
			</tr>
			<tr>
				<td><textarea style="width: 400; height: 200; resize: none;"></textarea></td>
			</tr>
			<tr>
				<td><button onclick="setBlack(${member.member_id})">OK</button></td>
			</tr>
		</table>
	</body>
	<script>
		function setBlack(member_id) {
			$.ajax({
				url:'/admin/updateSetBlack/'+member_id,
				type:'GET',
				data:{},
				dataType:'JSON',
				success:function(data){
					console.log(data.success);
					window.location.reload();
				},
				error:function(e){
					console.log(e);
				}
			});
		}
	</script>
</html>