
module m_vtkPoints

  use iso_fortran_env, only : error_unit
  use iso_c_binding

  implicit none

  interface vtkPoints_InsertNextPoint
     procedure :: vtkPoints_InsertNextPoint_lf_lf_lf
  end interface vtkPoints_InsertNextPoint
  
  interface
     function vtkPoints_New_c() result(pts) &
          bind(C, name="vtkPoints_New")
       import c_ptr
       type(c_ptr) :: pts
     end function vtkPoints_New_c

     subroutine vtkPoints_Delete(pts) &
          bind(C, name="vtkPoints_Delete")
       import c_ptr
       type(c_ptr),value :: pts
     end subroutine vtkPoints_Delete

     function vtkPoints_GetNumberOfPoints(pts) result(nPts) &
          bind(C, name="vtkPoints_GetNumberOfPoints")
       import c_ptr, c_int
       type(c_ptr),value :: pts
       integer(c_int)    :: nPts
     end function vtkPoints_GetNumberOfPoints
     
     function vtkPoints_InsertNextPoint_lf_lf_lf(pts, x, y, z) result(id) &
          bind(C, name="vtkPoints_InsertNextPoint_lf_lf_lf")
       import c_ptr, c_int, c_double
       integer(c_int)       :: id
       type(c_ptr),value    :: pts
       real(c_double),value :: x, y, z
     end function vtkPoints_InsertNextPoint_lf_lf_lf
     
  end interface

contains

  function vtkPoints_New() result(pts)
    implicit none
    type(c_ptr) :: pts
    pts = vtkPoints_New_c()
#if !defined(NDEBUG)
    write (error_unit, '(A,Z0.16)'), &
         "vtkPoints_New() returned 0x", pts
#endif
  end function vtkPoints_New

end module m_vtkPoints
