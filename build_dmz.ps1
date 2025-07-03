# Creates a DMXControl project archive (.dmz) from the show/dmz folder
param(
    [string]$ProjectFolder = "show/dmz"
)

function Get-CRC32 {
    param([string]$Path)
    $table = 0..255 | ForEach-Object {
        $crc = $_
        for ($j = 0; $j -lt 8; $j++) {
            if ($crc -band 1) {
                $crc = 0xEDB88320 -bxor ($crc -shr 1)
            } else {
                $crc = $crc -shr 1
            }
        }
        $crc
    }
    $crc = 0xFFFFFFFF
    $stream = [System.IO.File]::OpenRead($Path)
    try {
        $buffer = New-Object byte[] 4096
        while (($read = $stream.Read($buffer,0,$buffer.Length)) -gt 0) {
            for ($i = 0; $i -lt $read; $i++) {
                $crc = $table[($crc -bxor $buffer[$i]) -band 0xFF] -bxor ($crc -shr 8)
            }
        }
    }
    finally {
        $stream.Close()
    }
    return "{0:X8}" -f (-bnot $crc -band 0xFFFFFFFF)
}

$projectPath = Resolve-Path $ProjectFolder
$libPath = Join-Path $projectPath 'LibDevices'
if (-not (Test-Path $libPath)) { New-Item -ItemType Directory -Path $libPath | Out-Null }

$deviceFiles = @(
    'Prolights_LumiPar12UAW5_7ch.xml',
    'Prolights_LumiPar12UQPro_4ch.xml',
    'Prolights_LumiPar12UQPro_9ch.xml',
    'Prolights_LumiPar7UTRI_8ch.xml',
    'Prolights_PixieWash_13ch.xml',
    'WhatSoftware_Generic_4ch.xml'
)
foreach ($file in $deviceFiles) {
    $src = Join-Path $PSScriptRoot $file
    if (Test-Path $src) { Copy-Item $src -Destination $libPath -Force }
}

$checksumFile = Join-Path $projectPath 'checksum.sfv'
Remove-Item $checksumFile -Force -ErrorAction SilentlyContinue
'' | Out-File $checksumFile -Encoding ASCII

Get-ChildItem -Path $projectPath -Recurse -File | ForEach-Object {
    $relative = $_.FullName.Substring($projectPath.Length + 1) -replace '/', '\\'
    $crc = Get-CRC32 $_.FullName
    "$relative $crc" | Out-File $checksumFile -Append -Encoding ASCII
}

$parent = Split-Path $projectPath -Parent
$archive = Join-Path $parent ((Split-Path $projectPath -Leaf) + '.dmz')
if (Test-Path $archive) { Remove-Item $archive }
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($projectPath, $archive)
Write-Host "DMZ package created at $archive"
