
module m_vtkDataSetAttributes

  use iso_c_binding
  use cstring
  
  implicit none

  interface
     
     function vtkDataSetAttributes_SetScalars(data, array) result(index) &
          bind(C, name="vtkDataSetAttributes_SetScalars")
       import c_ptr, c_int
       integer(c_int)    :: index
       type(c_ptr),value :: data, array
     end function vtkDataSetAttributes_SetScalars

     function vtkDataSetAttributes_SetActiveScalars_c(data, name) result(index) &
          bind(C, name="vtkDataSetAttributes_SetActiveScalars")
       import c_ptr, c_int
       integer(c_int)    :: index
       type(c_ptr),value :: data, name
     end function vtkDataSetAttributes_SetActiveScalars_c
     
  end interface

contains

  function vtkDataSetAttributes_SetActiveScalars &
       (data, name) result(index)
    integer(c_int)                 :: index
    type(c_ptr)        ,intent(in) :: data
    character(*,c_char),intent(in) :: name
    index = vtkDataSetAttributes_SetActiveScalars_c( &
         data, f2c(name//c_null_char))
  end function vtkDataSetAttributes_SetActiveScalars

  
end module m_vtkDataSetAttributes
