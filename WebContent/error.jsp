<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지 => error.jsp</title>
<!-- 추가 -->
<jsp:useBean id="now" class="java.util.Date"/>

<body>
   <div> 
      <h2>error_page.jsp</h2>
      <hr>
      <table>
         <tr width=100% bgcolor="skyblue">
            <td>
               개발자에게 문의주세요!!<br>
               빠른 시일내로 복구하겠습니다.
            </td>
         </tr>
         <tr>
            <td>
               <%= now %><p>
               요청 실패URI : ${pageContext.errorData.requestURI}<br>
               상태코드 : ${pageContext.errorData.statusCode}<br>
               예외유행 : ${pageContext.errorData.throwable}
            
            </td>
         </tr>
      </table>
   </div>
</body>
</html>