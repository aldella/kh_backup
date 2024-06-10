<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajax Test9</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <style>
        #tb1 { border-collapse: collapse; }
        #tb1 th { border-top:2px solid #333; border-bottom:2px solid #333; background-color:gold; line-height:30px; min-width:150px;
            padding-left: 24px; padding-right: 24px; }
        #tb1 td { border-bottom:1px solid #333;  line-height: 30px; min-width:150px;  padding-left: 24px; padding-right: 24px; }
        #tb1 tbody tr:last-child td { background-color:#eee; }
    </style>
</head>
<body>
<nav>
    <h2>09_Post + Parameter + ResponseEntity Object 전송</h2>
    <hr>
    <ul>
        <li><a href="${path1}/ajax/">Home</a></li>
    </ul>
    <input type="text" name="num" id="num" placeholder="연번 입력" value="12" readonly required><br>
    <input type="text" name="title" id="title" placeholder="제목 입력" required><br><br>
    <button id="btn10" type="button">Post 전송</button>
    <hr>
    <h3>결과</h3>
    <ul id="res">

    </ul>
    <script>
        $(document).ready(function(){
            $("#btn10").click(function() {
                var test = {"num":parseInt($("#num").val()), "title":$("#title").val() };
                var txt = "";
                $.ajax({
                    type:"post",
                    url:"${path1}/ajax/test10pro",
                    data:JSON.stringify(test),
                    dataType:"json",
                    contentType: "application/json",
                    success:function(res) {
                        console.log("성공", res);
                        console.log("번호 : "+res[0].num);
                        console.log("제목 : "+res[0].title);
                        for(let i in res) {
                            $("#res").append("<li>" + res[i].num + ", " + res[i].title + "</li>");
                        }
                    },
                    error:function(err) { console.log("실패", err); }
                });
            });
        });
    </script>
</nav>
</body>
</html>
