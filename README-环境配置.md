# npm环境配置说明

## 问题解决

如果在新打开的PowerShell窗口中仍然无法识别npm命令，请按以下步骤操作：

### 方法1：使用刷新脚本（推荐）

在PowerShell中运行：
```powershell
. .\refresh-env.ps1
```

或者直接执行：
```powershell
$userPath = [System.Environment]::GetEnvironmentVariable('Path', 'User')
$machinePath = [System.Environment]::GetEnvironmentVariable('Path', 'Machine')
$env:Path = $machinePath + ';' + $userPath
```

### 方法2：手动刷新当前会话

在PowerShell中执行以下命令：
```powershell
$env:Path = [System.Environment]::GetEnvironmentVariable('Path', 'User') + ';' + [System.Environment]::GetEnvironmentVariable('Path', 'Machine')
```

### 方法3：永久解决方案

如果上述方法仍然不行，可以：

1. **重启计算机**（最彻底的方法）

2. **或者手动添加到系统PATH**：
   - 按 `Win + R`，输入 `sysdm.cpl`，回车
   - 点击"高级"选项卡
   - 点击"环境变量"
   - 在"用户变量"或"系统变量"中找到 `Path`
   - 点击"编辑"，添加 `C:\Program Files\nodejs`
   - 确定保存后，重新打开PowerShell

## 验证配置

运行以下命令验证：
```powershell
npm --version
node --version
```

如果显示版本号，说明配置成功。

## 快速启动项目

配置完成后，在项目目录下运行：
```powershell
npm start
```






