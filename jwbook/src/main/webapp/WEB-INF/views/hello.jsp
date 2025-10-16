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
		<h2>Hello World</h2>
		<ul>
			<li><a href="/hello">Hello 페이지로 이동</a></li>
			<li><a href="/calculator">계산기 사용하기</a></li>
		</ul>
		<hr>
			현재 날짜와 시간은
			<%=java.time.LocalDateTime.now()%>
			입니다. <BR>- from hello.jsp</BR>
		</hr>
	</body>
</html>