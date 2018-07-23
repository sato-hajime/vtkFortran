
#pragma once

#include <vtkDoubleArray.h>

extern "C" {

  vtkDoubleArray* vtkDoubleArray_New() ;
  double vtkDoubleArray_GetValue(vtkDoubleArray*, int) ;
  void   vtkDoubleArray_SetValue(vtkDoubleArray*, int, double) ;
  
}
