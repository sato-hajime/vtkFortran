
#include "vtkUnstructuredGrid_interface.hxx"

//#include "UnstructuredGridIO.hxx"

#include <vtkSmartPointer.h>
#include <vtkUnstructuredGridReader.h>
#include <vtkUnstructuredGridWriter.h>


extern "C" {

  vtkUnstructuredGrid* vtkUnstructuredGrid_New() {
    vtkSmartPointer<vtkUnstructuredGrid> obj = \
      vtkUnstructuredGrid::New() ;
    return obj.GetPointer() ;
  };

  
  void readVtkUnstructuredGrid(vtkUnstructuredGrid* uGrid, const char* fName) {
    vtkSmartPointer<vtkUnstructuredGridReader> reader = \
      vtkUnstructuredGridReader::New() ;
    reader->SetFileName(fName) ;
    reader->ReadAllScalarsOn() ;
    reader->ReadAllVectorsOn() ;
    reader->ReadAllTensorsOn() ;
    reader->Update() ;
    uGrid->DeepCopy(reader->GetOutput()) ;
  };

  void writeVtkUnstructuredGrid(vtkUnstructuredGrid* uGrid, const char* fName) {
    vtkSmartPointer<vtkUnstructuredGridWriter> writer = \
      vtkUnstructuredGridWriter::New() ;
    writer->SetFileName(fName) ;
    writer->SetInputData(uGrid) ;
    writer->Update() ;
  };
  
  // vtkCellArray* vtkUnstructuredGrid_GetCells(vtkUnstructuredGrid* uGrid) {
  //   vtkSmartPointer<vtkCellArray> cells = uGrid->GetCells() ;
  //   return cells.GetPointer() ;
  // };

}
