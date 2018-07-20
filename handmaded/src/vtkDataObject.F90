
module m_vtkDataObject

  use iso_c_binding

  implicit none

  interface
     function vtkDataObject_GetFieldData(this) result(fData) &
          bind(C, name="vtkDataObject_GetFieldData")
       import c_ptr
       type(c_ptr),value :: this
       type(c_ptr)       :: fData
     end function vtkDataObject_GetFieldData
  end interface
  
end module m_vtkDataObject
