<%@ page import="com.rush.entity.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Mednet | Update Employee</title>

<link rel="stylesheet"
 href="${pageContext.request.contextPath}/resources/css/register.css">

</head>

<body>

<%
HttpSession s = request.getSession();
Employee updateEmployee =
    (Employee) s.getAttribute("findEmployeeById");
%>


<!-- Page Title -->
<h1>Mednet Employee Update Portal</h1>

<c:if test="${not empty error}">
    <div class="error-msg">
        ${error}
    </div>
</c:if>


<!-- Update Card -->
<div class="form-container">

<form action="updateEmployee" method="post">

    <!-- Hidden ID -->
    <input type="hidden" name="id"
           value="<%= updateEmployee.getId() %>">


    <!-- Show ID -->
    <div class="form-row">
        <label>Employee ID</label>
        <input type="text"
               value="<%= updateEmployee.getId() %>"
               disabled>
    </div>


    <div class="form-row">
        <label>Name</label>
        <input type="text" name="name"
               value="<%= updateEmployee.getName() %>" required>
    </div>


    <div class="form-row">
        <label>Gender</label>

        <select name="gender" required>

            <option value="">-- Select Gender --</option>

            <option value="Male"
              <%= "Male".equals(updateEmployee.getGender())
                    ? "selected" : "" %>>
              Male
            </option>

            <option value="Female"
              <%= "Female".equals(updateEmployee.getGender())
                    ? "selected" : "" %>>
              Female
            </option>

            <option value="Other"
              <%= "Other".equals(updateEmployee.getGender())
                    ? "selected" : "" %>>
              Other
            </option>

        </select>
    </div>


    <div class="form-row">
        <label>Date of Birth</label>
        <input type="date" name="dob"
               value="<%= updateEmployee.getDob() %>" required>
    </div>

    <!-- Full Width -->
    <div class="form-row full">
        <label>Address</label>
        <textarea name="address" required>
<%= updateEmployee.getAddress() %>
        </textarea>
    </div>
    
    <div class="form-row">
        <label>State</label>
        <input type="text" name="state"
               value="<%= updateEmployee.getState() %>" required>
    </div>


    <div class="form-row">
        <label>City</label>
        <input type="text" name="city"
               value="<%= updateEmployee.getCity() %>" required>
    </div>


    <div class="form-row">
        <label>Login ID</label>
        <input type="text" name="loginId"
               value="<%= updateEmployee.getLoginId() %>" required>
    </div>


    <div class="form-row">
        <label>Password</label>
        <input type="password" name="password"
               value="<%= updateEmployee.getPassword() %>" required>
    </div>


    <!-- Submit -->
    <div class="button-area">

        <button type="submit"
          onclick="return confirm('Update this employee?')">
            Update Employee
        </button>

    </div>

</form>

</div>

</body>
</html>
