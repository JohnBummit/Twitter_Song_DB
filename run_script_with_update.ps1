# Define paths to the scripts
$pythonScriptPath = "./for_new_ppl/install_python.ps1"
$gitScriptPath = "./for_new_ppl/install_git.ps1"

# Function to check and run a script if it exists
function Run-ScriptIfExists($scriptPath) {
    if (Test-Path $scriptPath) {
        Write-Output "Found $scriptPath. Running the script..."
        try {
            # Execute the script
            & $scriptPath
        } catch {
            # Handle errors during script execution
            Write-Error "An error occurred while running $scriptPath: $($_.Exception.Message)"
        }
    } else {
        # Log an error if the script does not exist
        Write-Error "Error: $scriptPath not found! Please verify the file location."
    }
}

# Run the Python installation script
Run-ScriptIfExists $pythonScriptPath

# Run the Git installation script
Run-ScriptIfExists $gitScriptPath

# Output completion message
Write-Output "All scripts have been processed. Check for any errors in the output above."
