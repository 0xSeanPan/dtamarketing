# build_wiki.ps1 — 智能体营销研究双语 WIKI 构建器
# 用法：powershell -NoProfile -ExecutionPolicy Bypass -File build_wiki.ps1（当前终端为 PowerShell 时可直接 & 调用）
# 输入：Markdown 文档集（真相层，中文根目录 + en\ 英文镜像）  输出：wiki\index.html（阅读层，单文件，中英双语可切换）
# 规则：wiki/index.html 为派生产物，禁止手改；新增文档须在下方 $pages 同时登记中英文件后才会进入 WIKI

$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$outDir = Join-Path $root 'wiki'
$out = Join-Path $outDir 'index.html'
$stamp = Get-Date -Format 'yyyy-MM-dd HH:mm'

# ---------------- 页面配置（新增文档在此登记，中英成对） ----------------
$pages = @(
    @{ id = 'home';   gz = '总览';       tz = '项目总览';     fz = 'README.md';                      ge = 'Overview';              te = 'Project Overview';    fe = 'en\README.md' },
    @{ id = 'frame';  gz = '总纲';       tz = '研究框架';     fz = '01-总纲\研究框架.md';            ge = 'Framework';             te = 'Research Framework';  fe = 'en\01-framework\research-framework.md' },
    @{ id = 'm1';     gz = '模块研究';   tz = 'M1 被识别';    fz = '02-模块\M1-被智能体识别.md';     ge = 'Modules';               te = 'M1 Recognized';       fe = 'en\02-modules\m1-recognition.md' },
    @{ id = 'm2';     gz = '模块研究';   tz = 'M2 被发现';    fz = '02-模块\M2-被智能体发现.md';     ge = 'Modules';               te = 'M2 Discovered';       fe = 'en\02-modules\m2-discovery.md' },
    @{ id = 'm3';     gz = '模块研究';   tz = 'M3 被采用';    fz = '02-模块\M3-被智能体采用.md';     ge = 'Modules';               te = 'M3 Adopted';          fe = 'en\02-modules\m3-adoption.md' },
    @{ id = 'm4';     gz = '模块研究';   tz = 'M4 被复购';    fz = '02-模块\M4-被智能体复购.md';     ge = 'Modules';               te = 'M4 Repurchased';      fe = 'en\02-modules\m4-repurchase.md' },
    @{ id = 'road';   gz = '管理与推进'; tz = '研究路线图';   fz = '00-管理\研究路线图.md';          ge = 'Management & Cadence';  te = 'Research Roadmap';    fe = 'en\00-management\roadmap.md' },
    @{ id = 'month';  gz = '管理与推进'; tz = '月度推进流程'; fz = '00-管理\月度推进流程.md';        ge = 'Management & Cadence';  te = 'Monthly Research Cycle'; fe = 'en\00-management\monthly-cycle.md' },
    @{ id = 'log';    gz = '管理与推进'; tz = '研究日志';     fz = '00-管理\研究日志.md';            ge = 'Management & Cadence';  te = 'Research Log';        fe = 'en\00-management\research-log.md' },
    @{ id = 'board';  gz = '管理与推进'; tz = '业务决策看板'; fz = '00-管理\业务决策看板.md';        ge = 'Management & Cadence';  te = 'Decision Board';     fe = 'en\00-management\decision-board.md' },
    @{ id = 'skill';  gz = '商业化';     tz = '技能储备地图'; fz = '03-商业化\技能储备地图.md';      ge = 'Commercialization';     te = 'Skill Portfolio Map'; fe = 'en\03-commercialization\skill-portfolio.md' },
    @{ id = 'matrix'; gz = '商业化';     tz = '业务机会矩阵'; fz = '03-商业化\业务机会矩阵.md';      ge = 'Commercialization';     te = 'Opportunity Matrix'; fe = 'en\03-commercialization\opportunity-matrix.md' },
    @{ id = 'intel';  gz = '情报与方法'; tz = '监测源清单';   fz = '04-情报\监测源清单.md';          ge = 'Intel & Methods';       te = 'Monitoring Sources';  fe = 'en\04-intel\monitoring-sources.md' },
    @{ id = 'method'; gz = '情报与方法'; tz = '研究方法与模板'; fz = '05-方法\研究方法与模板.md';    ge = 'Intel & Methods';       te = 'Methods & Templates'; fe = 'en\05-method\methods-templates.md' }
)
$groupOrder = @('总览', '总纲', '模块研究', '管理与推进', '商业化', '情报与方法')

$script:LinkMap = @{}
foreach ($p in $pages) {
    $script:LinkMap[[IO.Path]::GetFileNameWithoutExtension($p.fz)] = $p.id
    $script:LinkMap[[IO.Path]::GetFileNameWithoutExtension($p.fe)] = $p.id
}

# ---------------- 基础函数 ----------------
function Escape-Html {
    param([string]$s)
    if ($null -eq $s) { return '' }
    return ($s -replace '&', '&amp;' -replace '<', '&lt;' -replace '>', '&gt;' -replace '"', '&quot;')
}

function Render-Inline {
    param([string]$s)
    $s = Escape-Html $s
    # 行内代码 → 令牌
    $ct = New-Object System.Collections.Generic.List[string]
    $parts = [regex]::Split($s, '(`[^`]+`)')
    $sb = New-Object System.Text.StringBuilder
    foreach ($p in $parts) {
        if ($p -match '^`[^`]+`$') {
            $ct.Add($p.Substring(1, $p.Length - 2))
            [void]$sb.Append('__CT' + ($ct.Count - 1) + '__')
        } else { [void]$sb.Append($p) }
    }
    $s = $sb.ToString()
    # 链接 → 令牌（内部 .md 映射为页面锚点）
    $lt = New-Object System.Collections.Generic.List[string]
    foreach ($m in [regex]::Matches($s, '\[([^\]]+)\]\(([^)\s]+)\)')) {
        $txt = $m.Groups[1].Value; $tgt = $m.Groups[2].Value
        $a = ''
        if ($tgt -like '*.md') {
            $base = [IO.Path]::GetFileNameWithoutExtension($tgt)
            if ($script:LinkMap.ContainsKey($base)) {
                $a = '<a class="wl" href="#page/' + $script:LinkMap[$base] + '">' + $txt + '</a>'
            } else { $a = '<span class="wl-dead">' + $txt + '</span>' }
        } elseif ($tgt -like 'mailto:*') {
            $a = '<a class="xl" href="' + $tgt + '">' + $txt + '</a>'
        } elseif ($tgt -like 'http*') {
            $a = '<a class="xl" href="' + $tgt + '" target="_blank" rel="noopener">' + $txt + '</a>'
        } else { $a = '<span class="wl-dead">' + $txt + '</span>' }
        $lt.Add($a)
        $s = $s.Replace($m.Value, ('__LT' + ($lt.Count - 1) + '__'))
    }
    $s = $s -replace '\*\*(.+?)\*\*', '<strong>$1</strong>'
    for ($k = 0; $k -lt $lt.Count; $k++) { $s = $s.Replace(('__LT' + $k + '__'), $lt[$k]) }
    for ($k = 0; $k -lt $ct.Count; $k++) {
        $c = $ct[$k]; $t = $c.Trim(); $rep = '<code>' + $c + '</code>'
        if ($t -like '*.md') {                    # 代码式 .md 路径 → 页内跳转链接
            $base = [IO.Path]::GetFileNameWithoutExtension($t)
            if ($script:LinkMap.ContainsKey($base)) { $rep = '<a class="wl" href="#page/' + $script:LinkMap[$base] + '">' + $c + '</a>' }
        }
        $s = $s.Replace(('__CT' + $k + '__'), $rep)
    }
    return $s
}

