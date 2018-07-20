
project(vtk_wrapper Fortran CXX)

set(foundation
  cstring.F90
  )

set(vtkSrc
  UnstructuredGridIO.cxx
  vtkAbstractArray.F90
  vtkCell.F90
  vtkCellArray.F90
  vtkCellData.F90
  vtkDataArray.F90
  vtkDataObject.F90
  vtkDataSet.F90
  vtkDataSetAttributes.F90
  vtkDoubleArray.F90
  vtkFieldData.F90
  vtkIdTypeArray.F90
  vtkIntArray.F90
  vtkObject.F90
  vtkObjectBase.F90
  vtkPointData.F90
  vtkPoints.F90
  vtkPointSet.F90
  vtkStdString.F90
  vtkStringArray.F90
  vtkUnsignedCharArray.F90
  vtkUnstructuredGrid.F90
  vtkAbstractArray_interface.cxx
  vtkCellArray_interface.cxx
  vtkCellData_interface.cxx
  vtkCell_interface.cxx
  vtkDataArray_interface.cxx
  vtkDataObject_interface.cxx
  vtkDataSetAttributes_interface.cxx
  vtkDataSet_interface.cxx
  vtkDoubleArray_interface.cxx
  vtkFieldData_interface.cxx
  vtkIdTypeArray_interface.cxx
  vtkIntArray_interface.cxx
  vtkObject_interface.cxx
  vtkObjectBase_interface.cxx
  vtkPointData_interface.cxx
  vtkPoints_interface.cxx
  vtkPointSet_interface.cxx
  vtkStdString_interface.cxx
  vtkStringArray_interface.cxx
  vtkUnsignedCharArray_interface.cxx
  vtkUnstructuredGrid_interface.cxx
  )

set(vtkClassSrc
  vtkAbstractArrayClass.F90
  vtkCellArrayClass.F90
  vtkPointsClass.F90
  vtkCellClass.F90
  vtkCellDataClass.F90
  vtkDataArrayClass.F90
  vtkDataObjectClass.F90
  vtkDataSetAttributesClass.F90
  vtkDataSetClass.F90
  vtkDoubleArrayClass.F90
  vtkFieldDataClass.F90
  vtkIntArrayClass.F90
  vtkObjectBaseClass.F90
  vtkObjectClass.F90
  vtkPointDataClass.F90
  vtkPointSetClass.F90
  vtkStringArrayClass.F90
  vtkUnstructuredGridClass.F90
  )

if(FORTRAN2003_CLASS)
  
  add_library(
    vtkFortran
    ${foundation}
    ${vtkSrc}
    ${vtkClassSrc}
    )
  target_link_libraries(
    vtkFortran
    ${VTK_LIBRARIES}
    )

else(FORTRAN2003_CLASS)

  add_library(
    vtkFortran
    ${foundation}
    ${vtkSrc}
    )
  target_link_libraries(
    vtkFortran
    ${VTK_LIBRARIES}
    )
  
endif(FORTRAN2003_CLASS)

add_library(
  vtkFortran_wrapper
  vtkPoints_wrapper.F90
  vtkCells_wrapper.F90
  vtkAbstractArray_wrapper.F90
  vtkStringArray_wrapper.F90
  vtkDoubleArray_wrapper.F90
  vtkIdTypeArray_wrapper.F90
  vtkIntArray_wrapper.F90
  vtkUnsignedCharArray_wrapper.F90
  )
target_link_libraries(
  vtkFortran_wrapper
  vtkFortran
  )


if(FORTRAN2003_CLASS)
  add_executable(vtkFortran_test unittest_with_class.F90)
  target_link_libraries(
    vtkFortran_test
    vtkFortran
    vtkFortran_wrapper
    )
else() # not FORTRAN2003_CLASS
  add_executable(vtkFortran_test unittest_no_class.F90)
  target_link_libraries(
    vtkFortran_test
    vtkFortran
    vtkFortran_wrapper
    )
endif(FORTRAN2003_CLASS)

add_test(
  NAME vtkFortran
  COMMAND $<TARGET_FILE:vtkFortran_test>
  )
