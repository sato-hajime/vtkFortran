
#include "UnstructuredGridIO.hxx"

#include <vtkUnstructuredGridReader.h>
#include <vtkUnstructuredGridWriter.h>

vtkSmartPointer<vtkUnstructuredGrid> \
UnstructuredGridIO::read(const char* fName) {
  
  vtkSmartPointer<vtkUnstructuredGrid> uGrid =	\
    vtkUnstructuredGrid::New() ;
  
  vtkSmartPointer<vtkUnstructuredGridReader> reader =	\
    vtkUnstructuredGridReader::New() ;

  reader->SetFileName(fName) ;
  reader->ReadAllScalarsOn() ;
  reader->Update() ;

  uGrid = reader->GetOutput() ;
  
  return uGrid ;
}

void UnstructuredGridIO::write
(vtkSmartPointer<vtkUnstructuredGrid> uGrid, const char* fName) {
  vtkSmartPointer<vtkUnstructuredGridWriter> writer = \
    vtkUnstructuredGridWriter::New() ;

  writer->SetFileName(fName) ;
  writer->SetInputData(uGrid) ;
  writer->Update() ;  
};
