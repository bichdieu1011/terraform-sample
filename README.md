# terraform-sample

<p>
This is a sample project to create/manage Azure resources
</p>
The way we organize this project could be applied to a real big system.

The state file is stored in Azure blob storage, and we call it as <strong>backend state</strong>.

To trigger deploy infrastructure by environemnt, run the command below

<quote>terraform apply -var-file="environment/{environment file name}>.tfvars"</quote>

