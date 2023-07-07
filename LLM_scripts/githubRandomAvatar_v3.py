import random
from PIL import Image, ImageDraw
import math

# Generate a random size for the avatar image
width = random.randint(50, 200)
height = random.randint(50, 200)

# Create an empty image with the given size
avatar_image = Image.new('RGB', (width, height))
draw = ImageDraw.Draw(avatar_image)

# Generate a random background color for the image
bg_color = (
    random.randint(
        0, 255), random.randint(
        0, 255), random.randint(
        0, 255))
draw.rectangle([(0, 0), (width, height)], fill=bg_color)

# Generate a random shape for the avatar image

# Generate a random number of sides for the polygon

num_sides = random.randint(3, 10)

# Generate a list of points for the polygon

points = []

for i in range(num_sides):
    x = 20 + i * (width - 40) / (num_sides - 1)

    y = 20 + i * (height - 40) / (num_sides - 1)

    points.append((x, y))

# Generate a random rotation angle for the shape

angle = math.radians(random.uniform(-180, 180))

# Rotate each point by the given angle

rotated_points = []

center_x = width / 2

center_y = height / 2

for x, y in points:

    rotated_x = math.cos(angle) * (x - center_x) - \
        math.sin(angle) * (y - center_y) + center_x

    rotated_y = math.sin(angle) * (x - center_x) + \
        math.cos(angle) * (y - center_y) + center_y

    rotated_points.append((rotated_x, rotated_y))

# Generate a random color for the shape

shape_color = (
    random.randint(
        0, 255), random.randint(
        0, 255), random.randint(
        0, 255))

# Draw the shape on the image

draw.polygon(rotated_points, fill=shape_color)

# Save the generated avatar image

avatar_image.save('avatar3.png')
