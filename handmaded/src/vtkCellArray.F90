
module m_vtkCellArray

  use iso_fortran_env, only : error_unit
  use iso_c_binding

  use m_vtkObject

  implicit none

  interface vtkCellArray_InsertNextCell
     procedure :: vtkCellArray_InsertNextCell_IdType_IdTypeArr
  end interface vtkCellArray_InsertNextCell
  
  interface

     function vtkCellArray_New_c() result(cells) &
          bind(C, name="vtkCellArray_New")
       import c_ptr
       type(c_ptr) :: cells
     end function vtkCellArray_New_c

     subroutine vtkCellArray_Delete(cells) &
          bind(C, name="vtkCellArray_Delete")
       import c_ptr
       type(c_ptr),value :: cells
     end subroutine vtkCellArray_Delete


     function vtkCellArray_GetNumberOfCells(cells) &
          result(ncells) bind(C, name="vtkCellArray_GetNumberOfCells")
       import c_ptr, c_int
       integer(c_int)    :: ncells
       type(c_ptr),value ::  cells
     end function vtkCellArray_GetNumberOfCells

     function vtkCellArray_GetData(cells) &
          result(Ids) bind(C, name="vtkCellArray_GetData")
       import c_ptr
       type(c_ptr)       :: Ids
       type(c_ptr),value :: cells
     end function vtkCellArray_GetData

     function vtkCellArray_InsertNextCell_IdType_IdTypeArr &
          (cells, npts, pts) result(id) &
          bind(C, name="vtkCellArray_InsertNextCell_IdType_IdTypeArr")
       import c_ptr, c_int
       integer(c_int) :: id
       type(c_ptr),value    :: cells
       integer(c_int),value :: npts
       integer(c_int)       :: pts(npts)
     end function vtkCellArray_InsertNextCell_IdType_IdTypeArr
     
  end interface

contains

  function vtkCellArray_New() result(cells)
    implicit none
    type(c_ptr) :: cells
    cells = vtkCellArray_New_c()
#if !defined(NDEBUG)
    write (error_unit, '(A,Z0.16)'), &
         "vtkCellArray_New() returned 0x", cells
#endif
  end function vtkCellArray_New


end module m_vtkCellArray
