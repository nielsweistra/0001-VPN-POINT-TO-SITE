# Point-to-Site Gateway

<a href="https://raw.githubusercontent.com/nielsweistra/0001-VPN-POINT-TO-SITE/master/azuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="https://raw.githubusercontent.com/nielsweistra/0001-VPN-POINT-TO-SITE/master/azuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template creates a VNET with a Gateway subnet. It then creates a public IP which is used to create a VPN Gateway in the VNET. Finally it configures a DynamicRouting gateway with Point-to-Site configuration incluing VPN client address pool, client root certificates and revoked certificates and then creates the Gateway.

Modify parameters file to change default values.

Steps to deploy the template
1. Run the createcerts.ps1. It will create the root and client certificates
2. Export the publickey of the P2SRootCert
3. Open the azuredeploy.paramaters.json and copy/past the publickey into field clientRootCertData.
4. Modify parameters file to change default values.
5. Open Powershell and run deploy.ps1.

For example: deploy.ps1 -ResourcegroupName "vnetrg" -TemplateFile "azuredeploy.json" -TemplateParameterFile -Location "West Europe"
6. Verify the VPN is working. 