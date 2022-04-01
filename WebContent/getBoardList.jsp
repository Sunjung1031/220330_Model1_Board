<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<!-- 추가 -->
<%@ page import="board.BoardDO"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="java.util.List"%>

<!-- JSTL추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");

	String searchField = "";
	String searchText = "";
	
	if(request.getParameter("searchCondition") != "" 
			&& request.getParameter("searchKeyword") !=""){
		searchField = request.getParameter("searchCondition");  //제목이나 작성자 
		searchText  = request.getParameter("searchKeyword");   //내용 
		
	}
	//BoardDAO 클래스 객체 생성
	BoardDAO boardDAO = new BoardDAO(); 
	List<BoardDO> boardList = boardDAO.getBoardList(searchField, searchText);
	request.setAttribute("boardList", boardList); //(아래 html)java파일과 html파일 상호작용위해 request내장객체로 set하면 현재 페이지에서 사용  
	
	int totalList= boardList.size();
	request.setAttribute("totalList", totalList); //java파일과 html파일 상호작용위해 request내장객체로 set하면 현재 페이지에서 사용  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 전체 목록 보기 페이지 => getBoardList.jsp</title>
</head>
<body>
	<div id="div_box">
		<h1>전체 게시글 목록 보기</h1>
		<h3>${IdKey}님 <!-- <--표현언어 -->
			환영합니다.&nbsp;&nbsp;&nbsp;<a href="logout_proc.jsp">로그아웃</a>
		</h3>
		<form name="boardListForm" method="POST" action="getBoardList.jsp">
			<P>총 게시글: ${totalList}건</P>
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<td align="right"><select name="searchCondition">
							<option value="TITLE">제목</option>
							<option value="WRITER">작성자</option>
					</select> <input type="text" name="searchKeyword" /> 
							  <input type="submit" value="검색" /></td>
				</tr>
			</table>
		</form>
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<th bgcolor="orange" width="100">번호</th>
					<th bgcolor="orange" width="200">제목</th>
					<th bgcolor="orange" width="150">작성자</th>
					<th bgcolor="orange" width="150">등록일</th>
					<th bgcolor="orange" width="100">조회수</th>
				</tr>
				<%-- 주석처리 
				<% for (BoardDO board : boardList) { %> <!-- 4건의 결과를 가지고 있는 boardList를 board에 넘겨주고 아래 코드에서 사용 -->
					<tr>
						<td align="center"><%= board.getSeq() %></td>
						<td align="left">
							<a href="getBoard.jsp?seq=<%=board.getSeq() %>">
								<%= board.getTitle() %></a>
						</td>
						<td align="center"><%= board.getWriter() %></td>
						<td align="center"><%= board.getRegdate() %></td>
						<td align="center"><%= board.getCnt() %></td>				
					</tr>
					
				<% } %>
				--%>
				
				<%-- 위의 코드를 표현언어와 JSTL을 적용하여 소스 변경  --%>
				<!-- c:forEach var="" items=""(반복문)  사용 구문 외우기  -->
				<c:forEach var="board" items="${boardList}">
					<tr>
						<td align="center">${board.seq}</td>
						<td align="left">    <!-- ↓멤버필드 이름 = 값 -->
							<a href="getBoard.jsp?seq=${board.seq}">${board.title}</a>
						</td>
						<td align="center">${board.writer}</td>
						<td align="center">${board.regdate}</td>
						<td align="center">${board.cnt}</td>
					</tr> 
				</c:forEach>
			</table>
			<br>
			<a href="insertBoard.jsp">새 개시글 등록</a>&nbsp;&nbsp;&nbsp;
			<a href="getBoardList.jsp">전체 게시글 목록 보기</a>
	</div>
</body>
</html>