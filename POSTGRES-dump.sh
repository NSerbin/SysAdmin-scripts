#!/bin/bash

# Function to display usage information
function display_usage {
    echo "Usage: $0 [-h <host>] [-U <user>] [-p <port>] [-d <database>] [-f <output_file>]"
    exit 1
}

# Initialize variables with default values
host=""
user=""
port=""
database=""
output_file=""

# Parse command-line arguments using getopts
while getopts ":h:U:p:d:f:" opt; do
    case $opt in
        h)
            host="$OPTARG"
            ;;
        U)
            user="$OPTARG"
            ;;
        p)
            port="$OPTARG"
            ;;
        d)
            database="$OPTARG"
            ;;
        f)
            output_file="$OPTARG"
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            display_usage
            ;;
        :)
            echo "Option -$OPTARG requires an argument."
            display_usage
            ;;
    esac
done

# Check if mandatory parameters are provided
if [[ -z "$host" || -z "$user" || -z "$port" ]]; then
    echo "Error: Missing required parameters."
    display_usage
fi

# Generate the PostgreSQL dump using the provided parameters
command="pg_dump --host=$host --username=$user --port=$port"
if [[ -n "$database" ]]; then
    command+=" --dbname=$database"
fi

if [[ -n "$output_file" ]]; then
    command+=" --file=$output_file"
fi

eval "$command"

echo "PostgreSQL dump generated successfully."
