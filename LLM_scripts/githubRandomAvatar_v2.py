import random
from PIL import Image, ImageDraw

# Generate a random size for the avatar image 
width = random.randint(50, 200) 
height = random.randint(50, 200) 

# Create an empty image with the given size 
avatar_image = Image.new('RGB', (width, height)) 
draw = ImageDraw.Draw(avatar_image) 
  
# Generate a random background color for the image 
bg_color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)) 
draw.rectangle([(0, 0), (width, height)], fill=bg_color) 

 # Generate a random shape for the avatar image  

 # Generate a random number of sides for the polygon  

num_sides = random.randint(3, 10)  

# Generate a list of points for the polygon  

points = []  

for i in range(num_sides):  
    x = 20 + i * (width - 40) / (num_sides - 1)  

    y = 20 + i * (height - 40) / (num_sides - 1)  

    points.append((x ,y))   

# Generate a random color for the shape  

shape_color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))   

# Draw the shape on the image   

draw.polygon(points ,fill=shape_color)   

# Save the generated avatar image   

avatar_image.save('avatar2.png')