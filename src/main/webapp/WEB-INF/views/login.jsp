<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mednet | Login</title>

<style>
body {
	background: #f4f4f4;
	padding: 40px;
}

h1 {
	text-align: center;
	margin-bottom: 40px;
	color: #333;
}

.form-container {
	max-width: 400px;
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
	width: 100px;
	font-weight: bold;
	font-size: 20px;
}

.form-row input {
	flex: 1;
	padding: 8px;
	border: 1px solid #aaa;
	border-radius: 4px;
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

	<h1>Mednet Employee Login Portal</h1>

	<div class="form-container">
		<form action="login" method="post">

			<div class="form-row">
				<label>Login ID:</label> <input type="text" name="loginId" required="required">
			</div>

			<div class="form-row">
				<label>Password:</label> <input type="password" name="password" required="required">
			</div>

			<!--     <div class="button-group"> -->
			<!--         <button type="submit">Login</button> -->
			<!--         <a href="register" class="register-link">Register</a> -->
			<!--     </div> -->

			<div class="button-group">

				<a href="login">
					<button class="login-btn" type="submit">Login</button>
				</a> 
				

			</div>
		</form>
		<div class="button-group">

			<a href="register">
					<button>Register</button>
			</a>

		</div>
	</div>

</body>
</html>
