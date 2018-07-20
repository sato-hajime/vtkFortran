
module m_vtkMemoryCounter

  use iso_c_binding

  implicit none
  
  interface
     function GetNumberOfPointers result(nPtrs) &
          bind(C, name="GetNumberOfPointers")
       import c_int
       integer(c_int) :: nPtrs
     end function GetNumberOfPointers

     function GetPointers_c result(ptrs)&
          bind(C, name="GetPointers")
       import c_ptr
       type(c_ptr) :: ptrs
     end function GetPointers_C

end module m_vtkMemoryCounter
