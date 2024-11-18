#Bypass exe

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process


# Define the URL for the Git installer
$gitDownloadUrl = "https://github.com/git-for-windows/git/releases/latest/download/Git-2.41.0-64-bit.exe"

# Set the path to download the installer
$installerPath = "$env:TEMP\GitInstaller.exe"

# Download the Git installer
Write-Host "Downloading Git installer..."
Invoke-WebRequest -Uri $gitDownloadUrl -OutFile $installerPath -UseBasicParsing
Write-Host "Download complete."

# Run the installer silently
Write-Host "Installing Git..."
Start-Process -FilePath $installerPath -ArgumentList "/SILENT" -Wait

# Remove the installer file
Remove-Item -Path $installerPath -Force

# Verify installation
Write-Host "Git installation completed. Checking version..."
git --version
