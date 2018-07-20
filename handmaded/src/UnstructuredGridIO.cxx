
#include "UnstructuredGridIO.hxx"

#include <vtkUnstructuredGridReader.h>

vtkSmartPointer<vtkUnstructuredGrid> \
UnstructuredGridIO::read(const char* fName) {
  
  vtkSmartPointer<vtkUnstructuredGrid> uGrid =	\
    vtkUnstructuredGrid::New() ;
  
  vtkSmartPointer<vtkUnstructuredGridReader> reader =	\
    vtkUnstructuredGridReader::New() ;
  
  reader->SetFileName(fName) ;
  reader->Update() ;

  uGrid = reader->GetOutput() ;
  
  return uGrid ;
}
