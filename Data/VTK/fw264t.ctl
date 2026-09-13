&miscparameters
 option='panel',
 max_number_of_panels=80,
 max_number_of_transforms=20,
 angle_units='degree'
/
&vtkfiles
 vtk_input_file='FW2.vtk','FW3.vtk','FW4.vtk','FW5.vtk','FW6.vtk'
 number_of_copies=11,11,11,11,11
/
&panelarrayparameters
      panel_bodies=101, 201, 301, 401, 501,
102, 103, 104, 105, 106, 107, 108, 109, 110, 111,
202, 203, 204, 205, 206, 207, 208, 209, 210, 211,
302, 303, 304, 305, 306, 307, 308, 309, 310, 311,
402, 403, 404, 405, 406, 407, 408, 409, 410, 411,
502, 503, 504, 505, 506, 507, 508, 509, 510, 511
      panel_transform=0,0,11,0,0,
1,2,3,4,5,6,7,8,9,10,
1,2,3,4,5,6,7,8,9,10,
1,2,3,4,5,6,7,8,9,10,
1,2,3,4,5,6,7,8,9,10,
1,2,3,4,5,6,7,8,9,10
/
&positionparameters
      position_transform=12,
      position_offset=0.,  0.,  20.
/
&positionparameters
      position_transform=12,
      position_offset=0.,  0.,  40.
/
&positionparameters
      position_transform=12,
      position_offset=0.,  0.,  60.
/
&positionparameters
      position_transform=12,
      position_offset=0.,  0.,  80.
/
&positionparameters
      position_transform=12,
      position_offset=0.,  0.,  100.
/
&positionparameters
      position_transform=12,
      position_offset=0.,   0.,  -20.
/
&positionparameters
      position_transform=12,  
      position_offset=0.,   0.,  -40.
/
&positionparameters
      position_transform=12,  
      position_offset=0.,   0.,  -60.
/
&positionparameters
      position_transform=12,  
      position_offset=0.,   0.,  -80.
/
&positionparameters
      position_transform=12,  
      position_offset=0.,   0.,  -100.
/
&positionparameters
      position_transform=42,  
      position_offset=-5.,   6210.,  0.
/
