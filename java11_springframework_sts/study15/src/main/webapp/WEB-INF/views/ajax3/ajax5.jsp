<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path2" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajax Test5</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<nav>
    <h2>05_Get + queryString + @RequestParam 전송</h2>
    <hr>
    <ul>
        <li><a href="${path2}/ajax3/">Home</a></li>
    </ul>
    <button id="btn5" type="button" num="2" age="38" name="김기태">Get 전송</button>
    <script>
    var btn5 = document.getElementById("btn5");
    btn5.addEventListener("click", async function(){
        try {
            var student = {
                stdNumber: parseInt(btn5.getAttribute("num")),
                age: parseInt(btn5.getAttribute("age")),
                name: btn5.getAttribute("name")
            };
            var queryString = `?stdNumber=${student.stdNumber}&age=${student.age}&name=${student.name}`;
            
            const response = await fetch('${path2}/ajax3/ajax5pro.do'+queryString);
            if (!response.ok) {
                throw new Error('서버 응답 실패');
            }
            
            const data = await response.json();
            alert("ajax5pro 전송 완료");
            console.log(data);
        } catch (error) {
            console.error(error);
        }
    });
    </script>
</nav>
</body>
</html>