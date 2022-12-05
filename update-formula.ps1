$version=$args[0]

if (!$version) {
    Write-Error 'Version is required'
    return;
}

if ($version.StartsWith('v')) {
    $version = $version.Substring(1)
}

Copy-Item $PSScriptRoot\msstore-cli.rb.template -Destination $PSScriptRoot\Formula\msstore-cli.rb -Force

$x64Content = Get-Content *x64*.sha256.txt
$arm64Content = Get-Content *arm64*.sha256.txt
$x64sha = $x64Content.Split("  ")[0]
$arm64sha = $arm64Content.Split("  ")[0]
if(!$x64sha -and !$arm64sha) {
    Write-Error 'Failed to get sha256'
    return;
}

Write-Output "Updating x64 sha to $x64sha, arm64 sha to $arm64sha, and version to $version"

$newForumla = ((Get-Content $PSScriptRoot\Formula\msstore-cli.rb -Raw) -replace 'MSSTORECLI_ARM64_URLSHA256',$arm64sha -replace 'MSSTORECLI_X64_URLSHA256',$x64sha -replace 'MSSTORECLI_VERSION', $version)
$newForumla | Set-Content $PSScriptRoot\Formula\msstore-cli.rb