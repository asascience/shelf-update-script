#!/usr/bin/env python

# coding: utf-8

# In[4]:

import csv
import json
import os
import time


# In[5]:
rig_loc_data = []
cwd = os.getcwd()
filename = cwd + '/ShelfRigLocations.csv'
print filename

updated = time.ctime(os.path.getmtime(filename))
print "created: %s" % time.ctime(os.path.getctime(filename))

json_data = {"rigs": []}
with open(filename, 'rU') as csvfile:
    csvreader = csv.reader(csvfile, delimiter=',', quotechar='|')
    for i, row in enumerate(csvreader):
        if i > 0 :
            item = {
              "dt": updated,
              "name": row[0],
              "coordinates": [row[1], row[2]]
            }
            json_data["rigs"].append(item)

print len(json_data["rigs"]), " Rigs"

new_filename = cwd + '/rig_locations.json'
with open(new_filename, 'w') as outfile:
    json.dump(json_data, outfile, indent=2)

print new_filename
