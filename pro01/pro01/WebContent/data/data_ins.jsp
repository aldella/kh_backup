<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path0" value="<%=request.getContextPath() %>" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<%@ include file="/head.jsp" %>
<style>
.container { width:1400px; }
.page { clear:both; height:100vh; }
#page1 { background-color:#ececec; }
#page2 { background-color:#42bcf5; }
.page_title { font-size:36px; padding-top:2em; text-align:center; }
</style>
</head>
<body>
<div id="header">
	<%@ include file="/header.jsp" %>
</div>
<div id="contents">
	<section class="page" id="page1">
		<div style="width:1400px; margin:0 auto;">
			<h3 class="page_title">자료 등록</h3>
			<form action="${path0 }/DataIns.do" method="post" enctype="multipart/form-data">
				<table class="table">
					<tbody>
						<tr>
							<th><label for="title">제목</label></th>
							<td>
								<input type="text" name="title" id="title" class="form-control" maxlength="100" required>
							</td>
						</tr>
						<tr>
							<th><label for="content">내용</label></th>
							<td>
								<textarea name="content" id="content" rows="8" cols="80" class="form-control"></textarea>
							</td>
						</tr>
						<tr>
							<th><label for="datafile">첨부파일</label></th>
							<td>
								<p>이미지(png/gif/jpg), 한글(hwp), MS워드(doc), 엑셀(xls), 파워포인트(ppt), 텍스트(txt), 압축(zip) 형태의 파일만 업로드하실 수 있습니다.</p>	
								<input type="file" class="form-control" name="datafile" id="datafile" accept=".gif, .jpg, .png, .hwp, .doc, .txt, .xls, .xlsx, .ppt, .pptx, .zip" />
							</td>
						</tr>
					</tbody>
				</table>
				<hr>
				<div class="btn-group">
				  <button type="submit" class="btn btn-secondary">자료 등록</button>
				  <a href="${path0 }/DataList.do" class="btn btn-secondary">자료 목록</a>
				</div>
			</form>
		</div>
	</section>
	<section class="page" id="page2">
		<div style="width:1400px; margin:0 auto;">	
			<h3 class="page_title"></h3>

		</div>	
	</section>	
</div>
<div id="footer">
	<%@ include file="/footer.jsp" %>
</div>
</body>
</html>