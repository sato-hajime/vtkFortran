
module m_vtkFieldData

  use iso_c_binding

  use cstring

  implicit none

  interface vtkFieldData_GetAbstractArray
     procedure vtkFieldData_GetAbstractArray_i0, vtkFieldData_GetAbstractArray_cp_ip
  end interface vtkFieldData_GetAbstractArray
  
  interface
     function vtkFieldData_GetNumberOfArrays(fData) result(nArray) &
          bind(C, name="vtkFieldData_GetNumberOfArrays")
       import c_ptr, c_int
       type(c_ptr),value :: fData
       integer(c_int)    :: nArray
     end function vtkFieldData_GetNumberOfArrays

     function vtkFieldData_AddArray(fData, array) result(arrayIdx) &
          bind(C, name="vtkFieldData_AddArray")
       import c_ptr, c_int
       type(c_ptr),value :: fData
       type(c_ptr),value :: array
       integer(c_int)    :: arrayIdx
     end function vtkFieldData_AddArray
     
     function vtkFieldData_GetAbstractArray_i0(fData, index) &
          result(arr) bind(C, name="vtkFieldData_GetAbstractArray_i0")
       import c_ptr, c_int
       type(c_ptr),value    :: fData
       integer(c_int),value :: index
       type(c_ptr)          :: arr
     end function vtkFieldData_GetAbstractArray_i0
     
     function vtkFieldData_GetAbstractArray_cp_ip_c(fData, arrName, index) &
          result(arr) bind(C, name="vtkFieldData_GetAbstractArray_cp_ip")
       import c_ptr, c_int
       type(c_ptr),value :: fData
       type(c_ptr),value :: arrName
       integer(c_int)    :: index
       type(c_ptr)       :: arr
     end function vtkFieldData_GetAbstractArray_cp_ip_c
     
  end interface

contains

  recursive function vtkFieldData_GetAbstractArray_cp_ip &
       (fData, arrayName, index) result(array)
    type(c_ptr),intent(in)         :: fData
    character(*,c_char),intent(in) :: arrayName
    integer(c_int),intent(out)     :: index
    type(c_ptr)                    :: array
    call GetAbstractArray_cp_ip_terminated(arrayName//c_null_char)
  contains
    subroutine GetAbstractArray_cp_ip_terminated(terminated)
      character(*,c_char),intent(in) :: terminated
      array = vtkFieldData_GetAbstractArray_cp_ip_c( &
           fData, f2c(terminated), index)
    end subroutine GetAbstractArray_cp_ip_terminated
  end function vtkFieldData_GetAbstractArray_cp_ip
  
end module m_vtkFieldData
