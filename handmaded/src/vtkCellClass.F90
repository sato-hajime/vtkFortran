
module m_vtkCellClass

  use iso_c_binding

  use m_vtkCell
  use m_vtkObjectClass

  implicit none
  
  type,extends(vtkObject) :: vtkCell
   contains
     procedure :: GetCellType       => vtkCellMethod_GetCellType
     procedure :: GetNumberOfPoints => vtkCellMethod_GetNumberOfPoints
     procedure :: GetPointId        => vtkCellMethod_GetPointId
  end type vtkCell
  
contains
  
  function vtkCellMethod_GetCellType(cell) result(cType)
    class(vtkCell) :: cell
    integer(c_int) :: cType
    cType = vtkCell_GetCellType(cell%ptr)
  end function vtkCellMethod_GetCellType

  function vtkCellMethod_GetNumberOfPoints(cell) result(nPoints)
    class(vtkCell) :: cell
    integer(c_int) :: nPoints
    nPoints = vtkCell_GetNumberOfPoints(cell%ptr)
  end function vtkCellMethod_GetNumberOfPoints

  function vtkCellMethod_GetPointId(cell, ptId) result(cellPtId)
    class(vtkCell)            :: cell
    integer(c_int),intent(in) :: ptId
    integer(c_int)            :: cellPtId
    cellPtId = vtkCell_GetPointId(cell%ptr, ptId)
  end function vtkCellMethod_GetPointId
  
end module m_vtkCellClass
