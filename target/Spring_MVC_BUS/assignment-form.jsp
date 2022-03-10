<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/2/2022
  Time: 5:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <title>Title</title>
    <style>
        #table {
            border-collapse: collapse;
            width: 100%;
        }

        #table td, #table th {
            border: 2px solid rgb(0, 0, 0);
            padding: 8px;
        }

        #form {
            background-color: rgb(208, 211, 211);
            border: 2px solid black;
            width: 30%;
            margin: auto;
        }

        .form-group {
            text-align: center;
            margin: 3% 10%;
        }

        .button{
            margin: 5px;
        }
        #stopNumber{
            padding-left: 5px;
        }
        #distance{
            margin-left: 28px;
        }
        #stopNumber{
            margin-left: 19px;
        }

    </style>
</head>
<body>

<script>

</script>

<div>
    <nav class="navbar navbar-expand-lg navbar-light " style="background-color: burlywood" >
        <a class="navbar-brand" href="#">Bus</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/">Home <span class="sr-only">(current)</span></a>
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
                <input class="form-control mr-sm-2" name="keyword" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
</div>
<div>
    <h3 style="text-align: center">Phân Công Cho Lái Xe Đã Chọn</h3>
</div>

<form:form id="form" cssStyle="margin-top: 70px;" action="${pageContext.request.contextPath}/assignment-create" method="POST">
    <root>
        <h6 style="text-align: center;">Tên Lái Xe</h6>
        <div class="form-group" style="background-color: cadetblue;">
            <input hidden name="driver_id" value="${driver.id}"/>
                <td>${driver.name}</td>
            <br/>
        </div>
        <div class="form-group">
            <h6>Tên Tuyến Đường</h6>
            <select path="busline_id" id="busline" name="busline_id" style="border-radius: 5px;
                                                                   padding: 10px 100px 2px 20px;">
                <c:forEach var="busline" items="${buslines}">
                    <option value="${busline.id}">${busline.buslineName}</option>
                </c:forEach>
            </select>
            <br/>
        </div>

        <div class="form-group">
            <h6>Số Lượt đi</h6>
            <input type="number" name="busLineSum" id="buslinesum" path="buslinesum" placeholder="Số lượt đi không quá 15" style="width: 204px;">
        </div>
        <div class="form-group">
            <button id="save-button" type="submit">Save</button>
        </div>
    </root>
</form:form>
</body>
</html>

