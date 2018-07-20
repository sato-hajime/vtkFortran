
#pragma once

#include <vtkCell.h>

extern "C" {
  int vtkCell_GetCellType(vtkCell*) ;
  int vtkCell_GetNumberOfPoints(vtkCell*) ;
  int vtkCell_GetPointId(vtkCell*, int) ;
}
