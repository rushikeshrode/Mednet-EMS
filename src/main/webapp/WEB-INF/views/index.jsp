<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mednet | Home</title>

<style>
    body {
        background: #f4f4f4;
        padding: 40px;
        text-align: center;
    }

    h1 {
        margin-bottom: 30px;
        color: #333;
        font-size: 50px;
    }

    .content-box {
        background: #ffffff;
        padding: 40px;
        border-radius: 8px;
        max-width: 700px;
        margin: 0 auto 30px auto;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .content-box p {
        font-size: 20px;
        line-height: 1.6;
        color: #444;
        margin-bottom: 20px;
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

<h1>Welcome to Mednet Labs - EMS</h1>

<div class="content-box">
    <p>
        Mednet Labs is a reputed healthcare and diagnostics solutions company based
        in Nagpur. Known for its modern laboratory infrastructure and advanced
        testing capabilities, Mednet Labs provides reliable, accurate, and
        technology-driven medical diagnostics.
    </p>

    <p>
        With a commitment to quality, innovation, and patient-centric care, the
        company offers a wide range of pathology and diagnostic services. Their
        skilled team, modern equipment, and strong service approach make Mednet
        Labs one of the trusted medical testing centers in the region.
    </p>
</div>

	<div class="button-group">

		<a href="login">
			<button class="login-btn">Login</button>
		</a> 
		<a href="register">
			<button>Register</button>
		</a>

	</div>

</body>
</html>
