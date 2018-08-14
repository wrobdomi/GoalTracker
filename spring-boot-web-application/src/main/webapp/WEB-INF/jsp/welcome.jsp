<!--  JSPF Fragments  -->
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>


<div class="container be-my-relative">  
    			
    			
    	<div class="jumbotron jumbotron-fluid jumbo-features" >
		  <div class="container">
		  	<h1>GOAL TRACKER </h1>
		    <h2 class="display-4">Welcome ${name}.</h2>
		    <p class="lead" >Achieve more thanks to organizing your goals !</p>
		    <p class="lead" onclick="displayMotiv()"><i id="motiv" > </i> <i class="blinking-cursor pointer">_</i></p>
		    
		  </div>
		</div>
		
	 <div class="container newspaper"> 
	 	
	  <a type="button" class="btn btn-success button enlarge-button" href="/list-todos">My <br> goals</a>
	  <a type="button" class="btn btn-info button enlarge-button" href="/done-todos">My <br> achievements</a>
	  <a type="button" class="btn btn-warning button enlarge-button" href="/motivation">Motivational <br> quotes </a>
	  <a type="button" class="btn btn-danger button enlarge-button">News</a>
	
	</div>    				
		
	
	
	<!--  TO DO : work on responsiveness of these jsp -->
	<div id="test-1" class="m-t-1" onmouseover="moveBox(this, this.id)"></div>
	<div id="test-2" class="m-t-2" onmouseover="moveBox(this, this.id)"></div>
	<div id="test-3" class="m-t-3" onmouseover="moveBox(this, this.id)"></div>
	<div id="test-4" class="m-t-4" onmouseover="moveBox(this, this.id)"></div>
	<div id="test-5" class="m-t-5" onmouseover="moveBox(this, this.id)"></div>
	<div id="test-6" class="m-t-6" onmouseover="moveBox(this, this.id)"></div>
	<div id="test-7" class="m-t-7" onmouseover="moveBox(this, this.id)"></div>
	<div id="test-8" class="m-t-8" onmouseover="moveBox(this, this.id)"></div>
	
	
	<div id="test-11" class="m-t-11" onmouseover="moveBox(this, this.id)"></div>
	<div id="test-22" class="m-t-22" onmouseover="moveBox(this, this.id)"></div>
	<div id="test-33" class="m-t-33" onmouseover="moveBox(this, this.id)"></div>
	<div id="test-44" class="m-t-44" onmouseover="moveBox(this, this.id)"></div>
	<div id="test-55" class="m-t-55" onmouseover="moveBox(this, this.id)"></div>
	<div id="test-66" class="m-t-66" onmouseover="moveBox(this, this.id)"></div>
	<div id="test-77" class="m-t-77" onmouseover="moveBox(this, this.id)"></div>
	<div id="test-88" class="m-t-88" onmouseover="moveBox(this, this.id)"></div>
	
	
	
		
</div>    	

<%@ include file="common/footer.jspf" %>