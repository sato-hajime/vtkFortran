
#include "vtkCellArray_interface.hxx"

#include <vtkType.h>
#include <vector>

extern "C" {

  vtkCellArray* vtkCellArray_New() {
    vtkSmartPointer<vtkCellArray> cells =		\
      vtkCellArray::New() ;
    return cells.GetPointer() ;
  } ;

  void vtkCellArray_Delete(vtkCellArray* cells) {
    cells->Delete() ;
  } ;

  int vtkCellArray_GetNumberOfCells(vtkCellArray* cells) {
    return cells->GetNumberOfCells() ;
  } ;

  vtkIdTypeArray* vtkCellArray_GetData(vtkCellArray* cells) {
    return cells->GetData() ;
  };

  int vtkCellArray_InsertNextCell_IdType_IdTypeArr
  (vtkCellArray* cells, int npts, const int pts_int[]) {
    std::vector<vtkIdType> pts(npts) ;
    for(int i = 0 ; i < npts ; i++) {
      pts[i] = pts_int[i] ;
    }
    return cells->InsertNextCell(npts, pts.data()) ;
  };
  

  
} ;
