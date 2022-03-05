<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/3/2022
  Time: 2:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .nav{
            width: 100%;
            height: 300px;
            background-color: blueviolet;
        }
        .button{
            width: 246px;
            height: 60px;
        }


    </style>
</head>
<body>
<div class="nav">
    <h2 style="text-align: center; padding-top: 115px;">BUS DRIVER ASSIGNMENT <br>
    Spring MVC
    </h2>

    <div style="display: flex; padding-top: 78px">
        <div>
            <form:form action="./driver-list" method="GET">
                <button class="button" type="submit">Danh Sách Lái Xe</button>
            </form:form>
        </div>
        <div>
            <form:form action="./busline-list" method="GET">
                <button class="button" type="submit">Danh Sách Tuyến Đường Đang Chạy</button>
            </form:form>

        </div>
        <div>
            <form:form action="" method="GET">
                <button class="button" type="submit">Danh Sách Phân Công Lái Xe </button>
            </form:form>
        </div>
        <div>
            <form:form action="./buslines" method="GET">
                <button class="button" type="submit">Nhập Danh Sách Tuyến Đường</button>
            </form:form>
        </div>
        <div>
            <form:form action="./drivers" method="GET">
                <button class="button" type="submit">Nhập Danh Sách Lái Xe</button>
            </form:form>
        </div>

        <div>
            <form:form action="./assignment-list" method="GET">
                <button class="button" type="submit">Nhập Danh Sách Phân Công Lái Xe</button>
            </form:form>
        </div>
    </div>
</div>



</body>
</html>
