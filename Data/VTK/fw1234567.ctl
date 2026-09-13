&miscparameters
 option='panel',
 max_number_of_panels=80,
 max_number_of_transforms=20,
 angle_units='degree'
/
&vtkfiles
 vtk_input_file='fw1.vtk','fw2.vtk','fw3.vtk','fw4.vtk','fw5.vtk','fw6.vtk','fw7.vtk'
 number_of_copies=11,11,11,11,11,11,11
 vtk_output_file='fw1234567.vtk'
/
&panelarrayparameters
      panel_bodies=101, 201, 301, 401, 501, 601, 701,
102, 103, 104, 105, 106, 107, 108, 109, 110, 111,
202, 203, 204, 205, 206, 207, 208, 209, 210, 211,
302, 303, 304, 305, 306, 307, 308, 309, 310, 311,
402, 403, 404, 405, 406, 407, 408, 409, 410, 411,
502, 503, 504, 505, 506, 507, 508, 509, 510, 511,
602, 603, 604, 605, 606, 607, 608, 609, 610, 611,
702, 703, 704, 705, 706, 707, 708, 709, 710, 711
      panel_transform=0,0,0,0,0,0,0,
1,2,3,4,5,6,7,8,9,10,
1,2,3,4,5,6,7,8,9,10,
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