function Convert-Md {
    param([string]$md)
    $lines = $md -split '\r?\n'
    $n = $lines.Count
    $out = New-Object System.Collections.Generic.List[string]
    $i = 0; $sec = 0
    while ($i -lt $n) {
        $line = $lines[$i]
        if ($line -match '^\s*$') { $i++; continue }

        if ($line -match '^```') {                      # 代码围栏
            $i++
            $buf = New-Object System.Collections.Generic.List[string]
            while ($i -lt $n -and $lines[$i] -notmatch '^```') { $buf.Add($lines[$i]); $i++ }
            $i++
            $code = ($buf | ForEach-Object { Escape-Html $_ }) -join "`n"
            $out.Add('<pre class="code">' + $code + '</pre>')
            continue
        }
        if ($line -match '^#\s+') { $i++; continue }     # 文档主标题（页面头已展示）
        if ($line -match '^###\s+(.*)$') { $sec++; $out.Add('<h3 id="s' + $sec + '">' + (Render-Inline $Matches[1]) + '</h3>'); $i++; continue }
        if ($line -match '^##\s+(.*)$')  { $sec++; $out.Add('<h2 id="s' + $sec + '">' + (Render-Inline $Matches[1]) + '</h2>'); $i++; continue }
        if ($line -match '^-{3,}\s*$')  { $out.Add('<hr>'); $i++; continue }

        if ($line -match '^\s*\|') {                     # 表格
            $rows = New-Object System.Collections.Generic.List[string]
            while ($i -lt $n -and $lines[$i] -match '^\s*\|') { $rows.Add($lines[$i].Trim()); $i++ }
            $thead = @(); $tbody = @()
            foreach ($row in $rows) {
                $cellsRaw = $row.Trim('|').Split('|')
                $isSep = $true
                foreach ($c in $cellsRaw) { if ($c.Trim() -notmatch '^:?-{2,}:?$') { $isSep = $false; break } }
                if ($isSep) { continue }
                if ($thead.Count -eq 0) {
                    foreach ($c in $cellsRaw) { $thead += ('<th>' + (Render-Inline $c.Trim()) + '</th>') }
                } else {
                    $tds = @()
                    foreach ($c in $cellsRaw) { $tds += ('<td>' + (Render-Inline $c.Trim()) + '</td>') }
                    $tbody += ('<tr>' + ($tds -join '') + '</tr>')
                }
            }
            $out.Add('<div class="tbl"><table><thead><tr>' + ($thead -join '') + '</tr></thead><tbody>' + ($tbody -join '') + '</tbody></table></div>')
            continue
        }
        if ($line -match '^\s*-\s+') {                   # 无序列表
            $items = @()
            while ($i -lt $n -and $lines[$i] -match '^\s*-\s+') {
                $t = $lines[$i] -replace '^\s*-\s+', ''
                $items += ('<li>' + (Render-Inline $t) + '</li>'); $i++
            }
            $out.Add('<ul>' + ($items -join '') + '</ul>'); continue
        }
        if ($line -match '^\s*\d+\.\s+') {               # 有序列表
            $items = @()
            while ($i -lt $n -and $lines[$i] -match '^\s*\d+\.\s+') {
                $t = $lines[$i] -replace '^\s*\d+\.\s+', ''
                $items += ('<li>' + (Render-Inline $t) + '</li>'); $i++
            }
            $out.Add('<ol>' + ($items -join '') + '</ol>'); continue
        }
        if ($line -match '^>') {                         # 引用块
            $bq = @()
            while ($i -lt $n -and $lines[$i] -match '^>') {
                $t = $lines[$i] -replace '^>\s?', ''
                $bq += (Render-Inline $t); $i++
            }
            $out.Add('<blockquote>' + ($bq -join '<br>') + '</blockquote>'); continue
        }
        $out.Add('<p>' + (Render-Inline $line) + '</p>'); $i++
    }
    return ($out -join "`n")
}

function Get-Meta {
    param([string]$md, [string]$lang)
    $upd = $null; $st = $null
    if ($lang -eq 'zh') {
        $m = [regex]::Match($md, '最后更新[：:]\s*([0-9]{4}-[0-9]{2}-[0-9]{2})')
        if (-not $m.Success) { $m = [regex]::Match($md, '创建[：:]\s*([0-9]{4}-[0-9]{2}-[0-9]{2})') }
        $ms = [regex]::Match($md, '状态[：:]\s*([^｜|>\r\n]{2,40})')
        if (-not $ms.Success) { $ms = [regex]::Match($md, '当前阶段[：:]\s*([^｜|>\r\n]{2,40})') }
    } else {
        $m = [regex]::Match($md, 'Last updated[：:]\s*([0-9]{4}-[0-9]{2}-[0-9]{2})')
        if (-not $m.Success) { $m = [regex]::Match($md, 'Created[：:]\s*([0-9]{4}-[0-9]{2}-[0-9]{2})') }
        $ms = [regex]::Match($md, 'Status[：:]\s*([^｜|>\r\n]{2,60})')
        if (-not $ms.Success) { $ms = [regex]::Match($md, 'Current phase[：:]\s*([^｜|>\r\n]{2,60})') }
    }
    if ($m.Success) { $upd = $m.Groups[1].Value }
    if ($ms.Success) { $st = $ms.Groups[1].Value.Trim() }
    return @{ upd = $upd; st = $st }
}

function Insert-Fig {
    param([string]$html, [string]$heading, [string]$fig)
    $pat = '(<h2 id="s\d+">' + [regex]::Escape($heading) + '</h2>)'
    return ($html -replace $pat, ('$1' + $fig))
}

