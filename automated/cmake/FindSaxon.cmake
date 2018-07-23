#
#
# configure saxon (Java Based XSLT processor) 
#
# [output]
#   SAXON_XSLT_COMMAND :: cmake variable
#
# [usage]
#   download saxon*.jar from http://saxon.sourceforge.net/
#
#   add saxon*.jar path to environ $CLASSPATH
#   or put path to cmake variable $SAXON_JAR
#
#

find_package(Java COMPONENTS Runtime)
if(NOT ${JAVA_FOUND})
  message(SEND_ERROR "java runtime not found")
endif()

include(UseJava)

set(SAXON_TRANSFORM_CLASS "net.sf.saxon.Transform")

set(SAXON_JAR CACHE FILE "path of saxon*.jar")

if("${SAXON_JAR}" STREQUAL "")
  execute_process(
    COMMAND ${Java_JAVA_EXECUTABLE} ${SAXON_TRANSFORM_CLASS} "-?"
    OUTPUT_QUIET ERROR_QUIET
    RESULT_VARIABLE RESULT)
  if(${RESULT} EQUAL 0)
    set(SAXON_INSTALLED TRUE)
  endif()
endif()

if(NOT "${SAXON_INSTALLED}" AND "${SAXON_JAR}" STREQUAL "")
  string(REPLACE ":" ";"
    CLASSPATH_LIST "$ENV{CLASSPATH}")
  message("${CLASSPATH_LIST}")
  find_jar(SAXON_JAR
    NAMES "saxon9ee" "saxon9pe" "saxon9he"
    PATHS ${CLASSPATH_LIST})

  if("${SAXON_JAR}" STREQUAL "")
    message(SEND_ERROR
      "saxon not installed and can't find saxon9*.jar from CLASSPATH")
    message(SEND_ERROR
      "download saxon9he.jar from http://saxon.sourceforge.net/")
  endif()
endif()

if ("${SAXON_JAR}" STREQUAL "")
  set(SAXON_XSLT_COMMAND
    ${Java_JAVA_EXECUTABLE}
    ${SAXON_TRANSFORM_CLASS})
else()
  set(SAXON_XSLT_COMMAND
    ${Java_JAVA_EXECUTABLE} -classpath ${SAXON_JAR}
    ${SAXON_TRANSFORM_CLASS})
endif()
