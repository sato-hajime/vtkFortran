module m_vtkIdTypeArray_wrapper

  use m_vtkObjectBase
  use m_vtkAbstractArray
  use m_vtkIdTypeArray

  use iso_fortran_env, only : error_unit
  
contains

  subroutine vtkIdTypeArray_wrap(absArray, iarray_wrapper, err)
    implicit none
    type(c_ptr),intent(in)       :: absArray
    integer(c_int),allocatable   :: iarray_wrapper(:,:)
    integer,intent(out),optional ::  err
    integer                      :: ierr

    integer :: nComponents, nTuples
    integer :: iComponents, iTuples
    integer :: iValue

    ierr = 0
    if ( .not. c_associated(absArray) ) then
       write(error_unit, '(A)') 'vtkIdTypeArray_wrap : null pointer'
       ierr = 1
       call raise_error
       return
    else if( .not. vtkObjectBase_IsA(absArray, "vtkIdTypeArray")) then
       write(error_unit, '(A)'),&
            'vtkIdTypeArray_wrap : not type of "vtkIdTypeArray"'
       ierr = 1
       call raise_error
       return
    end if

    nComponents = vtkAbstractArray_GetNumberOfComponents(absArray)
    nTuples     = vtkAbstractArray_GetNumberOfTuples(absArray)

    allocate( iarray_wrapper( 0:nComponents-1, 0:nTuples-1 ))

    iValue = 0
    do iTuples = 0,nTuples-1
       do iComponents = 0,nComponents-1
          iarray_wrapper(iComponents, iTuples) = &
               vtkIdTypeArray_GetValue(absArray, iValue)
          iValue = iValue + 1
       end do
    end do

  contains

    subroutine raise_error
      if ( present(err) ) then
         err = ierr
      elseif( ierr /= 0 ) then
         stop 1
      endif
    end subroutine raise_error
    
  end subroutine vtkIdTypeArray_wrap
end module m_vtkIdTypeArray_wrapper