# ---------------- SVG 图解（中文版） ----------------
$svgFunnelZh = @'
<svg viewBox="0 0 920 312" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="智能体营销漏斗">
  <g font-family="Segoe UI, Microsoft YaHei, PingFang SC, sans-serif">
    <rect x="18"  y="6"   width="884" height="62" rx="12" fill="#0a5548"/>
    <rect x="53"  y="82"  width="814" height="62" rx="12" fill="#0e7263"/>
    <rect x="88"  y="158" width="744" height="62" rx="12" fill="#1a8f7d"/>
    <rect x="123" y="234" width="674" height="62" rx="12" fill="#2fa48d"/>
    <path d="M452 70 L468 70 L460 80 Z" fill="#b9ad97"/>
    <path d="M452 146 L468 146 L460 156 Z" fill="#b9ad97"/>
    <path d="M452 222 L468 222 L460 232 Z" fill="#b9ad97"/>
    <text x="44"  y="32" font-size="17" font-weight="700" fill="#f4f1e8">M1 被识别</text>
    <text x="44"  y="53" font-size="12.5" fill="#f4f1e8" opacity="0.78">机器可读 · 结构化数据 · llms.txt · 实体消歧</text>
    <text x="876" y="42" font-size="12" fill="#f4f1e8" opacity="0.66" text-anchor="end">对标：品牌认知</text>
    <text x="79"  y="108" font-size="17" font-weight="700" fill="#f4f1e8">M2 被发现</text>
    <text x="79"  y="129" font-size="12.5" fill="#f4f1e8" opacity="0.78">GEO · AI 搜索 · 引用份额 · Agent 爬虫</text>
    <text x="845" y="118" font-size="12" fill="#f4f1e8" opacity="0.66" text-anchor="end">对标：SEO / SEM</text>
    <text x="114" y="184" font-size="17" font-weight="700" fill="#f4f1e8">M3 被采用</text>
    <text x="114" y="205" font-size="12.5" fill="#f4f1e8" opacity="0.78">MCP · 工具调用 · 协议目录 · 定价透明</text>
    <text x="816" y="194" font-size="12" fill="#f4f1e8" opacity="0.66" text-anchor="end">对标：转化优化</text>
    <text x="149" y="260" font-size="17" font-weight="700" fill="#f4f1e8">M4 被复购</text>
    <text x="149" y="281" font-size="12.5" fill="#f4f1e8" opacity="0.78">ACP / UCP · 履约记录 · 信任评分 · 组织记忆</text>
    <text x="779" y="270" font-size="12" fill="#f4f1e8" opacity="0.66" text-anchor="end">对标：复购与忠诚</text>
  </g>
</svg>
'@
$figFunnelZh = '<figure class="fig"><div class="figbox">' + $svgFunnelZh + '</div><figcaption>图 1 · 智能体营销漏斗：从被识别到被复购（右注为人类营销对标）</figcaption></figure>'

$svgParadigmZh = @'
<svg viewBox="0 0 920 336" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="范式迁移对比">
  <g font-family="Segoe UI, Microsoft YaHei, PingFang SC, sans-serif">
    <rect x="14" y="14" width="376" height="308" rx="16" fill="#fffdf9" stroke="#e0d8c6"/>
    <rect x="530" y="14" width="376" height="308" rx="16" fill="#ecf4f0" stroke="#c3dcd3"/>
    <text x="34" y="48" font-size="16.5" font-weight="700" fill="#1d2733">注意力经济</text>
    <text x="34" y="70" font-size="12" fill="#8a7f6a">说服人：有限理性与情绪</text>
    <line x1="34" y1="84" x2="370" y2="84" stroke="#eee6d4"/>
    <text x="564" y="48" font-size="16.5" font-weight="700" fill="#0a5548">智能体经济</text>
    <text x="564" y="70" font-size="12" fill="#5f8a7f">说服代理决策链：目标函数与评分</text>
    <line x1="564" y1="84" x2="900" y2="84" stroke="#d5e7e0"/>
    <g font-size="12" fill="#98907d">
      <text x="34" y="116">决策者</text><text x="34" y="160">信息获取</text><text x="34" y="204">影响机制</text><text x="34" y="248">内容偏好</text><text x="34" y="292">核心指标</text>
      <text x="564" y="116">决策者</text><text x="564" y="160">信息获取</text><text x="564" y="204">影响机制</text><text x="564" y="248">内容偏好</text><text x="564" y="292">核心指标</text>
    </g>
    <g font-size="13.5" fill="#1d2733">
      <text x="34" y="136">人脑：有限理性、情绪驱动</text>
      <text x="34" y="180">被推送：信息流、搜索排名</text>
      <text x="34" y="224">曝光、故事、社交证明</text>
      <text x="34" y="268">简单、视觉冲击、情绪共鸣</text>
      <text x="34" y="312">曝光量、CTR、ROI</text>
    </g>
    <g font-size="13.5" fill="#134e42">
      <text x="564" y="136">模型 ＋ 委托人目标函数</text>
      <text x="564" y="180">主动检索、工具调用</text>
      <text x="564" y="224">事实语料、评分、履约记录</text>
      <text x="564" y="268">准确、结构化、可验证</text>
      <text x="564" y="312">引用份额、调用量、复购率</text>
    </g>
    <line x1="402" y1="168" x2="508" y2="168" stroke="#0e7263" stroke-width="2.5"/>
    <path d="M522 168 L506 160 L506 176 Z" fill="#0e7263"/>
    <text x="460" y="146" font-size="13" font-weight="700" fill="#0a5548" text-anchor="middle">营销对象迁移</text>
    <text x="460" y="192" font-size="11.5" fill="#98907d" text-anchor="middle">曝光 → 证据</text>
  </g>
</svg>
'@
$figParadigmZh = '<figure class="fig"><div class="figbox">' + $svgParadigmZh + '</div><figcaption>图 2 · 范式迁移：从说服人心，到说服代理决策链</figcaption></figure>'

$svgChainZh = @'
<svg viewBox="0 0 920 330" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="代理链条与三个战场">
  <g font-family="Segoe UI, Microsoft YaHei, PingFang SC, sans-serif">
    <line x1="234" y1="63" x2="336" y2="63" stroke="#9a8f7c" stroke-width="2"/>
    <path d="M344 63 L330 55 L330 71 Z" fill="#9a8f7c"/>
    <text x="289" y="48" font-size="11.5" fill="#98907d" text-anchor="middle">委托：目标＋约束</text>
    <line x1="576" y1="63" x2="678" y2="63" stroke="#9a8f7c" stroke-width="2"/>
    <path d="M686 63 L672 55 L672 71 Z" fill="#9a8f7c"/>
    <text x="631" y="48" font-size="11.5" fill="#98907d" text-anchor="middle">检索 / 调用</text>
    <rect x="22"  y="30" width="212" height="66" rx="12" fill="#fffdf9" stroke="#e0d8c6"/>
    <text x="128" y="60" font-size="15.5" font-weight="700" fill="#1d2733" text-anchor="middle">终端用户</text>
    <text x="128" y="80" font-size="11.5" fill="#8a7f6a" text-anchor="middle">意图与预算 · 委托人</text>
    <rect x="344" y="30" width="232" height="66" rx="12" fill="#0e7263"/>
    <text x="460" y="60" font-size="15.5" font-weight="700" fill="#f4f1e8" text-anchor="middle">用户智能体</text>
    <text x="460" y="80" font-size="11.5" fill="#f4f1e8" opacity="0.78" text-anchor="middle">检索 → 评估 → 选择 → 执行</text>
    <rect x="686" y="30" width="212" height="66" rx="12" fill="#fffdf9" stroke="#d99a3d"/>
    <text x="792" y="60" font-size="15.5" font-weight="700" fill="#8a5a12" text-anchor="middle">你的产品</text>
    <text x="792" y="80" font-size="11.5" fill="#b07a2a" text-anchor="middle">识别→发现→采用→复购</text>
    <g stroke="#c9bfa8" stroke-dasharray="4 3" fill="none">
      <line x1="460" y1="96" x2="160" y2="150"/>
      <line x1="460" y1="96" x2="460" y2="150"/>
      <line x1="460" y1="96" x2="760" y2="150"/>
    </g>
    <rect x="22"  y="150" width="276" height="108" rx="12" fill="#f6f1e4" stroke="#e0d8c6"/>
    <rect x="322" y="150" width="276" height="108" rx="12" fill="#f6f1e4" stroke="#e0d8c6"/>
    <rect x="622" y="150" width="276" height="108" rx="12" fill="#f6f1e4" stroke="#e0d8c6"/>
    <text x="42"  y="182" font-size="13.5" font-weight="700" fill="#0a5548">语料层</text>
    <text x="342" y="182" font-size="13.5" font-weight="700" fill="#0a5548">决策层</text>
    <text x="642" y="182" font-size="13.5" font-weight="700" fill="#0a5548">协议层</text>
    <g font-size="12" fill="#5b6675">
      <text x="42"  y="207">训练与检索语料</text><text x="42"  y="230">建立事实存在感</text>
      <text x="342" y="207">结构化数据 · 评分 · 可比</text><text x="342" y="230">进入 agent 选择函数</text>
      <text x="642" y="207">目录 · 下单 · 结算 · 身份</text><text x="642" y="230">接入交易与信任网络</text>
    </g>
  </g>
