
module m_vtkDataSetAttributesClass

  use iso_c_binding

  use m_vtkDataSetAttributes
  use m_vtkFieldDataClass
  
  implicit none

  private
  
  type,public,extends(vtkFieldData) :: vtkDataSetAttributes
  end type vtkDataSetAttributes
  
end module m_vtkDataSetAttributesClass
