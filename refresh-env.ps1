# 刷新环境变量脚本
# 用于在当前PowerShell会话中刷新PATH环境变量

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   刷新npm环境变量" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "正在刷新环境变量..." -ForegroundColor Yellow

# 获取用户和系统级PATH
$userPath = [System.Environment]::GetEnvironmentVariable('Path', 'User')
$machinePath = [System.Environment]::GetEnvironmentVariable('Path', 'Machine')

# 合并并更新当前会话的PATH（系统级在前，用户级在后）
$env:Path = $machinePath + ';' + $userPath

Write-Host "环境变量已刷新" -ForegroundColor Green
Write-Host ""
Write-Host "验证npm和node..." -ForegroundColor Yellow
Write-Host ""

# 验证npm
try {
    $npmVersion = & npm --version 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[成功] npm版本: $npmVersion" -ForegroundColor Green
    } else {
        throw "npm命令执行失败"
    }
} catch {
    Write-Host "[失败] npm不可用" -ForegroundColor Red
    Write-Host "尝试直接调用: " -NoNewline
    if (Test-Path "C:\Program Files\nodejs\npm.cmd") {
        & "C:\Program Files\nodejs\npm.cmd" --version
    } else {
        Write-Host "未找到npm.cmd" -ForegroundColor Red
    }
}

# 验证node
try {
    $nodeVersion = & node --version 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[成功] node版本: $nodeVersion" -ForegroundColor Green
    } else {
        throw "node命令执行失败"
    }
} catch {
    Write-Host "[失败] node不可用" -ForegroundColor Red
    Write-Host "尝试直接调用: " -NoNewline
    if (Test-Path "C:\Program Files\nodejs\node.exe") {
        & "C:\Program Files\nodejs\node.exe" --version
    } else {
        Write-Host "未找到node.exe" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
if ($LASTEXITCODE -eq 0) {
    Write-Host "配置成功！现在可以使用npm和node命令了。" -ForegroundColor Green
} else {
    Write-Host "如果仍然失败，请尝试：" -ForegroundColor Yellow
    Write-Host "1. 重启计算机" -ForegroundColor Yellow
    Write-Host "2. 手动在系统环境变量中添加: C:\Program Files\nodejs" -ForegroundColor Yellow
}
Write-Host "========================================" -ForegroundColor Cyan

