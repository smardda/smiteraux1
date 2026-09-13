# Launch paraview to look at each power output file in turn
for i in $(find Test-* Val-* -name "*_powx.vtk"); do
paraview --data=$i
done
