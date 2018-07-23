
module m_vtkDoubleArray

  use iso_fortran_env, only : error_unit
  use iso_c_binding

  implicit none

  interface

     function vtkDoubleArray_New_c() result(arr) &
          bind(C, name="vtkDoubleArray_New")
       import c_ptr
       type(c_ptr) :: arr
     end function vtkDoubleArray_New_c

     function vtkDoubleArray_GetValue(array, id) result(dbl) &
          bind(C, name="vtkDoubleArray_GetValue")
       import c_ptr, c_int, c_double
       type(c_ptr),value    :: array
       integer(c_int),value :: id
       real(c_double)       :: dbl
     end function vtkDoubleArray_GetValue

     subroutine vtkDoubleArray_SetValue(array, id, dVal) &
          bind(C, name="vtkDoubleArray_SetValue")
       import c_ptr, c_int, c_double
       type(c_ptr),value    :: array
       integer(c_int),value :: id
       real(c_double),value :: dVal
     end subroutine vtkDoubleArray_SetValue

     
  end interface

contains

  function vtkDoubleArray_New() result(arr)
    implicit none
    type(c_ptr) :: arr
    arr = vtkDoubleArray_New_c()
#if !defined(NDEBUG)
    write (error_unit, '(A,Z0.16)'), &
         "vtkDoubleArray_New() returned 0x",arr
#endif
  end function vtkDoubleArray_New


end module m_vtkDoubleArray
