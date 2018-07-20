
module m_vtkCellDataClass

  use iso_c_binding

  use m_vtkCellData
  use m_vtkDataSetAttributesClass

  implicit none

  private
  
  type,public,extends(vtkDataSetAttributes) :: vtkCellData
  end type vtkCellData

end module m_vtkCellDataClass
