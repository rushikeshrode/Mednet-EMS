<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Mednet | Registration</title>

<!-- Common Theme CSS -->
<link rel="stylesheet"
 href="${pageContext.request.contextPath}/resources/css/register.css">

</head>

<body>

<!-- Page Title -->
<h1>Mednet Employee Registration Portal</h1>

<c:if test="${not empty error}">
    <div id="errorBox" class="error-msg">
        ${error}
    </div>
</c:if>

<!-- Registration Card -->
<div class="form-container">

    <form action="register" method="post" onsubmit="return validatePassword()">

        <div class="form-row" >
            <label>Name</label>
            <input type="text" name="name" required>
        </div>
        
		<div class="form-row">
		    <label>Gender</label>
		
		    <select name="gender" required>
		        <option value="">-- Select Gender --</option>
		        <option value="Male">Male</option>
		        <option value="Female">Female</option>
		        <option value="Other">Other</option>
		    </select>
		</div>
        
        <div class="form-row">
            <label>Date of Birth</label>
            <input type="date" name="dob" required>
        </div>        
        

        <div class="form-row">
            <label>State</label>
            <input type="text" name="state" required>
        </div>
        
        <div class="form-row full">
            <label>Address</label>
            <textarea name="address" required></textarea>
        </div>
        
        <div class="form-row">
            <label>City</label>
            <input type="text" name="city" required>
        </div>

        <div class="form-row">
            <label>Login ID</label>
            <input type="text" name="loginId" required>
        </div>

        <div class="form-row">
            <label>Password</label>
            <input type="password" name="password" id="password" required>
        </div>
        <div class="form-row">
            <label>Confirm Password</label>
            <input type="text" id="cpassword" required>
        </div>


        <!-- Submit -->

			<div class="button-area">
				<button type="submit" onclick="return confirm('Register yourself at Mednet-Labs')">Register</button>
			</div>


		</form>


    <!-- Back to Login -->
    
		<div class="button-area">
        <a href="login">
            <button class="secondary-btn">Back to Login</button>
        </a>			
        </div>


</div>

<script>

    setTimeout(function () {
        var box = document.getElementById("errorBox");

        if (box) {
            box.style.display = "none";
        }
    }, 5000); 
    
    var pwd = document.querySelector('input[name="password"]').value;
 	
    // Password validation function
    function validatePassword() {

        var pwd = document.getElementById("password").value;
        var cpwd = document.getElementById("cpassword").value;
		console.log("Passwords:", pwd,cpwd);
        if (pwd !== cpwd) {
            alert("Passwords do not match!");
            return false; // Stop submit
        }

        return true; // Allow submit
    }
    
</script>



</body>
</html>
