#!/bin/bash

# Define variables
RESOURCE_GROUP="MyResourceGroup"
VM_NAME="MyVM"

# Log in to Azure
az login

# Query the instance metadata
METADATA=$(az vm show --resource-group $RESOURCE_GROUP --name $VM_NAME --output json)

# Print the metadata
echo $METADATA