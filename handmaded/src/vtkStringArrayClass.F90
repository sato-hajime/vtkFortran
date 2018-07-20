
module m_vtkStringArrayClass

  use iso_c_binding

  use m_vtkAbstractArrayClass

  implicit none

  type,extends(vtkAbstractArray) :: vtkStringArray
  end type vtkStringArray
  
end module m_vtkStringArrayClass
