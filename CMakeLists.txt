cmake_minimum_required(VERSION 3.10)
project(test)


set(CMAKE_FIND_ROOT_PATH /opt/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu- PARENT_SCOPE)
set(CMAKE_C_COMPILER /opt/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc PARENT_SCOPE)
set(CMAKE_CXX_COMPILER /opt/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-g++ PARENT_SCOPE)

set(CMAKE_C_FLAGS "-O2 -Wwrite-strings")
set(CMAKE_CXX_FLAGS "-O2 -std=c++17 -Wwrite-strings")

# 添加源文件
file(GLOB SOURCES 
    "main.cpp"
)

add_executable(test ${SOURCES})

# 链接库
target_link_libraries(test  stdc++)