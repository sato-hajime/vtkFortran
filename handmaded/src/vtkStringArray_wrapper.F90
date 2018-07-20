
#define LABEL_FINALLY 00100

module m_vtkStringArray_wrapper
  
  use iso_c_binding

  use m_vtkObjectBase
  use m_vtkAbstractArray
  use m_vtkStringArray
#if defined(FORTRAN2003_CLASS)
  use m_vtkStringArrayClass
#endif
  
  implicit none

contains
  
  subroutine vtkStringArray_wrap(array, sarray_wrapper, err)
    implicit none
    type(c_ptr),intent(in)          :: array
    character(*,c_char),allocatable :: sarray_wrapper(:,:)
    integer,intent(out),optional    ::  err
    integer                         :: ierr
    
    integer :: nComponents, nTuples
    integer :: iComponents, iTuples
    integer :: iValue

    ierr = 0
    
    if ( .not. c_associated(array) ) then
       write(error_unit, '(A)') 'vtkStringArray_wrap : null pointer'
       ierr = 1
       goto LABEL_FINALLY
    else if( .not. vtkObjectBase_IsA(array, "vtkStringArray")) then
       write(error_unit, '(A)') 'vtkStringArray_wrap : not type of "vtkStringArray"'
       ierr = 1
       goto LABEL_FINALLY
    end if
    
    nComponents = vtkAbstractArray_GetNumberOfComponents(array)
    nTuples     = vtkAbstractArray_GetNumberOfTuples(array)
    
    allocate( sarray_wrapper( 0:nComponents-1 ,0:nTuples-1 ))
    
    iValue = 0
    do iTuples = 0,nTuples-1
       do iComponents = 0,nComponents-1
          sarray_wrapper(iComponents, iTuples) = &
               vtkStringArray_GetValue(&
               len(sarray_wrapper), array, iValue, ierr)
          if (ierr /= 0) then
             goto LABEL_FINALLY
          end if
          iValue = iValue + 1
       end do
    end do
    
    LABEL_FINALLY continue
    if ( present(err) ) then
       err = ierr
    elseif( ierr /= 0 ) then
       stop 1
    endif    
  end subroutine vtkStringArray_wrap

#if defined(FORTRAN2003_CLASS)
  subroutine vtkStringArrayClass_wrap(absArray, sarray_wrapper, err)
    implicit none
    class(vtkAbstractArray)              :: absArray
    character(*,c_char),allocatable :: sarray_wrapper(:,:)
    integer,intent(out),optional ::  err
    integer                      :: ierr
    ierr = 0
    call vtkStringArray_wrap(absArray%ptr, sarray_wrapper, err)
    if (ierr /= 0) then
       goto LABEL_FINALLY
    end if
    
    LABEL_FINALLY continue
    if ( present(err) ) then
       err = ierr
    elseif( ierr /= 0 ) then
       stop 1
    endif
  end subroutine vtkStringArrayClass_wrap    
#endif
  
end module m_vtkStringArray_wrapper
