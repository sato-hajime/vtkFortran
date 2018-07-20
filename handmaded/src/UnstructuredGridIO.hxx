
#pragma once

#include <string>

#include <vtkSmartPointer.h>
#include <vtkUnstructuredGrid.h>

namespace UnstructuredGridIO {
  using std::string ;
  vtkSmartPointer<vtkUnstructuredGrid> read (const char*) ;
  vtkSmartPointer<vtkUnstructuredGrid> read (const string&) ;
}
