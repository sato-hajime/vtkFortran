
#pragma once

#include <vtkStdString.h>

extern "C" {

  vtkStdString* vtkStdString_New() ;
  void vtkStdString_Delete(vtkStdString*) ;
  
}
