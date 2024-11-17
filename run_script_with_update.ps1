# Path to the script you want to run
$scriptPath = "./for_new_ppl/introduction.ps1"

# Get the current execution policy
$originalPolicy = Get-ExecutionPolicy

# Check if the execution policy allows running scripts
if ($originalPolicy -eq "Restricted") {
    Write-Output "Current execution policy is Restricted. Changing to RemoteSigned temporarily..."
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force
} else {
    Write-Output "Execution policy is already set to $originalPolicy."
}

# Run the script
try {
    Write-Output "Running the script: $scriptPath"
    & $scriptPath
} catch {
    Write-Output "An error occurred while running the script: $_"
} finally {
    # Restore the original execution policy
    Write-Output "Restoring the original execution policy: $originalPolicy"
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy $originalPolicy -Force
}
