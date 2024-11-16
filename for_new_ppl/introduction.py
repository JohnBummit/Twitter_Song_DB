# Ensure the script is running as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Please run this script as Administrator." -ForegroundColor Red
    exit 1
}

# Step 1: Install Python
Write-Host "Installing Python..."
if (-not (Test-Path "./install_python.ps1")) {
    Write-Host "Error: install_python.ps1 not found!" -ForegroundColor Red
    exit 1
}
.\install_python.ps1

# Step 2: Install Git
Write-Host "Installing Git..."
if (-not (Test-Path "./install_git.ps1")) {
    Write-Host "Error: install_git.ps1 not found!" -ForegroundColor Red
    exit 1
}
.\install_git.ps1

# Step 3: Set up Git remote
Write-Host "Configuring Git remote..."
git --version > $null 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Git is not installed or not found in PATH." -ForegroundColor Red
    exit 1
}

# Add the Git remote and fetch
git remote add origin https://github.com/JohnBummit/Twitter_Song_DB.git
git fetch origin

#install packages
pip install Flask requests pandas numpy


Write-Host "Setup completed successfully!" -ForegroundColor Green
