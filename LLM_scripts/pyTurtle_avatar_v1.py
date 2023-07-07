import turtle

# Create a new turtle object
turtle_avatar = turtle.Turtle()

# Set the background color to black
turtle.bgcolor("black")

# Set the pen color to red and draw a circle with radius of 50 pixels 
turtle_avatar.pencolor("red") 
turtle_avatar.circle(50) 
  
# Move the turtle to the right by 100 pixels and draw a circle with radius of 50 pixels 
turtle_avatar.penup() 
turtle_avatar.setpos(100, 0) 
turtle_avatar.pendown() 
turtle_avatar.circle(50) 

 # Move the turtle to the right by 100 pixels and draw a circle with radius of 50 pixels 
turtle_avatar.penup() 
turtle_avatar.setpos(200, 0) 
turtle_avatar.pendown() 
turtle_avatar.circle(50)  

 # Move the turtle to the right by 100 pixels and draw a circle with radius of 50 pixels 
turtle_avatar.penup() 
turtle_avatar.setpos(300, 0) 
turtle_avatar.pendown() 

 # Change pen color to green and draw a circle with radius of 50 pixels  										   	    
turtle_avatar.pencolor("green")  	    
turtle_avatar.circle(50)  

 # Move the turtle to the right by 100 pixels and draw a circle with radius of 50 pixels  	    
turtle_avatar.penup()  	    
turtle_avatar.setpos(400, 0)  	    
turtle_avatar.pendown()  

 # Change pen color to blue and draw a circle with radius of 50 pixels  	    
turtle_avatar.pencolor("blue")  	   
turtle_avatar.circle(50)  

 # Save your avatar as an image file in png format named "TurtuleAvater"    	    
ts = turtle.getscreen()    
ts = ts .getcanvas().postscript(file="TurtuleAvater" + ".png", colormode='color')