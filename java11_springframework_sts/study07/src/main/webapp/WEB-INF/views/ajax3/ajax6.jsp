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
    <title>Ajax Test6</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<nav>
    <h2>06_Post + Object 전송 + @RequestBody</h2>
    <hr>
    <ul>
        <li><a href="${path2}/ajax3/">Home</a></li>
    </ul>
    <input type="text" name="num" id="num" placeholder="번호 입력" required><br>
    <input type="text" name="stdName" id="stdName" placeholder="이름 입력" required><br>
    <input type="text" name="age" id="age" placeholder="나이 입력" required><br>
    <button id="btn6" type="button">Post 전송</button>
    <script>
    var btn6 = document.getElementById("btn6");
    var num = document.getElementById("num");
    var age = document.getElementById("age");
    var stdName = document.getElementById("stdName");
    var student = { stdNumber: 0, age: 0, name: "김아무개" };
    
    btn6.addEventListener("click", async function(){
        try {
            student.stdNumber = parseInt(num.value);
            student.age = parseInt(age.value);
            student.name = stdName.value;
            
            const response = await fetch("${path2}/ajax3/ajax6pro.do", {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(student)
            });
            
            if (!response.ok) {
                throw new Error('서버 응답 실패');
            }
            
            const data = await response.json();
            alert("ajax6pro 전송 완료");
            console.log(data);
        } catch (error) {
            console.error(error);
        }
    });
    </script>
</nav>
</body>
</html>