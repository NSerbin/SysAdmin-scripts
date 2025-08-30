#!/bin/bash

# Get the directory of the script
SCRIPT_DIR=$(dirname "$0")

# Directory to store the PEM files (same as the script directory)
PEM_DIR="$SCRIPT_DIR"

# List of instance names
instances=(
    ""
    ""
    ""
    ""
    ""
    ""
    ""
    ""
    ""
    ""
    ""
    ""
    ""
    ""
)

# Loop to create PEM files based on the instance names
for instance in "${instances[@]}"; do
    PEM_FILE="${PEM_DIR}/${instance}.pem"
    PUB_FILE="${PEM_DIR}/${instance}.pub"

    # Generate private key
    openssl genpkey -algorithm RSA -out $PEM_FILE -pkeyopt rsa_keygen_bits:2048
    chmod 400 $PEM_FILE
    
    # Retrieve public key
    ssh-keygen -y -f $PEM_FILE > $PUB_FILE
    
    echo "Created PEM file: $PEM_FILE"
    echo "Created Public Key file: $PUB_FILE"
done

echo "All PEM and Public Key files created and stored in $PEM_DIR"
