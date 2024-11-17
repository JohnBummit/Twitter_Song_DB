# Define the correct path to the install_python.ps1 script
$scriptPath = "./for_new_ppl/install_python.ps1"

# Check if the script file exists
if (Test-Path $scriptPath) {
    Write-Output "Found $scriptPath. Running the script..."
    try {
        # Run the script
        & $scriptPath
    } catch {
        # Handle any errors during script execution
        Write-Error "An error occurred while running the script: $_"
    }
} else {
    # Error if the file is not found
    Write-Error "Error: $scriptPath not found! Please verify the file location."
}
