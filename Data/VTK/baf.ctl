&miscparameters
 option='panel',
 max_number_of_panels=80,
 max_number_of_transforms=20,
 angle_units='degree'
/
&vtkfiles
 vtk_input_file='wdpdd06_mesh10mm_onlyfront.vtk'
 number_of_copies=1
/
&panelarrayparameters
      panel_bodies=1
      panel_transform=1
/
&positionparameters
      position_transform=12,  ! effect is to copy input 
      position_offset=0.,   0.,  0.
/
