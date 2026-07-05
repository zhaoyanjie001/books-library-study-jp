@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: 要?除的字符串
set "REMOVE=.skrold"

:: 遍?当前目?及子目?所有文件
for /r %%F in (*) do (
    set "oldname=%%~nxF"
    set "newname=!oldname:%REMOVE%=!"

    :: 如果文件名?生?化?重命名
    if not "!oldname!"=="!newname!" (
        echo 重命名:
        echo "%%~fF"
        echo ?
        echo "%%~dpF!newname!"
        ren "%%~fF" "!newname!"
    )
)

echo 完成
pause