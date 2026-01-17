<%@ page import="com.rush.entity.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mednet | Employees</title>

<style>
    body {
        padding: 20px;
        background: #f2f2f2;
    }

    h1, h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    .profile-box {
        width: 40%;
        margin: 0 auto 30px auto;
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    .profile-row {
        display: flex;
        margin-bottom: 10px;
    }

    .profile-label {
        width: 150px;
        font-weight: bold;
    }

    table {
        width: 100%;
        background: white;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        padding: 10px;
        border: 1px solid #ccc;
        text-align: center;
    }

    th {
        background: #007bff;
        color: white;
    }

    a {
        text-decoration: none;
        color: #007bff;
        margin-right: 10px;
    }

    a:hover {
        text-decoration: underline;
    }
    
    .button-group {
	display: flex;
	justify-content: center;
	gap: 20px;
	margin-top: 20px;
}

button {
	padding: 10px 25px;
	font-size: 16px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	background: #007bff;
	color: white;
	font-size: 18px;
}

button:hover {
	background: #0056b3;
}

.logout-btn {
	background: red;
}

.logout-btn:hover {
	background: tomato;
}
    

</style>


</head>
<body>

<%
HttpSession s = request.getSession();
Employee loggedEmployee = (Employee) s.getAttribute("loggedEmployee");
System.out.print(loggedEmployee.getName());
%>


<h1>Welcome to Mednet-EMS, <%= loggedEmployee.getName() %> !</h1>

<!-- ========== PROFILE SECTION ========== -->
<h2>My Profile</h2>

<div class="profile-box">
    <div class="profile-row">
        <div class="profile-label">Name:</div> <%= loggedEmployee.getName() %>
    </div>
    
    <div class="profile-row">
        <div class="profile-label">Login ID:</div> <%= loggedEmployee.getLoginId() %>
    </div>

    <div class="profile-row">
        <div class="profile-label">DOB:</div> <%= loggedEmployee.getDob()  %>
    </div>

    <div class="profile-row">
        <div class="profile-label">Gender:</div> <%= loggedEmployee.getGender() %>
    </div>
    
    <div class="profile-row">
        <div class="profile-label">Full Address:
        </div> <%= loggedEmployee.getAddress() %>, <%= loggedEmployee.getCity() %>, <%= loggedEmployee.getState() %>
    </div>
   
	<div class="button-group">
		<a href="logout">
			<button class="logout-btn" onclick="return confirm('Are you sure you want to logout?')">Logout</button>
		</a> 
	</div>
   	
</div>

<!-- ========== EMPLOYEE LIST SECTION ========== -->
<h2>All Employees</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>DOB</th>
        <th>Gender</th>
        <th>Address</th>
        <th>City</th>
        <th>State</th>
        <th>Actions</th>
    </tr>

    <c:forEach var="emp" items="${employees}">
        <tr>
            <td>${emp.id}</td>
            <td>${emp.name}</td>
            <td>${emp.dob}</td>
            <td>${emp.gender}</td>
            <td>${emp.address}</td>
            <td>${emp.city}</td>
            <td>${emp.state}</td>
            <td>
                <a href="edit/${emp.id}">Edit</a>
                |
                <a href="delete/${emp.id}" onclick="return confirm('Delete this employee?')"> Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>


</html>