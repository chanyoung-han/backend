<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>학생 등록</title>
		<style>
			body { font-family: Arial, sans-serif; margin: 20px; }
			.form-container { max-width: 500px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; }
			.form-group { margin-bottom: 15px; }
			label { display: block; margin-bottom: 5px; font-weight: bold; color: #333; }
			input[type="text"], input[type="email"], input[type="date"] {
			width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box;
			}
			.btn { padding: 10px 20px; margin: 5px; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; }
			.btn-submit { background-color: #4CAF50; color: white; }
			.btn-cancel { background-color: #f44336; color: white; }
			.btn:hover { opacity: 0.8; }
			h2 { color: #333; text-align: center; }
		</style>
	</head>
	<body>
		<div class="form-container">
		<h2>학생 등록</h2>
		<form action="${pageContext.request.contextPath}/studentControl/insert" method="post">
				<div class="form-group">
					<label for="username">이름:</label>
					<input type="text" id="username" name="username" required>
				</div>
				<div class="form-group">
					<label for="univ">대학:</label>
					<input type="text" id="univ" name="univ" required>
				</div>
				<div class="form-group">
					<label for="birth">생년월일:</label>
					<input type="date" id="birth" name="birth" required>
				</div>
				<div class="form-group">
					<label for="email">이메일:</label>
					<input type="email" id="email" name="email" required>
				</div>
				<div class="form-group">
					<label for="tel">전화번호:</label>
					<input type="text" id="tel" name="tel" placeholder="010-1234-5678">
				</div>
				<div style="text-align: center; margin-top: 20px;">
					<button type="submit" class="btn btn-submit">등록</button>
					<a href="${pageContext.request.contextPath}/studentControl" class="btn btn-cancel">취소</a>
				</div>
			</form>
		</div>
	</body>
</html>