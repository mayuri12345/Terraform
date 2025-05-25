Terraform Lifecycle: Overview
The Terraform lifecycle refers to the step-by-step process of deploying infrastructure as code (IaC) using Terraform. It includes several stages:

terraform init

terraform plan

terraform apply

terraform destroy (optional for teardown)

🔍 Step-by-Step Breakdown
1. terraform init — Initialization Phase
This is the first command you should run in a new Terraform project.

✅ What it does under the hood:
Initializes the working directory (creates .terraform/)

Downloads required provider plugins (e.g., AWS, Azure, Google)

Checks and installs modules (if you're using any)

Configures backend (e.g., S3 for remote state, if defined)

Creates a .terraform.lock.hcl to pin provider versions

📂 Resulting Files:
.terraform/ directory (stores downloaded provider binaries)

.terraform.lock.hcl (provider version locking)

📌 Example Output:
diff
Copy
Edit
- Finding latest version of hashicorp/aws...
- Installing hashicorp/aws v5.98.0...
- Successfully installed...
2. terraform plan — Execution Plan Phase
Generates an execution plan showing what changes Terraform will make to your infrastructure.

✅ What it does:
Loads .tf configuration files

Reads current state from terraform.tfstate (or backend like S3)

Compares desired state (in .tf files) vs current state

Outputs a list of additions, changes, and deletions

📘 Why it's important:
It allows you to review changes before applying, ensuring that no unintended infrastructure changes are made.

3. terraform apply — Provisioning Phase
Actually executes the actions required to reach the desired state.

✅ What it does:
Reuses the plan from terraform plan or regenerates one

Prompts you for confirmation (unless -auto-approve is used)

Calls the cloud provider APIs (e.g., AWS EC2, S3) to:

Create new resources

Modify existing resources

Delete obsolete resources

Updates the terraform.tfstate file with the new state

4. terraform destroy — Teardown Phase
Destroys all the infrastructure defined in your Terraform configuration.

✅ What it does:
Compares current state with config

Generates a plan to delete all resources

Prompts for confirmation

Executes deletion and updates terraform.tfstate



Command	  Purpose	   Key                            Actions
terraform init	    Initialize project	                  Downloads providers, sets up backend
terraform plan	    Show execution plan	                  Compares desired and current state
terraform apply	    Apply the changes	                  Calls cloud APIs, provisions infrastructure
terraform destroy	Tear down infrastructure          Deletes resources and updates state
