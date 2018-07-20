
module m_vtkUnsignedCharArray_wrapper

  use iso_fortran_env, only : error_unit
  use iso_c_binding
  
  use m_vtkObjectBase
  use m_vtkAbstractArray
  use m_vtkUnsignedCharArray

  implicit none

contains

  subroutine vtkUnsignedCharArray_wrap(absArray, iarray_wrapper, err)
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
       write(error_unit, '(A)') 'vtkUnsignedCharArray_wrap : null pointer'
       ierr = 1
       call raise_error
       return
    else if( .not. vtkObjectBase_IsA(absArray, "vtkUnsignedCharArray")) then
       write(error_unit, '(A)'),&
            'vtkUnsignedCharArray_wrap : not type of "vtkUnsignedCharArray"'
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
               vtkUnsignedCharArray_GetValue(absArray, iValue)
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

  end subroutine vtkUnsignedCharArray_wrap


end module m_vtkUnsignedCharArray_wrapper
