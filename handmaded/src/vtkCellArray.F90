
module m_vtkCellArray

  use iso_c_binding

  use m_vtkObject

  implicit none

  type,extends(vtkObject) :: vtkCellArray
  end type vtkCellArray
  
end module m_vtkCellArray
