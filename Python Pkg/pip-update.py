import sys

# Open and read the file
with open(sys.argv[1], 'r', encoding='utf-8') as file:
    # Skip the first two lines and store the rest
    vfile = file.readlines()[2:]

# Process each line and extract the substring before the first space
vfile_adj = [line.split(' ', 1)[0] for line in vfile]

# Write the adjusted lines to a new file
with open('.pip-adj.txt', 'w', encoding='utf-8') as new_file:
    new_file.writelines(line + '\n' for line in vfile_adj)
