
#pragma once

#include <vtkCellArray.h>
#include <vtkIdTypeArray.h>

extern "C" {

  vtkCellArray* vtkCellArray_New() ;
  void vtkCellArray_Delete(vtkCellArray*) ;  
  int vtkCellArray_GetNumberOfCells(vtkCellArray*) ;
  vtkIdTypeArray* vtkCellArray_GetData(vtkCellArray*) ;
  
  int vtkCellArray_InsertNextCell_IdType_IdTypeArr
  (vtkCellArray*, int, const int[]) ;
  
}
