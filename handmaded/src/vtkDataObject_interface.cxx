
#include "vtkDataObject_interface.hxx"

#include <vtkSmartPointer.h>

vtkFieldData* vtkDataObject_GetFieldData(vtkDataObject* data) {
  vtkSmartPointer<vtkFieldData> fData = data->GetFieldData() ;
  return fData.GetPointer() ;
};
