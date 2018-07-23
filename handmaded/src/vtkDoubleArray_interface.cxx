
#include "vtkDoubleArray_interface.hxx"

vtkDoubleArray* vtkDoubleArray_New() {
    vtkSmartPointer<vtkDoubleArray> arr = \
      vtkDoubleArray::New() ;
    return arr.GetPointer() ;
  } ;

double vtkDoubleArray_GetValue
(vtkDoubleArray* array, int id) {
  return array->GetValue(id) ;
};

void   vtkDoubleArray_SetValue
(vtkDoubleArray* array, int id, double dVal) {
  array->SetValue(id, dVal) ;
};
