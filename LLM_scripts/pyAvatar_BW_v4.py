import datetime
import random
from PIL import Image, ImageDraw
import os

# Create a new image with a white background
image = Image.new('RGB', (200, 200), (255, 255, 255))
draw = ImageDraw.Draw(image)
 
# Generate random rectangles with black or white colors and same width and height 
for i in range(10): 

    # Generate a random color for the rectangle  
    color = random.choice([(0, 0, 0), (255, 255, 255)])  

    x1 = 0  # Start from the left edge of the image 

    # Each rectangle will span one-tenth of the image height but sometimes reduce it slightly to create "holes" in the rectangles  
    y1 = i * (200 // 10) + random.randint(-2 * (200 // 10), 2 * (200 // 10))

    x2 = 200 # End at the right edge of the image 

    # Each rectangle will span one-tenth of the image height but sometimes reduce it slightly to create "holes" in the rectangles  
    y2 = (i + 1) * (200 // 10) + random.randint(-2 * (200 // 10), 2 * (200 // 10))

    # Sometimes rotate the rectangles slightly  
    angle = random.randint(-5, 5)  

    draw.rectangle([x1, y1, x2, y2], fill=color)  # Remove .rotate(angle) here as it is not necessary for drawing a rectangle

 # Generate a unique color for the background  
background_color = random.choice([(0, 0 , 0), (255 , 255 , 255)])  

 # Create a new image with the generated background color  
background_image = Image.new('RGB', (200, 200), background_color)  

 # Paste the generated avatar onto the background image and rotate it slightly if necessary 
if angle != 0:  # Only rotate if necessary 
    #background_image.paste(image,rotate=angle)  # Rotate here instead of when drawing rectangles as we need to rotate only once after all rectangles are drawn
    background_image.paste(image)
    background_image = background_image.rotate(angle)
else:  # Otherwise just paste without rotating    
    background_image.paste(image)     

 # Generate a timestamp for the filename  
timestamp = datetime.datetime.now().strftime("%Y-%m-%d-%H-%M-%S")  

 # Create a directory called "avatars" if it doesn't exist already 
if not os.path.exists("avatars"): 
    os.mkdir("avatars") 

 # Save the file as a png under the name "avatar" with a timestamp in the avatars directory
 # Save the file as a png under the name "avatar" with a timestamp in the avatars directory  
background_image.save("avatars/avatar-" + timestamp + ".png")
