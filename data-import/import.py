#!/usr//bin/env python
# coding: utf8

import json
from pprint import pprint

with open('data.json') as data_file:
    data = json.load(data_file)

for line in data:
	if 'achetLe' in line and 'type' in line and line['type'] != u'coffret':
		#pprint(line['type'])
		print "Import de:"
		print "  Brasseur: %s" % line['brasserie']
		print "  Type: %s" % line['nomDeLaBire']
		print "  Prix achat: %s" % line['pu']
		print "  Quantité: %i" % (int(line['nbreCartons']) * int(line['parCarton']))
