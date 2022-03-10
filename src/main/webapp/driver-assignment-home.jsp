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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        /*.nav{*/
        /*    width: 100%;*/
        /*    height: 300px;*/
        /*    background-color: blueviolet;*/
        /*}*/
        /*.button{*/
        /*    width: 246px;*/
        /*    height: 60px;*/
        /*}*/
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
            <form action="${pageContext.request.contextPath}/driver-find" class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" name="search" type="text" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>

</div>
<div>
    <iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d1269.9532185775445!2d105.78306397425581!3d21.032135949260983!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1646636843214!5m2!1svi!2s" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
</div>

</body>
</html>
