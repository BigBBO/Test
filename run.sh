#!/bin/bash

# 删除旧的 build 目录
echo "步骤 1: 删除旧的 build 目录"
rm -rf ./build

# 创建新的 build 目录
echo "步骤 2: 创建新的 build 目录"
mkdir build

# 切换到 build 目录
echo "步骤 3: 切换到 build 目录"
cd build

# 运行 cmake
echo "步骤 4: 运行 cmake"
cmake ..

# 编译项目
echo "步骤 5: 编译项目"
make -j4

# 检查 make 是否成功
if [ $? -eq 0 ]; then
  echo "步骤 6: 编译成功"

  # 移动二进制文件到上一级目录的 release 文件夹
  echo "步骤 7: 移动二进制文件到 release 目录"
  mv ./test ../

  # 执行 scp 命令
  echo "步骤 8: 执行 scp 命令"
  sshpass -p "artosyn" scp ../test root@192.168.29.8:/appfs/bin
  echo "步骤 9: scp 命令执行成功"

  # 删除 build 目录
  echo "步骤 10: 删除 build 目录"
  cd ..
  rm -rf ./build

else
  echo "步骤 6: 编译失败，未执行 scp 命令"
fi