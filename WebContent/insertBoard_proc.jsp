<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!-- 추가 -->
<%@ page import="board.BoardDO" %>
<%@ page import="board.BoardDAO" %>

<% 
	//입력폼에서 넘어온 한글 데이터가 깨지지 않게 할 때 호출 
	request.setCharacterEncoding("UTF-8");

	//1. 폼에서 넘어온 사용자 정보 추출 
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	//2. BoardDO 객체 생성 후 값들을 멤버 필드에 저장 
	BoardDO boardDO = new BoardDO();
	boardDO.setTitle(title);
	boardDO.setWriter(writer);
	boardDO.setContent(content);
	
	//3. BoardDAO 객체 생성 후 게시글 등록 메소드 호출 
	BoardDAO boardDAO = new BoardDAO();
	boardDAO.insertBoard(boardDO); 
	
	//4. 포워딩 => 응답
	response.sendRedirect("getBoardList.jsp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 게시글 등록 컨트롤러 페이지 => insertBoard_proc.jsp</title>
</head>
<body>

</body>
</html>