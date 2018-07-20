
module m_vtkStdString
  
  use iso_c_binding

  interface

     function vtkStdString_New() result(str) &
          bind(C, name="vtkStdString_New")
       import c_ptr
       type(c_ptr) :: str
     end function vtkStdString_New

     subroutine vtkStdString_Delete(str) &
          bind(C, name="vtkStdString_Delete")
       import c_ptr
       type(c_ptr),value :: str
     end subroutine vtkStdString_Delete
     
  end interface
  
end module m_vtkStdString
