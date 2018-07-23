
#pragma once

#include <vtkPoints.h>

extern "C" {
  
  vtkPoints* vtkPoints_New() ;
  void vtkPoints_Delete(vtkPoints*) ;
  int vtkPoints_GetNumberOfPoints(vtkPoints*) ;
  int vtkPoints_InsertNextPoint_lf_lf_lf(vtkPoints*, double, double, double) ;
  
}
