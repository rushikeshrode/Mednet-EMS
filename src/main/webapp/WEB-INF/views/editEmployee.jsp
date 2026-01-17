<%@ page import="com.rush.entity.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mednet | Update Employee</title>

<style>
body {
	background: #f4f4f4;
	padding: 20px;
}

h1 {
	text-align: center;
	margin-bottom: 35px;
	font-size: 40px;
}

.form-container {
	max-width: 700px;
	background: #ffffff;
	padding: 25px;
	margin: 0 auto;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-row {
	display: flex;
	align-items: center;
	margin-bottom: 15px;
}

.form-row label {
	width: 150px;
	font-weight: bold;
}

.form-row input, .form-row textarea, .form-row select {
	flex: 1;
	padding: 8px;
	border: 1px solid #aaa;
	border-radius: 4px;
}

textarea {
	height: 80px;
	resize: none;
}

.gender-options {
	flex: 1;
}

.checkbox-group {
	flex: 1;
	display: flex;
	flex-direction: column;
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
	font-size: 22px;
}

button:hover {
	background: #0056b3;
}

.login-btn {
	background: #28a745;
}

.login-btn:hover {
	background: #1e7e34;
}
</style>


</head>
<body>

<%
HttpSession s = request.getSession();
Employee updateEmployee = (Employee) s.getAttribute("findEmployeeById");
System.out.print(updateEmployee);
%>

<h1>Mednet Employee Update Portal</h1>

	<div class="form-container">
	
		<form action="updateEmployee" method="post">

		    <!-- REQUIRED -->
		    <input type="hidden" name="id" value="<%= updateEmployee.getId() %>">
		
		    <div class="form-row">
		        <label>ID:</label>
		        <label><%= updateEmployee.getId() %></label>
		    </div>
			

			<div class="form-row">
				<label>Name:</label> <input type="text" name="name" required="required" value="<%= updateEmployee.getName() %>">
			</div>

			<div class="form-row">
				<label>DOB:</label> <input type="date" name="dob" value="<%= updateEmployee.getDob() %>">
			</div>

			<div class="form-row">
				<label>Gender:</label>
				<div class="gender-options">
					<input type="radio" checked="checked" name="gender" value="Male" 
					<%= "Male".equals(updateEmployee.getGender()) ? "checked" : "" %> 
					> Male 
					<input type="radio" name="gender" value="Female" style="margin-left: 15px;"
					<%= "Female".equals(updateEmployee.getGender()) ? "checked" : "" %> 
					> Female
				</div>
			</div>

			<div class="form-row">
				<label>Address:</label>
				<textarea name="address" ><%= updateEmployee.getAddress() %></textarea>
			</div>

			<div class="form-row">
				<label>City:</label> <input type="text" name="city" value="<%= updateEmployee.getCity() %>">
			</div>

			<div class="form-row">
				<label>State:</label> <input type="text" name="state" value="<%= updateEmployee.getState() %>"> 
			</div>

			<div class="form-row">
				<label>Login ID:</label> <input type="text" name="loginId" required="required" value="<%= updateEmployee.getLoginId() %>">
			</div>

			<div class="form-row">
				<label>Password:</label> <input type="password" name="password" required="required" value="<%= updateEmployee.getPassword() %>">
			</div>


			<div class="button-group">
			    <button type="submit"
			        onclick="return confirm('Update this employee?')">
			        Update Employee
			    </button>
			</div>

		</form>


	</div>

</body>
</html>