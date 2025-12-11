<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>spring 시작!!</title>
	</head>
	<body>
		${hello}
		<h2>메인 페이지입니다.</h2>
		<ul>
			<li><a href="/mainStart">메인 페이지로 이동</a></li>
			<li><a href="/calculator">계산기 사용하기(OnePage방식)</a></li>
			<li><a href="/jstlExam">jstlExam</a></li>
			<li><a href="/ch08/calcForm.html">계산기 사용하기(POST방식)</a></li>
			<li><a href="/pcontrol">상품 목록 소개</a></li>
			<li><a href="/studentControl">학생 관리 시스템</a></li>
			<li><a href="/news">뉴스 기사 관리</a></li>
			<li><a href="/api">REST API 테스트</a></li>
		</ul>
		<hr>
			현재 날짜와 시간은
			<%=java.time.LocalDateTime.now()%>
			입니다. <BR>- from mainStart.jsp</BR>
		</hr>
	</body>
</html>