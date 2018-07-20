
module m_vtkCells_wrapper
  
  use m_vtkCell
  use m_vtkDataSet

#if defined(FORTRAN2003_CLASS)
  use m_vtkDataSetClass
#endif
  
  implicit none

#if defined(FORTRAN2003_CLASS)
  interface vtkCells_wrapper
     module procedure vtkCells_wrapper_vtkDataSetClass
  end interface vtkCells_wrapper
#endif
  
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

  subroutine vtkCells_wrapper_vtkDataSet(dataSet, cell_wrappers)
    implicit none
    type(c_ptr),intent(in)            :: dataSet
    type(vtkCell_wrapper),allocatable :: cell_wrappers(:)

    integer :: iCell
    allocate( cell_wrappers( 0:vtkDataSet_GetNumberOfCells(dataSet)-1 ))
    do iCell = lbound(cell_wrappers,1), ubound(cell_wrappers,1)
       call vtkCells_wrapper_vtkCell(&
            vtkDataSet_GetCell(dataSet, iCell), cell_wrappers(iCell))
    end do
  end subroutine vtkCells_wrapper_vtkDataSet

#if defined(FORTRAN2003_CLASS)
  subroutine vtkCells_wrapper_vtkDataSetClass(dataset, cell_wrappers)
    class(vtkDataSet)                 :: dataSet
    type(vtkCell_wrapper),allocatable :: cell_wrappers(:)
    call vtkCells_wrapper_vtkDataSet(dataSet%ptr, cell_wrappers)
  end subroutine vtkCells_wrapper_vtkDataSetClass
#endif
  
end module m_vtkCells_wrapper
