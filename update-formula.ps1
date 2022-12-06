$version=$args[0]

if (!$version) {
    Write-Error 'Version is required'
    return;
}

if ($version.StartsWith('v')) {
    $version = $version.Substring(1)
}

Copy-Item $PSScriptRoot\msstore-cli.rb.template -Destination $PSScriptRoot\Formula\msstore-cli.rb -Force

$x64osxContent = Get-Content MSStoreCLI-osx.12-x64.tar.gz.sha256.txt
$arm64osxContent = Get-Content MSStoreCLI-osx.12-arm64.tar.gz.sha256.txt
$x64linuxContent = Get-Content MSStoreCLI-linux-x64.tar.gz.sha256.txt
$arm64linuxContent = Get-Content MSStoreCLI-linux-arm64.tar.gz.sha256.txt
$x64osxSha = $x64osxContent.Split("  ")[0]
$arm64osxSha = $arm64osxContent.Split("  ")[0]
$x64linuxSha = $x64linuxContent.Split("  ")[0]
$arm64linuxSha = $arm64linuxContent.Split("  ")[0]
if (!$x64osxSha -or !$arm64osxSha -or !$x64linuxSha -or !$arm64linuxSha) {
    Write-Error 'Failed to get sha256'
    return;
}

Write-Output "Updating version to $version, x64osx: $x64osxSha, arm64osx: $arm64osxSha, x64linux: $x64linuxSha, arm64linux: $arm64linuxSha"

$newForumla = ((Get-Content $PSScriptRoot\Formula\msstore-cli.rb -Raw) -replace 'MSSTORECLI_OSX_X64_URLSHA256',$x64osxSha -replace 'MSSTORECLI_OSX_ARM64_URLSHA256',$arm64osxSha -replace 'MSSTORECLI_LINUX_X64_URLSHA256',$x64linuxSha -replace 'MSSTORECLI_LINUX_ARM64_URLSHA256',$arm64linuxSha -replace 'MSSTORECLI_VERSION', $version)
$newForumla | Set-Content $PSScriptRoot\Formula\msstore-cli.rb