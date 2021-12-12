#!/usr/bin/env python3

import json
import shutil
import hashlib

tools_list = "tools-list.txt"
all_tools = {}

def find_file(the_tool):
    return shutil.which(the_tool)

def write_json(my_data):
    with open("all_tools.json", "w") as write_file:
        json.dump(my_data, write_file)

with open(tools_list, 'r', encoding='utf-8') as reader:
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

write_json(all_tools)
print(json.dumps(all_tools, indent=4, sort_keys=True))

