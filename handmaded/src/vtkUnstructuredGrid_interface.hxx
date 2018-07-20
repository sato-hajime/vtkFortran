
#pragma once

#include <vtkUnstructuredGrid.h>

extern "C" {

  vtkUnstructuredGrid* vtkUnstructuredGrid_New() ;
  void readVtkUnstructuredGrid(vtkUnstructuredGrid*, const char*) ;
  void writeVtkUnstructuredGrid(vtkUnstructuredGrid*, const char*) ;
  // vtkCellArray* vtkUnstructuredGrid_GetCells(vtkUnstructuredGrid*) ;

}
