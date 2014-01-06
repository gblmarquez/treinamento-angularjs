param([int]$port=9001, [string]$path)

if(!$path) {
    $path = Split-Path -Parent $MyInvocation.MyCommand.Path
}
if(!(Test-Path $path)) {
    throw "Could not find '$path'. Use -path argument to specify the path."
}
$path = Convert-Path $path

$args = ' /path:"{0}" /port:{1} /clr:v4.0 /systray:true' -f $path, $port
$app = Join-Path `
    (Get-ItemProperty 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\IISExpress\8.0' 'InstallPath').InstallPath `
    'iisexpress.exe'

Write-Host "Starting HTTP Server on port: '$port' and path: '$path'"
Start-Process $app -ArgumentList $args -WindowStyle Hidden