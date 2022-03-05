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
        #name {
            margin-left: 67px;
        }
        #address{
            margin-left: 53px;
        }
        #phoneNumber{
            margin-left: 13px;
        }
        #select{
            padding-left: 100px;
            padding-right: 23.5px;
        }
    </style>
</head>
<body>

<script>
    const insertFail = location.search.split('insertFail=')[1]
    if (insertFail) {
        alert("Thêm mới thất bại");
    }
</script>

<form:form id="form" action="./driver" method="POST">
    <root>
        <div class="form-group">
            <form:label cssStyle="padding-left: 37px" path="name">Name</form:label>
            <form:input path="name"/>
            <br/>
        </div>
        <div class="form-group">
            <form:label cssStyle="padding-left: 36px" path="address">Address</form:label>
            <form:input path="address"/>
            <br/>
        </div>

        <div class="form-group">
            <form:label cssStyle="padding-left: 37px" path="phoneNumber">PhoneNumber</form:label>
            <form:input path="phoneNumber"/>
            <br/>
        </div>
        <div>
            <form:label id="select" path="lever">Driver Lever</form:label>
            <form:select path="lever">
                <form:option value="NONE" label="Select"/>
                <form:options items="${driverlever}"/>
            </form:select>
        </div>
        <div class="form-group">
            <button id="save-button" type="submit">Save</button>
        </div>

    </root>
</form:form>
</body>
</html>

