
module m_vtkUnsignedCharArray

  use iso_c_binding

  interface

     function vtkUnsignedCharArray_GetValue(array, id) result(iVal) &
          bind(C, name="vtkUnsignedCharArray_GetValue")
       import c_ptr, c_int
       type(c_ptr),value    :: array
       integer(c_int),value :: id
       integer(c_int)       :: iVal
     end function vtkUnsignedCharArray_GetValue
     
  end interface
  
end module m_vtkUnsignedCharArray
