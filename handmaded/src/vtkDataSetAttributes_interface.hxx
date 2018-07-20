
#pragma once

#include <vtkDataArray.h>
#include <vtkDataSetAttributes.h>

extern "C" {
  
  int vtkDataSetAttributes_SetScalars
  (vtkDataSetAttributes*, vtkDataArray*) ;

} ;
