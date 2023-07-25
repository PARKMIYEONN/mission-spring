<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#section{
	
	}
</style>
<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
	
	// 댓글리스트 조회(게시글번호)
	let getReplyList = function(){
		$.ajax({
			url: '${pageContext.request.contextPath}/reply/${board.no}',
			type: 'get',
			success: function(result){	//여기서 날아오는 result값은 json 배열임
				///let list = JSON.parse(result)
				
				$('#replyList').empty()
				$(result).each(function(){
					//console.log(this)
					
					let str = ''
					str += '<hr>'
					str += '<div>'
					str += '<strong>' + this.content + '</strong>'
					str += '(' + this.writer + ')'
					str += '&nbsp;&nbsp;' + this.regDate + '&nbsp;&nbsp;'
					str += '<button>삭제</button>'
					str += '</div>'
							
					$('#replyList').append(str)
				})
			}, error: function(){
				alert('실패')
			}
		})
	}
	
	$(document).ready(function(){
		getReplyList()
	})
	
	$(document).ready(function(){
		$('#replyAddBtn').click(function(){
			let content = document.rform.content.value
			let writer = document.rform.writer.value
			
			// http://localhost:8080/Mission-Spring/reply?content=어머어머&writer=hong&boardNo=42
			$.ajax({
				url: '${pageContext.request.contextPath}/reply',
				type: 'post',
				data: {
					content: content,
					writer: writer,
					boardNo: ${board.no}
				}, success: function(){
					document.rform.content.value = ''
						document.rform.writer.value = ''
					getReplyList()
				}, error: function(){
					alert('실패')
				}
			})
		})
	})
</script>
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
	<button onclick="location.href='${pageContext.request.contextPath}/board'">목록</button>
	<button onclick="location.href=''">수정</button>
	<button onclick="location.href=''">삭제</button>
	
	<br>
	<hr>
	<%-- 댓글 관련 --%>
	
	<form name="rform">
		댓글 : <input type="text" name="content" size="50"/>
		이름 : <input type="text" name="writer" size="20"/> 
		<button type="button" id="replyAddBtn">댓글추가</button>
		<div id="replyList">
		</div>
	</form>
</body>
</html>