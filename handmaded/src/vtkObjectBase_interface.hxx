
#pragma once

#include <vtkObjectBase.h>

extern "C" {

  vtkObjectBase* vtkObjectBase_New() ;
  void vtkObjectBase_Delete(vtkObjectBase*) ;
  int vtkObjectBase_GetReferenceCount(vtkObjectBase*) ;
  void vtkObjectBase_Print(vtkObjectBase*) ;
  void vtkObjectBase_PrintSelf(vtkObjectBase*, int) ;
  int vtkObjectBase_IsA(vtkObjectBase*, char*) ;
  // int vtkObjectBase_IsTypeOf(vtkObjectBase*, char*) ;

}
