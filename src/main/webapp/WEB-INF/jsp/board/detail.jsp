<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시판 상세 페이지</h2>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>등록일</th>
			<th>글내용</th>
		</tr>
		<tr>
			<td>${ board.no }</td>
			<td>${ board.title }</td>
			<td>${ board.writer }</td>
			<td>${ board.regDate }</td>
			<td>${ board.content }</td>
		</tr>
	</table>
	
</body>
</html>