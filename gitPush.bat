@echo off
chcp 65001 > nul
hugo
cd public
git status
git add .
set /p branches=请输入要推送的分支（默认为 main 分支）：
if "%branches%"=="" set branches=main
set /p commitMsg=请输入提交信息：
if "%commitMsg%"=="" set commitMsg=update
git pull origin %branches%
git commit -m "%commitMsg%"
git push origin %branches%
echo 已成功推送到 GitHub！
pause