
#include "vtkDataSetAttributes_interface.hxx"

extern "C" {
  
  int vtkDataSetAttributes_SetScalars
  (vtkDataSetAttributes* data, vtkDataArray* array) {
    return data->SetScalars(array) ;
  } ;

  int vtkDataSetAttributes_SetActiveScalars
  (vtkDataSetAttributes* data, const char * name) {
    return data->SetActiveScalars(name) ;
  } ;
  
} ;
