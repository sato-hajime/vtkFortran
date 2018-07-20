
module m_vtkCell

  use iso_c_binding

  implicit none

  interface

     function vtkCell_GetCellType(this) result(cType) &
          bind(C, name="vtkCell_GetCellType")
       import c_ptr, c_int
       type(c_ptr),value :: this
       integer(c_int)    :: cType
     end function vtkCell_GetCellType
     
     function vtkCell_GetNumberOfPoints(this) result(nPoints) &
          bind(C, name="vtkCell_GetNumberOfPoints")
       import c_ptr, c_int
       type(c_ptr),value :: this
       integer(c_int)    :: nPoints
     end function vtkCell_GetNumberOfPoints
     
     function vtkCell_GetPointId(this, ptId) result(cellPtId) &
          bind(C, name="vtkCell_GetPointId")
       import c_ptr, c_int
       type(c_ptr),value    :: this
       integer(c_int),value :: ptId
       integer(c_int)       :: cellPtId
     end function vtkCell_GetPointId
     
  end interface
  
end module m_vtkCell
