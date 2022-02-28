#Venga Boy 01 (Jonas) was here

#Block Windows Update Button
#Block Windows Pause Update Button
#------------------------------------------------------------------
# Test if Value Exists
#Cleaning -----------
$regKeyPath = ''
$regValueName = ''
$regValueName2 = ''
$valueExists = ''
$valueExists2 = ''
$state = ''
$state2 = ''
#-------------------- 
#Header
Write-Host '##################' -ForegroundColor DarkGray
Write-Host '###>>' -ForegroundColor DarkGray -NoNewline
Write-Host 'relyonAG' -ForegroundColor Green -NoNewline
Write-host '<<###' -ForegroundColor DarkGray
Write-Host '##################' -ForegroundColor DarkGray
Write-Host ''
Write-Host 'Starting Execution... ' -ForegroundColor Magenta
Write-Host ''
#-----------------------------------------
# Variables
$regKeyPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate'
$regValueName = 'SetDisableUXWUAccess'
$regValueName2 = 'SetDisablePauseUXAccess'
$valueExists = (Get-Item $regKeyPath -EA Ignore).Property -contains $regValueName
$valueExists2 = (Get-Item $regKeyPath -EA Ignore).Property -contains $regValueName2
# End Variables
#------------------------------------------------------------------
# Start "if" Loop ...
if ($valueExists -match 'False') {
Write-host '|SetDisableUXWUAccess| Value does not Exist generating....' -ForegroundColor Yellow
#if(((Get-WmiObject Win32_OperatingSystem).ProductType -eq 1) -and ((Get-WmiObject Win32_OperatingSystem).Version.StartsWith("10.")))
#{
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -Name 'WindowsUpdate' -ErrorAction Ignore
    New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'AU' -ErrorAction Ignore
    Set-ItemProperty 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name "SetDisableUXWUAccess" -Value 1
 #   }
Write-Host '....Success' -ForegroundColor Green
}
if ($valueExists2 -match 'False') {
    Write-host '|SetDisablePauseUXAccess| Value does not Exist generating....' -ForegroundColor Yellow
    #if(((Get-WmiObject Win32_OperatingSystem).ProductType -eq 1) -and ((Get-WmiObject Win32_OperatingSystem).Version.StartsWith("10.")))
    #{
        New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -Name 'WindowsUpdate' -ErrorAction Ignore
        New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'AU' -ErrorAction Ignore
        Set-ItemProperty 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name "SetDisablePauseUXAccess" -Value 1
        #}
        Write-Host '....Success' -ForegroundColor Green
    }
if ($valueExists -match 'True') {
    $state = Get-ItemProperty 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name "SetDisableUXWUAccess"
        if ($state -match 0)
        {
            Set-ItemProperty 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name "SetDisableUXWUAccess" -Value 1
        Write-Host '|SetDisableUXWUAccess| Value is 0 setting it back to 1....' -ForegroundColor Yellow     
        }
    elseif ($state -match 1) {Write-Host '|SetDisableUXWUAccess| Value does Exist skipping' -ForegroundColor Green}
else {Write-host 'No State Detected |SetDisableUXWUAccess|' -ForegroundColor Red}
}
if ($valueExists2 -match 'True') {
    $state2 = Get-ItemProperty 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name "SetDisablePauseUXAccess"
    if ($state2 -match 0)
    {
        Set-ItemProperty 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name "SetDisablePauseUXAccess" -Value 1
    Write-Host '|SetDisablePauseUXAccess| Value is 0 setting it back to 1....' -ForegroundColor Yellow        
    }
elseif ($state2 -match 1) {Write-Host '|SetDisablePauseUXAccess| Value does Exist skipping' -ForegroundColor Green}
else {Write-host 'No State Detected |SetDisablePauseUXAccess|' -ForegroundColor Red}}
#end If Loop
<#debug
$debug = ' | ValueExists = ' + $valueExists + ' | valueExists2 = ' + $valueExists2 + ' | state = ' + $state + ' | state2 = ' + $state2
Write-Host '----------------------------- ##### Debug Output ##### ----------------------------' -ForegroundColor Blue
Write-Host $debug -ForegroundColor DarkCyan
Write-Host '----------------------------- ##### End-Debug ##### ----------------------------' -ForegroundColor Blue
#end-debug #>
Write-Host ''
Write-Host '>> Execute Check <<' -ForegroundColor Green
$valueExists = (Get-Item $regKeyPath -EA Ignore).Property -contains $regValueName
$valueExists2 = (Get-Item $regKeyPath -EA Ignore).Property -contains $regValueName2
Write-Host 'SetDisableUXWUAccess exists? | '
if ($valueExists -match 'True') {
Write-Host $valueExists -ForegroundColor Green
$state = Get-ItemProperty 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name "SetDisableUXWUAccess"}
elseif ($valueExists -match 'False'){
 Write-Host $valueExists -ForegroundColor Red 
}
Write-Host 'Value Key = '
if ($state -match 1) {
     Write-Host '1' -ForegroundColor Green
}
elseif ($state -match 0){
    Write-Host '0' -ForegroundColor Red
}
Write-Host 'SetDisablePauseUXAccess exists? | '
if ($valueExists2 -match 'True') {
    Write-Host $valueExists2 -ForegroundColor Green 
    $state2 = Get-ItemProperty 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name "SetDisablePauseUXAccess"}
    elseif ($valueExists2 -match 'False'){
     Write-Host $valueExists2 -ForegroundColor Red 
    }
    Write-Host 'Value Key = '
if ($state2 -match 1) {
     Write-Host '1' -ForegroundColor Green
}
elseif ($state2 -match 0){
    Write-Host '0' -ForegroundColor Red
}
Write-Host '>> Check Finished <<' -ForegroundColor Green