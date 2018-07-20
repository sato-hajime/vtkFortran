
#define LABEL_FINALLY 00100

module cstring

  use iso_fortran_env
  use iso_c_binding

  implicit none
       
  interface c2f
#if defined(FORTRAN2003_ALLOCATABLE_CHARACTER)
     module procedure c2f_explicit, c2f_allocatable
#else
     module procedure c2f_explicit
#endif
  end interface c2f

  interface
     
     subroutine printf(str) bind(C)
       import c_ptr
       type(c_ptr),value :: str
     end subroutine printf
     
     function strlen(str) bind(C)
       import c_ptr, c_size_t
       type(c_ptr),value :: str
       integer(c_size_t) :: strlen
     end function strlen

     function memcpy(s1, s2, n) result(s1_) bind(C)
       import c_ptr, c_size_t
       type(c_ptr),value       :: s1, s2
       integer(c_size_t),value :: n
       type(c_ptr) :: s1_
     end function memcpy
     
  end interface
  
contains
  
  function c2f_explicit(length, cstr, err) result(fstr)
    implicit none
    integer,intent(in)              :: length
    type(c_ptr),intent(in)          :: cstr
    integer,intent(out),optional    ::  err
    integer                         :: ierr
    character(length,c_char),target :: fstr

    character(1,c_char),pointer :: charArr(:)
    integer(c_size_t) :: clen

    integer iChar

    ierr = 0
    
    clen = strlen(cstr)
    if ( clen > (length+1) ) then
       write(error_unit, '(A,I0,A,I0)'), &
            'c2f_explicit : strlen(cstr)=',clen,' > (length+1)=',length+1
       ierr = 1
       goto LABEL_FINALLY
    end if
    
    call c_f_pointer(cstr, charArr, [clen])
    fstr = ""
    do iChar = lbound(charArr,1), ubound(charArr,1)
       fstr(iChar:iChar) = charArr(iChar)
    end do

    LABEL_FINALLY continue
    if ( present(err) ) then
       err = ierr
    elseif( ierr /= 0 ) then
       stop 1
    end if
    return
  end function c2f_explicit

#if defined(FORTRAN2003_ALLOCATABLE_CHARACTER)
  function c2f_allocatable(cstr) result(fstr)
    implicit none
    type(c_ptr),intent(in)          :: cstr
    character(:),allocatable        :: fstr
    
    integer :: clen
    
    fstr = ""
    clen = strlen(cstr)
    fstr = c2f(clen, cstr)
  end function c2f_allocatable
#endif

  logical function nullTerminated(fstr)
    implicit none
    character(*,c_char) :: fstr
    integer :: length
    length = len_trim(fstr)
    nullTerminated = fstr(length:length) == c_null_char
  end function nullTerminated
  
  logical function nullContained(fstr)
    implicit none
    character(*,c_char) :: fstr
    integer :: iChar
    nullContained = .false.
    do iChar = len(fstr), 1, -1
       if (fstr(iChar:iChar) == c_null_char) then
          nullContained = .true.
          exit
       end if
    end do
  end function nullContained
    
  function f2c(fstr, err) result(cstr)
    implicit none
    character(*,c_char),target   :: fstr
    integer,intent(out),optional :: err
    integer                      :: ierr
    type(c_ptr)         :: cstr
    character(1,c_char),pointer :: firstChar

    ierr = 0
    
    if    ( .not. nullTerminated(fstr)) then
#if !defined(NDEBUG)
       write(error_unit, *), "'"//fstr//"' is not null terminated"
#endif
    elseif( .not. nullContained(fstr) ) then
       write(error_unit, *), "'"//fstr//"' is not null conteined"
       ierr = 1
       goto LABEL_FINALLY
    end if

    firstChar => fstr(1:1)
    cstr = c_loc( firstChar )

    LABEL_FINALLY continue
    if ( present(err) ) then
       err = ierr
    elseif( ierr /= 0 ) then
       stop 1
    end if
    return
    
  end function f2c
  
end module cstring
