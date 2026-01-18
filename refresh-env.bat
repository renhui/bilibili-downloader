@echo off
echo 正在刷新环境变量...
call refreshenv
echo.
echo 验证npm和node...
npm --version
node --version
echo.
echo 如果上面显示了版本号，说明配置成功！
pause






