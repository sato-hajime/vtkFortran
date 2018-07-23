
module m_vtkPointsClass

  use iso_c_binding
  use iso_fortran_env, only: error_unit

  use m_vtkPoints
  
  use m_vtkObjectClass
  
  implicit none

  private
  
  type,public,extends(vtkObject) :: vtkPoints
   contains
     procedure :: New => vtkPointsMethod_New
     procedure :: InsertNextPoint_d3 => &
          vtkPointsMethod_InsertNextPoint_d3
     procedure :: InsertNextPoint_3d => &
          vtkPointsMethod_InsertNextPoint_3d
     generic   :: InsertNextPoint => &
          InsertNextPoint_d3, &
          InsertNextPoint_3d
  end type vtkPoints

contains
  
  subroutine vtkPointsMethod_New(obj)
    implicit none
    class(vtkPoints) :: obj
    if ( c_associated(obj%ptr) ) then
       write(error_unit, '(A,z0.16,A)'),&
            'vtkPoints(at 0x',obj%ptr,') already allocated'
       stop 1
    end if
    obj%ptr = vtkPoints_New()
  end subroutine vtkPointsMethod_New

  integer(c_int) function vtkPointsMethod_InsertNextPoint_d3(pts, pt) result(id)
    class(vtkPoints)          :: pts
    real(c_double),intent(in) :: pt(3)
    id = vtkPoints_InsertNextPoint(pts%ptr, pt(1), pt(2), pt(3))
  end function vtkPointsMethod_InsertNextPoint_d3

  integer(c_int) function vtkPointsMethod_InsertNextPoint_3d(pts, x, y, z) result(id)
    class(vtkPoints)          :: pts
    real(c_double),intent(in) :: x, y, z
    id = vtkPoints_InsertNextPoint(pts%ptr, x, y, z)
  end function vtkPointsMethod_InsertNextPoint_3d
  
end module m_vtkPointsClass
