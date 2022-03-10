<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <title>Title</title>
    <style>
        #table td, #table th {
            border: 2px solid rgb(0, 0, 0);
            padding: 40px;
        }
        .table{
            margin: 0px auto;
        }
    </style>

</head>
<body>
<div>
    <nav class="navbar navbar-expand-lg navbar-light " style="background-color: burlywood">
        <a class="navbar-brand" href="#">Bus</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link"href="${pageContext.request.contextPath}/drivers" >Thêm Danh Sách Lái Xe</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Menu
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/driver-list">Driver</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/busline-list">Busline</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/driver-assignment">Assignment</a>
                    </div>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" name="name" type="text" action="${pageContext.request.contextPath}/driver-find/name" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>

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

