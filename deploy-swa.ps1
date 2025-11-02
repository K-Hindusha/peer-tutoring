# deploy-swa.ps1
# Arguments:
# 1. Artifact Path (e.g., $(System.DefaultWorkingDirectory)/static-website)
# 2. Deployment Token (e.g., $(DeploymentTokenSecret))
# 3. Resource Group Name
# 4. Static Web App Name

$ArtifactPath = $args[0]
$Token = $args[1]
$ResourceGroup = $args[2]
$AppName = $args[3]

Write-Host "Starting Static Web App Deployment..."

az staticwebapp deploy `
  --app-location $ArtifactPath `
  --output-location "" `
  --deployment-token $Token `
  --no-wait `
  --resource-group $ResourceGroup `
  --name $AppName
