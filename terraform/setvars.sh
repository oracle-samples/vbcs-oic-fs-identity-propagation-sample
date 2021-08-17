#!/bin/sh
#    Copyright (c) 2021, Oracle and/or its affiliates.  
#    Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.



#Tenancy specifics
TF_VAR_tenancy_ocid=""; export TF_VAR_tenancy_ocid
TF_VAR_user_ocid=""; export TF_VAR_user_ocid
TF_VAR_fingerprint=""; export TF_VAR_fingerprint
TF_VAR_private_key_path=""; export TF_VAR_private_key_path
#OCI Region, such as us-phoenix-1
TF_VAR_region=""; export TF_VAR_region

#Comparment OCID for all created entities
TF_VAR_compartment_ocid=""; export TF_VAR_compartment_ocid
#Subnet OCID for function
TF_VAR_subnet_ocid=""; export TF_VAR_subnet_id

#Name prefix for all created entites
TF_VAR_name_prefix=""; export TF_VAR_name_prefix

#Registry specifics
TF_VAR_region_code=""; export TF_VAR_region_code
TF_VAR_tenancy_namespace=""; export TF_VAR_tenancy_namespace
TF_VAR_repos_name=""; export TF_VAR_repos_name

#Function configuration parameters
TF_VAR_debug_level="FINEST"; export TF_VAR_debug_level
TF_VAR_clientid=""; export TF_VAR_clientid
TF_VAR_audience="https://identity.oraclecloud.com/"; export TF_VAR_audience
TF_VAR_issuer_name=""; export TF_VAR_issuer_name
TF_VAR_key_file_name=""; export TF_VAR_key_file_name
TF_VAR_cert_file_name=""; export TF_VAR_cert_file_name

