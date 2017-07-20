Login-AzureRmAccount

New-AzureRmResourceGroup -Name ExampleResourceGroup -Location "West Europe"
New-AzureRmResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName ExampleResourceGroup -TemplateFile azuredeploy.json -TemplateParameterFile azuredeploy.parameters.json 