</svg>
'@
$figChainZh = '<figure class="fig"><div class="figbox">' + $svgChainZh + '</div><figcaption>图 3 · 代理链条与营销的三个战场（语料层 / 决策层 / 协议层）</figcaption></figure>'

$svgTimeZh = @'
<svg viewBox="0 0 920 208" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="研究路线时间线">
  <g font-family="Segoe UI, Microsoft YaHei, PingFang SC, sans-serif">
    <line x1="46" y1="104" x2="874" y2="104" stroke="#d8cfba" stroke-width="2"/>
    <path d="M874 104 L862 97 L862 111 Z" fill="#d8cfba"/>
    <text x="130" y="48" font-size="11" font-weight="700" fill="#b45309" text-anchor="middle">当前</text>
    <circle cx="130" cy="104" r="13" fill="none" stroke="#7db3a8" stroke-dasharray="3 3"/>
    <circle cx="130" cy="104" r="7" fill="#0e7263"/>
    <circle cx="300" cy="104" r="7" fill="#fffdf9" stroke="#0e7263" stroke-width="2.5"/>
    <circle cx="470" cy="104" r="7" fill="#fffdf9" stroke="#0e7263" stroke-width="2.5"/>
    <circle cx="640" cy="104" r="7" fill="#fffdf9" stroke="#0e7263" stroke-width="2.5"/>
    <circle cx="810" cy="104" r="7" fill="#fffdf9" stroke="#0e7263" stroke-width="2.5"/>
    <g font-size="13.5" font-weight="700" fill="#1d2733" text-anchor="middle">
      <text x="130" y="74">2026-08</text><text x="300" y="74">2026-09</text><text x="470" y="74">2026-10</text><text x="640" y="74">2026-11</text><text x="810" y="74">2026-12+</text>
    </g>
    <g font-size="13" font-weight="700" fill="#0a5548" text-anchor="middle">
      <text x="130" y="138">Phase 0</text><text x="300" y="138">Phase 1</text><text x="470" y="138">Phase 2</text><text x="640" y="138">Phase 3</text><text x="810" y="138">持续运营</text>
    </g>
    <g font-size="11.5" fill="#8a7f6a" text-anchor="middle">
      <text x="130" y="160">框架与基线测量</text>
      <text x="300" y="160">M1 识别 · M2 发现深研</text>
      <text x="470" y="160">M3 采用 · M4 复购深研</text>
      <text x="640" y="160">商业化映射与取舍</text>
      <text x="810" y="160">月度复测 · 季度评审</text>
    </g>
  </g>
</svg>
'@
$figTimeZh = '<figure class="fig"><div class="figbox">' + $svgTimeZh + '</div><figcaption>图 4 · 研究路线：2026-08 启动，滚动运营</figcaption></figure>'

# ---------------- SVG 图解（英文版） ----------------
$svgFunnelEn = @'
<svg viewBox="0 0 920 312" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="The agent marketing funnel">
  <g font-family="Segoe UI, Microsoft YaHei, PingFang SC, sans-serif">
    <rect x="18"  y="6"   width="884" height="62" rx="12" fill="#0a5548"/>
    <rect x="53"  y="82"  width="814" height="62" rx="12" fill="#0e7263"/>
    <rect x="88"  y="158" width="744" height="62" rx="12" fill="#1a8f7d"/>
    <rect x="123" y="234" width="674" height="62" rx="12" fill="#2fa48d"/>
    <path d="M452 70 L468 70 L460 80 Z" fill="#b9ad97"/>
    <path d="M452 146 L468 146 L460 156 Z" fill="#b9ad97"/>
    <path d="M452 222 L468 222 L460 232 Z" fill="#b9ad97"/>
    <text x="44"  y="32" font-size="17" font-weight="700" fill="#f4f1e8">M1 Recognized</text>
    <text x="44"  y="53" font-size="12.5" fill="#f4f1e8" opacity="0.78">Machine-readable · structured data · llms.txt · entity disambiguation</text>
    <text x="876" y="42" font-size="12" fill="#f4f1e8" opacity="0.66" text-anchor="end">Analog: brand awareness</text>
    <text x="79"  y="108" font-size="17" font-weight="700" fill="#f4f1e8">M2 Discovered</text>
    <text x="79"  y="129" font-size="12.5" fill="#f4f1e8" opacity="0.78">GEO · AI search · citation share · agent crawlers</text>
    <text x="845" y="118" font-size="12" fill="#f4f1e8" opacity="0.66" text-anchor="end">Analog: SEO / SEM</text>
    <text x="114" y="184" font-size="17" font-weight="700" fill="#f4f1e8">M3 Adopted</text>
    <text x="114" y="205" font-size="12.5" fill="#f4f1e8" opacity="0.78">MCP · tool calls · protocol directories · transparent pricing</text>
    <text x="816" y="194" font-size="12" fill="#f4f1e8" opacity="0.66" text-anchor="end">Analog: conversion optimization</text>
    <text x="149" y="260" font-size="17" font-weight="700" fill="#f4f1e8">M4 Repurchased</text>
    <text x="149" y="281" font-size="12.5" fill="#f4f1e8" opacity="0.78">ACP / UCP · fulfillment records · trust scores · organizational memory</text>
    <text x="779" y="270" font-size="12" fill="#f4f1e8" opacity="0.66" text-anchor="end">Analog: retention &amp; loyalty</text>
  </g>
</svg>
'@
$figFunnelEn = '<figure class="fig"><div class="figbox">' + $svgFunnelEn + '</div><figcaption>Fig. 1 · The agent marketing funnel: from recognized to repurchased (right notes: human-marketing analogs)</figcaption></figure>'

