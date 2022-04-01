<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!-- 추가 -->
<%@ page import="user.UserDO" %>
<%@ page import="user.UserDAO" %>
<% //자바 코드 기술
   //1.사용자 입력 정보 추출
   String id = request.getParameter("id");
   String password = request.getParameter("password");
   
   //2.UserDO 클래스 객체 생성 후 중간 저장소에 값 초기화 작업 
   UserDO userDO = new UserDO();
   userDO.setId(id);
   userDO.setPassword(password);
   
   //3.UserDAO 클래스 객체 생성 후 getUser() 메소드 호출 
   UserDAO userDAO = new UserDAO();
   UserDO user = userDAO.getUser(userDO);
   
   //4.화면 네비게이션 => 포워딩 
    if(user != null){
    	//out.println("<script>alert('로그인 성공');</script>");
    	session.setAttribute("IdKey",id);   //session으로 set시키면 다른 페이지에서도 사용 가능 
    	response.sendRedirect("getBoardList.jsp");
    }else{
    	//out.println("<script>alert('로그인 실패');</script>");
    	response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 패턴의 Controller 역할의 페이지 =>login_proc.jsp</title>
</head>
<body>

</body>
</html>