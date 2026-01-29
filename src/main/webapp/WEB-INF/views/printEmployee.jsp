<%@ page import="com.rush.entity.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Mednet | Print Employee</title>

<style>
body {
    font-family: Arial, sans-serif;
    padding: 40px;
}

h2 {
    text-align: center;
    margin-bottom: 50px;
    font-size: 30px;
}

.print-box {
    width: 500px;
    margin: auto;
    border: 1px solid #000;
    padding: 25px;
}

.row {
    margin-bottom: 12px;
}

.label {
    font-weight: bold;
}
</style>

</head>

<body onload="window.print()">

<%
Employee emp =
 (Employee) session.getAttribute("printEmployee");
%>

<h2>Employee Details</h2>

<div class="print-box">

    <div class="row">
        <span class="label">ID:</span> <%= emp.getId() %>
    </div>

    <div class="row">
        <span class="label">Name:</span> <%= emp.getName() %>
    </div>

    <div class="row">
        <span class="label">DOB:</span> <%= emp.getDob() %>
    </div>

    <div class="row">
        <span class="label">Gender:</span> <%= emp.getGender() %>
    </div>

    <div class="row">
        <span class="label">Address:</span> <%= emp.getAddress() %>
    </div>
    
    <div class="row">
        <span class="label">City:</span> <%= emp.getCity() %>
    </div>
    
    <div class="row">
        <span class="label">State:</span> <%= emp.getState() %>
    </div>

</div>

</body>
</html>
