
#define LABEL_FINALLY 00100

module m_vtkStringArray

  use iso_c_binding

  use m_vtkStdString
  use cstring
  
  implicit none
  
  interface vtkStringArray_GetValue
     module procedure vtkStringArray_GetValue_explicit
#if defined(FORTRAN2003_ALLOCATABLE_CHARACTER)
     module procedure vtkStringArray_GetValue_allocatable
#endif
  end interface vtkStringArray_GetValue  
  
  interface
     function vtkStringArray_GetValue_cp &
          (this, id) result(str) &
          bind(C, name="vtkStringArray_GetValue_cp")
       import c_ptr, c_int
       type(c_ptr),value    :: this
       integer(c_int),value :: id
       type(c_ptr)          :: str
     end function vtkStringArray_GetValue_cp
  end interface

contains

  function vtkStringArray_GetValue_explicit( &
       length, this, id, err) result(str)
    implicit none
    integer,intent(in)           :: length
    type(c_ptr),intent(in)       :: this
    integer(c_int),intent(in)    :: id
    integer,intent(out),optional ::  err
    integer                      :: ierr
    character(length,c_char)     :: str
    type(c_ptr) :: vtkStr
    ierr = 0
    str = c2f(length, &
         vtkStringArray_GetValue_cp(this, id), ierr)
    if (ierr /= 0) goto LABEL_FINALLY
    
    LABEL_FINALLY continue
    if    ( present(err) ) then
       err = ierr
    elseif( ierr /= 0    ) then
       stop 1
    end if
    
  end function vtkStringArray_GetValue_explicit

#if defined(FORTRAN2003_ALLOCATABLE_CHARACTER)
  function vtkStringArray_GetValue_allocatable( &
       this, id) result(str)
    implicit none
    type(c_ptr),intent(in)          :: this
    integer(c_int),intent(in)       :: id
    character(:,c_char),allocatable :: str
    type(c_ptr) :: vtkStr
    str = c2f(vtkStringArray_GetValue_cp(this, id))
  end function vtkStringArray_GetValue_allocatable
#endif
  
end module m_vtkStringArray
