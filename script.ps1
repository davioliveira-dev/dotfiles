# Disable all network adapters (Enable "Airplane Mode" effect)
Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | ForEach-Object { 
    Write-Host "Disabling adapter: $($_.Name)" 
    Disable-NetAdapter -Name $_.Name -Confirm:$false 
}

# Wait for 30 seconds
Start-Sleep -Seconds 30

# Enable all network adapters (Disable "Airplane Mode" effect)
Get-NetAdapter | Where-Object { $_.Status -eq "Disabled" } | ForEach-Object { 
    Write-Host "Enabling adapter: $($_.Name)" 
    Enable-NetAdapter -Name $_.Name -Confirm:$false 
}

Write-Host "Airplane Mode toggled successfully!"