$svgParadigmEn = @'
<svg viewBox="0 0 920 336" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Paradigm shift comparison">
  <g font-family="Segoe UI, Microsoft YaHei, PingFang SC, sans-serif">
    <rect x="14" y="14" width="376" height="308" rx="16" fill="#fffdf9" stroke="#e0d8c6"/>
    <rect x="530" y="14" width="376" height="308" rx="16" fill="#ecf4f0" stroke="#c3dcd3"/>
    <text x="34" y="48" font-size="16.5" font-weight="700" fill="#1d2733">Attention Economy</text>
    <text x="34" y="70" font-size="12" fill="#8a7f6a">Persuading humans: bounded rationality, emotion</text>
    <line x1="34" y1="84" x2="370" y2="84" stroke="#eee6d4"/>
    <text x="564" y="48" font-size="16.5" font-weight="700" fill="#0a5548">Agent Economy</text>
    <text x="564" y="70" font-size="12" fill="#5f8a7f">Persuading agents: objectives and scoring</text>
    <line x1="564" y1="84" x2="900" y2="84" stroke="#d5e7e0"/>
    <g font-size="12" fill="#98907d">
      <text x="34" y="116">Decision-maker</text><text x="34" y="160">Info intake</text><text x="34" y="204">Influence</text><text x="34" y="248">Content preference</text><text x="34" y="292">Core metrics</text>
      <text x="564" y="116">Decision-maker</text><text x="564" y="160">Info intake</text><text x="564" y="204">Influence</text><text x="564" y="248">Content preference</text><text x="564" y="292">Core metrics</text>
    </g>
    <g font-size="13" fill="#1d2733">
      <text x="34" y="136">Human brain — bounded rationality, emotion</text>
      <text x="34" y="180">Fed by feeds: streams, search rankings</text>
      <text x="34" y="224">Exposure, stories, social proof</text>
      <text x="34" y="268">Simple, striking, emotionally resonant</text>
      <text x="34" y="312">Impressions, CTR, ROI</text>
    </g>
    <g font-size="13" fill="#134e42">
      <text x="564" y="136">Model + the principal&#8217;s objective function</text>
      <text x="564" y="180">Active retrieval and tool calls</text>
      <text x="564" y="224">Factual corpora, scores, fulfillment records</text>
      <text x="564" y="268">Accurate, structured, verifiable</text>
      <text x="564" y="312">Citation share, call volume, repurchase rate</text>
    </g>
    <line x1="402" y1="168" x2="508" y2="168" stroke="#0e7263" stroke-width="2.5"/>
    <path d="M522 168 L506 160 L506 176 Z" fill="#0e7263"/>
    <text x="460" y="146" font-size="13" font-weight="700" fill="#0a5548" text-anchor="middle">Paradigm shift</text>
    <text x="460" y="192" font-size="11.5" fill="#98907d" text-anchor="middle">exposure &#8594; evidence</text>
  </g>
</svg>
'@
$figParadigmEn = '<figure class="fig"><div class="figbox">' + $svgParadigmEn + '</div><figcaption>Fig. 2 · The paradigm shift: from persuading human minds to persuading the agentic decision chain</figcaption></figure>'

$svgChainEn = @'
<svg viewBox="0 0 920 330" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="The agentic chain and three arenas">
  <g font-family="Segoe UI, Microsoft YaHei, PingFang SC, sans-serif">
    <line x1="234" y1="63" x2="336" y2="63" stroke="#9a8f7c" stroke-width="2"/>
    <path d="M344 63 L330 55 L330 71 Z" fill="#9a8f7c"/>
    <text x="289" y="48" font-size="11.5" fill="#98907d" text-anchor="middle">goal + constraints</text>
    <line x1="576" y1="63" x2="678" y2="63" stroke="#9a8f7c" stroke-width="2"/>
    <path d="M686 63 L672 55 L672 71 Z" fill="#9a8f7c"/>
    <text x="631" y="48" font-size="11.5" fill="#98907d" text-anchor="middle">retrieve / call</text>
    <rect x="22"  y="30" width="212" height="66" rx="12" fill="#fffdf9" stroke="#e0d8c6"/>
    <text x="128" y="60" font-size="15.5" font-weight="700" fill="#1d2733" text-anchor="middle">End user</text>
    <text x="128" y="80" font-size="11.5" fill="#8a7f6a" text-anchor="middle">intent &amp; budget · principal</text>
    <rect x="344" y="30" width="232" height="66" rx="12" fill="#0e7263"/>
    <text x="460" y="60" font-size="15.5" font-weight="700" fill="#f4f1e8" text-anchor="middle">User agent</text>
    <text x="460" y="80" font-size="11" fill="#f4f1e8" opacity="0.78" text-anchor="middle">retrieve &#8594; evaluate &#8594; select &#8594; execute</text>
    <rect x="686" y="30" width="212" height="66" rx="12" fill="#fffdf9" stroke="#d99a3d"/>
    <text x="792" y="60" font-size="15.5" font-weight="700" fill="#8a5a12" text-anchor="middle">Your product</text>
    <text x="792" y="80" font-size="11" fill="#b07a2a" text-anchor="middle">recognize&#8594;discover&#8594;adopt&#8594;repurchase</text>
    <g stroke="#c9bfa8" stroke-dasharray="4 3" fill="none">
      <line x1="460" y1="96" x2="160" y2="150"/>
      <line x1="460" y1="96" x2="460" y2="150"/>
      <line x1="460" y1="96" x2="760" y2="150"/>
    </g>
    <rect x="22"  y="150" width="276" height="108" rx="12" fill="#f6f1e4" stroke="#e0d8c6"/>
    <rect x="322" y="150" width="276" height="108" rx="12" fill="#f6f1e4" stroke="#e0d8c6"/>
    <rect x="622" y="150" width="276" height="108" rx="12" fill="#f6f1e4" stroke="#e0d8c6"/>
    <text x="42"  y="182" font-size="13.5" font-weight="700" fill="#0a5548">Corpus layer</text>
    <text x="342" y="182" font-size="13.5" font-weight="700" fill="#0a5548">Decision layer</text>
    <text x="642" y="182" font-size="13.5" font-weight="700" fill="#0a5548">Protocol layer</text>
    <g font-size="11.5" fill="#5b6675">
      <text x="42"  y="207">training &amp; retrieval corpora</text><text x="42"  y="230">establishing factual presence</text>
      <text x="342" y="207">structured data · scores · comparability</text><text x="342" y="230">entering the agent&#8217;s choice function</text>
      <text x="642" y="207">order · checkout · settlement · identity</text><text x="642" y="230">joining the transaction &amp; trust network</text>
    </g>
  </g>
</svg>
'@
$figChainEn = '<figure class="fig"><div class="figbox">' + $svgChainEn + '</div><figcaption>Fig. 3 · The agentic chain and the three arenas of marketing (corpus / decision / protocol)</figcaption></figure>'

