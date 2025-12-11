<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
		<title>뉴스 등록</title>
	</head>
	<body>
		<div class="container w-75 mt-5 mx-auto">
			<h2>뉴스 등록</h2>
			<hr>
			<form method="post" action="/news/add" enctype="multipart/form-data">
				<div class="mb-3">
					<label class="form-label">제목</label>
					<input type="text" name="title" class="form-control" required>
				</div>
				<div class="mb-3">
					<label class="form-label">이미지</label>
					<input type="file" name="file" class="form-control">
				</div>
				<div class="mb-3">
					<label class="form-label">기사 내용</label>
					<textarea name="content" rows="6" class="form-control" required></textarea>
				</div>
				<button type="submit" class="btn btn-success">저장</button>
				<a href="/news" class="btn btn-secondary">취소</a>
			</form>
		</div>
	</body>
</html>