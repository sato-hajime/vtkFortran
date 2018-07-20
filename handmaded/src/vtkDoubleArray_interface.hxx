
#pragma once

#include <vtkDoubleArray.h>

extern "C" {

  vtkDoubleArray* vtkDoubleArray_New() ;
  double vtkDoubleArray_GetValue(vtkDoubleArray*, int) ;
  
}
