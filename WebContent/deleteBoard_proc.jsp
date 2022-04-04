<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!-- 추가 -->
<%@ page import="board.BoardDO"%>
<%@ page import="board.BoardDAO"%>

<%
	request.setCharacterEncoding("UTF-8");

	//get방식으로 넘어온 seq 추출 
	String seq = request.getParameter("seq");
	
	BoardDO boardDO =new BoardDO();
	boardDO.setSeq(Integer.parseInt(seq));
	
	BoardDAO boardDAO = new BoardDAO();
	boardDAO.deleteBoard(boardDO);
	
	//포워딩 => 응답 
	response.sendRedirect("getBoardList.jsp");
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제 컨트롤러 페이지 => deleteBoard_proc.jsp</title>
</head>
<body>

</body>
</html>