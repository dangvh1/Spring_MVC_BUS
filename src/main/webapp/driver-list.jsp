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
        <form:form action="./drivers" method="GET">
            <button class="button" type="submit">Nhập Danh Sách Lái Xe</button>
        </form:form>
    </div>

</div>
<div>
    <h3 style="text-align: center">Danh Sách Lái Xe</h3>
</div>
<table class="table" id="table">
    <tr>

        <th>Id</th>
        <th>Họ và tên</th>
        <th>Quê quán</th>
        <th>Số Điện Thoại</th>
        <th>Trình Độ</th>
        <th>action</th>
    </tr>
    <c:forEach var="driver" items="${drivers}">
        <tr>

            <td>${driver.id}</td>
            <td>${driver.name}</td>
            <td>${driver.address}</td>
            <td>${driver.phoneNumber}</td>
            <td>${driver.lever}</td>
            <td>
                <button><a href="/Spring_MVC_BUS_war/driver-remove/${driver.id}">Delete</a></button>
                <button><a href="/Spring_MVC_BUS_war/driver-update/${driver.id}">Update</a></button>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

