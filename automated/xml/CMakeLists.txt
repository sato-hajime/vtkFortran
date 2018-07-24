
configure_file(
  parser.xsl.in
  parser.xsl
  )

configure_file(
  parser-definition.xml.in
  parser-definition.xml
  )

configure_file(
  lex.xml.in
  lex.xml
  )

configure_file(
  lex-literal-kinds.xml.in
  lex-literal-kinds.xml
  )

configure_file(
  class-mem.xml.in
  class-mem.xml
  )

configure_file(
  expr.xml.in
  expr.xml
  )

configure_file(
  expr-prim-general.xml.in
  expr-prim-general.xml
  )

configure_file(
  dcl.xml.in
  dcl.xml
  )

configure_file(
  dcl-decl.xml.in
  dcl-decl.xml
  )

configure_file(
  dcl-fct.xml.in
  dcl-fct.xml
  )

configure_file(
  dcl-init.xml.in
  dcl-init.xml
  )

configure_file(
  dcl-name.xml.in
  dcl-name.xml
  )

configure_file(
  dcl-type.xml.in
  dcl-type.xml
  )

configure_file(
  temp-names.xml.in
  temp-names.xml
  )

configure_file(
  vtkFortranIntermediateData.xsl.in
  vtkFortranIntermediateData.xsl
  )

add_custom_command(
  OUTPUT vtkFortranIntermediateData.xml
  COMMAND ${SAXON_XSLT_COMMAND}
  -s:index.xml
  -xsl:vtkFortranIntermediateData.xsl
  -o:vtkFortranIntermediateData.xml
  DEPENDS ${VTK_HEADER_INDEX_XML}
  ${CMAKE_CURRENT_BINARY_DIR}/vtkFortranIntermediateData.xsl  
  ${CMAKE_CURRENT_BINARY_DIR}/parser.xsl
  ${CMAKE_CURRENT_BINARY_DIR}/parser-definition.xml
  ${CMAKE_CURRENT_BINARY_DIR}/lex.xml
  ${CMAKE_CURRENT_BINARY_DIR}/lex-literal-kinds.xml
  ${CMAKE_CURRENT_BINARY_DIR}/class-mem.xml
  ${CMAKE_CURRENT_BINARY_DIR}/expr.xml
  ${CMAKE_CURRENT_BINARY_DIR}/expr-prim-general.xml
  ${CMAKE_CURRENT_BINARY_DIR}/dcl.xml
  ${CMAKE_CURRENT_BINARY_DIR}/dcl-decl.xml
  ${CMAKE_CURRENT_BINARY_DIR}/dcl-fct.xml
  ${CMAKE_CURRENT_BINARY_DIR}/dcl-init.xml
  ${CMAKE_CURRENT_BINARY_DIR}/dcl-name.xml
  ${CMAKE_CURRENT_BINARY_DIR}/temp-names.xml   
 )

add_custom_target(vtkFortranIntermediateData ALL
  DEPENDS vtkFortranIntermediateData.xml
  )
