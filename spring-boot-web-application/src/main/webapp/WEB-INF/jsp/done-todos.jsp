<!--  JSPF Fragments  -->
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>

    	<div class="container">

	    	<div class="jumbotron jumbotron-fluid jumbo-features">
			  <div class="container">
			    <h1 class="display-4">Congratulations!</h1>
			    <p class="lead">The table of pride below is showing all your memorable achievements.</p>
			  </div>
			</div>
	    	

	    	<!--  Table with tickets -->
	    	<table class="table">
	    		<caption>Your achievements</caption>
	    		<thead>
	    		<tr class="active">
	    			<th>Description </th>
	    			<th>Target Date </th>
	    			<th>Is it done? </th>
	    			<th>Delete</th>
	    			
	    		</tr>
	    		</thead>
	    		
	    		<!--  Dynamically create body using JSTL and data stored by TodoService -->	
	    		<tbody>
	    			<c:forEach items="${todos}" var="todo">
	    			
	    			
	    		
					
	    			<tr  class="done-table-row" >
	    			
	    				<td>${todo.desc}</td>
	    				<td><fmt:formatDate value="${todo.targetDate}" pattern="dd/MM/yyyy"/></td>
	    				<td>${todo.done}</td>
	    				<td><a type="button" class="btn btn-warning" href="/delete-todo?id=${todo.id}">Delete</a></td>
	    				
	    			</tr>
	    			
	    			</c:forEach>
	    		</tbody>
	    	</table>
	    	

    	<!-- JS webjars -->
    	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	    <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	    </div>
	    
<%@ include file="common/footer.jspf" %>