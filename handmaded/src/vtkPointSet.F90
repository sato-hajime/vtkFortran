
module m_vtkPointSet

  use iso_c_binding
  
  implicit none

  interface
     function vtkPointSet_GetPoints(pSet) result(pts) &
          bind(C, name="vtkPointSet_GetPoints")
       import c_ptr
       type(c_ptr) :: pts
       type(c_ptr),value :: pSet
     end function vtkPointSet_GetPoints
     
     subroutine vtkPointSet_SetPoints(pSet, pts) &
          bind(C, name="vtkPointSet_SetPoints")
       import c_ptr
       type(c_ptr),value :: pSet, pts
     end subroutine vtkPointSet_SetPoints
     
  end interface
  
end module m_vtkPointSet
