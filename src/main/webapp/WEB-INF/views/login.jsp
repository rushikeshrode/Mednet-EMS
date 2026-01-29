<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mednet | Login</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">

</head>
<body>

	<h1>Employee Login Portal</h1>

	<div class="form-container">
		<form action="login" method="post">

			<div class="form-row">
				<label>Login ID:</label> <input type="text" name="loginId"
					required="required">
			</div>

			<div class="form-row">
				<label>Password:</label> <input type="password" name="password"
					required="required">
			</div>



			<div class="button-group">
				<button class="login-btn" type="submit">Login</button>
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
