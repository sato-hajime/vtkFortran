program unittest

  use iso_fortran_env, only : input_unit, output_unit, error_unit

  ! vtkのクラスをFortanのクラスで表現したもの
  use m_vtkUnstructuredGridClass
  use m_vtkPointsClass
  use m_vtkAbstractArrayClass
  
  ! vtkObjectからFortranの配列にwrapするモジュール群
  use m_vtkPoints_wrapper
  use m_vtkCells_wrapper
  use m_vtkAbstractArray_wrapper

  implicit none
  
  character(*,c_char),parameter :: vtkFile = "vtkFortran.vtk"
  
  call writeTest
  call readTest
  
contains

  subroutine writeTest
    type(vtkUnstructuredGrid) :: uGrid
    type(vtkPoints)           :: pts
    integer(c_int) :: ptsID
    integer i, j, k
    
    print *, 'test > "'//vtkFile//'"'
    
    call uGrid%New
    call pts%New
    
    do i = 0,1
       do j = 0,1
          do k = 0,1
             ptsID = pts%InsertNextPoint( &
                  real(i,c_double), &
                  real(j,c_double), &
                  real(k,c_double)  &
                  )
          end do
       end do
    end do

    call uGrid%SetPoints(pts)
    call uGrid%write(vtkFile)
    
    call pts%Delete
    call uGrid%Delete
  end subroutine writeTest

  subroutine readTest
    type(vtkUnstructuredGrid) :: uGrid

    type(vtkFieldData) :: fData
    type(vtkPointData) :: pData
    type(vtkCellData)  :: cData
    
    real(c_double),allocatable             :: points(:,:)
    type(vtkCell_wrapper),allocatable      :: cells(:)
    
    type(vtkAbstractArray)     :: array
    integer(c_int)             :: arrayIdx
    
    print *, 'test < "'//vtkFile//'"'
      
    call uGrid%New
    call uGrid%Read(vtkFile)
    call uGrid%Delete
    
  end subroutine readTest
    
  
end program unittest
