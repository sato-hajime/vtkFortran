
#pragma once

#include <vtkDataObject.h>
#include <vtkFieldData.h>

extern "C" {
  
  vtkFieldData* vtkDataObject_GetFieldData(vtkDataObject*) ;

}
