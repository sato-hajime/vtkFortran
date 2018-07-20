
#pragma once

#include <vtkPointSet.h>

#include <vtkPoints.h>

extern "C" {

  void vtkPointSet_SetPoints(vtkPointSet*, vtkPoints*) ;
  vtkPoints* vtkPointSet_GetPoints(vtkPointSet*) ;

}
