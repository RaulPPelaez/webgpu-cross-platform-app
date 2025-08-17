cmake_minimum_required(VERSION 3.21)
project(
	webgpu-experiments
	VERSION 0.1.0
	LANGUAGES CXX C
)

include(FetchContent)
FetchContent_Declare(
	webgpu
	GIT_REPOSITORY https://github.com/eliemichel/WebGPU-distribution.git
	GIT_TAG        main
	GIT_SHALLOW    TRUE
)
FetchContent_MakeAvailable(webgpu)

add_subdirectory(src)
