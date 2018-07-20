
module m_vtkAbstractArrayClass

  use iso_c_binding

  use m_vtkAbstractArray
  use m_vtkObjectClass
  
  implicit none
  
  type,public,extends(vtkObject) :: vtkAbstractArray
   contains
#if defined(FORTRAN2003_ALLOCATABLE_CARACTER)
     procedure :: GetName_explicit => &
          vtkAbstractArrayMethod_GetName_explicit
     procedure :: GetName_allocatable => &
          vtkAbstractArrayMethod_GetName_allocatable
     generic   :: GetName => GetName_explicit, GetName_allocatable
#else
     procedure :: GetName_explicit => &
          vtkAbstractArrayMethod_GetName_explicit
     generic   :: GetName => GetName_explicit
#endif
     procedure :: GetNumberOfValues => &
          vtkAbstractArrayMethod_GetNumberOfValues
     procedure :: GetNumberOfTuples => &
          vtkAbstractArrayMethod_GetNumberOfTuples
     procedure :: GetNumberOfComponents => &
          vtkAbstractArrayMethod_GetNumberOfComponents
     procedure :: GetVoidPointer => vtkAbstractArrayMethod_GetVoidPointer
  end type vtkAbstractArray
  
contains

  function vtkAbstractArrayMethod_GetName_explicit(array, length) result(name)
    implicit none
    class(vtkAbstractArray)  :: array
    integer,intent(in)       :: length
    character(length,c_char) :: name
    name = vtkAbstractArray_GetName_explicit(array%ptr, length)
  end function vtkAbstractArrayMethod_GetName_explicit

#if defined(FORTRAN2003_ALLOCATABLE_CARACTER)
  function vtkAbstractArrayMethod_GetName_allocatable(array) result(name)
    implicit none
    class(vtkAbstractArray)  :: array
    character(:),allocatable :: name
    name = vtkAbstractArray_GetName_allocatable(array%ptr)
  end function vtkAbstractArrayMethod_GetName_allocatable
#endif
  
  function vtkAbstractArrayMethod_GetNumberOfValues(array) result(nValues)
    class(vtkAbstractArray) :: array
    integer(c_int)          :: nValues
    nValues = vtkAbstractArray_GetNumberOfValues(array%ptr)
  end function vtkAbstractArrayMethod_GetNumberOfValues

  function vtkAbstractArrayMethod_GetNumberOfTuples(array) result(nTuples)
    class(vtkAbstractArray) :: array
    integer(c_int)          :: nTuples
    nTuples = vtkAbstractArray_GetNumberOfTuples(array%ptr)
  end function vtkAbstractArrayMethod_GetNumberOfTuples
  
  function vtkAbstractArrayMethod_GetNumberOfComponents(array) &
       result(nComponents)
    class(vtkAbstractArray) :: array
    integer(c_int)          :: nComponents
    nComponents = vtkAbstractArray_GetNumberOfComponents(array%ptr)
  end function vtkAbstractArrayMethod_GetNumberOfComponents

  function vtkAbstractArrayMethod_GetVoidPointer(array, valueIdx) result(ptr)
    class(vtkAbstractArray)   :: array
    integer(c_int),intent(in) :: valueIdx
    type(c_ptr)               :: ptr
    ptr = vtkAbstractArray_GetVoidPointer(array%ptr, valueIdx)
  end function vtkAbstractArrayMethod_GetVoidPointer
 
end module m_vtkAbstractArrayClass
