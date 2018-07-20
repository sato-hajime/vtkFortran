
#include "vtkObjectBase_interface.hxx"

#include <iostream>

#include <vtkIndent.h>
#include <vtkSmartPointer.h>


vtkObjectBase* vtkObjectBase_New() {
  vtkSmartPointer<vtkObjectBase> obj = \
    vtkObjectBase::New() ;
  return obj.GetPointer() ;
};

void vtkObjectBase_Delete(vtkObjectBase* obj){
  obj->Delete() ;
};

int vtkObjectBase_GetReferenceCount(vtkObjectBase* obj) {
return obj->GetReferenceCount() ;
};

void vtkObjectBase_Print(vtkObjectBase* obj) {
  obj->Print(std::cout) ;
};


void vtkObjectBase_PrintSelf(vtkObjectBase* obj, int indent) {
  obj->PrintSelf(std::cout, vtkIndent(indent)) ;
};

int vtkObjectBase_IsA(vtkObjectBase* obj, char* name) {
  return obj->IsA(name) ;
};

// int vtkObjectBase_IsTypeOf(vtkObjectBase* obj, char* name) {
//   return obj->IsTypeOf(name) ;
// };
