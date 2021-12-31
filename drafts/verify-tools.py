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
            the_tool = line.strip()
            the_hash = hashlib.sha512(the_tool.encode('utf-8'))
            the_path = find_file(the_tool)
            if the_path is None:
                not_found.append(the_tool)
            all_tools[the_tool] = {
                    "path": the_path,
                    "sha256": the_hash.hexdigest()
            }
        line = reader.readline()

write_json(all_tools)

print('Tools not found in path:')
print(not_found)

print('More details:')
print(json.dumps(all_tools, indent=4, sort_keys=True))


