<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #eee;
}

.form-signin {
	max-width: 300px;
	padding: 15px;
	margin: 0 auto;
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin .checkbox {
	font-weight: normal;
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
</style>
</head>
<body>
	<div class="container">
		<form:form class="form-signin" modelAttribute="user" method="POST" action="regUser">
			<h2 class="form-signin-heading">Register</h2>
			<form:label for="inputfirstName" path="firstName" class="sr-only">First Name</form:label> 
			<form:input path="firstName" id="firstName" class="form-control"
				placeholder="First Name" />
				<form:label for="inputlastName" path="lastName" class="sr-only">Last Name</form:label> 
			<form:input path="lastName" id="inputEmail" class="form-control"
				placeholder="Last Name" />
			<form:label for="inputEmail" path="emailID" class="sr-only">Email address</form:label> 
			<form:input path="emailID" id="inputEmail" class="form-control"
				placeholder="Email address" />
				
			<form:label for="inputPassword" path="password" class="sr-only">Password</form:label> 
			<form:input type="password" path="password" id="inputEmail" class="form-control"
				placeholder="Password" />
			 
			<!-- <div class="checkbox">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div> -->
			
			 <input type="submit" value="Submit" class="btn btn-lg btn-primary"/>
		 	</form:form>

	</div>
	<!-- /container -->
</body>
</html>