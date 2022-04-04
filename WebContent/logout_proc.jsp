<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 브라우저에 연결된 세션 객체 강제 종료 
	session.invalidate();

	//2. 세션 종료 후 로그인 페이지로 이동하라 
	response.sendRedirect("login.jsp");

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 컨트롤러 페이지 => logout_proc.jsp</title>
</head>
<body>

</body>
</html>