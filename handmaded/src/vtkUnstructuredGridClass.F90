
module m_vtkUnstructuredGridClass

  use iso_c_binding

  use m_vtkUnstructuredGrid
  use m_vtkPointSetClass
  !use m_vtkCellArrayClass
  !use m_vtkCellClass

  implicit none
  
  private

  type,public,extends(vtkPointSet) :: vtkUnstructuredGrid
   contains
     procedure :: New   => vtkUnstructuredGridMethod_New
     procedure :: Read  => vtkUnstructuredGridMethod_Read
     procedure :: Write => vtkUnstructuredGridMethod_Write
     ! procedure :: GetCells => vtkUnstructuredGridMethod_GetCells
     ! procedure :: GetCell  => vtkUnstructuredGridMethod_GetCell
  end type vtkUnstructuredGrid

contains

  subroutine vtkUnstructuredGridMethod_New(obj)
    implicit none
    class(vtkUnstructuredGrid) :: obj
    if ( c_associated(obj%ptr) ) then
       write(error_unit, '(A,z0.16,A)'),&
            'vtkUnstructuredGrid(at 0x',obj%ptr,') already allocated'
       stop 1
    end if
    obj%ptr = vtkUnstructuredGrid_New()
  end subroutine vtkUnstructuredGridMethod_New
  
  subroutine vtkUnstructuredGridMethod_Read(uGrid, fname)
    implicit none
    class(vtkUnstructuredGrid)     :: uGrid
    character(*,c_char),intent(in) :: fName
    call readVtkUnstructuredGrid(uGrid%ptr, fName)
  end subroutine vtkUnstructuredGridMethod_Read

  subroutine vtkUnstructuredGridMethod_Write(uGrid, fname)
    implicit none
    class(vtkUnstructuredGrid)     :: uGrid
    character(*,c_char),intent(in) :: fName
    call writeVtkUnstructuredGrid(uGrid%ptr, fName)
  end subroutine vtkUnstructuredGridMethod_Write

  ! function vtkUnstructuredGrid_GetCells(uGrid) result(cells)
  !   class(vtkUnstructuredGrid) :: uGrid
  !   type(vtkCellArray)         :: cells
  !   cells%ptr = vtkUnstructuredGrid_GetCells_c(this%ptr)
  ! end function vtkUnstructuredGrid_GetCells

  ! function vtkUnstructuredGridMethod_GetCell(this, cellId) result (cell)
  !   class(vtkUnstructuredGrid) :: this
  !   integer(c_int),intent(in)  :: cellId
  !   type(vtkCell)              :: cell
  !   cell%ptr = vtkUnstructuredGrid_GetCell_c(this%ptr, cellId)
  ! end function vtkUnstructuredGridMethod_GetCell
  
end module m_vtkUnstructuredGridClass
