
#include "vtkIdTypeArray_interface.hxx"

int vtkIdTypeArray_GetValue(vtkIdTypeArray* ids, int idx) {
  return ids->GetValue(idx) ;
};
