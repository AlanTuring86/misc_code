import random

# List of cat names organized by breed
cat_names = {
    'Abyssinian': ['Puma', 'Nala', 'Aby', 'Sabre', 'Zara'],
    'Siamese': ['Koko', 'Ling', 'Sia', 'Leo', 'Kai'],
    'Persian': ['Simba', 'Luna', 'Persy', 'Fluffy', 'Whiskers'],
    'Sphynx': ['Neko', 'Sphynxy', 'Baldy', 'Hairless', 'Nakey'],
    'Maine Coon': ['Maine', 'Coony', 'Coonie', 'McGraw', 'Muffin']
}

# Prompt user for cat breed
breed = input("What breed of cat would you like a name for? ")

# Check if breed is in cat_names dictionary
if breed in cat_names:
    # Select a random name from the breed's list of names
    name = random.choice(cat_names[breed])
    print(f"Here is a good name for a {breed} cat: {name}")
else:
    print(f"Sorry, we do not have a list of names for {breed} cats.")