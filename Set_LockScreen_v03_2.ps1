Set-ExecutionPolicy Unrestricted

$RegKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP"

$LockScreenPath = "LockScreenImagePath"
$LockScreenStatus = "LockScreenImageStatus"
$LockScreenUrl = "LockScreenImageUrl"

$StatusValue = 1
$LockScreenImageValue = "C:\temp\LockScreen\ornt_lockscreen_01_16-09-2024.jpg"  # Adjust afor new lock img

# Check if registry key exists
if (-not (Test-Path $RegKeyPath)) {
    New-Item -Path $RegKeyPath -Force | Out-Null
    New-ItemProperty -Path $RegKeyPath -Name $LockScreenStatus -Value $StatusValue -PropertyType DWORD -Force | Out-Null
    New-ItemProperty -Path $RegKeyPath -Name $LockScreenPath -Value $LockScreenImageValue -PropertyType STRING -Force | Out-Null
    New-ItemProperty -Path $RegKeyPath -Name $LockScreenUrl -Value $LockScreenImageValue -PropertyType STRING -Force | Out-Null
} else {
    Set-ItemProperty -Path $RegKeyPath -Name $LockScreenStatus -Value $StatusValue -Force | Out-Null
    Set-ItemProperty -Path $RegKeyPath -Name $LockScreenPath -Value $LockScreenImageValue -Force | Out-Null
    Set-ItemProperty -Path $RegKeyPath -Name $LockScreenUrl -Value $LockScreenImageValue -Force | Out-Null
}

Set-ExecutionPolicy Restricted
