
module m_vtkPointSet

  use iso_c_binding
  
  implicit none

  interface
     subroutine vtkPointSet_SetPoints(pSet, pts) &
          bind(C, name="vtkPointSet_SetPoints")
       import c_ptr
       type(c_ptr),value :: pSet
       type(c_ptr),value :: pts
     end subroutine vtkPointSet_SetPoints
     
     function vtkPointSet_GetPoints(pSet) result(pts) &
          bind(C, name="vtkPointSet_GetPoints")
       import c_ptr
       type(c_ptr),value :: pSet
       type(c_ptr)       :: pts
     end function vtkPointSet_GetPoints
  end interface
  
end module m_vtkPointSet
