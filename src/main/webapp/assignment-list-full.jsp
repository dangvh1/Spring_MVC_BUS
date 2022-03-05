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


</div>
<div>
    <h3 style="text-align: center">Bảng Phân Công</h3>
</div>
<table class="table" id="table">
    <tr>

        <th>Id</th>
        <th>Họ và tên</th>
        <th>Số Điện Thoại</th>
        <th>Trình Độ</th>
        <th>Tuyến Đường Đi</th>
        <th>Tổng Số Lượt</th>

    </tr>
    <c:forEach var="assignment" items="">
        <tr>

            <td>${assignment.id}</td>
            <td>${assignment.name}</td>
            <td>${assignment.phoneNumber}</td>
            <td>${assignment.lever}</td>
            <td>${assignment.buslinesum}</td>
            <td>${assignment.distancesum}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

