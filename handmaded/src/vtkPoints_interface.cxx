
#include "vtkPoints_interface.hxx"

#include <vtkSmartPointer.h>
#include <iostream>

vtkPoints* vtkPoints_New() {
  vtkSmartPointer<vtkPoints>  pts = \
    vtkPoints::New() ;
  return pts.GetPointer() ;
};

void vtkPoints_InsertNextPoint_d3
(vtkPoints* pts, const double pt[3]) {
  pts->InsertNextPoint(pt) ;
};

void vtkPoints_InsertNextPoint_3d
(vtkPoints* pts, const double x, const double y, const double z) {
  pts->InsertNextPoint(x, y, z) ;
};
