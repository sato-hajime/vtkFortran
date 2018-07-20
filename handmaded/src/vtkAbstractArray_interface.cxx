
#include "vtkAbstractArray_interface.hxx"

extern "C" {

  int vtkAbstractArray_GetNumberOfValues(vtkAbstractArray* array) {
    return array->GetNumberOfValues() ;
  };

  void vtkAbstractArray_SetNumberOfValues
  (vtkAbstractArray* array, int nValues) {
    array->SetNumberOfValues(nValues) ;
  };

  int vtkAbstractArray_GetNumberOfTuples(vtkAbstractArray* array) {
    return array->GetNumberOfTuples() ;
  };

  void vtkAbstractArray_SetNumberOfTuples
  (vtkAbstractArray* array, int nTuples) {
    array->SetNumberOfTuples(nTuples) ;
  };

  
  int vtkAbstractArray_GetNumberOfComponents(vtkAbstractArray* array) {
    return array->GetNumberOfComponents() ;
  };

  void vtkAbstractArray_SetNumberOfComponents
  (vtkAbstractArray* array, int nComponents) {
    array->SetNumberOfComponents(nComponents) ;
  };

  
  void* vtkAbstractArray_GetVoidPointer(vtkAbstractArray* array, int valueIdx) {
    return array->GetVoidPointer(valueIdx) ;
  };

  char* vtkAbstractArray_GetName(vtkAbstractArray* array){
    return array->GetName() ;
  };

  void vtkAbstractArray_SetName(vtkAbstractArray* array, const char * name) {
    array->SetName(name) ;
  };

} ;
