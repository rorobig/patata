#!/bin/bash

# Geef de map met afbeeldingen op
directory="$(pwd)"
counter=5495  # Startnummer

# Ga door alle .jpg en .jpeg bestanden in de map heen
for file in "$directory"/*.{jpg,jpeg,JPG,JPEG}; do
    if [ -e "$file" ]; then  # Check of het bestand bestaat
        # Haal de extensie van het bestand
        extension="${file##*.}"
        # Creëer de nieuwe bestandsnaam (oplopend nummer met juiste extensie)
        new_name=$(printf "$directory/IMG_%04d.%s" "$counter" "$extension")
        # Hernoem het bestand
        mv "$file" "$new_name"
        echo "Renamed: $file to $new_name"
        # Verhoog de teller
        counter=$((counter + 1))
    fi
done
