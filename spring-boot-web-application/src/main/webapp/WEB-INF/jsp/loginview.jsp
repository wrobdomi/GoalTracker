<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="js/loginScripts.js"></script> 
	<link href="css/loginStyle.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div id="login-box">
			<div class="logo">
				<h1 class="logo-caption"><span class="tweak"></span>GoalTracker</h1>
				<h1 class="logo-caption"><span class="tweak">L</span>ogin</h1>
			</div><!-- /.logo -->
			<div class="controls">
			 <form name='f' action="login" method='POST'>
				<input type="text" name="username" placeholder="Username" class="form-control" />
				<input type="password" name="password" placeholder="Password" class="form-control" />
				<button type="submit" class="btn btn-default btn-block btn-custom">Login</button>
					<c:if test="${param.error != null}">
					    <div class="login-error">
					        *Invalid Username or Password
					    </div>
					</c:if>
			 </form>
				
			</div>
		</div>
	</div>
	
	



<div id="particles-js"></div>
</body>
</html>