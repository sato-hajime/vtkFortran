
#include "vtkPointSet_interface.hxx"

void vtkPointSet_SetPoints(vtkPointSet* pSet, vtkPoints* pts) {
  pSet->SetPoints(pts) ;
}
vtkPoints* vtkPointSet_GetPoints(vtkPointSet* pSet) {
  return pSet->GetPoints() ;
}
