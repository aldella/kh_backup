<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path2" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>자유게시판 글 수정</title>
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script src="${path2}/resources/js/ckeditor/ckeditor.js"></script>
</head>
<body>
<div class="full-wrap">
    <main id="contents" class="contents">
    	<div id="breadcrumb" class="container breadcrumb-wrap clr-fix" style="height:60px; line-height:60px;">
	    	<nav class="breadcrumb" aria-label="breadcrumbs">
			  <ul>
			    <li><a href="${path2 }">Home</a></li>
			    <li><a href="${path2 }/free/list.do">자유게시판</a></li>
			    <li class="is-active"><a href="#" aria-current="page">수정</a></li>
			  </ul>
			</nav>
    	</div>
 	    <section class="page" id="page1">
    		<h2 class="page-title">자유게시판 글 수정</h2>
    		<div class="page-wrap">
	    		<div class="clr-fix">
	    			<br>
					<form action="${path2 }/free/updatePro.do" method="post">
						<table class="table">
							<tbody>
								<tr>
									<th><label for="no">글 번호</label></th>
									<td>
										<input type="text" name="no" id="no" class="input" value="${free.no }" readonly>
									</td>
								</tr>
								<tr>
									<th><label for="title">제목</label></th>
									<td>
										<input type="text" name="title" id="title" class="input" maxlength="100" value="${free.title }" required>
									</td>
								</tr>
								<tr>
									<th><label for="content">내용</label></th>
									<td>
										<textarea name="content" id="content" rows="8" cols="80" class="textarea">${free.content }</textarea>
									</td>
								</tr>
								<tr>
									<th><label for="resdate">작성 일시</label></th>
									<td>
										<input type="text" name="resdate" id="resdate" class="input" value="${free.resdate }" disabled>
									</td>
								</tr>
								<tr>
									<th><label for="visited">읽은 횟수</label></th>
									<td>
										<input type="text" name="visited" id="visited" class="input" value="${free.hits }" disabled>
									</td>
								</tr>
							</tbody>
						</table>
						<hr>
						<div class="buttons">
						  <button type="submit" class="button is-danger">글 수정</button>
						  <a href="${path2 }/free/list.do" class="button is-primary">글 목록</a>
						  <a href="${path2 }/free/detail.do?no=${free.no} " class="button is-success">글 상세보기</a>
						</div>
					</form>
					<script>
					$(function(){
						CKEDITOR.replace('content', {
							filebrowserUploadUrl : '${path2}/free/fileupload.do'
						});
					});
					</script>
				</div>
    		</div>
    	</section>
    </main>
    <script>
    $(document).ready(function(){
    	$("#tb1_length, #tb1_filter").css("margin-bottom", "20px");
    });
    </script>
</div>    
</body>
</html>