
#pragma once

#include <vtkPointSet.h>

#include <vtkPoints.h>

extern "C" {
  
  vtkPoints* vtkPointSet_GetPoints(vtkPointSet*) ;
  void vtkPointSet_SetPoints(vtkPointSet*, vtkPoints*) ;
  
}

