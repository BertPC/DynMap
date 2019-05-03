# CMake generated Testfile for 
# Source directory: /home/erik/code/DynMap/cmake-2.8.10.2/Utilities
# Build directory: /home/erik/code/DynMap/cmake-2.8.10.2/Utilities
# 
# This file includes the relevent testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
ADD_TEST(CMake.HTML "/usr/bin/xmllint" "--valid" "--noout" "--nonet" "--path" "/home/erik/code/DynMap/cmake-2.8.10.2/Utilities/xml/xhtml1" "/home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake.html" "/home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake-policies.html" "/home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake-properties.html" "/home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake-variables.html" "/home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake-modules.html" "/home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake-commands.html" "/home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake-compatcommands.html" "/home/erik/code/DynMap/cmake-2.8.10.2/Docs/ctest.html" "/home/erik/code/DynMap/cmake-2.8.10.2/Docs/cpack.html")
ADD_TEST(CMake.DocBook "/usr/bin/xmllint" "--valid" "--noout" "--nonet" "--path" "/home/erik/code/DynMap/cmake-2.8.10.2/Utilities/xml/docbook-4.5" "/home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake.docbook" "/home/erik/code/DynMap/cmake-2.8.10.2/Docs/ctest.docbook" "/home/erik/code/DynMap/cmake-2.8.10.2/Docs/cpack.docbook")
SUBDIRS(Doxygen)
SUBDIRS(KWStyle)
