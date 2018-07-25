
set(PARSER_XSLT
  parser.xsl
  )

set(CPP_PARSER_DEFINITION_XMLS
  parser-definition.xml
  lex.xml
  lex-literal-kinds.xml
  class-mem.xml
  expr.xml
  expr-prim-general.xml
  dcl.xml
  dcl-decl.xml
  dcl-fct.xml
  dcl-init.xml
  dcl-name.xml
  dcl-type.xml
  temp-names.xml
  )

# configure_file for all
foreach(XML
    ${PARSER_XSLT} ${CPP_PARSER_DEFINITION_XMLS})
  configure_file(
    ${XML}.in
    ${XML}
    )
endforeach()

# CONFIGURED_CPP_PARSER_DEFINITION_XMLS
foreach(XML ${CPP_PARSER_DEFINITION_XMLS})
  list(APPEND
    CONFIGURED_CPP_PARSER_DEFINITION_XMLS
    ${CMAKE_CURRENT_BINARY_DIR}/${XML}
    )
endforeach()

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
  ${CONFIGURED_CPP_PARSER_DEFINITION_XMLS}
  )

add_custom_target(vtkFortranIntermediateData ALL
  DEPENDS vtkFortranIntermediateData.xml
  )
