
module m_vtkAbstractArray

  use iso_c_binding

  use cstring
  
  implicit none

  interface vtkAbstractArray_GetName
#if defined(FORTRAN2003_ALLOCATABLE_CHARACTER)
     module procedure vtkAbstractArray_GetName_explicit, vtkAbstractArray_GetName_allocatable
#else
     module procedure vtkAbstractArray_GetName_explicit
#endif
  end interface vtkAbstractArray_GetName

  interface

     subroutine vtkAbstractArray_SetName_c(array, name) &
          bind(C, name="vtkAbstractArray_SetName")
       import c_ptr
       type(c_ptr),value :: array
       type(c_ptr),value :: name
     end subroutine vtkAbstractArray_SetName_c
     
     function vtkAbstractArray_GetName_c(array) result(name) &
          bind(C, name="vtkAbstractArray_GetName")
       import c_ptr, c_int
       type(c_ptr),value :: array
       type(c_ptr)       :: name
     end function vtkAbstractArray_GetName_c

     subroutine vtkAbstractArray_SetNumberOfValues(array, nValues) &
          bind(C, name="vtkAbstractArray_SetNumberOfValues")
       import c_ptr, c_int
       type(c_ptr),value    :: array
       integer(c_int),value :: nValues 
     end subroutine vtkAbstractArray_SetNumberOfValues
     
     function vtkAbstractArray_GetNumberOfValues(array) &
          result(nValues) bind(C, name="vtkAbstractArray_GetNumberOfValues")
       import c_ptr, c_int
       type(c_ptr),value :: array
       integer(c_int)    :: nValues
     end function vtkAbstractArray_GetNumberOfValues

     subroutine vtkAbstractArray_SetNumberOfTuples(array, nTuples) &
          bind(C, name="vtkAbstractArray_SetNumberOfTuples")
       import c_ptr, c_int
       type(c_ptr),value    :: array
       integer(c_int),value :: nTuples 
     end subroutine vtkAbstractArray_SetNumberOfTuples
     
     function vtkAbstractArray_GetNumberOfTuples(array) &
          result(nTuples) bind(C, name="vtkAbstractArray_GetNumberOfTuples")
       import c_ptr, c_int
       type(c_ptr),value :: array
       integer(c_int)    :: nTuples
     end function vtkAbstractArray_GetNumberOfTuples

     subroutine vtkAbstractArray_SetNumberOfComponents(array, nComponents) &
          bind(C, name="vtkAbstractArray_SetNumberOfComponents")
       import c_ptr, c_int
       type(c_ptr),value    :: array
       integer(c_int),value :: nComponents
     end subroutine vtkAbstractArray_SetNumberOfComponents
     
     function vtkAbstractArray_GetNumberOfComponents(array) &
          result(nComponents) &
          bind(C, name="vtkAbstractArray_GetNumberOfComponents")
       import c_ptr, c_int
       type(c_ptr),value :: array
       integer(c_int)    :: nComponents
     end function vtkAbstractArray_GetNumberOfComponents
     
     function vtkAbstractArray_GetVoidPointer(array, valueIdx) result(ptr) &
          bind(C, name="vtkAbstractArray_GetVoidPointer")
       import c_ptr, c_int
       type(c_ptr),value    :: array
       integer(c_int),value :: valueIdx
       type(c_ptr)          :: ptr
     end function vtkAbstractArray_GetVoidPointer
     
  end interface
  
contains

  subroutine vtkAbstractArray_SetName(array, name)
    implicit none
    type(c_ptr),intent(in)         :: array
    character(*,c_char),intent(in) :: name
    call SetName_terminated(name//c_null_char)
  contains
    subroutine SetName_terminated(terminated)
      character(*,c_char),intent(in) :: terminated
      call vtkAbstractArray_SetName_c(array, f2c(terminated))
    end subroutine SetName_terminated
  end subroutine vtkAbstractArray_SetName

  
  function vtkAbstractArray_GetName_explicit(array, length) result(name)
    implicit none
    type(c_ptr),intent(in)          :: array
    integer,intent(in)              :: length
    character(length,c_char)        :: name
    name = c2f(length, vtkAbstractArray_GetName_c(array))
  end function vtkAbstractArray_GetName_explicit

#if defined(FORTRAN2003_ALLOCATABLE_CHARACTER)
  function vtkAbstractArray_GetName_allocatable(array) result(name)
    implicit none
    type(c_ptr),intent(in)   :: array
    character(:),allocatable :: name
    type(c_ptr) :: cbuf
    name = c2f(vtkAbstractArray_GetName_c(array))
  end function vtkAbstractArray_GetName_allocatable
#endif
  
end module m_vtkAbstractArray
