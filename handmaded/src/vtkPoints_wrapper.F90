
module m_vtkPoints_wrapper

  use iso_c_binding

#if defined(FORTRAN2003_CLASS)
  use m_vtkDataSetClass
#endif
  use m_vtkDataSet
  
  implicit none

#if defined(FORTRAN2003_CLASS)
  interface vtkPoints_wrapper
     module procedure vtkPoints_wrapper_vtkDataSetClass
  end interface vtkPoints_wrapper
#endif

contains
  
  subroutine vtkPoints_wrapper_vtkDataSet(dataSet, points)
    implicit none
    type(c_ptr),intent(in)     :: dataSet
    real(c_double),allocatable :: points(:,:)
    
    integer iPoint
    
    allocate( points( 3, 0:vtkDataSet_GetNumberOfPoints(dataSet)-1 ) )
    do iPoint = lbound(points,2), ubound(points,2)
       points(:,iPoint) = vtkDataSet_GetPoint(dataSet, iPoint)
    end do
    
  end subroutine vtkPoints_wrapper_vtkDataSet

#if defined(FORTRAN2003_CLASS)
  subroutine vtkPoints_wrapper_vtkDataSetClass(dSet, points)
    implicit none
    class(vtkDataSet) :: dSet
    real(c_double),allocatable :: points(:,:)
    call vtkPoints_wrapper_vtkDataSet(dSet%ptr, points)
  end subroutine vtkPoints_wrapper_vtkDataSetClass
#endif
end module m_vtkPoints_wrapper

