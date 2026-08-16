# deploy_github.ps1 — 智能体营销研究 GitHub 部署器（零依赖，PowerShell 5.1 内置能力）
# 用法：& ".\deploy_github.ps1" -Token "<github_pat_...>"
# 行为：把项目全部文件（Markdown 真相层 + wiki/index.html + 脚本 + 根跳转页）经 GitHub Git Data API
#       推送为仓库 main 分支的一个提交（blob → tree → commit → ref），随后确保 GitHub Pages 已启用。
# 安全：Token 仅作为参数在内存中使用，不写入任何文件；建议用短有效期细粒度 PAT，用完即撤销。

param(
    [Parameter(Mandatory = $true)][string]$Token,
    [string]$Owner = '0xSeanPan',
    [string]$Repo = 'dtamarketing',
    [string]$Message = '部署智能体营销研究双语WIKI：Markdown 真相层 + 单文件双语阅读层 + 构建与部署脚本',
    [string]$AuthorName = 'Sean Pan',
    [string]$AuthorEmail = 'seanpanjiaming@aliyun.com'
)

$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$H = @{ Authorization = "Bearer $Token"; Accept = 'application/vnd.github+json'; 'X-GitHub-Api-Version' = '2022-11-28' }
$api = "https://api.github.com/repos/$Owner/$Repo"

function Send-Api {
    param([string]$Method, [string]$Uri, $BodyObj)
    if ($null -ne $BodyObj) {
        $json = ConvertTo-Json $BodyObj -Depth 10 -Compress
        $bytes = [Text.Encoding]::UTF8.GetBytes($json)
        return Invoke-RestMethod -Method $Method -Uri $Uri -Headers $script:H -ContentType 'application/json' -Body $bytes -TimeoutSec 60
    }
    return Invoke-RestMethod -Method $Method -Uri $Uri -Headers $script:H -TimeoutSec 60
}

# 1. 收集项目全部文件（排除部署产物目录之外无其他内容；wiki/ 生成物属部署内容，一并上传）
$files = Get-ChildItem -LiteralPath $root -Recurse -File | Where-Object { $_.FullName -notmatch '\\\.git\\' }
if ($files.Count -eq 0) { throw '未找到任何文件' }
Write-Host ('文件数: ' + $files.Count)

# 2. 查询 main 分支现状（空仓库 = 无父提交）
$parentSha = $null
try {
    $ref = Send-Api 'GET' "$api/git/ref/heads/main"
    $parentSha = $ref.object.sha
    Write-Host ('main 已存在，父提交: ' + $parentSha)
} catch {
    Write-Host 'main 不存在（空仓库），用 Contents API 引导初始化'
    # 空仓库引导：Git Data API 在首次提交前返回 409，先经 Contents API 落一个文件建立 git 数据库
    $b64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes((Join-Path $root 'README.md')))
    Send-Api 'PUT' "$api/contents/README.md" @{ message = 'init'; content = $b64 } | Out-Null
    $ref = Send-Api 'GET' "$api/git/ref/heads/main"
    $parentSha = $ref.object.sha
    Write-Host ('引导完成，父提交: ' + $parentSha)
}

# 3. 逐文件建 blob（base64 保真：含 BOM 的 .ps1 字节原样入库）
$entries = @()
foreach ($f in $files) {
    $rel = $f.FullName.Substring($root.Length + 1).Replace('\', '/')
    $b64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes($f.FullName))
    $blob = Send-Api 'POST' "$api/git/blobs" @{ content = $b64; encoding = 'base64' }
    $entries += @{ path = $rel; mode = '100644'; type = 'blob'; sha = $blob.sha }
    Write-Host ('  blob: ' + $rel)
}

# 4. 建 tree（有父提交则挂 base_tree，保留仓库既有内容）
$treeBody = @{ tree = $entries }
if ($parentSha) { $treeBody.base_tree = (Send-Api 'GET' "$api/git/commits/$parentSha").tree.sha }
$tree = Send-Api 'POST' "$api/git/trees" $treeBody

# 5. 建提交
$commitBody = @{ message = $Message; tree = $tree.sha; author = @{ name = $AuthorName; email = $AuthorEmail } }
if ($parentSha) { $commitBody.parents = @($parentSha) }
$commit = Send-Api 'POST' "$api/git/commits" $commitBody
Write-Host ('提交: ' + $commit.sha)

# 6. 推进 main 指针
if ($parentSha) {
    Send-Api 'PATCH' "$api/git/refs/heads/main" @{ sha = $commit.sha; force = $false } | Out-Null
} else {
    Send-Api 'POST' "$api/git/refs" @{ ref = 'refs/heads/main'; sha = $commit.sha } | Out-Null
}
Write-Host ('main 已更新: https://github.com/' + $Owner + '/' + $Repo + '/tree/main')

# 7. 确保 GitHub Pages 启用（main 分支根目录）
try {
    Send-Api 'POST' "$api/pages" @{ source = @{ branch = 'main'; path = '/' } } | Out-Null
    Write-Host 'GitHub Pages 已启用'
} catch {
    $code = $_.Exception.Response.StatusCode.value__
    if ($code -eq 409) { Write-Host 'GitHub Pages 已处于启用状态' }
    elseif ($code -eq 403 -or $code -eq 404) { Write-Warning 'Token 无 Pages 权限，请在网页端手动开启（Settings → Pages → main / root）' }
    else { Write-Warning ('Pages 开启返回 HTTP ' + $code + '，可网页端手动核对') }
}
try {
    $pg = Send-Api 'GET' "$api/pages"
    Write-Host ('站点地址: ' + $pg.html_url)
} catch { }
Write-Host '部署完成'
