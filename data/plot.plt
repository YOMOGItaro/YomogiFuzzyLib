set pm3d at b
#set pm3d map
# set isosample 40,40
set xlabel "velocity[km/h]"
set ylabel "distance[m]"
set zlabel "acceleration"

splot "twod.dat"
pause -1