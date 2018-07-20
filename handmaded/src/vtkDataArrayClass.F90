
module m_vtkDataArrayClass

  use iso_c_binding

  use m_vtkDataArray
  use m_vtkAbstractArrayClass

  implicit none

  private
  
  type,public,extends(vtkAbstractArray) :: vtkDataArray
  end type vtkDataArray
  
end module m_vtkDataArrayClass
