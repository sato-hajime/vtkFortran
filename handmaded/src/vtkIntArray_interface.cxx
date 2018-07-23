
#include "vtkIntArray_interface.hxx"

extern "C" {

  vtkIntArray* vtkIntArray_New() {
    vtkSmartPointer<vtkIntArray> arr = \
      vtkIntArray::New() ;
    return arr.GetPointer() ;
  } ;

  int vtkIntArray_GetValue
  (vtkIntArray* array, int id) {
    return array->GetValue(id) ;
  } ;

  void vtkIntArray_SetValue
  (vtkIntArray* array, int id, int iVal) {
    array->SetValue(id, iVal) ;
  } ;
  
} ;
