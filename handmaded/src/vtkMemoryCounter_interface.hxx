
#pragma once

#include <vtkObjectBase.h>

int vtkMemoryManager_insert(vtkObjectBase*) ;
int vtkMemoryManager_erase(vtkObjectBase*) ;
size_t vtkMemoryManager_GetSize() ;
void vtkMemoryManager_GetPointers(vtkObjectBase* size_t) ;
