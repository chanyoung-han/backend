<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>계산 결과</title>
		<style>
			body {
				font-family: Arial, sans-serif;
				max-width: 500px;
				margin: 50px auto;
				padding: 20px;
			}
			h2 {
				color: #333;
			}
			.result {
				font-size: 24px;
				color: #4CAF50;
				font-weight: bold;
				margin: 20px 0;
			}
			a {
				display: inline-block;
				margin-top: 20px;
				padding: 10px 20px;
				background-color: #2196F3;
				color: white;
				text-decoration: none;
				border-radius: 4px;
			}
			a:hover {
				background-color: #0b7dda;
			}
			</style>
	</head>
	<body>
		<h2>계산 결과 (Spring Boot)</h2>
		<hr>
		<div class="result">
			결과: ${result}
		</div>
			<a href="/ch08/calcForm.html">다시 계산하기</a>
	        <a href="/mainStart">메인 페이지로 이동</a>
		</hr>
	</body>
</html>