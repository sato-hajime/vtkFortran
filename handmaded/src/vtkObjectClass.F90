
module m_vtkObjectClass
  
  use iso_fortran_env, only : input_unit, output_unit, error_unit
  use iso_c_binding

  use m_vtkObject
  use m_vtkObjectBaseClass
  
  implicit none

  private
    
  type,public,extends(vtkObjectBase) :: vtkObject
  end type vtkObject
    
end module m_vtkObjectClass
