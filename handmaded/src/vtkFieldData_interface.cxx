
#include "vtkFieldData_interface.hxx"

extern "C" {

  int vtkFieldData_GetNumberOfArrays(vtkFieldData* fData) {
    return fData->GetNumberOfArrays() ;
  };

  vtkAbstractArray* vtkFieldData_GetAbstractArray_i0
  (vtkFieldData* fData, int index) {
    return fData->GetAbstractArray(index) ;
  };


  vtkAbstractArray* vtkFieldData_GetAbstractArray_cp_ip
  (vtkFieldData* fData, const char* arrayName, int* index) {
    return fData->GetAbstractArray(arrayName, *index) ;
  };

  int vtkFieldData_AddArray
  (vtkFieldData* fData, vtkAbstractArray* array) {
    return fData->AddArray(array) ;
  };

} ;
