
#include "vtkStringArray_interface.hxx"

#include "vtkStdString.h"

#include <iostream>

const char* vtkStringArray_GetValue_cp\
(vtkStringArray* sarray, int id) {
  return sarray->GetValue(id) ;
};
