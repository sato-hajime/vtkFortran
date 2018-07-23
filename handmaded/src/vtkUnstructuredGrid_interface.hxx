
#pragma once

#include <vtkUnstructuredGrid.h>

extern "C" {

  vtkUnstructuredGrid* vtkUnstructuredGrid_New() ;
  void vtkUnstructuredGrid_Delete(vtkUnstructuredGrid*) ;

  void readVtkUnstructuredGrid (vtkUnstructuredGrid*, const char*) ;
  void writeVtkUnstructuredGrid(vtkUnstructuredGrid*, const char*) ;
  
  vtkCellArray*         vtkUnstructuredGrid_GetCells(vtkUnstructuredGrid*) ;
  vtkUnsignedCharArray* vtkUnstructuredGrid_GetCellTypesArray(vtkUnstructuredGrid*) ;
  vtkIdTypeArray*       vtkUnstructuredGrid_GetCellLocationsArray(vtkUnstructuredGrid*) ;

  void vtkUnstructuredGrid_SetCells_i_vtkCellArrayp
  (vtkUnstructuredGrid*, int  , vtkCellArray*) ;
    
  void vtkUnstructuredGrid_SetCells_ip_vtkCellArrayp
  (vtkUnstructuredGrid*, int *, vtkCellArray*) ;
}
