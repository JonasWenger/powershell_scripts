<#Link Detroyer Version1.0
By Jonas Wenger
#>
Write-Host "RelyonAG ver.1.0 by Jonas Wenger"
# Name of the link to delete
$lnk = "teamviewer host.lnk"

#search on Puplic Desktop

if (Test-Path $env:Public\desktop\$lnk)
{
Write-Host "$($lnk) Public link detected" -ForegroundColor Gray
Write-Host "try to delete lnk" -ForegroundColor Yellow
Get-ChildItem $env:Public\desktop\$lnk | ForEach-Object { Remove-Item $_}
    if (Test-Path $env:Public\desktop\$lnk)
    {
        Write-Host "$($lnk) not deleted an Error was detected" -ForegroundColor Red
    }    

            else    {
                        Write-Host "$($lnk) Deleted.." -ForegroundColor Green
                    }
}

#search on Private Desktop
else 
{
            Write-Host "$($ink) not on Puplic folder Detected"
            Write-Host "Try to find $($lnk) folder in $($env:USERPROFILE)"


                if (Test-Path $env:USERPROFILE\Desktop\$lnk)
                    {
                        Write-Host "$($lnk) on Private folder Detected" -ForegroundColor Gray
                        Write-Host "Try to Delete $($lnk)" -ForegroundColor Yellow
                        Get-ChildItem $env:USERPROFILE\desktop\$lnk | ForEach-Object { Remove-Item $_}
                            
                        if (Test-Path $env:USERPROFILE\desktop\$lnk)
                        {
                            Write-Host "$($lnk) not deleted an Error was detected" -ForegroundColor Red
                        }
                                    else 
                                    {
                                        Write-Host "$($lnk) Deleted.." -ForegroundColor Green
                                    }

                    }
            else 
            {
                Write-Host "$($lnk) not detected on Puplic or Private Desktop" -ForegroundColor Green
                Write-Host "Nothing to do" -ForegroundColor Yellow
            }
}
