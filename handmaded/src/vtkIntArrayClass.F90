
module m_vtkIntArrayClass

  use iso_c_binding

  use m_vtkDataArrayClass

  implicit none

  type,extends(vtkDataArray) :: vtkIntArray
  end type vtkIntArray
  
end module m_vtkIntArrayClass
