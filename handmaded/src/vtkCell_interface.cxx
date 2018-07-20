
#include "vtkCell_interface.hxx"

int vtkCell_GetCellType(vtkCell* cell) {
  return cell->GetCellType() ;
};

int vtkCell_GetNumberOfPoints(vtkCell* cell) {
  return cell->GetNumberOfPoints() ;
};

int vtkCell_GetPointId(vtkCell* cell, int ptId) {
  return cell->GetPointId(ptId) ;
};
