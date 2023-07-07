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
shape_type = random.choice(['circle', 'square', 'triangle'])  

 # Generate a random color for the shape  
shape_color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))  

 # Draw the shape on the image  

if shape_type == 'circle':  
    draw.ellipse([(10, 10), (width-10, height-10)], fill=shape_color)  
elif shape_type == 'square':
    draw.rectangle([(10, 10), (width-10, height-10)], fill=shape_color)  
elif shape_type == 'triangle':  
    points = [(20, 10), (width-20 ,height-10), (20 ,height-10)]
    draw.polygon(points ,fill=shape_color)

# Save the generated avatar image   
avatar_image.save('avatar.png')
