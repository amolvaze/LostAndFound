<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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
		.head div{
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 200;
}
.head div span{
	color: #5379fa !important;
	text-align: left;
}
		body
		{
		background-color:#101010; 
		color:white;
		}
	    select,input
		{
		color:black;
		}
		</style>
<body>

    <nav class="navbar navbar-inverse " role="navigation">
      <div>
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
                  
                        <div class="head">
			<div><b>LOST<span> & FOUND</span><b></div>
		</div>
                    </a>

        </div>
       <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" role="form">
            <div class="form-group">
              
            </div>
           
          </form>
        </div><!--/.navbar-collapse -->

      </div>
    </nav>

	<div style='position:absolute; top:300px; left:800px;' >
		<form:form class="form-signin" modelAttribute="user" method="POST" action="login">
			<h2 class="form-signin-heading">Login</h2>
			<form:label for="inputEmail" path="emailID" class="sr-only">Email address</form:label> 
			<form:input path="emailID" id="inputEmail" class="form-control"
				placeholder="Email address" />
				
			<form:label for="inputPassword" path="password" class="sr-only">Password</form:label> 
			<form:input type="password" path="password" id="inputEmail" class="form-control"
				placeholder="Password" />
			 
		
			
			 <input type="submit" value="Submit" class="form-control btn btn-lg btn-primary"/>
		    	</form:form>

	</div> 
	<!-- /container -->
</body>
</html>