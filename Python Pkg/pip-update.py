# Pip-update.py
import sys

file = open(sys.argv[1],'r')

vfile = []
for i in file:
    vfile.append(i)

file.close()
vfile = vfile[2:]
vfile_adj = []

for i in vfile:
    index = 0
    while (i[index] != ' '):
        index = index + 1
    vfile_adj.append(i[:index])

new_file = open('.pip-adj.txt','w')
for i in vfile_adj:
    new_file.writelines(i)
    new_file.writelines('\n')

new_file.close()