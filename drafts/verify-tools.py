#!/usr/bin/env python3

import json
import shutil
import hashlib

my_path = "./"
tools_list = "drafts/tools-list.txt"
all_tools = {}

def find_file(the_tool):
    #print(the_tool, end='')
    return shutil.which(the_tool)

with open(tools_list, 'r', encoding='utf-8') as reader:
    # Read and print the entire file line by line
    line = reader.readline()
    while line != '': 
        if not line.startswith('#') and not line.startswith('\n'):
            tool = line.strip()
            h = hashlib.sha512(tool.encode('utf-8'))
            all_tools[tool] = {
                    "path": find_file(tool),
                    "sha256": h.hexdigest()
            }
        line = reader.readline()

print(json.dumps(all_tools, indent=4, sort_keys=True))
