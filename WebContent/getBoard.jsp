<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<!-- 추가 -->
<%@ page import="board.BoardDO" %>
<%@ page import="board.BoardDAO" %>

<%
	// 1. getBoardList.jsp에서 넘어온 seq 추출
	String seq = request.getParameter("seq");
	// 2. BoardDO 객체 생성 후 seq를 중간 저장소에 저장한다.
	BoardDO boardDO = new BoardDO();
	boardDO.setSeq(Integer.parseInt(seq));  // 문자열을 정수로 변환하여 저장
	
	// 3. BoardDAO 객체 생성 후 게시글 상세보기 메소드 호출
	BoardDAO boardDAO = new BoardDAO();
	BoardDO board = boardDAO.getBoard(boardDO);
	request.setAttribute("board", board);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기 페이지 => getBoard.jsp</title>
<style>
	#div_box {
		position:absolute;
		top:10%;
		left:40%;
	}
</style>
</head>
<body>
	<div id="div_box">
		<h1>게시글 상세보기</h1>
		<a href="logout_proc.jsp">로그아웃</a>
		<hr>
		<form name="detailForm" method="POST" action="updateBoard_proc.jsp">
			<input type="hidden" name="seq" value="${board.seq}"/>
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70">제  목</td>
					<td align="left">
						<input type="text" name="title" value="${board.title}"/>
					</td>
				</tr>
				<tr>
					<td bgcolor="orange">작성자</td>
					<td align="left">
						<input type="text" name="writer" value="${board.writer}"/>
					</td>
				</tr>
				<tr>
					<td bgcolor="orange">내  용</td>
					<td align="left">
						<textarea name="content" rows="10" cols="40">${board.content}</textarea>
					</td>
				</tr>
				<tr>
					<td bgcolor="orange">작성일자</td>
					<td align="left">
						<input type="text" value="${board.regdate}"/>
					</td>
				</tr>
				<tr>
					<td bgcolor="orange">조회수</td>
					<td align="left">
						<input type="text" value="${board.cnt}"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="게시글 수정"/>
					</td>
				</tr>
			</table>
		</form>
		<hr>
		<a href="insertBoard.jsp">새 게시글 등록</a>&nbsp;&nbsp;
		<a href="deleteBoard_proc.jsp?seq=${board.seq}">게시글 삭제</a>&nbsp;&nbsp;
		<a href="getBoardList.jsp">전체 게시글 목록 보기</a>
	</div>
</body>
</html>