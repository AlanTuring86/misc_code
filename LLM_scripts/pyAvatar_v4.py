import datetime
import random
from PIL import Image, ImageDraw
import os

# Create a new image with a white background
image = Image.new('RGB', (200, 200), (255, 255, 255))
draw = ImageDraw.Draw(image)
 
# Generate random rectangles with different colors and orientations 
for i in range(10): 

    # Generate a random color for the rectangle  
    color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))  

    x1 = random.randint(0, 200) 
    y1 = random.randint(0, 200) 

    x2 = random.randint(0, 200) 
    y2 = random.randint(0, 200) 

    draw.rectangle([x1, y1, x2, y2], fill=color) 

 # Generate a unique color for the background  
background_color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))  

 # Create a new image with the generated background color  
background_image = Image.new('RGB', (200, 200), background_color)  

 # Paste the generated avatar onto the background image  
background_image.paste(image)  

 # Generate a timestamp for the filename  
timestamp = datetime.datetime.now().strftime("%Y-%m-%d-%H-%M-%S")  

 # Create a directory called "avatars" if it doesn't exist already 
if not os.path.exists("avatars"): 
    os.mkdir("avatars") 

 # Save the file as a png under the name "avatar" with a timestamp in the avatars directory  
background_image.save("avatars/avatar-" + timestamp + ".png")
