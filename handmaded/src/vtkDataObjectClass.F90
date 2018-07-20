
module m_vtkDataObjectClass

  use iso_c_binding

  use m_vtkDataObject
  use m_vtkObjectClass
  use m_vtkFieldDataClass

  implicit none
  
  type,extends(vtkObject) :: vtkDataObject
   contains
     procedure :: GetFieldData => vtkDataObjectMethod_GetFieldData
  end type vtkDataObject

contains

  function vtkDataObjectMethod_GetFieldData(dataObj) result(fData)
    class(vtkDataObject) :: dataObj
    type(vtkFieldData)   :: fData
    fData%ptr = vtkDataObject_GetFieldData(dataObj%ptr)
  end function vtkDataObjectMethod_GetFieldData
  
end module m_vtkDataObjectClass
