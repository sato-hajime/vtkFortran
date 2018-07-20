
module m_vtkIdTypeArray

  use iso_c_binding

  implicit none
  
  interface
     function vtkIdTypeArray_GetValue(array, id) result(iVal) &
          bind(C, name="vtkIdTypeArray_GetValue")
       import c_ptr, c_int
       type(c_ptr),value    :: array
       integer(c_int),value :: id
       integer(c_int)       :: iVal
     end function vtkIdTypeArray_GetValue
  end interface
  
  
end module m_vtkIdTypeArray
