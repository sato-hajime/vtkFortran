
#include "vtkAbstractArray_wrapper_interface.hxx"

int vtkAbstractArray_wrapper_IsA(vtkAbstractArray* array) {
  if ( false ) {
  } else if ( array->IsA("vtkStringArray") ) {
    return FORTRAN_WRAP_VTK_vtkStringArray ;
  } else if ( array->IsA("vtkDoubleArray") ) { 
    return FORTRAN_WRAP_VTK_vtkDoubleArray ;
  } else if ( array->IsA("vtkIntArray"   ) ) {
    return FORTRAN_WRAP_VTK_vtkIntArray    ;
  } else {
    return FORTRAN_WRAP_VTK_NotImplimented ;
  }  
};
