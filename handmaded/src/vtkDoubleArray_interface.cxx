
#include "vtkDoubleArray_interface.hxx"

#include <vtkSmartPointer.h>

vtkDoubleArray* vtkDoubleArray_New() {
  vtkSmartPointer<vtkDoubleArray> array = \
    vtkDoubleArray::New() ;
  return array.GetPointer() ;

};


double vtkDoubleArray_GetValue
(vtkDoubleArray* array, int id) {
  return array->GetValue(id) ;
};
