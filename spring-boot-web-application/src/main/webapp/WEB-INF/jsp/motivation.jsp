<!--  JSPF Fragments  -->
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>

	    	
	    	<!--  My Very First Attempt At 3D CSS ( Got inspired :D )  -->
	    	<div id="viewport" class="viewport-3d">
			  <div id="world" class="world-3d"></div>
			</div>
	  
	    	
    	<script>
    	
	    	/*
	    	  Defining our variables
	    	  world and viewport are DOM elements,
	    	  worldXAngle and worldYAngle are floats that hold the world rotations,
	    	  d is an int that defines the distance of the world from the camera
	    	*/
	    	var world = document.getElementById( 'world' ),
	    	  viewport = document.getElementById( 'viewport' ),
	    	  worldXAngle = 0,
	    	  worldYAngle = 0,
	    	  d = 0;
	
	    	
	    	
	    	/*
	    	  Event listener to transform mouse position into angles
	    	  from -180 to 180 degress, both vertically and horizontally
	    	*/
	    	window.addEventListener( 'mousemove', function( e ) {
		
	    	  worldYAngle = -( .5 - ( e.clientX / window.innerWidth ) ) * 180;
	    	  worldXAngle = ( .5 - ( e.clientY / window.innerHeight ) ) * 180;
	    	  updateView();
	
	    	} );

	    	
	    	
	    	
	    	/*
	    	  Changes the transform property of world to be
	    	  translated in the Z axis by d pixels,
	    	  rotated in the X axis by worldXAngle degrees and
	    	  rotated in the Y axis by worldYAngle degrees.
	    	*/
	    	function updateView() {
	    	  world.style.transform = 'translateZ( ' + d + 'px ) \
	    	  rotateX( ' + worldXAngle + 'deg) \
	    	  rotateY( ' + worldYAngle + 'deg)';
	
	    	}
	    	
	    	
    	
	    	
			/*
			  objects is an array of cloud bases
			  layers is an array of cloud layers
			*/
			var objects = [],
			  layers = [];
	
			
			
			generate();
			
			
			/*
			  Clears the DOM of previous clouds bases
			  and generates a new set of cloud bases
			*/
			function generate() {
			  
			  console.log("Start script");
			  
			  objects = [];
			  layers = [];
	
			  if ( world.hasChildNodes() ) {
				  console.log("i have a child");
			    while ( world.childNodes.length >= 1 ) {
			      world.removeChild( world.firstChild );
			    }
			  }
	
			  for( var j = 0; j < 5; j++ ) {
			    objects.push( createCloud() );
			  }
			  
			  for( var j = 0; j < 8; j++ ) {
				    objects.push( createQuote() );
				  }
	
			}
	
			
			
			/*
			  Creates a single cloud base: a div in world
			  that is translated randomly into world space.
			  Each axis goes from -256 to 256 pixels.
			*/
			function createCloud() {
				  
				  random_a= Math.floor(Math.random() * 201) - 100;
			      random_s= Math.random();
			      
			      
				  random_x= Math.floor(Math.random() * 300) - 150;
			      random_y= Math.floor(Math.random() * 300) - 150;
			      random_z= Math.floor(Math.random() * 300) - 150;
			  	  
			  	  /* 
			  	  random_x=110;
			  	  random_y=0;
			  	  random_z=0;
			  	  */
			  	  
			      var div = document.createElement( 'div'  );
			      div.className = 'cloudBase';
			      
			      var t = 'translateX( ' + random_x + 'px ) \
			        translateY( ' + random_y + 'px ) \
			        translateZ( ' + random_z + 'px )';
			      div.style.transform = t;
			      world.appendChild( div );

			      for( var j = 0; j < 14; j++ ) {
			        var cloud = document.createElement( 'IMG' );
			        cloud.className = 'cloudLayer';
					cloud.setAttribute("src", "img/cloud.png");
					
					
			       	  random_a= Math.floor(Math.random() * 201) - 100;
				      random_s= Math.random();
				      
					  random_x= Math.floor(Math.random() * 1000) - 500;
				      random_y= Math.floor(Math.random() * 50) + 10;
				      random_z= Math.floor(Math.random() * 800) - 400;
				      
				      
				     
			        cloud.data = {
			          x: random_x,
			          y: random_y,
			          z: random_z,
			          a: random_a,
			          s: random_s
			        };
			        
			        var t = 'translateX( ' + random_x + 'px ) \
			          translateY( ' + random_y + 'px ) \
			          translateZ( ' + random_z + 'px ) \
			          rotateZ( ' + random_a + 'deg ) \
			          scale( ' + random_s + ' )';
			          
			          
			          
			          /*var t = 'translateZ( ' + random_x + 'px )'; 
			          
			          \
				        translateY( ' + random_y + 'px ) \
				        translateZ( ' + random_z + 'px )';
			          */
			          
			        cloud.style.transform = t;
					
			          //-webkit-animation:spin 4s linear infinite;
			          //-moz-animation:spin 4s linear infinite;
			          
			          
			        //cloud.setAttribute("animation", "spin 4s linear infinite");
			        
			        div.appendChild( cloud );
			        layers.push( cloud );
			      }

			      return div;
			      
			}
			
			
			
			
			function createQuote() {
				  
				  random_a= Math.floor(Math.random() * 201) - 100;
			      random_s= Math.random();
			      
			      
				  random_x= Math.floor(Math.random() * 300) - 150;
			      random_y= Math.floor(Math.random() * 300) - 325;
			      random_z= Math.floor(Math.random() * 300) - 150;
			  	  
			  	  /* 
			  	  random_x=110;
			  	  random_y=0;
			  	  random_z=0;
			  	  */
			  	  
			      var div = document.createElement( 'div'  );
			      div.className = 'cloudBase';
			      
			      var t = 'translateX( ' + random_x + 'px ) \
			        translateY( ' + random_y + 'px ) \
			        translateZ( ' + random_z + 'px )';
			      div.style.transform = t;
			      world.appendChild( div );

			      for( var j = 0; j < 1; j++ ) {
			        var cloud = document.createElement( 'IMG' );
			        cloud.className = 'cloudLayer';
			        
			        var chooseImage = Math.floor(Math.random()*3)+2;
			        chooseImage = chooseImage - Math.floor(Math.random()+0.5);
			       	console.log(chooseImage); 
			       
			       	if(chooseImage==1){
						cloud.setAttribute("src", "img/Q_1.png");
			       	}
			    	if(chooseImage==2){
						cloud.setAttribute("src", "img/Q_2.png");
			       	}
			    	if(chooseImage==3){
						cloud.setAttribute("src", "img/Q_3.png");
			       	}
			    	if(chooseImage==4){
						cloud.setAttribute("src", "img/Q_4.png");
			       	}
					
					
					
					
			       	  random_a= Math.floor(Math.random() * 201) - 100;
				      random_s= Math.random();
				      
					  random_x= Math.floor(Math.random() * 700) - 350;
				      random_y= Math.floor(Math.random() * 200) - 200;
				      random_z= Math.floor(Math.random() * 650) - 325;
				      
				      
				      
				      
			        cloud.data = {
			          x: random_x,
			          y: random_y,
			          z: random_z,
			          a: random_a,
			          s: random_s
			        };
			        
			        var t = 'translateX( ' + random_x + 'px ) \
			          translateY( ' + random_y + 'px ) \
			          translateZ( ' + random_z + 'px ) \
			          rotateZ( ' + random_a + 'deg ) \
			          scale( ' + random_s + ' )';
			          
			          
			          
			          /*var t = 'translateZ( ' + random_x + 'px )'; 
			          
			          \
				        translateY( ' + random_y + 'px ) \
				        translateZ( ' + random_z + 'px )';
			          */
			          
			        cloud.style.transform = t;
					
			          //-webkit-animation:spin 4s linear infinite;
			          //-moz-animation:spin 4s linear infinite;
			          
			          
			        //cloud.setAttribute("animation", "spin 4s linear infinite");
			        
			        div.appendChild( cloud );
			        layers.push( cloud );
			      }

			      return div;
			      
			}
			
			
			
			update();
			
			function update (){

				  for( var j = 0; j < layers.length; j++ ) {
				    var layer = layers[ j ];
				    layer.data.a += layer.data.speed;
				    var t = 'translateX( ' + layer.data.x + 'px ) \
				      translateY( ' + layer.data.y + 'px ) \
				      translateZ( ' + layer.data.z + 'px ) \
				      rotateY( ' + ( - worldYAngle ) + 'deg ) \
				      rotateX( ' + ( - worldXAngle ) + 'deg ) \
				      scale( ' + layer.data.s + ')';
				    layer.style.transform = t;
				  }

				  requestAnimationFrame( update );

				}
			
		</script> 
	    <!--  </div> -->
	    
	    
	    
<%@ include file="common/footer.jspf" %>