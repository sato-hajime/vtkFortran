
#pragma once

#include <vtkDataSet.h>
#include <vtkPointData.h>
#include <vtkCellData.h>

extern "C" {

  int vtkDataSet_GetNumberOfPoints(vtkDataSet*) ;
  void vtkDataSet_GetPoint_i0_r3(vtkDataSet*, int, double*) ;
  vtkPointData* vtkDataSet_GetPointData(vtkDataSet*) ;
  int vtkDataSet_GetNumberOfCells(vtkDataSet*) ;
  vtkCell* vtkDataSet_GetCell (vtkDataSet*, int) ;
  vtkCellData* vtkDataSet_GetCellData(vtkDataSet*) ;
  
}
