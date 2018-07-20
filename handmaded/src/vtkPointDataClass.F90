
module m_vtkPointDataClass

  use iso_c_binding

  use m_vtkPointData
  use m_vtkDataSetAttributesClass

  implicit none

  private
  
  type,public,extends(vtkDataSetAttributes) :: vtkPointData
  end type vtkPointData

end module m_vtkPointDataClass
