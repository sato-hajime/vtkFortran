
#pragma once

#include <vtkPoints.h>

extern "C" {
  vtkPoints* vtkPoints_New() ;

  void vtkPoints_InsertNextPoint_d3
  (vtkPoints*, const double[3]) ;

  void vtkPoints_InsertNextPoint_3d
  (vtkPoints*, const double, const double, const double) ;
}


