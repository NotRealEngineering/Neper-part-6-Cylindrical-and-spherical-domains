#Property of Not Real Engineering 
#Copyright 2021 Not Real Engineering - All Rights Reserved. You may not use, 
#           distribute and modify this code without the written permission 
#           from Not Real Engineering.

# Customized cubical domain MICROSTRUCTURE USING NEPER

cd /mnt/c
cd NRE_examples

# Step 1 Tessellation
export OMP_NUM_THREADS=8 
neper -T -n 500 -domain "cube(3,3,1)" -o Polycrystal_cube
neper -V Polycrystal_cube.tess -datacellcol id -datacelltrs 0.5 -imagesize 1200:1200 -print Polycrystal_cube_image


# Step 2 Mesh
export OMP_NUM_THREADS=1
neper -M Polycrystal_cube.tess -order 2 -meshqualexpr Odis -meshqualmin 1
neper -V Polycrystal_cube.tess,Polycrystal_cube.msh -dataelsetcol id -imagesize 1200:1200 -print Polycrystal_cube_mesh_image
#---------------------------------------------------------------#


# Cylindrical domain MICROSTRUCTURE USING NEPER

# Step 1 Tessellation
export OMP_NUM_THREADS=8 
neper -T -n 100 -domain "cylinder(50,100)" -o Polycrystal_cylinder
neper -V Polycrystal_cylinder.tess -datacellcol id -showedge "cyl==0" -datacelltrs 0.5 -imagesize 1200:1200 -print Polycrystal_cylinder_image


# Step 2 Mesh
export OMP_NUM_THREADS=1
neper -M Polycrystal_cylinder.tess -meshqualexpr Odis -meshqualmin 1
neper -V Polycrystal_cylinder.tess,Polycrystal_cylinder.msh -dataelsetcol id -imagesize 1200:1200 -print Polycrystal_cylinder_mesh_image
#---------------------------------------------------------------#


# Spherical domain MICROSTRUCTURE USING NEPER

# Step 1 Tessellation
export OMP_NUM_THREADS=8 
neper -T -n 500 -domain "sphere(10)" -o Polycrystal_sphere
neper -V Polycrystal_sphere.tess -showedge "polynb>1" -datacellcol id -datacelltrs 0.5 -imagesize 1200:1200 -print Polycrystal_sphere_image


# Step 2 Mesh
export OMP_NUM_THREADS=1
neper -M Polycrystal_sphere.tess -meshqualexpr Odis -meshqualmin 1
neper -V Polycrystal_sphere.tess,Polycrystal_sphere.msh -dataelsetcol id -imagesize 1200:1200 -print Polycrystal_sphere_mesh_image
#---------------------------------------------------------------#