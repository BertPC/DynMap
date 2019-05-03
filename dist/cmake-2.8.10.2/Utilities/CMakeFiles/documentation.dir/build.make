# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/erik/code/DynMap/cmake-2.8.10.2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/erik/code/DynMap/cmake-2.8.10.2

# Utility rule file for documentation.

# Include the progress variables for this target.
include Utilities/CMakeFiles/documentation.dir/progress.make

Utilities/CMakeFiles/documentation: Docs/ctest.txt
Utilities/CMakeFiles/documentation: Docs/cpack.txt
Utilities/CMakeFiles/documentation: Docs/cmake.txt

Docs/ctest.txt: bin/ctest
Docs/ctest.txt: Utilities/Doxygen/authors.txt
	$(CMAKE_COMMAND) -E cmake_progress_report /home/erik/code/DynMap/cmake-2.8.10.2/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating ../Docs/ctest.txt"
	cd /home/erik/code/DynMap/cmake-2.8.10.2/Utilities && ../bin/ctest --help-full /home/erik/code/DynMap/cmake-2.8.10.2/Docs/ctest.txt --help-full /home/erik/code/DynMap/cmake-2.8.10.2/Docs/ctest.html --help-full /home/erik/code/DynMap/cmake-2.8.10.2/Docs/ctest.1 --help-full /home/erik/code/DynMap/cmake-2.8.10.2/Docs/ctest.docbook

Docs/cpack.txt: bin/cpack
Docs/cpack.txt: Utilities/Doxygen/authors.txt
	$(CMAKE_COMMAND) -E cmake_progress_report /home/erik/code/DynMap/cmake-2.8.10.2/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating ../Docs/cpack.txt"
	cd /home/erik/code/DynMap/cmake-2.8.10.2/Utilities && ../bin/cpack --help-full /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cpack.txt --help-full /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cpack.html --help-full /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cpack.1 --help-full /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cpack.docbook

Docs/cmake.txt: bin/cmake
Docs/cmake.txt: Utilities/Doxygen/authors.txt
	$(CMAKE_COMMAND) -E cmake_progress_report /home/erik/code/DynMap/cmake-2.8.10.2/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating ../Docs/cmake.txt"
	cd /home/erik/code/DynMap/cmake-2.8.10.2/Utilities && ../bin/cmake --copyright /home/erik/code/DynMap/cmake-2.8.10.2/Docs/Copyright.txt --help-full /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake.txt --help-full /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake.html --help-full /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake.1 --help-full /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake.docbook --help-policies /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake-policies.txt --help-policies /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake-policies.html --help-policies /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmakepolicies.1 --help-properties /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake-properties.txt --help-properties /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake-properties.html --help-properties /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmakeprops.1 --help-variables /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake-variables.txt --help-variables /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake-variables.html --help-variables /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmakevars.1 --help-modules /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake-modules.txt --help-modules /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake-modules.html --help-modules /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmakemodules.1 --help-commands /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake-commands.txt --help-commands /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake-commands.html --help-commands /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmakecommands.1 --help-compatcommands /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake-compatcommands.txt --help-compatcommands /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmake-compatcommands.html --help-compatcommands /home/erik/code/DynMap/cmake-2.8.10.2/Docs/cmakecompat.1

documentation: Utilities/CMakeFiles/documentation
documentation: Docs/ctest.txt
documentation: Docs/cpack.txt
documentation: Docs/cmake.txt
documentation: Utilities/CMakeFiles/documentation.dir/build.make
.PHONY : documentation

# Rule to build all files generated by this target.
Utilities/CMakeFiles/documentation.dir/build: documentation
.PHONY : Utilities/CMakeFiles/documentation.dir/build

Utilities/CMakeFiles/documentation.dir/clean:
	cd /home/erik/code/DynMap/cmake-2.8.10.2/Utilities && $(CMAKE_COMMAND) -P CMakeFiles/documentation.dir/cmake_clean.cmake
.PHONY : Utilities/CMakeFiles/documentation.dir/clean

Utilities/CMakeFiles/documentation.dir/depend:
	cd /home/erik/code/DynMap/cmake-2.8.10.2 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/erik/code/DynMap/cmake-2.8.10.2 /home/erik/code/DynMap/cmake-2.8.10.2/Utilities /home/erik/code/DynMap/cmake-2.8.10.2 /home/erik/code/DynMap/cmake-2.8.10.2/Utilities /home/erik/code/DynMap/cmake-2.8.10.2/Utilities/CMakeFiles/documentation.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Utilities/CMakeFiles/documentation.dir/depend

