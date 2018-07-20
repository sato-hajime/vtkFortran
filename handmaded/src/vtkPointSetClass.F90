
module m_vtkPointSetClass

  use iso_c_binding

  use m_vtkPointSet
  use m_vtkDataSetClass
  use m_vtkPointsClass
  
  implicit none

  private
  
  type,public,extends(vtkDataSet) :: vtkPointSet
   contains
     procedure :: SetPoints => vtkPointSetMethod_SetPoints
     procedure :: GetPoints => vtkPointSetMethod_GetPoints
  end type vtkPointSet

contains
  
  subroutine vtkPointSetMethod_SetPoints(pSet, pts)
    class(vtkPointSet)         :: pSet
    type(vtkPoints),intent(in) :: pts
    call vtkPointSet_SetPoints(pSet%ptr, pts%ptr)
  end subroutine vtkPointSetMethod_SetPoints

  function vtkPointSetMethod_GetPoints(pSet) result(pts)
    class(vtkPointSet)         :: pSet
    type(vtkPoints)            :: pts
    pts%ptr = vtkPointSet_GetPoints(pSet%ptr)
  end function vtkPointSetMethod_GetPoints

end module m_vtkPointSetClass
