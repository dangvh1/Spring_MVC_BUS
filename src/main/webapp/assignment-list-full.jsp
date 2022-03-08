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
<div>
    <nav class="navbar navbar-expand-lg navbar-light " style="background-color: burlywood" >
        <a class="navbar-brand" href="#">Bus</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="./">Home <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Menu
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="./driver-list">Driver</a>
                        <a class="dropdown-item" href="./busline-list">Busline</a>
                        <a class="dropdown-item" href="./driver-assignment">Assignment</a>
                    </div>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" name="keyword" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
</div>
<div style="border-bottom: 1px; padding-top: 30px;">
        <button class="btn btn-outline-success my-2 my-sm-0" style="background-color: aquamarine;"type="submit"><a style="text-decoration: none" href="./assignment-list">Phân Công Cho Lái Xe</a></button>
</div>
<div>
    <h3 style="text-align: center">Bảng Phân Công</h3>
</div>
<table class="table" id="table">
    <tr>
        <th>Mã Lái Xe</th>
        <th>Họ và tên</th>
        <th>Số Điện Thoại</th>
        <th>Tuyến Đường Đi</th>
        <th>Khoảng Cách</th>
        <th>Tổng Số Lượt</th>
        <th></th>


    </tr>
    <c:forEach var="assignment" items="${driverAssignment}">
        <tr>
            <td>${assignment.driver.id}</td>
            <td>${assignment.driver.name}</td>
            <td>${assignment.driver.phoneNumber}</td>
            <td>${assignment.busline.buslineName}</td>
            <td>${assignment.busline.distance}</td>
            <td>${assignment.busLineSum}</td>
            <td>
                <button><a href="/Spring_MVC_BUS_war/remove-assignment/${assignment.id}">Delete</a></button>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

