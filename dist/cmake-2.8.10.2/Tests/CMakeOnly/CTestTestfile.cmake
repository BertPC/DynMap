# CMake generated Testfile for 
# Source directory: /home/erik/code/DynMap/cmake-2.8.10.2/Tests/CMakeOnly
# Build directory: /home/erik/code/DynMap/cmake-2.8.10.2/Tests/CMakeOnly
# 
# This file includes the relevent testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
ADD_TEST(CMakeOnly.LinkInterfaceLoop "/home/erik/code/DynMap/cmake-2.8.10.2/bin/cmake" "-DTEST=LinkInterfaceLoop" "-P" "/home/erik/code/DynMap/cmake-2.8.10.2/Tests/CMakeOnly/Test.cmake")
SET_TESTS_PROPERTIES(CMakeOnly.LinkInterfaceLoop PROPERTIES  TIMEOUT "90")
ADD_TEST(CMakeOnly.CheckSymbolExists "/home/erik/code/DynMap/cmake-2.8.10.2/bin/cmake" "-DTEST=CheckSymbolExists" "-P" "/home/erik/code/DynMap/cmake-2.8.10.2/Tests/CMakeOnly/Test.cmake")
ADD_TEST(CMakeOnly.CheckCXXSymbolExists "/home/erik/code/DynMap/cmake-2.8.10.2/bin/cmake" "-DTEST=CheckCXXSymbolExists" "-P" "/home/erik/code/DynMap/cmake-2.8.10.2/Tests/CMakeOnly/Test.cmake")
ADD_TEST(CMakeOnly.CheckCXXCompilerFlag "/home/erik/code/DynMap/cmake-2.8.10.2/bin/cmake" "-DTEST=CheckCXXCompilerFlag" "-P" "/home/erik/code/DynMap/cmake-2.8.10.2/Tests/CMakeOnly/Test.cmake")
ADD_TEST(CMakeOnly.CheckLanguage "/home/erik/code/DynMap/cmake-2.8.10.2/bin/cmake" "-DTEST=CheckLanguage" "-P" "/home/erik/code/DynMap/cmake-2.8.10.2/Tests/CMakeOnly/Test.cmake")
ADD_TEST(CMakeOnly.CompilerIdC "/home/erik/code/DynMap/cmake-2.8.10.2/bin/cmake" "-DTEST=CompilerIdC" "-P" "/home/erik/code/DynMap/cmake-2.8.10.2/Tests/CMakeOnly/Test.cmake")
ADD_TEST(CMakeOnly.CompilerIdCXX "/home/erik/code/DynMap/cmake-2.8.10.2/bin/cmake" "-DTEST=CompilerIdCXX" "-P" "/home/erik/code/DynMap/cmake-2.8.10.2/Tests/CMakeOnly/Test.cmake")
ADD_TEST(CMakeOnly.AllFindModules "/home/erik/code/DynMap/cmake-2.8.10.2/bin/cmake" "-DTEST=AllFindModules" "-P" "/home/erik/code/DynMap/cmake-2.8.10.2/Tests/CMakeOnly/Test.cmake")
ADD_TEST(CMakeOnly.SelectLibraryConfigurations "/home/erik/code/DynMap/cmake-2.8.10.2/bin/cmake" "-DTEST=SelectLibraryConfigurations" "-P" "/home/erik/code/DynMap/cmake-2.8.10.2/Tests/CMakeOnly/Test.cmake")
ADD_TEST(CMakeOnly.TargetScope "/home/erik/code/DynMap/cmake-2.8.10.2/bin/cmake" "-DTEST=TargetScope" "-P" "/home/erik/code/DynMap/cmake-2.8.10.2/Tests/CMakeOnly/Test.cmake")
ADD_TEST(CMakeOnly.find_library "/home/erik/code/DynMap/cmake-2.8.10.2/bin/cmake" "-DTEST=find_library" "-P" "/home/erik/code/DynMap/cmake-2.8.10.2/Tests/CMakeOnly/Test.cmake")
ADD_TEST(CMakeOnly.ProjectInclude "/home/erik/code/DynMap/cmake-2.8.10.2/bin/cmake" "-DTEST=ProjectInclude" "-DCMAKE_ARGS=-DCMAKE_PROJECT_ProjectInclude_INCLUDE=/home/erik/code/DynMap/cmake-2.8.10.2/Tests/CMakeOnly/ProjectInclude/include.cmake" "-P" "/home/erik/code/DynMap/cmake-2.8.10.2/Tests/CMakeOnly/Test.cmake")
