<!--  JSPF Fragments  -->
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>

		<!-- Main content of the page -->
    	<div class="container">
    	
    	
    	
    	<div class="jumbotron jumbotron-fluid jumbo-features">
			  <div class="container">
			    <h1 class="display-4">Set a new goal for ${name}.</h1>
			    <p class="lead"></p>
			 </div>
		</div>
	    	
    	
    	
    	<!--  Usage of command bean in form ( mapping to object )-->
    	<form:form method="post" modelAttribute="todo">
    		<form:hidden path="id"/>
    		
    		<fieldset class="form-group">
	    		<form:label path="desc">Description:</form:label> 
	    		<form:input path="desc" type="text" class="form-control" required="required"/>
	    		<form:errors path="desc" cssClass="text-warning"></form:errors>
    		</fieldset>
    		
    		<fieldset class="form-group">
	    		<form:label path="targetDate">Target Date:</form:label> 
	    		<form:input path="targetDate" type="text" class="form-control" required="required"/>
	    		<form:errors path="targetDate" cssClass="text-warning"></form:errors>
    		</fieldset>
    		
    		<button type="submit" class="btn btn-success">Add</button>
    	</form:form>
    	
    	</div>
    
<%@ include file="common/footer.jspf" %>