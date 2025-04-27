#!/bin/bash

# Function to display usage information
function display_usage {
    echo "Usage: $0 [-h <host>] [-u <user>] [-P <port>] [-p <password>] [-d <database>] [-o <output_file>]"
    exit 1
}

# Initialize variables with default values
host=""
user=""
port=""
password=""
database=""
output_file=""

# Parse command-line arguments using getopts
while getopts ":h:u:P:p:d:o:" opt; do
    case $opt in
        h)
            host="$OPTARG"
            ;;
        u)
            user="$OPTARG"
            ;;
        P)
            port="$OPTARG"
            ;;
        p)
            password="$OPTARG"
            ;;
        d)
            database="$OPTARG"
            ;;
        o)
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
if [[ -z "$host" || -z "$user" || -z "$port" || -z "$password" ]]; then
    echo "Error: Missing required parameters."
    display_usage
fi

# Generate the MySQL dump using the provided parameters
command="mysqldump --host=$host --user=$user --port=$port"
if [[ -n "$password" ]]; then
    command+=" --password=$password"
fi

if [[ -n "$database" ]]; then
    command+=" $database"
fi

if [[ -n "$output_file" ]]; then
    command+=" > $output_file"
fi

eval "$command"

echo "MySQL dump generated successfully."
