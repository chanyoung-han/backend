<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>학생 목록</title>
		<style>
			body { font-family: Arial, sans-serif; margin: 20px; }
			table { border-collapse: collapse; width: 100%; margin-top: 20px; }
			th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
			th { background-color: #4CAF50; color: white; }
			tr:hover { background-color: #f5f5f5; }
			.btn { padding: 8px 16px; margin: 5px; text-decoration: none;
			background-color: #4CAF50; color: white; border-radius: 4px; }
			.btn-delete { background-color: #f44336; }
			.btn:hover { opacity: 0.8; }
			h2 { color: #333; }
		</style>
	</head>
	<body>
		<h2>학생 관리 시스템</h2>
		<a href="${pageContext.request.contextPath}/studentControl/form" class="btn">새 학생 등록</a>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>대학</th>
					<th>생년월일</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="student" items="${students}">
					<tr>
						<td>${student.id}</td>
						<td>${student.username}</td>
						<td>${student.univ}</td>
						<td>${student.birth}</td>
						<td>${student.email}</td>
						<td>${student.tel}</td>
						<td>
							<a href="${pageContext.request.contextPath}/studentControl/edit?id=${student.id}" class="btn">수정</a>
							<a href="${pageContext.request.contextPath}/studentControl/delete?id=${student.id}"
								class="btn btn-delete" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
						</td>
					</tr>
				</c:forEach>
				<c:if test="${empty students}">
					<tr>
						<td colspan="7" style="text-align: center;">등록된 학생이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<div style="margin-top: 20px;">
			<a href="/mainStart" class='btn'>집으로</a>
		</div>
	</body>
</html>