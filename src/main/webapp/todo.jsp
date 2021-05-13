<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<link rel="shortcut icon" href="favicon.ico" />
		<!--Import Google Icon Font-->
    	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    	<!--Import materialize.css-->
  		<link type="text/css" rel="stylesheet" href="css/materialize.css"  media="screen,projection"/>
  		<!-- <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
  		 -->
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
 <div id="inside_block" style="height: 84vh;">
 	<div>
 		<br/>
 		<br/>
 		<div class="fixed-action-btn">
			<a class="btn-floating btn-large red" id="open_new_note">
    			<i class="large material-icons">add</i>
  			</a>
		</div>
		<!-- New note -->
 	   			<div id="new_note" class="modal custom_model">
				<div class="modal-content">
					  <div class="row">
    					<form class="col s12" action=todoServlet method=POST>
    						<input type="hidden" name="command" value="NEW" />
							<input type="hidden" name="user" value="yanivc"/>
      						<div class="row">
        						<div class="input-field col s6">
          							<i class="material-icons prefix">mode_edit</i>
          							<textarea id="icon_prefix2" class="materialize-textarea" style="font-size: 1.9em;" name="title"></textarea>
          							<label for="icon_prefix2">Title</label>
        						</div>
      						</div>
      						<div class="row">
        						<div class="input-field col s12" id="data_div">
  	        						<i class="material-icons prefix">mode_edit</i>
    	      						<textarea id="icon_prefix2" class="materialize-textarea resize_texarea" style="height: 375px;" name="data"></textarea>
        	  						<label for="icon_prefix2">Note</label>
       							 </div>
      						</div>
      						<div class="modal-footer">
       							<input type=submit class="modal-close waves-effect waves-green btn-flat" value=Save />
    						</div>
    					</form>
  					</div>
				</div>
			</div>
	<!-- End of new note -->
 	</div>
	<div id="inside">
		<table>
	<thead>
		<tr><th>Complete</th><th>Title</th><th>Date</th><th>Action</th></tr>
	</thead>
	<tbody>
	<c:forEach var="row" items="${TODO}">
		<c:url var="deleteLink" value="todoServlet">
			<c:param name="command" value="DELETE" />
			<c:param name="rowId" value="${row.id}" />
		</c:url>
		<tr id="modal_${row.id}">
			<td>
				<form action=todoServlet method=POST>
				<input type="hidden" name="command" value="UPDATE" />
				<input type="hidden" name="rowId" value="${row.id}"/>
				<input type="hidden" name="user" value="yanivc"/>
				<input type="hidden" name="title" value="${row.title}"/>
				<input type="hidden" name="data" value="${row.data}"/>				
				<p>
				<c:choose>
				<c:when test="${row.complete}">
				    <label>
				    <input type="checkbox" class="complete_placeholder" checked="checked" onChange="this.form.submit()" name="complete" value="false"  />
				    <span></span>			
					</label>
				</c:when>
				<c:otherwise>
					<label>
					<input type="checkbox" onChange="this.form.submit()" name="complete" value="true" />
					<span></span>
					</label>
				</c:otherwise>
				</c:choose>
				</p>
				</form>
			</td>
			<td data-target="modal1" class="modal-trigger modal_trigger" >${row.title}</td>
				<td class="modal_trigger"> 
				<fmt:formatDate type = "both" pattern="dd/MM/YY H:m" value = "${row.date}" />
				</td> 
 			<td><a href="${deleteLink}" onclick="if(!(confirm('Are you sure?'))) return false">DELETE</a></td>
<!-- Update Modal -->
   			<div id="modal_${row.id}" class="modal custom_model">
				<div class="modal-content">
					  <div class="row">
    					<form class="col s12" id="form_${row.id}" action=todoServlet method=POST>
    						<input type="hidden" name="command" value="UPDATE" />
    						<input type="hidden" name="rowId" value="${row.id}"/>
							<input type="hidden" name="user" value="yanivc" />
							<input type="hidden" name="complete" value="false"/>    					
      						<div class="row">
        						<div class="input-field col s6">
          							<i class="material-icons prefix">mode_edit</i>
          							<textarea id="icon_prefix2" name="title" class="materialize-textarea" style="font-size: 1.9em;" >${row.title}</textarea>
          							<label for="icon_prefix2">Title</label>
        						</div>
      						</div>
      						<div class="row">
        						<div class="input-field col s12" id="data_div">
  	        						<i class="material-icons prefix">mode_edit</i>
    	      						<textarea id="icon_prefix2" name="data" class="materialize-textarea resize_texarea" style="height: 375px;">${row.data}</textarea>
        	  						<label for="icon_prefix2">Note</label>
       							 </div>
      						</div>
      						<div class="modal-footer">
        							<input type=submit class="modal-close waves-effect waves-green btn-flat" style="display: none;" />
        							<input type=button onclick="form_submit('form_${row.id}');" value=Save />    			
   						</div>
    					</form>
  					</div>
				</div>
			</div>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	</div>

 <br/>
 <br/>
 </div>
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
