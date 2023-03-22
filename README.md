# terraform-sample

<p>
This is a sample project to create/manage Azure resources using azurerm version 3.48.0
</p>

The way we organize this project could be applied to a real big system.

The state file is stored in Azure blob storage, and we call it as <strong>backend state</strong>.

For each environemnt, we will have a corresponding config file in folder <i>environment</i> which define values for that evinronment.

To trigger deploy infrastructure by environemnt, run the command below

<blockquote>terraform apply -var-file="environment/{environment file name}.tfvars"</blockquote>

