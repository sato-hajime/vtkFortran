
#include "vtkStdString_interface.hxx"

vtkStdString* vtkStdString_New() {
  return new vtkStdString ;
};

void vtkStdString_Delete(vtkStdString* str) {
  delete str ;
};
