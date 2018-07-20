
#pragma once

#include <vtkAbstractArray.h>

enum FORTRAN_WRAP_VTK_TYPE {
  FORTRAN_WRAP_VTK_NotImplimented,
  FORTRAN_WRAP_VTK_vtkStringArray,
  FORTRAN_WRAP_VTK_vtkDoubleArray,
  FORTRAN_WRAP_VTK_vtkIntArray,
};

extern "C" {

  int vtkAbstractArray_wrapper_IsA(vtkAbstractArray*) ;

}
