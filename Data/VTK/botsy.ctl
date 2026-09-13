&miscparameters
 option='panel',
 max_number_of_panels=80,
 max_number_of_transforms=20,
 angle_units='degree'
/
&vtkfiles
 vtk_input_file='fw18sy.vtk','wdpdd06_mesh30mm_tfm1.vtk','dome_outrefl_skeleton_july2012sy.vtk','beancansy.vtk','wdpdd06_mesh10mm_onlyfront.vtk'
 number_of_copies=1,8,1,1
/
&panelarrayparameters
      panel_bodies=101,501,301,401,201,202,203,204,205,206,207,208
      panel_transform=0,0,0,0,1,2,3,4,5,6,7,8
/
&positionparameters
      position_transform=12, ! 1
      position_offset=0.,   0.,     6.66667
/
&positionparameters
      position_transform=12, ! 2
      position_offset=0.,   0.,     -6.66667
/
&positionparameters
      position_transform=12, ! 3
      position_offset=0.,   0.,     13.333333
/
&positionparameters
      position_transform=12, ! 4
      position_offset=0.,   0.,     -13.333333
/
&positionparameters
      position_transform=12, ! 5
      position_offset=0.,   0.,     20.
/
&positionparameters
      position_transform=12, ! 6
      position_offset=0.,   0.,     -20.
/
&positionparameters
      position_transform=12, ! 7
      position_offset=0.,   0.,     26.66667
/
&positionparameters
      position_transform=12, ! 8
      position_offset=0.,   0.,     -26.66667
/
