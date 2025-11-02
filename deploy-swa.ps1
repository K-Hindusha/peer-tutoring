param(
    [Parameter(Mandatory=$true)]
    [string]$AppLocation,
    [Parameter(Mandatory=$true)]
    [string]$DeploymentToken,
    [Parameter(Mandatory=$true)]
    [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)]
    [string]$StaticWebAppName
)

Write-Host "Starting Static Web App Deployment..."

# 1. Check for and Install the Azure CLI Extension (Fixes 'deploy' is not recognized error)
Write-Host "1. Ensuring 'staticwebapp' Azure CLI extension is installed..."
try {
    # The --yes flag ensures no prompt is shown
    az extension add --name staticwebapp --yes --only-show-errors 
    Write-Host "   Extension check complete."
} catch {
    Write-Error "Failed to install 'staticwebapp' extension. Check Azure CLI installation."
    exit 1
}

# 2. Define and Log the Deployment Command (Token is masked in the log)
$AzCommand = "az staticwebapp deploy `
    --resource-group '$ResourceGroupName' `
    --name '$StaticWebAppName' `
    --app-location '$AppLocation' `
    --deployment-token '$DeploymentToken' `
    --output tsv"

Write-Host "2. Executing Deployment command (token is hidden):"
Write-Host "   az staticwebapp deploy --resource-group '$ResourceGroupName' --name '$StaticWebAppName' --app-location '$AppLocation' --deployment-token '***' --output tsv"

# 3. Execute the Command
try {
    # The 'Invoke-Expression' is required here because we are building the command line with splatting/backticks
    Invoke-Expression $AzCommand
    Write-Host "Deployment completed successfully!"
} catch {
    Write-Error "Deployment failed. Check the error details above."
    exit 1
}

exit 0
