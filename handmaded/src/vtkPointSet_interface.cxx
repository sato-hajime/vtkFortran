
#include "vtkPointSet_interface.hxx"

extern "C" {

  vtkPoints* vtkPointSet_GetPoints(vtkPointSet* pSet) {
    return pSet->GetPoints() ;
  } ;

  void vtkPointSet_SetPoints(vtkPointSet* pSet, vtkPoints* pts) {
    pSet->SetPoints(pts) ;
  } ;
  
} ;
