
configure_file(
  vtkHeaderXML.conf.in
  vtkHeaderXML.conf
  )

add_custom_command(
  OUTPUT  ${VTK_HEADER_INDEX_XML}
  COMMAND ${DOXYGEN_EXECUTABLE} vtkHeaderXML.conf
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/vtkHeaderXML.conf
  )

add_custom_target(index_xml ALL
  DEPENDS ${VTK_HEADER_INDEX_XML}
  )

