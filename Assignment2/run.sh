# Bash script to run mesh files.

# Generate the mesh.
e4shared --custom-post --script-file="NACA0020course.lua"

# Open in Paraview.
paraview
