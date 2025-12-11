<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
		<title>뉴스 관리 앱</title>
		<style>
			.btnn { padding: 8px 16px; margin: 110px; text-decoration: none; border-radius: 4px; }
		</style>
	</head>
	<body>
		<div class="container w-75 mt-5 mx-auto">
			<h2>뉴스 목록</h2>
			<hr>
			<ul class="list-group">
				<c:forEach var="news" items="${newslist}" varStatus="status">
					<li class="list-group-item list-group-item-action">
						<div class="d-flex justify-content-between align-items-start">
							<div class="flex-grow-1">
								<a href="/news/${news.aid}" class="text-decoration-none">
									<h5>[${status.count}] ${news.title}</h5>
									<small class="text-muted">${news.date}</small>
									<p class="text-secondary mt-2 mb-0">
										<!-- 컨텐츠를 100자로 제한하여 요약 표시 -->
										<c:choose>
											<c:when test="${fn:length(news.content) > 100}">
												${fn:substring(news.content, 0, 100)}...
											</c:when>
											<c:otherwise>
												${news.content}
											</c:otherwise>
										</c:choose>
									</p>
								</a>
							</div>
							<a href="/news/delete/${news.aid}">
								<span class="badge bg-secondary">&times;</span>
							</a>
						</div>
					</li>
				</c:forEach>
			</ul>
			<hr>
			<c:if test="${error != null}">
				<div class="alert alert-danger alert-dismissible fade show mt-3">
					에러 발생: ${error}
					<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
				</div>
			</c:if>
			<button class="btn btn-outline-info mb-3" type="button" data-bs-toggle="collapse"
							data-bs-target="#addForm" aria-expanded="false" aria-controls="addForm">
				뉴스 등록
			</button>
			<div class="collapse" id="addForm">
				<div class="card card-body">
					<form method="post" action="/news/add" enctype="multipart/form-data">
						<label class="form-label">제목</label>
						<input type="text" name="title" class="form-control">
						<label class="form-label">이미지</label>
						<input type="file" name="file" class="form-control">
						<label class="form-label">기사내용</label>
						<textarea cols="50" rows="5" name="content" class="form-control"></textarea>
						<button type="submit" class="btn btn-success mt-3">저장</button>
					</form>
				</div>
			</div>
		</div>
		<div style="margin-top: 20px;" class=btnn>
			<a href="/mainStart">메인 페이지로 이동</a>
		</div>
	</body>
</html>