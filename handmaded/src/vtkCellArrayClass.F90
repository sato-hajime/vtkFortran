
module m_vtkCellArrayClass

  use iso_c_binding

  use m_vtkObjectClass

  implicit none

  type,extends(vtkObject) :: vtkCellArray
  end type vtkCellArray
  
end module m_vtkCellArrayClass