$svgTimeEn = @'
<svg viewBox="0 0 920 208" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Research roadmap timeline">
  <g font-family="Segoe UI, Microsoft YaHei, PingFang SC, sans-serif">
    <line x1="46" y1="104" x2="874" y2="104" stroke="#d8cfba" stroke-width="2"/>
    <path d="M874 104 L862 97 L862 111 Z" fill="#d8cfba"/>
    <text x="130" y="48" font-size="11" font-weight="700" fill="#b45309" text-anchor="middle">Current</text>
    <circle cx="130" cy="104" r="13" fill="none" stroke="#7db3a8" stroke-dasharray="3 3"/>
    <circle cx="130" cy="104" r="7" fill="#0e7263"/>
    <circle cx="300" cy="104" r="7" fill="#fffdf9" stroke="#0e7263" stroke-width="2.5"/>
    <circle cx="470" cy="104" r="7" fill="#fffdf9" stroke="#0e7263" stroke-width="2.5"/>
    <circle cx="640" cy="104" r="7" fill="#fffdf9" stroke="#0e7263" stroke-width="2.5"/>
    <circle cx="810" cy="104" r="7" fill="#fffdf9" stroke="#0e7263" stroke-width="2.5"/>
    <g font-size="13.5" font-weight="700" fill="#1d2733" text-anchor="middle">
      <text x="130" y="74">2026-08</text><text x="300" y="74">2026-09</text><text x="470" y="74">2026-10</text><text x="640" y="74">2026-11</text><text x="810" y="74">2026-12+</text>
    </g>
    <g font-size="13" font-weight="700" fill="#0a5548" text-anchor="middle">
      <text x="130" y="138">Phase 0</text><text x="300" y="138">Phase 1</text><text x="470" y="138">Phase 2</text><text x="640" y="138">Phase 3</text><text x="810" y="138">Ongoing ops</text>
    </g>
    <g font-size="11" fill="#8a7f6a" text-anchor="middle">
      <text x="130" y="160">framework &amp; baselines</text>
      <text x="300" y="160">M1 &amp; M2 deep-dives</text>
      <text x="470" y="160">M3 &amp; M4 deep-dives</text>
      <text x="640" y="160">commercialization mapping</text>
      <text x="810" y="160">monthly &amp; quarterly reviews</text>
    </g>
  </g>
</svg>
'@
$figTimeEn = '<figure class="fig"><div class="figbox">' + $svgTimeEn + '</div><figcaption>Fig. 4 · Research roadmap: launched 2026-08, rolling operation</figcaption></figure>'

# ---------------- 双语页面装配 ----------------
$sections = New-Object System.Collections.Generic.List[string]
$navZh = New-Object System.Collections.Generic.List[string]
$navEn = New-Object System.Collections.Generic.List[string]
$countZh = 0; $countEn = 0

foreach ($p in $pages) {
    foreach ($lang in @('zh', 'en')) {
        $f = if ($lang -eq 'zh') { $p.fz } else { $p.fe }
        $t = if ($lang -eq 'zh') { $p.tz } else { $p.te }
        $g = if ($lang -eq 'zh') { $p.gz } else { $p.ge }
        $path = Join-Path $root $f
        if (-not (Test-Path $path)) { Write-Warning ('缺少文件，已跳过: ' + $f); continue }
        $md = [IO.File]::ReadAllText($path)
        $body = Convert-Md $md

        if ($p.id -eq 'home') {
            $h = if ($lang -eq 'zh') { '研究主线：智能体营销漏斗' } else { 'The Agent Marketing Funnel' }
            $fg = if ($lang -eq 'zh') { $figFunnelZh } else { $figFunnelEn }
            $body = Insert-Fig $body $h $fg
        }
        if ($p.id -eq 'frame') {
            $h2 = if ($lang -eq 'zh') { '2. 范式对比' } else { '2. Paradigm Comparison' }
            $h3 = if ($lang -eq 'zh') { '3. 代理链条' } else { '3. The Agentic Chain' }
            $h4 = if ($lang -eq 'zh') { '4. 智能体营销漏斗（研究主线）' } else { '4. The Agent Marketing Funnel (Main Line of Research)' }
            $fgP = if ($lang -eq 'zh') { $figParadigmZh } else { $figParadigmEn }
            $fgC = if ($lang -eq 'zh') { $figChainZh } else { $figChainEn }
            $fgF = if ($lang -eq 'zh') { $figFunnelZh } else { $figFunnelEn }
            $body = Insert-Fig $body $h2 $fgP
            $body = Insert-Fig $body $h3 $fgC
            $body = Insert-Fig $body $h4 $fgF
        }
        if ($p.id -eq 'road') {
            $h = if ($lang -eq 'zh') { '阶段总览' } else { 'Phase Overview' }
            $fg = if ($lang -eq 'zh') { $figTimeZh } else { $figTimeEn }
            $body = Insert-Fig $body $h $fg
        }

        $meta = Get-Meta $md $lang
        $badges = ''
        if ($meta.st)  { $badges += '<span class="badge st">' + (Escape-Html $meta.st) + '</span>' }
        if ($meta.upd) {
            $lbl = if ($lang -eq 'zh') { '更新 ' } else { 'Updated ' }
            $badges += '<span class="badge up">' + $lbl + $meta.upd + '</span>'
        }
        if ($badges -ne '') { $badges = '<div class="badges">' + $badges + '</div>' }

        $search = [regex]::Replace($md, '(?s)```.*?```', ' ')
        $search = $search -replace '[#|>*`\[\]()_-]', ' '
        $search = [regex]::Replace($search, '\s+', ' ').Trim()
        if ($search.Length -gt 3500) { $search = $search.Substring(0, 3500) }
        $search = Escape-Html $search

        $sections.Add('<section class="page lang-' + $lang + '" id="pg-' + $lang + '-' + $p.id + '" data-title="' + (Escape-Html $t) + '" data-search="' + $search + '">' +
            '<header class="phead"><div class="crumb">' + (Escape-Html $g) + '</div><h1>' + (Escape-Html $t) + '</h1>' + $badges + '</header>' +
            '<article>' + $body + '</article></section>')

        $navItem = '<a class="nav-item" data-lang="' + $lang + '" href="#page/' + $p.id + '" data-id="' + $p.id + '" data-t="' + (Escape-Html ($t + ' ' + $g)) + '">' + (Escape-Html $t) + '</a>'
        if ($lang -eq 'zh') { $navZh.Add($navItem); $countZh++ } else { $navEn.Add($navItem); $countEn++ }
    }
}

function Build-Nav {
    param($lang, $items)
    $sb = New-Object System.Text.StringBuilder
    foreach ($g in $groupOrder) {
        $ge = ($pages | Where-Object { $_.gz -eq $g } | Select-Object -First 1).ge
        $gLabel = if ($lang -eq 'zh') { $g } else { $ge }
        $list = @()
        foreach ($p in ($pages | Where-Object { $_.gz -eq $g })) {
            $hit = $items | Where-Object { $_ -match ('data-id="' + $p.id + '"') } | Select-Object -First 1
            if ($hit) { $list += $hit }
        }
        if ($list.Count -gt 0) {
            [void]$sb.Append('<div class="nav-group" data-lang="' + $lang + '"><div class="nav-label">' + (Escape-Html $gLabel) + '</div>' + ($list -join "`n") + '</div>')
        }
    }
    return $sb.ToString()
}
$navZhHtml = Build-Nav 'zh' $navZh
$navEnHtml = Build-Nav 'en' $navEn

