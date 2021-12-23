#!/usr/bin/env python3

import json
import shutil
import hashlib

tools_list = "tools-list.txt"
all_tools = {}
not_found = []

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
            hash = hashlib.sha512(tool.encode('utf-8'))
            path = find_file(tool)
            if path == null:
                not_found.append(tool)
            all_tools[tool] = {
                    "path": path,
                    "sha256": hash.hexdigest()
            }
        line = reader.readline()

write_json(all_tools)
print(json.dumps(all_tools, indent=4, sort_keys=True))

print('tools not found in path:')
print(not_found)
