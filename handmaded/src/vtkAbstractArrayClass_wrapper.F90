
module m_vtkAbstractArray_wrapper

  use iso_fortran_env, only : input_unit, output_unit, error_unit
  
  use m_vtkAbstractArray
  ! use m_vtkStringArray
  use m_vtkDoubleArray
  ! use m_vtkIntArray

  implicit none
    
  type vtkAbstractArray_wrapper
  end type vtkAbstractArray_wrapper
  
  ! type,extends(vtkAbstractArray_wrapper) :: vtkStringArray_wrapper
  !    character(:,c_char),pointer :: array(:) => NULL()
  !  contains
  !    final :: vtkStringArray_wrapper_Finalize
  ! end type vtkStringArray_wrapper
  
  type,extends(vtkAbstractArray_wrapper) :: vtkDoubleArray_wrapper
     real(c_double),pointer :: array(:,:) => NULL()
  end type vtkDoubleArray_wrapper
  
  ! type,extends(vtkAbstractArray_wrapper) :: vtkIntArray_wrapper
  !    integer(c_int),pointer :: array(:,:) => NULL()
  !  contains
  !    final :: vtkIntArray_wrapper_Finalize
  ! end type vtkIntArray_wrapper

contains

  

#ifdef FORTRAN2003_CLASS
  subroutine vtkAbstractArray_wrap(array, array_wrapper)
    class(vtkAbstractArray),intent(in)      :: array
    class(vtkAbstractArray_wrapper),pointer :: array_wrapper
    
    
    if ( .false. ) then
       continue   
       ! else if ( array%IsA("vtkStringArray") ) then
       !    call vtkStringArray_wrap(array, array_wrapper)
    else if ( array%IsA("vtkDoubleArray") ) then
       call doubleArray
    ! else if ( array%IsA("vtkIntArray"   ) ) then
    !    call vtkIntArray_wrap(array, array_wrapper)
    else
       write(error_unit, *), "notImplimentedType"
       stop -1
    end if  

  contains
    subroutine doubleArray
      type(vtkDoubleArray_wrapper),pointer :: darray_wrapper => NULL()
      call vtkDoubleArray_wrap(array, darray_wrapper)
      array_wrapper => darray_wrapper
    end subroutine doubleArray
    
  end subroutine vtkAbstractArray_wrap
  
  subroutine vtkDoubleArray_wrap(array, array_wrapper)
    class(vtkAbstractArray),intent(in)                 :: array
    type(vtkDoubleArray_wrapper),pointer,intent(out) :: array_wrapper

    type(vtkDoubleArray)                :: darray
    
    real(c_double),pointer :: double_2D(:,:)
    
    allocate( array_wrapper )

    darray%ptr = array%ptr
    call c_f_pointer(darray%GetVoidPointer(), double_2D, &
         [darray%GetNumberOfComponents(), darray%GetNumberOfTuples()])

    array_wrapper%array(0:,0:) => double_2D(:,:)
    
  end subroutine vtkDoubleArray_wrap
#endif

end module m_vtkAbstractArray_wrapper
