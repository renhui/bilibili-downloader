@echo off
chcp 65001 >nul
echo ========================================
echo   刷新npm环境变量
echo ========================================
echo.

REM 刷新当前会话的环境变量
call refreshenv

echo.
echo 正在验证npm和node...
echo.

npm --version
if %errorlevel% equ 0 (
    echo [成功] npm已可用
) else (
    echo [失败] npm不可用
)

node --version
if %errorlevel% equ 0 (
    echo [成功] node已可用
) else (
    echo [失败] node不可用
)

echo.
echo ========================================
echo 如果显示版本号，说明配置成功！
echo 如果仍然失败，请重启计算机或手动配置环境变量
echo ========================================
echo.
pause






