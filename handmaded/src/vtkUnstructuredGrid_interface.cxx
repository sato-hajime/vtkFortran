
#include "vtkUnstructuredGrid_interface.hxx"

#include "UnstructuredGridIO.hxx"

#include <vtkSmartPointer.h>

extern "C" {

  vtkUnstructuredGrid* vtkUnstructuredGrid_New() {
    vtkSmartPointer<vtkUnstructuredGrid> obj = \
      vtkUnstructuredGrid::New() ;
    return obj.GetPointer() ;
  };
  
  void readVtkUnstructuredGrid(vtkUnstructuredGrid* uGrid, const char* fName) {
    uGrid->DeepCopy(UnstructuredGridIO::read(fName)) ;
  };

  void writeVtkUnstructuredGrid(vtkUnstructuredGrid* uGrid, const char* fName) {
    UnstructuredGridIO::write(vtkSmartPointer<vtkUnstructuredGrid>::Take(uGrid), fName) ;
  };

  
  void vtkUnstructuredGrid_Delete(vtkUnstructuredGrid* uGrid) {
    uGrid->Delete() ;
  };

  vtkCellArray* vtkUnstructuredGrid_GetCells(vtkUnstructuredGrid* uGrid) {
    return uGrid->GetCells() ;
  };

  vtkUnsignedCharArray* vtkUnstructuredGrid_GetCellTypesArray(vtkUnstructuredGrid* uGrid) {
    return uGrid->GetCellTypesArray() ;
  };

  vtkIdTypeArray* vtkUnstructuredGrid_GetCellLocationsArray(vtkUnstructuredGrid* uGrid) {
    return uGrid->GetCellLocationsArray() ;
  } ;

  void vtkUnstructuredGrid_SetCells_i_vtkCellArrayp
  (vtkUnstructuredGrid* uGrid, int  type , vtkCellArray* cells) {
    uGrid->SetCells(type , cells) ;
  };
  
  void vtkUnstructuredGrid_SetCells_ip_vtkCellArrayp
  (vtkUnstructuredGrid* uGrid, int* types, vtkCellArray* cells) {
    uGrid->SetCells(types, cells) ;
  };
  
} ;
