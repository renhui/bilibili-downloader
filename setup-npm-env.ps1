# 配置npm环境变量脚本
# 用于将Node.js添加到系统PATH环境变量

Write-Host "正在检查Node.js安装..." -ForegroundColor Yellow

$nodePath = "C:\Program Files\nodejs"
if (-not (Test-Path "$nodePath\node.exe")) {
    Write-Host "错误: 未找到Node.js安装，请先安装Node.js" -ForegroundColor Red
    exit 1
}

Write-Host "找到Node.js安装路径: $nodePath" -ForegroundColor Green

# 获取当前用户PATH
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")

# 检查是否已存在
if ($currentPath -like "*$nodePath*") {
    Write-Host "Node.js路径已存在于用户PATH环境变量中" -ForegroundColor Green
} else {
    # 添加到用户PATH
    $newPath = $currentPath + ";$nodePath"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    Write-Host "已成功添加Node.js到用户PATH环境变量" -ForegroundColor Green
    Write-Host "注意: 需要重新打开终端窗口才能生效" -ForegroundColor Yellow
}

# 验证安装
Write-Host "`n验证安装..." -ForegroundColor Yellow
$env:Path = [Environment]::GetEnvironmentVariable("Path", "User") + ";$nodePath"

Write-Host "Node.js版本: " -NoNewline
node --version

Write-Host "npm版本: " -NoNewline
npm --version

Write-Host "`n配置完成！" -ForegroundColor Green
Write-Host "如果命令仍然无法识别，请重新打开终端窗口。" -ForegroundColor Yellow

