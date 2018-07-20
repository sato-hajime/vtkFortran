
module m_vtkDoubleArrayClass

  use iso_c_binding

  use m_vtkDoubleArray
  use m_vtkDataArrayClass
  
  implicit none

  type,public,extends(vtkDataArray) :: vtkDoubleArray
  end type vtkDoubleArray
  
end module m_vtkDoubleArrayClass
