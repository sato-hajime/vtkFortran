
module m_vtkDataSetClass
  
  use iso_c_binding

  use m_vtkDataSet
  use m_vtkDataObjectClass
  use m_vtkPointDataClass
  use m_vtkCellDataClass

  implicit none
  
  type,extends(vtkDataObject) :: vtkDataSet
   contains
     procedure :: GetNumberOfCells => vtkDataSetMethod_GetNumberOfCells
     procedure :: GetPointData     => vtkDataSetMethod_GetPointData
     procedure :: GetCellData      => vtkDataSetMethod_GetCellData
  end type vtkDataSet

contains

  function vtkDataSetMethod_GetNumberOfCells(dataSet) result(nCells)
    implicit none
    class(vtkDataSet) :: dataSet
    integer(c_int)    :: nCells
    nCells = vtkDataSet_GetNumberOfCells(dataSet%ptr)
  end function vtkDataSetMethod_GetNumberOfCells
  
  function vtkDataSetMethod_GetPointData(dataSet) result(pData)
    implicit none
    class(vtkDataSet)  :: dataSet
    type(vtkPointData) :: pData
    pData%ptr = vtkDataSet_GetPointData(dataSet%ptr)
  end function vtkDataSetMethod_GetPointData
    
  function vtkDataSetMethod_GetCellData(dataSet) result(cData)
    implicit none
    class(vtkDataSet)  :: dataSet
    type(vtkCellData) :: cData
    cData%ptr = vtkDataSet_GetCellData(dataSet%ptr)
  end function vtkDataSetMethod_GetCellData
  
end module m_vtkDataSetClass
