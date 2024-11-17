# Define the paths to the scripts
$pythonScriptPath = "./for_new_ppl/install_python.ps1"
$gitScriptPath = "./for_new_ppl/install_git.ps1"

# Function to check and run a script
function Run-ScriptIfExists($scriptPath) {
    if (Test-Path $scriptPath) {
        Write-Output "Found $scriptPath. Running the script..."
        try {
            # Run the script
            & $scriptPath
        } catch {
            # Handle errors during script execution
            Write-Error "An error occurred while running $scriptPath: $_"
        }
    } else {
        # Error if the file is not found
        Write-Error "Error: $scriptPath not found! Please verify the file location."
    }
}

# Run the Python installation script
Run-ScriptIfExists $pythonScriptPath

# Run the Git installation script
Run-ScriptIfExists $gitScriptPath