# ---------------- 页面模板 ----------------
$tpl = @'
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>智能体营销研究 · Agent Marketing Research · WIKI</title>
<style>
*{box-sizing:border-box;margin:0;padding:0}
html{scroll-behavior:smooth}
body{font-family:"Segoe UI","Microsoft YaHei","PingFang SC",sans-serif;background:#f6f3ec;color:#1d2733;font-size:15.5px;line-height:1.9}
::selection{background:#0e7263;color:#f6f3ec}
aside{position:fixed;top:0;left:0;bottom:0;width:264px;background:#141f2e;color:#c6d0de;overflow-y:auto;z-index:30;transition:transform .25s ease}
.brand{padding:26px 22px 16px;border-bottom:1px solid rgba(198,208,222,.14)}
.brand .bt{font-size:17px;font-weight:700;color:#f3efe6;letter-spacing:.02em}
.brand .bs{font-size:11px;color:#8fa0b5;margin-top:4px;letter-spacing:.14em;text-transform:uppercase}
.brand .br{font-size:11.5px;color:#9fb0c4;margin-top:8px;padding-top:7px;border-top:1px solid rgba(198,208,222,.12)}
#langsw{display:flex;gap:6px;padding:12px 22px 2px}
.lb{background:rgba(198,208,222,.08);border:1px solid rgba(198,208,222,.22);color:#a9b7c9;font-size:11.5px;padding:3px 12px;border-radius:99px;cursor:pointer;font-family:inherit;letter-spacing:.04em}
.lb:hover{color:#fff;border-color:#3aa895}
.lb.on{background:rgba(58,168,149,.2);color:#fff;border-color:#3aa895;font-weight:600}
.search{padding:12px 16px 6px}
.search input{width:100%;background:rgba(198,208,222,.08);border:1px solid rgba(198,208,222,.18);color:#e8ecf2;border-radius:9px;padding:8px 12px;font-size:13px;outline:none;font-family:inherit}
.search input:focus{border-color:#3aa895;background:rgba(58,168,149,.1)}
.search input::placeholder{color:#71829a}
#qcount{font-size:11px;color:#7ea89e;padding:6px 18px 0;min-height:18px}
nav{padding:8px 10px 24px}
.nav-label{font-size:11px;letter-spacing:.18em;color:#6d7f96;padding:16px 12px 6px}
.nav-item{display:block;padding:7px 12px;border-radius:8px;color:#c6d0de;text-decoration:none;font-size:13.5px;border-left:2px solid transparent}
.nav-item:hover{background:rgba(198,208,222,.07);color:#fff}
.nav-item.on{background:rgba(58,168,149,.16);color:#fff;border-left-color:#3aa895;font-weight:600}
.side-foot{padding:14px 22px 26px;font-size:11px;color:#5d6e84;border-top:1px solid rgba(198,208,222,.12);line-height:1.7}
main{margin-left:264px;padding:46px 40px 80px;max-width:940px}
#tg{display:none;position:fixed;top:12px;left:12px;z-index:40;width:40px;height:40px;border-radius:10px;border:1px solid #d8d0c0;background:#fffdf9;color:#1d2733;font-size:16px;align-items:center;justify-content:center;cursor:pointer}
@media (max-width:960px){
  aside{transform:translateX(-100%)}
  body.nav-open aside{transform:none;box-shadow:0 0 40px rgba(0,0,0,.4)}
  main{margin-left:0;padding:60px 20px 60px}
  #tg{display:flex}
}
body.lang-zh [data-lang="en"]{display:none}
body.lang-en [data-lang="zh"]{display:none}
.page{display:none;animation:fadein .28s ease}
body.lang-zh .page.on.lang-zh{display:block}
body.lang-en .page.on.lang-en{display:block}
@keyframes fadein{from{opacity:0;transform:translateY(6px)}to{opacity:1;transform:none}}
@media (prefers-reduced-motion:reduce){.page{animation:none}}
.phead{border-bottom:3px solid #1d2733;padding-bottom:18px;margin-bottom:26px}
.crumb{font-size:12px;letter-spacing:.16em;color:#8a7f6a;text-transform:uppercase;margin-bottom:6px}
h1{font-size:clamp(26px,4vw,32px);font-weight:800;letter-spacing:.01em;margin-bottom:10px}
.badges{display:flex;gap:8px;flex-wrap:wrap;margin-bottom:4px}
.badge{font-size:12px;padding:3px 10px;border-radius:99px;border:1px solid}
.badge.up{color:#8a5a12;border-color:#e3c48f;background:#faf1df}
.badge.st{color:#0a5548;border-color:#a9cfc5;background:#e9f4f0}
h2{font-size:20px;margin:38px 0 14px;padding-bottom:8px;border-bottom:1px solid #ddd3c0;font-weight:700}
h3{font-size:16.5px;color:#0a5548;margin:26px 0 10px;font-weight:700}
p{margin:.85em 0}
strong{font-weight:700}
ul,ol{margin:.85em 0 .85em 1.6em}
li{margin:.35em 0}
a.wl{color:#0e7263;text-decoration:none;border-bottom:1px dashed #7db3a8}
a.wl:hover{color:#0a5548;border-bottom-style:solid}
a.xl{color:#0e7263}
.wl-dead{color:#9a8f7c;border-bottom:1px dotted #c9bfa8}
code{font-family:Consolas,"Courier New",monospace;font-size:.86em;background:#ece5d4;color:#7a4a10;padding:2px 6px;border-radius:5px}
pre.code{background:#141f2e;color:#d7e3ef;border-radius:12px;padding:16px 18px;overflow:auto;font-size:13px;line-height:1.75;margin:18px 0}
pre.code code{background:none;color:inherit;padding:0}
blockquote{margin:16px 0;padding:10px 16px;border-left:3px solid #0e7263;background:rgba(14,114,99,.06);border-radius:0 10px 10px 0;color:#5b6675;font-size:14px}
hr{border:none;border-top:1px dashed #d8cfba;margin:26px 0}
.tbl{overflow-x:auto;margin:16px 0}
table{border-collapse:collapse;width:100%;font-size:13.8px;line-height:1.7}
th{text-align:left;font-size:12.5px;color:#6b6252;letter-spacing:.03em;border-bottom:2px solid #1d2733;padding:8px 10px;white-space:nowrap}
td{border-bottom:1px solid #e3dcc9;padding:9px 10px;vertical-align:top}
tr:hover td{background:rgba(14,114,99,.035)}
.fig{margin:26px 0}
.figbox{background:#fffdf9;border:1px solid #e3dcc9;border-radius:14px;padding:16px 12px}
.figbox svg{display:block;width:100%;height:auto}
figcaption{font-size:12.5px;color:#8a7f6a;margin-top:9px;text-align:center}
.foot{margin-top:70px;padding-top:16px;border-top:1px solid #ddd3c0;font-size:12px;color:#9a8f7c}
.foot a.fl{color:#0e7263}
@media print{aside,#tg,#langsw{display:none}main{margin:0;padding:0}body.lang-zh .page.lang-zh,body.lang-en .page.lang-en{display:block!important}}
</style>
</head>
<body class="lang-zh">
<button id="tg" aria-label="打开目录 / Open menu">☰</button>
<aside>
  <div class="brand">
    <div data-lang="zh"><div class="bt">智能体营销研究</div><div class="bs">Agent Marketing Wiki</div></div>
    <div data-lang="en"><div class="bt">Agent Marketing Research</div><div class="bs">Bilingual Research Wiki</div></div>
    <div class="br" data-lang="zh">研究员 潘佳鸣 · Sean Pan</div>
    <div class="br" data-lang="en">Researcher: Sean Pan (潘佳鸣)</div>
  </div>
  <div id="langsw"><button class="lb" data-l="zh" type="button">中文</button><button class="lb" data-l="en" type="button">English</button></div>
  <div class="search"><input id="q" type="search" placeholder="搜索本库（按 / 聚焦）" autocomplete="off"></div>
  <div id="qcount"></div>
  <nav data-lang="zh">__NAV_ZH__</nav>
  <nav data-lang="en">__NAV_EN__</nav>
  <div class="side-foot"><span data-lang="zh">真相层：Markdown 文档集（中文根目录 ＋ en/ 英文镜像）<br>阅读层：由 build_wiki.ps1 生成（中英双语）<br>构建：</span><span data-lang="en">Source of truth: Markdown corpus (Chinese root + en/ mirror)<br>Reading layer: generated by build_wiki.ps1 (zh/en)<br>Build:</span> __BUILD__</div>
</aside>
<main>
__SECTIONS__
<div class="foot"><span data-lang="zh">智能体营销研究 · 研究员 潘佳鸣（Sean Pan） · </span><span data-lang="en">Agent Marketing Research · Researcher Sean Pan (潘佳鸣) · </span><a class="fl" href="mailto:seanpanjiaming@aliyun.com">seanpanjiaming@aliyun.com</a><span data-lang="zh"> · 由 Markdown 构建生成，请勿手改 · 构建时间 </span><span data-lang="en"> · Generated from Markdown, do not edit by hand · Built </span>__BUILD__</div>
</main>
<script>
(function(){
  var lang='zh';
  try{var sv=localStorage.getItem('aml-lang');if(sv==='zh'||sv==='en'){lang=sv;}}catch(e){}
  var pages=document.querySelectorAll('.page');
  var items=document.querySelectorAll('.nav-item');
  var q=document.getElementById('q');
  var cur='home';
  function title(){
    var sec=document.getElementById('pg-'+lang+'-'+cur);
    var base=lang==='zh'?'智能体营销研究':'Agent Marketing Research';
    document.title=base+' · '+(sec?sec.getAttribute('data-title'):'WIKI');
  }
  function show(id){
    cur=id;
    var found=false,i,j;
    for(i=0;i<pages.length;i++){var on=pages[i].id==='pg-zh-'+id||pages[i].id==='pg-en-'+id;pages[i].classList.toggle('on',on);if(on)found=true;}
    if(!found){cur='home';for(i=0;i<pages.length;i++){pages[i].classList.toggle('on',pages[i].id==='pg-zh-home'||pages[i].id==='pg-en-home');}}
    for(j=0;j<items.length;j++){items[j].classList.toggle('on',items[j].getAttribute('href')==='#page/'+cur);}
    title();
    window.scrollTo(0,0);
    document.body.classList.remove('nav-open');
  }
  function filter(){
    var v=q.value.trim().toLowerCase(),n=0,j,k,z;
    for(j=0;j<items.length;j++){
      var it=items[j];
      if(it.getAttribute('data-lang')!==lang){continue;}
      var sec=document.getElementById('pg-'+lang+'-'+it.getAttribute('data-id'));
      var hay=(it.getAttribute('data-t')+' '+(sec?sec.getAttribute('data-search'):'')).toLowerCase();
      var ok=!v||hay.indexOf(v)>-1;
      it.style.display=ok?'':'none';
      if(ok&&v)n++;
    }
    var gs=document.querySelectorAll('.nav-group');
    for(k=0;k<gs.length;k++){
      if(gs[k].getAttribute('data-lang')!==lang){continue;}
      var vis=false,its=gs[k].querySelectorAll('.nav-item');
      for(z=0;z<its.length;z++){if(its[z].style.display!=='none'){vis=true;break;}}
      gs[k].style.display=vis?'':'none';
    }
    document.getElementById('qcount').textContent=v?(n+(lang==='zh'?' 个页面匹配':' pages matched')):'';
  }
  function setLang(l,save){
    lang=l;
    var open=document.body.classList.contains('nav-open');
    document.body.className='lang-'+l+(open?' nav-open':'');
    document.documentElement.lang=l==='zh'?'zh-CN':'en';
    var bs=document.querySelectorAll('.lb'),i;
    for(i=0;i<bs.length;i++){bs[i].classList.toggle('on',bs[i].getAttribute('data-l')===l);}
    q.placeholder=l==='zh'?'搜索本库（按 / 聚焦）':'Search the wiki (press / to focus)';
    title();
    if(save){try{localStorage.setItem('aml-lang',l);}catch(e){}}
    filter();
  }
  function route(){
    var m=(location.hash||'').match(/^#page\/([a-z0-9_-]+)/i);
    show(m?m[1].toLowerCase():'home');
  }
  window.addEventListener('hashchange',route);
  q.addEventListener('input',filter);
  var lbs=document.querySelectorAll('.lb'),b;
  for(b=0;b<lbs.length;b++){(function(btn){btn.addEventListener('click',function(){setLang(btn.getAttribute('data-l'),true);});})(lbs[b]);}
  document.addEventListener('keydown',function(e){
    if(e.key==='/'&&document.activeElement!==q){e.preventDefault();q.focus();}
    if(e.key==='Escape'&&document.activeElement===q){q.value='';q.dispatchEvent(new Event('input'));q.blur();}
  });
  var tg=document.getElementById('tg');
  if(tg){tg.addEventListener('click',function(){document.body.classList.toggle('nav-open');});}
  setLang(lang,false);
  route();
})();
</script>
</body>
</html>
'@

# ---------------- 输出 ----------------
New-Item -ItemType Directory -Force -Path $outDir | Out-Null
$final = $tpl.Replace('__NAV_ZH__', $navZhHtml).Replace('__NAV_EN__', $navEnHtml).Replace('__SECTIONS__', ($sections -join "`n")).Replace('__BUILD__', $stamp)
[IO.File]::WriteAllText($out, $final, (New-Object System.Text.UTF8Encoding($false)))
Write-Host ('双语 WIKI 已生成: ' + $out)
Write-Host ('页面数: 中文 ' + $countZh + ' / 英文 ' + $countEn + '  大小: ' + [math]::Round((Get-Item $out).Length / 1KB, 1) + ' KB  构建: ' + $stamp)
