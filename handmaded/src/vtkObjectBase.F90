
module m_vtkObjectBase

  use iso_fortran_env, only: input_unit, output_unit, error_unit
  use iso_c_binding
  use cstring
  
  interface
     function vtkObjectBase_New_c() result(obj) &
          bind(C, name="vtkObjectBase_New")
       import c_ptr
       type(c_ptr) :: obj
     end function vtkObjectBase_New_c
     
     subroutine vtkObjectBase_Delete_c(obj) &
          bind(C, name="vtkObjectBase_Delete")
       import c_ptr
       type(c_ptr),value :: obj
     end subroutine vtkObjectBase_Delete_c
     
     function vtkObjectBase_GetReferenceCount(obj) result(refcnt) &
          bind(C, name="vtkObjectBase_GetReferenceCount")
       import c_ptr, c_int
       type(c_ptr),value :: obj
       integer(c_int)    :: refcnt
     end function vtkObjectBase_GetReferenceCount

     subroutine vtkObjectBase_Print(obj) &
          bind(C, name="vtkObjectBase_Print")
       import c_ptr
       type(c_ptr),value :: obj
     end subroutine vtkObjectBase_Print

     subroutine vtkObjectBase_PrintSelf(obj, indent) &
          bind(C, name="vtkObjectBase_PrintSelf")
       import c_ptr, c_int
       type(c_ptr),value    :: obj
       integer(c_int),value :: indent
     end subroutine vtkObjectBase_PrintSelf

     function vtkObjectBase_IsA_c(obj, name) result(isA) &
          bind(C, name="vtkObjectBase_IsA")
       import c_ptr, c_int
       type(c_ptr),value :: obj
       type(c_ptr),value :: name
       integer(c_int)    :: isA
     end function vtkObjectBase_IsA_c

     ! function vtkObjectBase_IsTypeOf_c(name) result (IsTypeOf) &
     !      bind(C, name="vtkObjectBase_IsTypeOf")
     !   import c_ptr, c_int
     !   type(c_ptr),value :: obj
     !   type(c_ptr),value :: name
     !   integer(c_int)    :: IsTypeOf
     ! end function vtkObjectBase_IsTypeOf_c
  end interface
  
contains

  function vtkObjectBase_New() result(this)
    implicit none
    type(c_ptr) :: this
    this = vtkObjectBase_New_c()
#if !defined(NDEBUG)
    write (error_unit, '(A,Z0.16)'), &
         "vtkObjectBase_New() returned 0x",this
#endif
  end function vtkObjectBase_New
  
  subroutine vtkObjectBase_Delete(this)
    implicit none
    type(c_ptr),intent(inout) :: this
    if ( .not. c_associated(this) ) then
       write(error_unit, '(A,z0.16,A)'),&
            "vtkObjectBase(0x",this,")%Delete : delete null pointer "
       stop 1
    end if
#if !defined(NDEBUG)
    write(error_unit, '(A,z0.16,A)'), &
         "vtkObjectBase_Delete(0x",this, ")"
#endif
    call vtkObjectBase_Delete_c(this)
    this = c_null_ptr
  end subroutine vtkObjectBase_Delete
  
  function vtkObjectBase_IsA(this, name) result(isA)
    implicit none
    type(c_ptr),intent(in)  :: this
    character(*),intent(in) :: name
    logical                 :: isA
    
    integer(c_int) :: result
    
    if ( .not. nullContained(name) ) then
       call IsA_terminated(name//c_null_char)
    else
       call IsA_terminated(name)
    endif
    select case(result)
    case( 0 )
       isA = .false.
    case( 1 )
       isA = .true.
    case default
       write(error_unit, '(A,A,A,I0)'), &
            "vtkObjectBase->IsA(",trim(name),") returned ",result
       stop 1        
    end select
    
  contains
    subroutine IsA_terminated(terminated)
      character(*,c_char),intent(in) :: terminated
      result = vtkObjectBase_IsA_c(this, f2c(terminated))
    end subroutine IsA_terminated
  end function vtkObjectBase_IsA
  
  ! function vtkObjectBase_IsTypeOf(this, name) result(IsTypeOf)
  !   implicit none
  !   type(c_ptr),intent(in)  :: this
  !   character(*),intent(in) :: name
  !   logical                 :: IsTypeOf
    
  !   integer(c_int) :: result
    
  !   if ( .not. nullContained(name) ) then
  !      call IsTypeOf_terminated(name//c_null_char)
  !   else
  !      call IsTypeOf_terminated(name)
  !   endif
  !   select case(result)
  !   case( 0 )
  !      IsTypeOf = .false.
  !   case( 1 )
  !      IsTypeOf = .true.
  !   case default
  !      write(error_unit, '(A,A,A,I0)'), &
  !           "vtkObjectBase->IsTypeOf(",trim(name),") returned ",result
  !      stop 1        
  !   end select
    
  ! contains
  !   subroutine IsTypeOf_terminated(terminated)
  !     character(*,c_char),intent(in) :: terminated
  !     result = vtkObjectBase_IsTypeOf_c(this, f2c(terminated))
  !   end subroutine IsTypeOf_terminated
  ! end function vtkObjectBase_IsTypeOf  
  
end module m_vtkObjectBase
