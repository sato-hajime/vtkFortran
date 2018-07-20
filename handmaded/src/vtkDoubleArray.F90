
module m_vtkDoubleArray

  use iso_c_binding

  implicit none

  interface
     function vtkDoubleArray_New() result(array) &
          bind(C, name="vtkDoubleArray_New")
       import c_ptr
       type(c_ptr) :: array
     end function vtkDoubleArray_New
     
     function vtkDoubleArray_GetValue(array, id) result(dbl) &
          bind(C, name="vtkDoubleArray_GetValue")
       import c_ptr, c_int, c_double
       type(c_ptr),value    :: array
       integer(c_int),value :: id
       real(c_double)       :: dbl
     end function vtkDoubleArray_GetValue
  end interface
  
end module m_vtkDoubleArray
