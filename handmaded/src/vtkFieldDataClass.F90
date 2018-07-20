
module m_vtkFieldDataClass

  use iso_c_binding

  use m_vtkFieldData
  use m_vtkObjectClass
  use m_vtkAbstractArrayClass

  implicit none

  private
  
  type,public,extends(vtkObject) :: vtkFieldData
   contains
     procedure :: GetNumberOfArrays => vtkFieldDataMethod_GetNumberOfArrays
     procedure :: GetAbstractArray_i0 => &
          vtkFieldDataMethod_GetAbstractArray_i0
     procedure :: GetAbstractArray_cp_ip => &
          vtkFieldDataMethod_GetAbstractArray_cp_ip
     generic   :: GetAbstractArray => &
          GetAbstractArray_i0, GetAbstractArray_cp_ip
  end type vtkFieldData
  
contains
  
  function vtkFieldDataMethod_GetNumberOfArrays(fData) result(nArray)
    implicit none
    class(vtkFieldData) :: fData
    integer(c_int)      :: nArray
    nArray = vtkFieldData_GetNumberOfArrays(fData%ptr)
  end function vtkFieldDataMethod_GetNumberOfArrays
  
  function vtkFieldDataMethod_GetAbstractArray_i0(fData, index) &
       result(array)
    implicit none
    class(vtkFieldData)       :: fData
    integer(c_int),intent(in) :: index
    type(vtkAbstractArray)    :: array
    array%ptr = vtkFieldData_GetAbstractArray_i0(fData%ptr, index)
  end function vtkFieldDataMethod_GetAbstractArray_i0

  
  function vtkFieldDataMethod_GetAbstractArray_cp_ip(fData, arrName, index) &
       result(array)
    implicit none
    class(vtkFieldData)        :: fData
    character(*),intent(in)    :: arrName
    integer(c_int),intent(out) :: index
    type(vtkAbstractArray)     :: array
    array%ptr = vtkFieldData_GetAbstractArray_cp_ip(fData%ptr, arrName, index)
  end function vtkFieldDataMethod_GetAbstractArray_cp_ip
  
end module m_vtkFieldDataClass
