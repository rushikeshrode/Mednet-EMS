<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mednet | Registration</title>

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

	<h1>Mednet Employee Registration Portal</h1>

	<div class="form-container">
	
		<form action="register" method="post">

			<div class="form-row">
				<label>Name:</label> <input type="text" name="name" required="required">
			</div>

			<div class="form-row">
				<label>DOB:</label> <input type="date" name="dob">
			</div>

			<div class="form-row">
				<label>Gender:</label>
				<div class="gender-options">
					<input type="radio" name="gender" value="Male"> Male 
					<input type="radio" name="gender" value="Female" style="margin-left: 15px;"> Female
				</div>
			</div>

			<div class="form-row">
				<label>Address:</label>
				<textarea name="address"></textarea>
			</div>

			<div class="form-row">
				<label>City:</label> <input type="text" name="city">
			</div>

			<div class="form-row">
				<label>State:</label> <input type="text" name="state">
			</div>

			<div class="form-row">
				<label>Login ID:</label> <input type="text" name="loginId" required="required">
			</div>

			<div class="form-row">
				<label>Password:</label> <input type="password" name="password" required="required">
			</div>


			<div class="button-group">

				<a href="register">
					<button type="submit"
						onclick="return confirm('Register yourself at Mednet-Labs')">Register</button>
				</a>

			</div>

		</form>
		<div class="button-group">

			<a href="login">
				<button class="login-btn">Login</button>
			</a>

		</div>


	</div>

</body>
</html>
