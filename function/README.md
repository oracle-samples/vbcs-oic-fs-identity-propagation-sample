# jwt_assertion Function



## Installation Pre-Requirements

1. Maven 3.6.0, or higher
2. Java SDK 11 
3. Terraform 0.13.5+ and the OCI Terraform Provider 4.5.0+
4. Oracle Functions SDK and that the user has followed the [Oracle Functions Quickstart](https://www.oracle.com/webfolder/technetwork/tutorials/infographics/oci_faas_gettingstarted_quickview/functions_quickview_top/functions_quickview/index.html) and deployed, and executed, a simple *HelloWorld* function.
5. An Oracle SaaS Subscription. The current example code uses [Oracle Sales Cloud](https://www.oracle.com/applications/customer-experience/sales/sales-force-automation.html)(CRM) and assumes users are able to query/edit Sales Cloud Opportunities
6. Oracle OCI Subscription with access to Functions, Image Repository and Key Management Services.
7. Install the OCI [Command Line Interface (CLI)](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/cliconcepts.htm).
8. Administrative access to the[Oracle Identity Cloud Service](https://www.oracle.com/cloud/security/cloud-services/identity-cloud.html)(IDCS) instance associated with Oracle Fusion Applications
9. An x509 certificate to identify the function as a Trusted Application in IDCS.  For testing purposes, this can be a self-signed certificate.
10. A VCN and public subnet for deploying functions.

## Configure Oracle IDCS 

For the solution to work we need to create a Trusted Application within Oracle Identity Cloud Service(IDCS). This must be the same Identity Management Service instance which is associated with Oracle Fusion otherwise the tokens issued by IDCS wont be acceptable by Oracle Fusion SaaS. 

The Trusted Application in this instance represents the Function, which will request an access token to SaaS on behalf of the user entity that invokes the Integration in OIC.

1. Navigate to your Identity Management Console and create a new *application*

2. On the Details page, only the name field need be filled in.
   
3. Within the client Configuration page, Client Configuration tab, ensure:

   * Allowed grant types include "*JWT Assertion*" and "*Refresh Token*"

   * Select Client Type of Trusted and import the Public key for the certificate to be used to identify the function
     
   * Within Token Issuance Policy,  click Specific and click the "Add Scope" button and the scope from the "Oracle Applications Cloud(Fusion)" application. 
     
     Hint: It will be called something like "urn:opc:resource:consumer::all"
     
     The resulting scope name displayed(combined) will be something like ```urn:opc:resource:fa:instanceid=1234567urn:opc:resource:consumer::all```    
     
     ​     ![1578659781146](../docs/images/IDCSClientConfig.png)


​     
   * Save and Activate the IDCS confidential application
     
     
     

## Deploying the code
### Configure Security policies for Oracle Functions and Key Management

#### Configure Security Policies for Functions Deployment

Instructions for setting up security policies for the deployment, and execution, of Oracle Functions can be found in the Oracle Functions getting started guide. We recommend the user follows the Oracle Functions quick-start before continuing.

#### Configure Security Policies for KMS Access

The Following IAM Security Policies need to be setup

| Policy Type | Policy         | Usage |
| ----------- | -------------- | ----- |
| Dynamic Group called "FN_DYN_GRP" | ALL {resource.type='fnfunc', resource.compartment.id='<**YOUR_COMPARTMENT_OCID**>'} | Dynamically defines all Function instances within the given compartment |
| Policy         | Allow dynamic-group **FN_DYN_GRP** to manage vaults in compartment <**YOUR_COMPARTMENT_NAME**> | Allow access the KMS Vaults |
| Policy         | Allow dynamic-group **FN_DYN_GRP** to manage keys in compartment <**YOUR_COMPARTMENT_NAME**> | Allow access the keys in KMS |
| Policy         | Allow dynamic-group **FN_DYN_GRP** to manage key-delegate in compartment <**YOUR_COMPARTMENT_NAME**> | Allow access the key delegates in KMS |

### Deploying the code using Terraform

A Terraform script is provided that creates the required Function, Vault, etc. The pre-requisites to running the script is to build the function code and push it to the OCIR repository and create a compartment and subnet for the function resources to reside in.

#### Deploy Functions

**IMPORTANT :** Ensure you have the Oracle Functions SDK installed, configured and you have successfully deployed a sample function. For more information refer to the [Oracle Functions quickstart](https://www.oracle.com/webfolder/technetwork/tutorials/infographics/oci_faas_gettingstarted_quickview/functions_quickview_top/functions_quickview/index.html)

1. Compile the source and push the image to the repository.

   - Navigate to the *function* directory
   - Ensure your FN CLI Context is setup correctly [](https://docs.oracle.com/en-us/iaas/Content/Functions/Tasks/functionscreatefncontext.htm#Create_an_Fn_Project_CLI_Context_to_Connect_to_Oracle_Cloud_Infrastructure)
   - Execute fn build to build the function source into a container
   - Execute fn push to upload the function container to the OCI registry

#### Run the Terraform script

The script will create all the required OCI resources needed.  However, prior to executing the script a shell script needs to be created with all of the required details for your OCI environment.

1. Edit the setvars.sh script, setting the following values:

| Variable name            | Required value                                               |
| ------------------------ | ------------------------------------------------------------ |
| TF_VAR_tenancy_ocid      | OCID for your OCI tenancy                                    |
| TF_VAR_user_ocid         | OCID of your user ID                                         |
| TF_VAR_fingerprint       | Private key fingerprint                                      |
| TF_VAR_private_key_path  | Path to your private key                                     |
| TF_VAR_region            | OCI region where the resources will be created               |
| TF_VAR_compartment_ocid  | OCID for the compartment where the resources will be created |
| TF_VAR_subnet_ocid       | OCID for the subnet where the function will be created       |
| TF_VAR_name_prefix       | Prefix used for the names of all resources created to allow running this script multiple times in the same compartment with different names. |
| TF_VAR_region_code       | Oracle Registry region code, should be equivalent to region above |
| TF_VAR_tenancy_namespace | The namespace for your tenancy                               |
| TF_VAR_repos_name        | The name of the OCIR repository for pushing functions        |
| TF_VAR_debug_level       | Can be FINE,FINEST,INFO                                      |
|                          |                                                              |
| TF_VAR_audience          | OAuth Token audience claim value.  Typically "https://identity.oraclecloud.com/" for IDCS |
| TF_VAR_issuer_name       | OAuth Token issuer claim value.  This should be the client ID of the Trusted application created above. |
| TF_VAR_key_file_name     | The private key to be used to sign JWT Assertion requests from the Trusted Application |
| TF_VAR_cert_file_name    | The public certificate key associated to the private key to be used by the Trusted Application |

2. Run terraform init, if it hasn't previously been run in this directory
3. Run terraform plan. This will validate the script and show what changes will be applied, but won't actually apply them.
4. Run terraform apply to apply those changes and create the required resources.

## Testing
### Check that the Function works with Sample input

From your command line execute the following command 

```shell
oci fn function invoke --function-id <function_ocid> --file "-" --body '{"principal":"<test_userid>", "scopes": ["<scope_name>"]}'

```

If all is working you should get output similar to the following:

```
{"assertion":"grant_type=urn%3Aietf%3Aparams%3Aoauth%3Agrant-type%3Ajwt-bearer&assertion=eyJ4NXQjUzI1NiI6IjlWbHBRcnoxX1I3NmI1Y2U1c0NUeG1ocUkwTzh5SS1vLW9DbHR4ZU5VNkUiLCJraWQiOiJ0ZXN0S2V5IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJtaWtlLm11bGxlckBvcmFjbGUuY29tIiwiYXVkIjoiaHR0cHM6XC9cL2lkZW50aXR5Lm9yYWNsZWNsb3VkLmNvbVwvIiwiaXNzIjoiN2YzZDUyZjZkMGVhNDllY2JhZmFkNDI5YTY0MTRiMzYiLCJleHAiOjE2MTc5ODE2MzksImlhdCI6MTYxNzk3ODAzOSwianRpIjoiOWE5NTYyYmItZDEwOC00NWRmLTk4NTEtZjRmZDdhOGZkZWYxIn0.bHwGpQ7vmJkBeBce2kUnAeBG9-iFD063lH5Lc8jaB3r71s20YKeWWviDP6BtaXqygZkrXJmAERpwY38GI2rZr8KS5fEpivmaTCGqdnlk2B_7l6T4MR3d2tFb6aEqzSbDv7zw3eKDZGWlTI8KP3J_mCxXmUbgfRwt0hhLdDur_CDFh6HGexRfIk0P21oMJPkgrL7L2xpMKL1ECcTOT_xV8oivtvv69MTczgGMAaDBtj8TjBlv49LFgXPeIQDWicEG2e-5GXkTyjGEFhuGgi-0qUSjXXa_nj8JXiqUtgomZ3GS9GK867NWycrU59UWu-ssumPn5FLod7EsLNRVgwfBKg&client_id=7f3d52f6d0ea49ecbafad429a6414b36&client_assertion_type=urn%3Aietf%3Aparams%3Aoauth%3Aclient-assertion-type%3Ajwt-bearer&client_assertion=eyJ4NXQjUzI1NiI6IjlWbHBRcnoxX1I3NmI1Y2U1c0NUeG1ocUkwTzh5SS1vLW9DbHR4ZU5VNkUiLCJraWQiOiJ0ZXN0S2V5IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiI3ZjNkNTJmNmQwZWE0OWVjYmFmYWQ0MjlhNjQxNGIzNiIsImF1ZCI6Imh0dHBzOlwvXC9pZGVudGl0eS5vcmFjbGVjbG91ZC5jb21cLyIsImlzcyI6IjdmM2Q1MmY2ZDBlYTQ5ZWNiYWZhZDQyOWE2NDE0YjM2IiwiZXhwIjoxNjE3OTgxNjM5LCJpYXQiOjE2MTc5NzgwMzksImp0aSI6Ijg1MjQyNzg2LWE3ZDAtNDFlNi05YTYxLTdjMTEzNWNkZTI2OCJ9.hyZASm4WmA2Pu-wmTQ4No2MWnZnGHn-iMp1ycjkGuo5d11OLWFR1TRhUICFbXWmAZoN3T0zpK91XaSvEd_tIjqm2YtEqwJhMPKOQSd06G7R54i8TnfKat5G9V_oPmpZj-QH5BtajfMywnnl0quP4Ot8tM0smod0evsFU0bVhb_Qcvz4bzFMYZwGjHcy15tkgqnMPOgUvPrKMllMtB5XB7Gx4_S8mG11jxpmDVYvF_EM7rPjgeq3Od2MMVdBvQLAdulkwDCOLv-Z5OA9KhlDvxHdsoay8Hz59t3c0F7JTOIhfOYhiACuZxyVv0ovIvr2gnvqSIEn_CEY9xt-_eUii7Q&scope=urn:opc:resource:fa:instanceid=616273568urn:opc:resource:consumer::all"}
```



Copyright(c) 2021, Oracle and/or its affiliates.  
Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.




