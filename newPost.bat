@echo off
chcp 65001 > nul
set /p Dir=请输入文章目录（默认为temp目录）：
if "%Dir%"=="" set Dir=temp

if exist "content/post/%Dir%" (
    echo 目录 content/post/%Dir% 已存在，是否删除？(y/n)
    set /p confirm=
    if /i "%confirm%"=="y" (
        rmdir /s /q "content/post/%Dir%"
        echo 已删除旧目录
    ) else (
        echo 取消操作
        pause
        exit /b 0
    )
)

hugo new content/post/%Dir%/index.md
hugo new content/post/%Dir%/index.zh.md
hugo new content/post/%Dir%/index.ja.md
hugo new content/post/%Dir%/index.zh-hant-tw.md
echo 文章已在content/post/%Dir%/创建！
pause