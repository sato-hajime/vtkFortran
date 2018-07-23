
module m_vtkIntArray

  use iso_fortran_env, only : error_unit
  use iso_c_binding

  implicit none

  interface

     function vtkIntArray_New_c() result(arr) &
          bind(C, name="vtkIntArray_New")
       import c_ptr
       type(c_ptr) :: arr
     end function vtkIntArray_New_c
     
     function vtkIntArray_GetValue(array, id) result(iVal) &
          bind(C, name="vtkIntArray_GetValue")
       import c_ptr, c_int
       type(c_ptr),value    :: array
       integer(c_int),value :: id
       integer(c_int)       :: iVal
     end function vtkIntArray_GetValue

     subroutine vtkIntArray_SetValue(array, id, iVal) &
          bind(C, name="vtkIntArray_SetValue")
       import c_ptr, c_int
       type(c_ptr),value    :: array
       integer(c_int),value :: id
       integer(c_int),value :: iVal
     end subroutine vtkIntArray_SetValue
     
  end interface

contains

  function vtkIntArray_New() result(arr)
    implicit none
    type(c_ptr) :: arr
    arr = vtkIntArray_New_c()
#if !defined(NDEBUG)
    write (error_unit, '(A,Z0.16)'), &
         "vtkIntArray_New() returned 0x",arr
#endif
  end function vtkIntArray_New


end module m_vtkIntArray
