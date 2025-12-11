<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>학생 정보 수정</title>
		<style>
			body { font-family: Arial, sans-serif; margin: 20px; }
			.form-container { max-width: 500px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; background-color: #f9f9f9;}
			.form-group { margin-bottom: 15px; }
			label { display: block; margin-bottom: 5px; font-weight: bold; color: #333; }
			input[type="text"], input[type="email"], input[type="date"] {width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box;}
			input[readonly] { background-color: #e9ecef; cursor: not-allowed; }
			.btn { padding: 10px 20px; margin: 5px; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; text-decoration: none; display: inline-block;}
			.btn-update { background-color: #4CAF50; color: white; }
			.btn-cancel { background-color: #6c757d; color: white; }
			.btn:hover { opacity: 0.8; }
			h2 { color: #333; text-align: center; }
			.info-text { color: #666; font-size: 12px; margin-top: 5px; }
		</style>
	</head>
	<body>
		<div class="form-container">
		<h2>학생 정보 수정</h2>
		<form action="${pageContext.request.contextPath}/studentControl/update" method="post">
				<!-- ID는 hidden으로 전달 -->
				<input type="hidden" name="id" value="${student.id}">
				<div class="form-group">
					<label for="id">ID:</label>
					<input type="text" id="id" value="${student.id}" readonly>
					<p class="info-text">* ID는 수정할 수 없습니다.</p>
				</div>
				<div class="form-group">
					<label for="username">이름:</label>
					<input type="text" id="username" name="username" value="${student.username}" required>
				</div>
				<div class="form-group">
					<label for="univ">대학:</label>
					<input type="text" id="univ" name="univ" value="${student.univ}" required>
				</div>
				<div class="form-group">
					<label for="birth">생년월일:</label>
					<fmt:formatDate value="${student.birth}" pattern="yyyy-MM-dd" var="formattedBirth"/>
					<input type="date" id="birth" name="birth" value="${formattedBirth}" required>
				</div>
				<div class="form-group">
					<label for="email">이메일:</label>
					<input type="email" id="email" name="email" value="${student.email}" required>
				</div>
				<div class="form-group">
					<label for="tel">전화번호:</label>
					<input type="text" id="tel" name="tel" value="${student.tel}" placeholder="010-1234-5678">
				</div>
				<div style="text-align: center; margin-top: 20px;">
					<button type="submit" class="btn btn-update">수정</button>
					<a href="${pageContext.request.contextPath}/studentControl" class="btn btn-cancel">취소</a>
				</div>
			</form>
		</div>
	</body>
</html>