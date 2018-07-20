
# -*- coding: utf-8 -*-

vtk_wrapper C++のvtkライブラリのFortranラッパー



ビルド方法

projectroot :: 当ファイルのあるディレクトリの一つ上のディレクトリ

$ cd ${projectroot}
$ mkdir build
$ cd build
$ ccmake ..

# ccmake のguiが起動確認して[c] [c] [g]を押下

$ make

# vtkライブラリのリンクで失敗する場合
# ccmake の際に、VTK_DIRへvtkのパスを入力する。

build/modulesに、モジュールファイルが
build/vtk_wrapperに静的ライブラリが生成される。
(いまのところは)コピーして使えばよいかと思う。
${projectroot}/CMakeLists.txtを書けば、他のソースとのリンクも自動でできる。



使用法

unittest_no_class.f90 が使用法の例

ソース・モジュール・ライブラリの対応は下記のとおり。
${stem}.F90
m_${stem}.mod
lib${stem}Fortran.a
