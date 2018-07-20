
module m_vtkDataSet
  
  use iso_c_binding
  
  implicit none

  interface

     function vtkDataSet_GetNumberOfPoints(this) &
          result(nPoints) bind(C, name="vtkDataSet_GetNumberOfPoints")
       import c_ptr, c_int
       type(c_ptr),value :: this
       integer(c_int)    :: nPoints
     end function vtkDataSet_GetNumberOfPoints
     
     subroutine vtkDataSet_GetPoint_i0_r3_c(pSet, ptId, x) &
          bind(C, name="vtkDataSet_GetPoint_i0_r3")
       import c_ptr, c_int
       type(c_ptr),value    :: pSet
       integer(c_int),value :: ptId
       type(c_ptr),value    :: x
     end subroutine vtkDataSet_GetPoint_i0_r3_c
     
     function vtkDataSet_GetPointData(this) result(pData) &
          bind(C, name="vtkDataSet_GetPointData")
       import c_ptr
       type(c_ptr),value :: this
       type(c_ptr)       :: pData
     end function vtkDataSet_GetPointData

     function vtkDataSet_GetNumberOfCells(this) result(nCells) &
          bind(C, name="vtkDataSet_GetNumberOfCells")
       import c_ptr, c_int
       type(c_ptr),value :: this
       integer(c_int)    :: nCells
     end function vtkDataSet_GetNumberOfCells

     function vtkDataSet_GetCell(this, cellId) result(cell) &
          bind(C, name="vtkDataSet_GetCell")
       import c_ptr, c_int
       type(c_ptr),value    :: this
       integer(c_int),value :: cellId
       type(c_ptr)          :: cell
     end function vtkDataSet_GetCell
     
     function vtkDataSet_GetCellData(this) result(cData) &
          bind(C, name="vtkDataSet_GetCellData")
       import c_ptr
       type(c_ptr),value :: this
       type(c_ptr)       :: cData
     end function vtkDataSet_GetCellData
     
  end interface

contains
  
  function vtkDataSet_GetPoint(this, ptId) result(x)
    implicit none
    type(c_ptr)               :: this
    integer(c_int),intent(in) :: ptId
    real(c_double),target     :: x(3)
    call vtkDataSet_GetPoint_i0_r3_c(this, ptId, c_loc(x))
  end function vtkDataSet_GetPoint
  
end module m_vtkDataSet
