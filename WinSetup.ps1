##Get WinRM Configuration on Server
##  winrm get winrm/config

#WinRM - Set Basic Authentication
Set-Item -Path "WSMan:\localhost\Service\Auth\Basic" -Value $true

#WinRM - Check for CredSSP authentication
Enable-WSManCredSSP -role server -Force

#WinRM - Set Firewall Rules
# Configure firewall to allow WinRM HTTPS connections.
$fwtest1 = netsh advfirewall firewall show rule name="Allow WinRM HTTPS"
$fwtest2 = netsh advfirewall firewall show rule name="Allow WinRM HTTPS" profile=any
If ($fwtest1.count -lt 5)
{
    #Write-Verbose "Adding firewall rule to allow WinRM HTTPS."
    netsh advfirewall firewall add rule profile=any name="Allow WinRM HTTPS" dir=in localport=5986 protocol=TCP action=allow
    #Write-Log "Added firewall rule to allow WinRM HTTPS."
}
ElseIf (($fwtest1.count -ge 5) -and ($fwtest2.count -lt 5))
{
    #Write-Verbose "Updating firewall rule to allow WinRM HTTPS for any profile."
    netsh advfirewall firewall set rule name="Allow WinRM HTTPS" new profile=any
    #Write-Log "Updated firewall rule to allow WinRM HTTPS for any profile."
}

#WinRM - Allow http / Unencrypted
Set-Item -Path "WSMan:\localhost\Service\AllowUnencrypted" $true

#WinRM - Restart Service
#Restart-Service winrm



