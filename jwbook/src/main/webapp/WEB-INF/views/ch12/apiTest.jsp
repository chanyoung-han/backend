<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>REST API 테스트</title>
	</head>
	<body>
		<h2>REST API 테스트 페이지</h2>
		
		<hr>
		<!-- Test API -->
		<div>
			<h3>1. Test API</h3>
			<button onclick="testGetApi()">GET Test</button>
			<br> <br> <input type="text" id="testMsg" placeholder="메시지 입력">
			<button onclick="testPostApi()">POST Test</button>
			<div id="testResult"></div>
		</div>
	
		<hr>
		<!-- News API -->
		<div>
			<h3>2. News API</h3>
			<button onclick="getAllNews()">모든 뉴스 조회 (GET)</button>
			<br> <br> <input type="number" id="newsId" placeholder="뉴스 ID">
			<button onclick="getNewsById()">특정 뉴스 조회 (GET)</button>
			<hr>
			<h4>뉴스 추가 (POST)</h4>
			<input type="text" id="newsTitle" placeholder="제목"><br> 
			<input type="text" id="newsImg" placeholder="이미지 경로"><br>
			<textarea id="newsContent" placeholder="내용"></textarea>
			<br>
			<button onclick="addNews()">뉴스 추가</button>
			<hr>
			<input type="number" id="deleteNewsId" placeholder="삭제할 뉴스 ID">
			<button onclick="deleteNews()">뉴스 삭제 (DELETE)</button>
			<div id="newsResult"></div>
		</div>
		<hr>
		<a href="/mainStart">메인 페이지로 이동</a>
		<script>
			// Test API - GET
			function testGetApi() {
				fetch('/api/test')
				.then(response => response.text())
				.then(data => { document.getElementById('testResult').innerHTML = 'Response: ' + data; })
				.catch(error => { document.getElementById('testResult').innerHTML = 'Error: ' + error; });
			}
			// Test API - POST
			function testPostApi() {
				const msg = document.getElementById('testMsg').value;
				fetch('/api/test?msg=' + encodeURIComponent(msg), { method: 'POST' })
				.then(response => response.text())
				.then(data => { document.getElementById('testResult').innerHTML = 'Response: ' + data; })
				.catch(error => { document.getElementById('testResult').innerHTML = 'Error: ' + error; });
			}
			// 모든 뉴스 조회
			function getAllNews() {
				fetch('/api/news')
				.then(response => response.json())
				.then(data => { document.getElementById('newsResult').innerHTML = '<pre>' + JSON.stringify(data, null, 2) + '</pre>'; })
				.catch(error => { document.getElementById('newsResult').innerHTML = 'Error: ' + error; });
			}
			// 특정 뉴스 조회
			function getNewsById() {
				const id = document.getElementById('newsId').value;
				fetch('/api/news/' + id)
				.then(response => response.json())
				.then(data => { document.getElementById('newsResult').innerHTML = '<pre>' + JSON.stringify(data, null, 2) + '</pre>'; })
				.catch(error => { document.getElementById('newsResult').innerHTML = 'Error: ' + error; });
			}
			// 뉴스 추가
			function addNews() {
				const news = {
				title: document.getElementById('newsTitle').value,
				img: document.getElementById('newsImg').value,
				content: document.getElementById('newsContent').value
			};
			fetch('/api/news', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(news) })
			.then(response => response.text())
			.then(data => {
				document.getElementById('newsResult').innerHTML = 'Response: ' + data;
				// 입력 필드 초기화
				document.getElementById('newsTitle').value = '';
				document.getElementById('newsImg').value = '';
				document.getElementById('newsContent').value = '';
			})
			.catch(error => { document.getElementById('newsResult').innerHTML = 'Error: ' + error; });
		}
		// 뉴스 삭제
		function deleteNews() {
			const id = document.getElementById('deleteNewsId').value;
			fetch('/api/news/' + id, { method: 'DELETE' })
			.then(response => response.text())
			.then(data => {
				document.getElementById('newsResult').innerHTML = 'Response: ' + data;
				document.getElementById('deleteNewsId').value = '';
			})
			.catch(error => { document.getElementById('newsResult').innerHTML = 'Error: ' + error; });
		}
		</script>
	</body>
</html>