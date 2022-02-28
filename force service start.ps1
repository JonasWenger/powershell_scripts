Param(
    [Parameter(Mandatory=$true)]
    [string[]]
    $ServiceName
)
$arrService = Get-Service -Name $ServiceName

if ($arrService.Status -ne 'Running'){
$ServiceStarted = $false}
Else{$ServiceStarted = $true}

while ($ServiceStarted -ne $true){
Start-Service $ServiceName
write-host $arrService.status
write-host 'Service started'
Start-Sleep -seconds 60
$arrService = Get-Service -Name $ServiceName
if ($arrService.Status -eq 'Running'){
$ServiceStarted = $true}
}