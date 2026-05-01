#!/bin/sh

# 设置 UTF-8 编码
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

echo "请输入文章目录（默认为temp目录，为空则之前生成的temp文件夹将会被删除）："
read Dir

if [ -z "$Dir" ]; then
    Dir="temp"
fi

if [ -d "content/post/$Dir" ]; then
    echo "目录 content/post/$Dir 已存在，是否删除？(y/n)"
    read confirm
    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
        rm -rf "content/post/$Dir"
        echo "已删除旧目录"
    else
        echo "取消操作"
        exit 0
    fi
fi

# 创建多语言文章
hugo new "content/post/$Dir/index.en.md"
hugo new "content/post/$Dir/index.zh.md"
hugo new "content/post/$Dir/index.ja.md"
hugo new "content/post/$Dir/index.zh-hant-tw.md"

echo "文章已在 content/post/$Dir 创建！"
