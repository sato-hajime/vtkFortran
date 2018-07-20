
#include "vtkDataSet_interface.hxx"

#include "vtkSmartPointer.h"

int vtkDataSet_GetNumberOfPoints(vtkDataSet* dataSet) {
  return dataSet->GetNumberOfPoints() ;
};

void vtkDataSet_GetPoint_i0_r3(vtkDataSet* dSet, int ptId, double* x) {
  dSet->GetPoint(ptId, x) ;
};


vtkPointData* vtkDataSet_GetPointData(vtkDataSet* dataSet) {
  vtkSmartPointer<vtkPointData> pData = \
    dataSet->GetPointData() ;
  return pData.GetPointer() ;
};

int vtkDataSet_GetNumberOfCells(vtkDataSet* dataSet) {
  return dataSet->GetNumberOfCells() ;
};

vtkCell* vtkDataSet_GetCell (vtkDataSet* dataSet, int cellId) {
  return dataSet->GetCell(cellId) ;
};

vtkCellData* vtkDataSet_GetCellData(vtkDataSet* dataSet) {
  vtkSmartPointer<vtkCellData> cData =	\
    dataSet->GetCellData() ;
  return cData.GetPointer() ;
};
