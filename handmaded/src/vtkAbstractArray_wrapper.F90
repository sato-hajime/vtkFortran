
module m_vtkAbstractArray_wrapper
  
  use iso_fortran_env, only : input_unit, output_unit, error_unit
  
  use m_vtkStringArray_wrapper
  use m_vtkDoubleArray_wrapper
  use m_vtkIntArray_wrapper

! #if defined(FORTRAN2003_CLASS)
!   use m_vtkAbstractArrayClass
!   use m_vtkStringArrayClass
! #endif
  
  implicit none

  interface vtkAbstractArray_wrap
     module procedure vtkStringArray_wrap
     module procedure vtkDoubleArray_wrap
     module procedure vtkIntArray_wrap
#if defined(FORTRAN2003_CLASS)
     module procedure vtkStringArrayClass_wrap
     module procedure vtkDoubleArrayClass_wrap
     module procedure vtkIntArrayClass_wrap
#endif
  end interface vtkAbstractArray_wrap
  
end module m_vtkAbstractArray_wrapper
