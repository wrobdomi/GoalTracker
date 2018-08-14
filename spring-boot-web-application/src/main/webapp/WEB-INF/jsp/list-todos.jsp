<!--  JSPF Fragments  -->
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>


    	<div class="container">
    	
	    	<div class="jumbotron jumbotron-fluid jumbo-features">
			  <div class="container">
			    <h1 class="display-4">Goal Tracker</h1>
			    <p class="lead">List of goals for ${name}</p>
			  </div>
			</div>
	    	
	    	
	    	
	  		<div id="flip"><b>Click to see color legend</b></div>
			
			
			<div id="panel">
		
			
				 <div class="col-sm-6 color-legend-done"><b>Already done</b></div>
  				 <div class="col-sm-6 color-legend-today"><b>To be done today</b></div>
  			<br>
  			
				 <div class="col-sm-6 color-legend-late"><b>Late</b></div>
  				 <div class="col-sm-6 color-legend-todo"><b>To do in the future</b></div>
  		
			</div>
			
	    	
	    	<!-- table-striped --> 
	    	<!--  Table with tickets -->
	    	<table class="table">
	    		<caption>Today is <fmt:formatDate value="${currentDate}" pattern="dd/MM/yyyy"/>. Your goals are:</caption>
	    		<thead>
	    		<tr class="active" >
	    			<th>Description </th>
	    			<th>Target Date </th>
	    			<th>Is it done? </th>
	    			<th>Update</th>
	    			<th>Delete</th>
	    			<th>Sign as done</th>
	    		</tr>
	    		</thead>
	    		
	    		<!--  Dynamically create body using JSTL and data stored by TodoService -->	
	    		<tbody>
	    			
	    			<c:set value="0" var="lateGoals"></c:set>
	    			<c:set value="0" var="todayGoals"></c:set>
	    			<c:set value="0" var="todoGoals"></c:set>
	    			<c:set value="0" var="doneGoals"></c:set>
	    			<c:set value="0" var="allGoals"></c:set>
	    			
	    			
	    			<c:forEach items="${todos}" var="todo">
	    			
					
					<c:set value="${allGoals+1}" var="allGoals"></c:set>
					
					<fmt:formatDate value="${todo.targetDate}" pattern="yyyy" var="todoYear" />
					<fmt:formatDate value="${currentDate}" pattern="yyyy" var="currentYear" />
					<fmt:formatDate value="${todo.targetDate}" pattern="MM" var="todoMonth" />
					<fmt:formatDate value="${currentDate}" pattern="MM" var="currentMonth" />	
					<fmt:formatDate value="${todo.targetDate}" pattern="dd" var="todoDay" />
					<fmt:formatDate value="${currentDate}" pattern="dd" var="currentDay" />	
					
					
					
					<!-- Default goal--------------------------------------- -->
					<c:set value="todo-table-row" var="cssClass"></c:set>
					<!-- --------------------------------------------------------------- -->
					
					
					<!-- Qualifying as a late goal --------------------------------------- -->
					<c:if test="${todoYear < currentYear}">
						<c:set value="late-table-row" var="cssClass"></c:set>
					</c:if> 
					
					
					<c:if test="${todoYear == currentYear}">					
							<c:if test="${todoMonth < currentMonth}">
					    		<c:set value="late-table-row" var="cssClass"></c:set>
					    	</c:if> 
					</c:if> 
					
					<c:if test="${todoYear == currentYear}">	
						<c:if test="${todoMonth == currentMonth}">					
								<c:if test="${todoDay < currentDay}">
						    		<c:set value="late-table-row" var="cssClass"></c:set>
						    	</c:if> 
						</c:if> 
					</c:if> 
					<!-- --------------------------------------------------------------- -->
					
					
					
					<!-- Qualifying as today goal --------------------------------------- -->
					<c:if test="${todoYear == currentYear && todoMonth == currentMonth && todoDay == currentDay }">
					    	<c:set value="today-table-row" var="cssClass"></c:set>
					    	
					</c:if> 
					<!-- --------------------------------------------------------------- -->
					
					
					<c:if test="${todo.done=='true'}"> 
					  		<c:set value="done-table-row" var="cssClass"></c:set>
					  		
					</c:if> 
					
					
					
					<c:if test="${cssClass == 'done-table-row'}">
						<c:set value="${doneGoals+1}" var="doneGoals"></c:set>
					</c:if> 
					<c:if test="${cssClass == 'today-table-row'}">
						<c:set value="${todayGoals+1}" var="todayGoals"></c:set>
					</c:if> 
					<c:if test="${cssClass == 'late-table-row'}">
						<c:set value="${lateGoals+1}" var="lateGoals"></c:set>
					</c:if> 

	    			
	    			<tr class="${cssClass}" >
	    				<td>${todo.desc}</td>
	    				<td><fmt:formatDate value="${todo.targetDate}" pattern="dd/MM/yyyy"/></td>
	    				<td>${todo.done}</td>
	    				<td><a type="button" class="btn btn-info" href="/update-todo?id=${todo.id}">Update</a></td>
	    				<td><a type="button" class="btn btn-warning" href="/delete-todo?id=${todo.id}">Delete</a></td>
	    				<td><a type="button" class="btn btn-success" href="/signasdone-todo?id=${todo.id}">Done</a></td>
	    			</tr>
	    			</c:forEach>
	    			
	    			<c:set value="${allGoals-doneGoals-todayGoals-lateGoals}" var="todoGoals"></c:set>
	    			
	    		</tbody>
	    	</table>

	    	
	    	<div>
	    		<a type="button" class="btn btn-primary" href="/add-todo">Add a goal</a>
    		
    		
    		<button class="btn btn-primary" onclick="display(${doneGoals}, ${lateGoals}, ${todayGoals}, ${todoGoals} )">Show my statistics</button>
    		</div>
    	
    		<canvas id="myChart"></canvas>
    		
    		
    	
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    	<script>
    	
	    	
	    	function display(x, y, z, a){
	    		console.log("TRYING TO CREATE MY FIRST CHART");
		    	var ctx = document.getElementById('myChart').getContext('2d');
		    	var chart = new Chart(ctx, {
		    	    // The type of chart we want to create
		    	    type: 'bar',
		    	    
		    	    // The data for our dataset
		    	    data: {
		    	        labels: ["Done Goals", "Late Goals ", "Today Goals", "Future Goals"],
		    	        datasets: [{
		    	            label: "Goals",
		    	            backgroundColor: ["#A4C639", "#c94c4c","#6b5b95","#aaaaaa"],
		    	            borderColor: 'rgb(255, 99, 132)',
		    	            data: [x, y, z, a],
		    	        }]
		    	    },
		    	    
		    	    options: {
		    	        scales: {
		    	            yAxes: [{
		    	                ticks: {
		    	                	 max: 5,
		    	                     min: 0,
		    	                     stepSize: 1
		    	                }
		    	            }]
		    	        }
		    	    }
		
		    	    // Configuration options go here
		    	   
		    	});
	    	}
    	
    	</script>
    	
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    	
    	<script> 
			$(document).ready(function(){
			    $("#flip").click(function(){
			        $("#panel").slideToggle("slow");
			    });
			});
		</script>
		
		
		
    	<!-- JS webjars -->
    	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	    <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	    </div>
	    
<%@ include file="common/footer.jspf" %>