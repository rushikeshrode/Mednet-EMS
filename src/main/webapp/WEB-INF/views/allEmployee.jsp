<%@ page import="com.rush.entity.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mednet | Employees</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/allEmployee.css">

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
					<button class="logout-btn" onclick="return confirm('Are you sure you want to logout?')">
						Logout
					</button>
				</a>
			</div>
	
		</div>

<!-- ========== EMPLOYEE LIST SECTION ========== -->

	<h2>All Employees</h2>

	<table>
	    <tr>
	        <th>EmpID</th>
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
	                <a href="print/${emp.id}">Print</a>
	                |
	                <a href="delete/${emp.id}" onclick="return confirm('Delete this employee?')"> Delete</a>
	            </td>
	        </tr> 
	        
	    </c:forEach>
	</table>

</body>


</html>