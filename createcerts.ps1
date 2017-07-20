#Create Root certificate
$cert = New-SelfSignedCertificate -Type Custom -KeySpec Signature `
-Subject "CN=P2SRootCert" -KeyExportPolicy Exportable `
-HashAlgorithm sha256 -KeyLength 2048 `
-CertStoreLocation "Cert:\CurrentUser\My" -KeyUsageProperty Sign -KeyUsage CertSign

#Export the public key (.cer)
#
#Point-to-Site connections require the certificate public key .cer file (not the private key) to be uploaded to Azure. The following steps help you export the .cer file for your self-signed root certificate:
#To obtain a .cer file from the certificate, open Manage user certificates. Locate the self-signed root certificate, typically in 'Certificates - Current User\Personal\Certificates', and right-click. Click All Tasks, and then click Export. This opens the Certificate Export Wizard.
#In the Wizard, click Next. Select No, do not export the private key, and then click Next.
#n the Export File Format page, select Base-64 encoded X.509 (.CER)., and then click Next.
#On the File to Export, Browse to the location to which you want to export the certificate. For File name, name the certificate file. Then, click Next.
#Click Finish to export the certificate. You see The export was successful. Click OK to close the wizard.
#Open the exported publickey and copy the key into your parametersfile.

#Create Child
New-SelfSignedCertificate -Type Custom -KeySpec Signature `
-Subject "CN=P2SChildCert" -KeyExportPolicy Exportable `
-HashAlgorithm sha256 -KeyLength 2048 `
-CertStoreLocation "Cert:\CurrentUser\My" `
-Signer $cert -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.2")

#Export a client certificate
#When you generate a client certificate, it's automatically installed on the computer that you used to generate it. If you want to install the client certificate on another client computer, you need to export the client certificate that you generated.
#To export a client certificate, open Manage user certificates. The client certificates that you generated are, by default, located in 'Certificates - Current User\Personal\Certificates'. Right-click the client certificate that you want to export, click all tasks, and then click Export to open the Certificate Export Wizard.
#In the Wizard, click Next, then select Yes, export the private key, and then click Next.
#On the Export File Format page, leave the defaults selected. Make sure that Include all certificates in the certification path if possible is selected. Selecting this also exports the root certificate information that is required for successful authentication. Then, click Next.
#On the Security page, you must protect the private key. If you select to use a password, make sure to record or remember the password that you set for this certificate. Then, click Next.
#On the File to Export, Browse to the location to which you want to export the certificate. For File name, name the certificate file. Then, click Next.
#Click Finish to export the certificate.

#Install an exported client certificate
#If you want to create a P2S connection from a client computer other than the one you used to generate the client certificates, you need to install a client certificate. When installing a client certificate, you need the password that was created when the client certificate was exported.
#Locate and copy the .pfx file to the client computer. On the client computer, double-click the .pfx file to install. Leave the Store Location as Current User, and then click Next.
#On the File to import page, don't make any changes. Click Next.
#On the Private key protection page, input the password for the certificate, or verify that the security principal is correct, then click Next.
#On the Certificate Store page, leave the default location, and then click Next.
#Click Finish. On the Security Warning for the certificate installation, click Yes. You can feel comfortable clicking 'Yes' because you generated the certificate. The certificate is now successfully imported.