<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>전체게시글 조회</h2>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>등록일</th>
		</tr>
	<c:forEach items="${ boardList }" var="board">
		<tr>
			<td>${ board.no }</td>
			<td>
				<a href="${ pageContext.request.contextPath }/board/${ board.no }">${ board.title }</a>
				<c:if test="${board.replyCnt ne 0 }">
					[${board.replyCnt }]
					</c:if>
					
			</td>
			<td>${ board.writer }</td>
			<td>${ board.regDate }</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>