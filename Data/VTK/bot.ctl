&miscparameters
 option='panel',
 max_number_of_panels=80,
 max_number_of_transforms=20,
 angle_units='degree'
/
&vtkfiles
 vtk_input_file='fw18.vtk','wdpdd06_mesh30mm_tfm1.vtk','dome_outrefl_skeleton_july2012.vtk','beancan.vtk'
 number_of_copies=1,3,1,1
/
&panelarrayparameters
      panel_bodies=101,201,301,401,202,203
      panel_transform=0,0,0,0,1,2
/
&positionparameters
      position_transform=12, ! 1
      position_offset=0.,   0.,     6.66667
/
&positionparameters
      position_transform=12, ! 2
      position_offset=0.,   0.,     -6.66667
/
