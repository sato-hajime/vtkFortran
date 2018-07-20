
module m_vtkObjectBaseClass
  use iso_c_binding

  use m_vtkObjectBase

  private
  
  type,public :: vtkObjectBase
     type(c_ptr),public :: ptr = c_null_ptr
   contains
     procedure :: New    => vtkObjectBaseMethod_New
     procedure :: Delete => vtkObjectBaseMethod_Delete
     procedure :: GetReferenceCount => &
          vtkObjectBaseMethod_GetReferenceCount
     procedure :: Print     => vtkObjectBaseMethod_Print
     procedure :: PrintSelf => vtkObjectBaseMethod_PrintSelf
     procedure :: IsA       => vtkObjectBaseMethod_IsA
     ! procedure :: IsTypeOf  => vtkObjectBaseMethod_IsTypeOf
     procedure :: IsNull    => vtkObjectBaseMethod_IsNull
  end type vtkObjectBase
  
contains

  subroutine vtkObjectBaseMethod_New(obj)
    implicit none
    class(vtkObjectBase) :: obj
    if ( c_associated(obj%ptr) ) then
       write(error_unit, '(A,z0.16,A)'),&
            "vtkObjectBase(obj%ptr=0x", obj%ptr , ")%New : already allocated"
       stop -1
    end if
    obj%ptr = vtkObjectBase_New()
  end subroutine vtkObjectBaseMethod_New
  
  subroutine vtkObjectBaseMethod_Delete(obj)
    implicit none
    class(vtkObjectBase) :: obj
    if ( .not. c_associated(obj%ptr) ) then
       write(error_unit, '(A,z0.16,A)'),&
            "vtkObjectBase(obj%ptr=0x",obj%ptr,")%Delete : delete null pointer "
       stop -1
    end if
    call vtkObjectBase_Delete(obj%ptr)
    obj%ptr = c_null_ptr
  end subroutine vtkObjectBaseMethod_Delete
  
  function vtkObjectBaseMethod_GetReferenceCount(obj) result(refcnt)
    implicit none
    class(vtkObjectBase) :: obj
    integer(c_int)   :: refcnt
    refcnt = vtkObjectBase_GetReferenceCount(obj%ptr)
  end function vtkObjectBaseMethod_GetReferenceCount

  subroutine vtkObjectBaseMethod_Print(obj)
    implicit none
    class(vtkObjectBase) :: obj
    call vtkObjectBase_Print(obj%ptr)
  end subroutine vtkObjectBaseMethod_Print

  subroutine vtkObjectBaseMethod_PrintSelf(obj, indent)
      implicit none
    class(vtkObjectBase)      :: obj
    integer(c_int),intent(in) :: indent
    call vtkObjectBase_PrintSelf(obj%ptr, indent)
  end subroutine vtkObjectBaseMethod_PrintSelf
  
  function vtkObjectBaseMethod_IsA(obj, name) result(isA)
    implicit none
    class(vtkObjectBase)    :: obj
    character(*),intent(in) :: name
    logical                 :: isA
    isA = vtkObjectBase_IsA(obj%ptr, name)
  end function vtkObjectBaseMethod_IsA

  ! function vtkObjectBaseMethod_IsTypeOf(obj, name) result(isTypeOf)
  !   implicit none
  !   class(vtkObjectBase)    :: obj
  !   character(*),intent(in) :: name
  !   logical                 :: isTypeOf
  !   isTypeOf = vtkObjectBase_IsTypeOf(obj%ptr, name)
  ! end function vtkObjectBaseMethod_IsTypeOf

  function vtkObjectBaseMethod_IsNull(obj) result(isNull)
    implicit none
    class(vtkObjectBase) :: obj
    logical              :: isNull
    isNull = .not. c_associated(obj%ptr)
  end function vtkObjectBaseMethod_IsNull
  
end module m_vtkObjectBaseClass
