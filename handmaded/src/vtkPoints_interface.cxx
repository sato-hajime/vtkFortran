
#include "vtkPoints_interface.hxx"

#include <vtkSmartPointer.h>

vtkPoints* vtkPoints_New() {
  vtkSmartPointer<vtkPoints> obj =	\
    vtkPoints::New() ;
  return obj.GetPointer() ;
  };

void vtkPoints_Delete(vtkPoints* pts) {
  pts->Delete() ;
};

int vtkPoints_GetNumberOfPoints(vtkPoints* pts) {
  return pts->GetNumberOfPoints() ;
};

int vtkPoints_InsertNextPoint_lf_lf_lf
(vtkPoints* pts, double x, double y, double z) {
  pts->InsertNextPoint(x, y, z) ;
};
