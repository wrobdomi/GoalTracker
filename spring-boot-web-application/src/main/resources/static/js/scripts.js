function moveBox(x, y) {
		
	var My_colors = ["#e3a21a", "#e3a21a", "#da532c", "#b91d47", "#99b433", "#00a300", "#1e7145", "#ff0097", 
		"#9f00a7", "#7e3878", "#603cba", "#1d1d1d", "#2d89ef", "#2b5797", "#ffc40d", "#ee1111",
		"#b91d47"]; 

	var x_1;
	
	if(y.length < 7){
		
		switch (y) {
	  
		    case "test-1":
		    	x_1="test-11";
		        console.log(x_1);
		        break;
		    case "test-2":
		    	x_1="test-22";
		        console.log(x_1);
		        break;
		    case "test-3":
		    	x_1="test-33";
		        console.log(x_1);
		        break;
		    case "test-4":
		    	x_1="test-44";
		        console.log(x_1);
		        break;
		    case "test-5":
		    	x_1="test-55";
		        console.log(x_1);
		        break;
		    case "test-6":
		    	x_1="test-66";
		        console.log(x_1);
		        break;
		    case "test-7":
		    	x_1="test-77";
		        console.log(x_1);
		        break;
		    case "test-8":
		    	x_1="test-88";
		        console.log(x_1);
		        break;
		}
	}
	
	else {
		
		switch (y) {
		  
	    case "test-11":
	    	x_1="test-1";
	        console.log(x_1);
	        break;
	    case "test-22":
	    	x_1="test-2";
	        console.log(x_1);
	        break;
	    case "test-33":
	    	x_1="test-3";
	        console.log(x_1);
	        break;
	    case "test-44":
	    	x_1="test-4";
	        console.log(x_1);
	        break;
	    case "test-55":
	    	x_1="test-5";
	        console.log(x_1);
	        break;
	    case "test-66":
	    	x_1="test-6";
	        console.log(x_1);
	        break;
	    case "test-77":
	    	x_1="test-7";
	        console.log(x_1);
	        break;
	    case "test-88":
	    	x_1="test-8";
	        console.log(x_1);
	        break;
	}
		
	}
	
	var ranNum = Math.floor((Math.random() * My_colors.length) + 1);
	var ranNum_1 = Math.floor((Math.random() * My_colors.length) + 1);
	

	x.style.backgroundColor = My_colors[ranNum];
	document.getElementById(x_1).style.backgroundColor = My_colors[ranNum_1];

	
    var id = setInterval(frame, 25);
    var degrees = 50; 
    
    function frame() {
    	
    	if(degrees==140) {
    		  clearInterval(id);
    		}
    	else {
    		
    		insert = degrees + "deg"; 
    	
	    	x.style.transform="rotate(" + insert + ")";
	    	document.getElementById(x_1).style.transform="rotate(" + insert + ")";
	    	
	    	degrees=degrees+5;
	        
    	}
    }
     
}




function displayMotiv() {
	
	
	document.getElementById("motiv").innerHTML = " ";
	
	var My_letters = ['E', 'v', 'e', 'r', 'y', ' ', 'm', 'i', 'n', 'u', 't', 'e', ' ', 'm', 'a', 't', 't', 'e', 'r', 's', ' ', '!' ]; 

	var My_motiv_quotes = [
			
		['E', 'v', 'e', 'r', 'y', ' ', 'm', 'i', 'n', 'u', 't', 'e', ' ', 'm', 'a', 't', 't', 'e', 'r', 's', ' ', '!'],
		
		['N', 'e', 'v', 'e', 'r', ' ', 'g', 'i', 'v', 'e', ' ', 'u', 'p', ' ', '!'],
		
		['H', 'a', 'r', 'd', ' ', 'w', 'o', 'r', 'k', ' ', 'p', 'a', 'y', 's', ' ', 'o', 'f', 'f', ' ', '!']
		
		];
	
	
	
	
	
	console.log(My_motiv_quotes[0].length);
	console.log(My_motiv_quotes[1].length);
	
	
	var ranNum = Math.floor((Math.random() * My_motiv_quotes.length) + 1);
	
	
	console.log(ranNum);
	
	
    var id = setInterval(frame, 200);
    var counter = 0; 
    
    function frame() {
    	
    	if(counter==(My_motiv_quotes[ranNum-1].length)) {
    		  clearInterval(id);
    		}
    	else {
    		
	    	document.getElementById("motiv").innerHTML = document.getElementById("motiv").innerHTML + My_motiv_quotes[ranNum-1][counter];
	    	
	    	counter++; 
	        
    	}
    }
    
    
    
}

