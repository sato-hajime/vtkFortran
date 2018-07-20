
module m_vtkUnstructuredGrid

  use iso_c_binding

  use cstring
  
  implicit none
  
  interface

     function vtkUnstructuredGrid_New_c() result(obj) &
          bind(C, name="vtkUnstructuredGrid_New")
       import c_ptr
       type(c_ptr) :: obj
     end function vtkUnstructuredGrid_New_c
     
     subroutine readVtkUnstructuredGrid_c(uGrid, fName) &
          bind(C, name="readVtkUnstructuredGrid")
       import c_ptr
       type(c_ptr),value :: uGrid
       type(c_ptr),value :: fName
     end subroutine readVtkUnstructuredGrid_c

     subroutine writeVtkUnstructuredGrid_c(uGrid, fName) &
          bind(C, name="writeVtkUnstructuredGrid")
       import c_ptr
       type(c_ptr),value :: uGrid
       type(c_ptr),value :: fName
     end subroutine writeVtkUnstructuredGrid_c

     
     ! function vtkUnstructuredGrid_GetCells(uGrid) result(cells) &
     !      bind(C, name="vtkUnstructuredGrid_GetCells")
     !   import c_ptr
     !   type(c_ptr),value :: uGrid
     !   type(c_ptr)       :: cells
     ! end function vtkUnstructuredGrid_GetCells

  end interface

contains

  function vtkUnstructuredGrid_New() result(this)
    implicit none
    type(c_ptr) :: this
    this = vtkUnstructuredGrid_New_c()
#if !defined(NDEBUG)
    print '(A,Z0.16)', "vtkUnstructuredGrid_New() returened 0x",this
#endif
  end function vtkUnstructuredGrid_New
  
  subroutine readVtkUnstructuredGrid(this, fname)
    type(c_ptr),intent(in) :: this
    character(*),intent(in) :: fName
    
    if ( nullContained(fName) ) then
       call readTerminated(fName)
    else
       call readTerminated(fName//c_null_char)
    end if
  contains
    subroutine readTerminated(terminated)
      character(*,c_char) :: terminated
      call readVtkUnstructuredGrid_c(this, f2c(terminated))
    end subroutine readTerminated
  end subroutine readVtkUnstructuredGrid

  subroutine writeVtkUnstructuredGrid(this, fname)
    type(c_ptr),intent(in) :: this
    character(*),intent(in) :: fName
    
    if ( nullContained(fName) ) then
       call writeTerminated(fName)
    else
       call writeTerminated(fName//c_null_char)
    end if
  contains
    subroutine writeTerminated(terminated)
      character(*,c_char) :: terminated
      call writeVtkUnstructuredGrid_c(this, f2c(terminated))
    end subroutine writeTerminated
  end subroutine writeVtkUnstructuredGrid
  
end module m_vtkUnstructuredGrid
