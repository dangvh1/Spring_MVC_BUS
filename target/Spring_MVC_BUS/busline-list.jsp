<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <style>
        #table td, #table th {
            border: 2px solid rgb(0, 0, 0);
            padding: 40px;
        }
        .table{
            margin: 0px auto;
        }
        .nav{
            width: 100%;
            height: 300px;
            background-color: blueviolet;
        }
        .button{
            width: 246px;
            height: 32px;
        }
    </style>
</head>
<body>
<div style="display: flex;">
    <div>
        <form:form action="./" method="GET">
            <button class="button" type="submit">Trang Chủ</button>
        </form:form>

    </div>

    <div>
        <form:form action="./buslines" method="GET">
            <button class="button" type="submit">Thêm Danh Sách Tuyến Đường</button>
        </form:form>
    </div>

</div>
<div>
    <h3 style="text-align: center">Danh Sách Tuyến Đường</h3>
</div>
<table class="table" id="table">
    <tr>
        <th>ID</th>
        <th>Tên Tuyến Đường</th>
        <th>Khoảng Cách</th>
        <th>Số Điểm Dừng</th>
        <th>action</th>

    </tr>
    <c:forEach var="busline" items="${buslines}">
        <tr>
            <td>${busline.id}</td>
            <td>${busline.buslineName}</td>
            <td>${busline.distance} km</td>
            <td>${busline.stopNumber}</td>
            <td>
                <button type="submit" ><a href="${pageContext.request.contextPath}/busline-remove/${busline.id}">Delete</a></button>
                <button><a href="/Spring_MVC_BUS_war/busline-update/${busline.id}">Update</a></button>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>