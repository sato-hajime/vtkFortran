
module m_vtkCells_wrapper
  
  use m_vtkCell
  use m_vtkDataSet
  use m_vtkObjectBase

#if defined(FORTRAN2003_CLASS)
  use m_vtkDataSetClass
#endif
  
  implicit none

  interface vtkCells_wrap
     module procedure vtkCells_wrap_vtkDataSet
     ! module procedure vtkCells_wrap_cellTypes_cellArray
#if defined(FORTRAN2003_CLASS)
     module procedure vtkCells_wrap_vtkDataSetClass
#endif
  end interface vtkCells_wrap
  
  type :: vtkCell_wrapper
     integer(c_int)             :: type = -1
     integer(c_int),allocatable :: points(:)
  end type vtkCell_wrapper

contains
  
  subroutine vtkCells_wrapper_vtkCell(cell, cell_wrapper)
    implicit none
    type(c_ptr),intent(in) :: cell
    type(vtkCell_wrapper)  :: cell_wrapper
    
    integer :: iPoint
    
    cell_wrapper%type = vtkCell_GetCellType(cell)
    allocate( cell_wrapper%points(0:vtkCell_GetNumberOfPoints(cell)-1) )
    do iPoint = lbound(cell_wrapper%points,1), ubound(cell_wrapper%points,1)
       cell_wrapper%points(iPoint) = vtkCell_GetPointId(cell, iPoint)
    end do
    
  end subroutine vtkCells_wrapper_vtkCell

  subroutine vtkCells_wrap_vtkDataSet(dataSet, cell_wrappers)
    implicit none
    type(c_ptr),intent(in)            :: dataSet
    type(vtkCell_wrapper),allocatable :: cell_wrappers(:)

    type(c_ptr) :: cell
    
    integer :: iCell
    allocate( cell_wrappers( 0:vtkDataSet_GetNumberOfCells(dataSet)-1 ))
    do iCell = lbound(cell_wrappers,1), ubound(cell_wrappers,1)
       cell = vtkDataSet_GetCell(dataSet, iCell)
       call vtkCells_wrapper_vtkCell(cell, cell_wrappers(iCell))
    end do
  end subroutine vtkCells_wrap_vtkDataSet

#if defined(FORTRAN2003_CLASS)
  subroutine vtkCells_wrap_vtkDataSetClass(dataset, cell_wrappers)
    class(vtkDataSet)                 :: dataSet
    type(vtkCell_wrapper),allocatable :: cell_wrappers(:)
    call vtkCells_wrap_vtkDataSet(dataSet%ptr, cell_wrappers)
  end subroutine vtkCells_wrap_vtkDataSetClass
#endif
  
end module m_vtkCells_wrapper
