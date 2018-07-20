
#include "vtkMemoryManager_interface.cxx"

#include <set>
typedef std::set<vtkObjectBase*> vtkObjectBaseSet ;
static vtkObjectBaseSet pointers = vtkObjectBaseSet() ;

int vtkMemoryManager_insert(vtkObjectBase*) {
  
};

int vtkMemoryManager_erase(vtkObjectBase*) {

};

size_t vtkMemoryManager_GetSize() {
  
};
void vtkMemoryManager_GetPointers(vtkObjectBase* size_t) {
};
