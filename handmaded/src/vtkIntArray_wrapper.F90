
#define LABEL_FINALLY 00100

module m_vtkIntArray_wrapper

  use iso_fortran_env, only : input_unit, output_unit, error_unit
  use iso_c_binding

  use m_vtkObjectBase
  use m_vtkAbstractArray
  use m_vtkIntArray
#if defined(FORTRAN2003_CLASS)
  use m_vtkAbstractArrayClass
#endif

  implicit none
  
contains
  
    subroutine vtkIntArray_wrap(absArray, iarray_wrapper, err)
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
       write(error_unit, '(A)') 'vtkIntArray_wrap : null pointer'
       ierr = 1
       goto LABEL_FINALLY
    else if( .not. vtkObjectBase_IsA(absArray, "vtkIntArray")) then
       write(error_unit, '(A)'),&
            'vtkIntArray_wrap : not type of "vtkIntArray"'
       ierr = 1
       goto LABEL_FINALLY
    end if

    nComponents = vtkAbstractArray_GetNumberOfComponents(absArray)
    nTuples     = vtkAbstractArray_GetNumberOfTuples(absArray)
    
    allocate( iarray_wrapper( 0:nComponents-1, 0:nTuples-1 ))

    iValue = 0
    do iTuples = 0,nTuples-1
       do iComponents = 0,nComponents-1
          iarray_wrapper(iComponents, iTuples) = &
               vtkIntArray_GetValue(absArray, iValue)
          iValue = iValue + 1
       end do
    end do
        
    LABEL_FINALLY continue
    if ( present(err) ) then
       err = ierr
    elseif( ierr /= 0 ) then
       stop 1
    endif
  end subroutine vtkIntArray_wrap

#if defined(FORTRAN2003_CLASS)
  subroutine vtkIntArrayClass_wrap(absArray, iarray_wrapper, err)
    implicit none
    class(vtkAbstractArray)      :: absArray
    integer(c_int),allocatable   :: iarray_wrapper(:,:)
    integer,intent(out),optional ::  err
    integer                      :: ierr
    ierr = 0
    call vtkIntArray_wrap(absArray%ptr, iarray_wrapper, ierr)
    if (ierr /= 0) then
       goto LABEL_FINALLY
    end if
    
    LABEL_FINALLY continue
    if ( present(err) ) then
       err = ierr
    elseif( ierr /= 0 ) then
       stop 1
    endif
  end subroutine vtkIntArrayClass_wrap
#endif

  
end module m_vtkIntArray_wrapper
