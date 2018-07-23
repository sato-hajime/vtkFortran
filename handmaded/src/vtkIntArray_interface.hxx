
#pragma once

#include <vtkIntArray.h>

extern "C" {

  vtkIntArray* vtkIntArray_New() ;
  int vtkIntArray_GetValue(vtkIntArray*, int) ;
  void vtkIntArray_SetValue(vtkIntArray*, int, int) ;
  
}
