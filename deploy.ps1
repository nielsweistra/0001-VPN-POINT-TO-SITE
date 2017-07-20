Param(
  [string]$ResourceGroupName,
  [string]$TemplateFile,
  [string]$TemplateParameterFile,
  [string]$Location

)

$UnixTimeStamp = [DateTimeOffset]::Now.ToUnixTimeSeconds()

Login-AzureRmAccount

New-AzureRmResourceGroup -Name $ResourceGroupName -Location $Location
New-AzureRmResourceGroupDeployment -Name $UnixTimeStamp -ResourceGroupName $ResourceGroupName -TemplateFile $TemplateFile -TemplateParameterFile $TemplateParameterFile 