<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
    <!-- 추가 -->
<%@ page import="board.BoardDO"%>
<%@ page import="board.BoardDAO"%>
<%
	//입력폼에서 넘어온 한글 데이터가 깨지지 않게 할 때 호출 
	request.setCharacterEncoding("UTF-8");

	String seq = request.getParameter("seq"); //hidden 객체로 넘어온 seq
	String title = request.getParameter("title"); 
	String content = request.getParameter("content");
	
	BoardDO boardDO = new BoardDO();
	boardDO.setSeq(Integer.parseInt(seq));
	boardDO.setTitle(title);
	boardDO.setContent(content);
	
	BoardDAO boardDAO = new BoardDAO();
	//게시글 수정 메소드 호출 
	
	boardDAO.updateBoard(boardDO);
	
	//포워딩 => 응답
    response.sendRedirect("getBoardList.jsp");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해당 게시글 수정 컨트롤러 => updateBoard_proc.jsp 페이지</title>
</head>
<body>

</body>
</html>