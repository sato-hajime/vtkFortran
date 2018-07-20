
#pragma once

#include <vtkAbstractArray.h>

extern "C" {
  
  int  vtkAbstractArray_GetNumberOfValues(vtkAbstractArray*) ;
  void vtkAbstractArray_SetNumberOfValues(vtkAbstractArray*, int) ;
  int  vtkAbstractArray_GetNumberOfTuples(vtkAbstractArray*) ;
  void vtkAbstractArray_SetNumberOfTuples(vtkAbstractArray*, int) ;
  int  vtkAbstractArray_GetNumberOfComponents(vtkAbstractArray*) ;
  void vtkAbstractArray_SetNumberOfComponents(vtkAbstractArray*, int) ;
  void* vtkAbstractArray_GetVoidPointer(vtkAbstractArray*, int) ;
  char* vtkAbstractArray_GetName(vtkAbstractArray*) ;
  void vtkAbstractArray_SetName(vtkAbstractArray*, const char *) ;
} ;
