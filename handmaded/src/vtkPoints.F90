
module m_vtkPoints

  use iso_c_binding

  implicit none

  interface vtkPoints_InsertNextPoint
     subroutine vtkPoints_InsertNextPoint_d3(pts, pt) &
          bind(C, name="vtkPoints_InsertNextPoint_d3")
       import c_ptr, c_double
       type(c_ptr),value         :: pts
       real(c_double),intent(in) :: pt(3)
     end subroutine vtkPoints_InsertNextPoint_d3
     
     subroutine vtkPoints_InsertNextPoints_3d(pts, x, y, z) &
          bind(C, name="vtkPoints_InsertNextPoint_3d")
       import c_ptr, c_double
       type(c_ptr),value    :: pts
       real(c_double),value :: x, y, z
     end subroutine vtkPoints_InsertNextPoints_3d
  end interface vtkPoints_InsertNextPoint
  
  interface
     function vtkPoints_New_c() result(obj) &
          bind(C, name="vtkPoints_New")
       import c_ptr
       type(c_ptr) :: obj
     end function vtkPoints_New_c

  end interface

contains

  function vtkPoints_New() result(this)
    implicit none
    type(c_ptr) :: this
    this = vtkPoints_New_c()
#if !defined(NDEBUG)
    print '(A,Z0.16)', "vtkPoints_New() returened 0x",this
#endif
  end function vtkPoints_New
  
    
end module m_vtkPoints
