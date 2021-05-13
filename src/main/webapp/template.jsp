<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<!--Import Google Icon Font-->
    	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    	<!--Import materialize.css-->
  		<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
      	<!--Let browser know website is optimized for mobile-->
      	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<!--Customize css-->
  		<link type="text/css" rel="stylesheet" href="css/style.css" />
  		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

		<title>TODO</title>
</head>
<body>
  <nav class="grey darken-4 lighten-1" role="navigation">
    <div class="nav-wrapper container"><a id="logo-container" href="#" class="brand-logo">Logo</a>
      <ul class="right hide-on-med-and-down">
        <li><a href="#">Navbar Link</a></li>
      </ul>

      <ul id="nav-mobile" class="sidenav">
        <li><a href="#">Navbar Link</a></li>
      </ul>
      <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
    </div>
  </nav>
    
 <div class="container">
 	<div>
 	<!--	<a class="waves-effect waves-light btn">Add new</a>
 		<a class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">add</i></a>
 	-->
 		<div class="fixed-action-btn">
			<a class="btn-floating btn-large red">
    			<i class="large material-icons">add</i>
  			</a>
  			<ul>
    			<li><a class="btn-floating red"><i class="material-icons">insert_chart</i></a></li>
    			<li><a class="btn-floating yellow darken-1"><i class="material-icons">format_quote</i></a></li>
    			<li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
    			<li><a class="btn-floating blue"><i class="material-icons">attach_file</i></a></li>
  			</ul>
	</div>
 		
 		
 	</div>
	<table>
	<thead><tr><th>Complete</th><th>Title</th><th>Date</th><th>Action</th></tr></thead>
	</table>



 </div>

  <footer class="page-footer grey darken-4">
    <div class="footer-copyright">
      <div class="container">
      Made by <a class="orange-text text-lighten-3" href="#">Yaniv Cohen</a>
      </div>
    </div>
  </footer>
    
  <script type="text/javascript" src="js/materialize.min.js"></script>
  <script type="text/javascript" src="js/script.js"></script>
  
</body>
</html>