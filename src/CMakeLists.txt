cmake_minimum_required(VERSION 3.21)

add_executable(App
	main.cpp
	webgpu-utils.h
	webgpu-utils.cpp
	Application.cpp
	Application.h
)
if (NOT EMSCRIPTEN)
	add_subdirectory(glfw)
else()
	# Create a mock 'glfw' target that just sets the `-sUSE_GLFW=3` link option:
	add_library(glfw INTERFACE)
	target_link_options(glfw INTERFACE -sUSE_GLFW=3)
endif()
add_subdirectory(glfw3webgpu)
target_link_libraries(App PRIVATE webgpu glfw glfw3webgpu)
#target_copy_webgpu_binaries(App)
set_target_properties(App PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set_target_properties(App PROPERTIES
	CXX_STANDARD 20
	CXX_STANDARD_REQUIRED ON
	CXX_EXTENSIONS OFF
	COMPILE_WARNING_AS_ERROR ON
)
if (EMSCRIPTEN)
    set_target_properties(App PROPERTIES SUFFIX ".html")
    target_link_options(App PRIVATE -sASYNCIFY)
endif()