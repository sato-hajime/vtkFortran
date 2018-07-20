
#pragma once

#include <vtkFieldData.h>
#include <vtkAbstractArray.h>

extern "C" {

  int vtkFieldData_GetNumberOfArrays(vtkFieldData*) ;
  int vtkFieldData_AddArray(vtkFieldData*, vtkAbstractArray*) ;
  vtkAbstractArray* vtkFieldData_GetAbstractArray_i0
  (vtkFieldData*, int) ;
  vtkAbstractArray* vtkFieldData_GetAbstractArray_cp_ip
  (vtkFieldData*, const char*, int *) ;
  
}
