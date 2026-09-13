&miscparameters
 option='panel',
 max_number_of_panels=80,
 max_number_of_transforms=20,
 angle_units='degree'
/
&vtkfiles
 vtk_input_file='FW2.vtk','FW3.vtk','FW4.vtk','FW5.vtk','FW6.vtk','FW3_5mm.vtk',
 ! seq no.       1          2        3         4         5         6 
 number_of_copies=11,10,11,11,11,1
 vtk_output_file='fw26r3t1.vtk'
/
&panelarrayparameters
      panel_bodies= 101, 601, 301, 401, 501,
102, 103, 104, 105, 106, 107, 108, 109, 110, 111,
202, 203, 204, 205, 206, 207, 208, 209, 210, 201,
302, 303, 304, 305, 306, 307, 308, 309, 310, 311,
402, 403, 404, 405, 406, 407, 408, 409, 410, 411,
502, 503, 504, 505, 506, 507, 508, 509, 510, 511
      panel_transform=0, 11, 0, 0, 0, 
1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 
1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 
1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 
1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 
1, 2, 3, 4, 5, 6, 7, 8, 9, 10
/
&positionparameters
      position_transform=12, ! 1
      position_offset=0.,  0.,  20.
/
&positionparameters
      position_transform=12, ! 2
      position_offset=0.,  0.,  40.
/
&positionparameters
      position_transform=12, ! 3
      position_offset=0.,  0.,  60.
/
&positionparameters
      position_transform=12, ! 4
      position_offset=0.,  0.,  80.
/
&positionparameters
      position_transform=12, ! 5
      position_offset=0.,  0.,  100.
/
&positionparameters
      position_transform=12, ! 6
      position_offset=0.,   0.,  -20.
/
&positionparameters
      position_transform=12,   ! 7
      position_offset=0.,   0.,  -40.
/
&positionparameters
      position_transform=12,   ! 8
      position_offset=0.,   0.,  -60.
/
&positionparameters
      position_transform=12,   ! 9
      position_offset=0.,   0.,  -80.
/
&positionparameters
      position_transform=12,   ! 10
      position_offset=0.,   0.,  -100.
/
&positionparameters
      position_transform=42,   ! 11
      position_offset=-5.,   6210.,  0.
/
