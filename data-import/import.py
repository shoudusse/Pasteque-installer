#!/usr//bin/env python
# coding: utf8

import json
import mysql.connector
from pprint import pprint

def main():

	with open('data.json') as data_file:
	    data = json.load(data_file)

	cnx = mysql.connector.connect(user='pasteque', password='pasteque',
	                              host='pasteque-db',
	                              database='pasteque')

	curA = cnx.cursor(buffered=True)
	query = ("SELECT REFERENCE FROM PRODUCTS")
	curA.execute(query)
	stock = curA.fetchall()

	from pprint import pprint; import ipdb; ipdb.set_trace()

	for line in data:
		if 'achetLe' in line and 'type' in line and line['type'] != u'coffret' and line['type'] != u'Coffret':
			#pprint(line['type'])
			print "Import de:"
			print "  Brasseur: %s" % line['brasserie']
			print "  Type: %s" % line['nomDeLaBire']
			print "  Prix achat: %s" % line['pu']
			print "  Quantité: %i" % (int(line['nbreCartons']) * int(line['parCarton']))
			print "  Code: %s" % line['codification']
			if (line['codification'],) in stock
				add_product()
			save_in_db(cnx, line['brasserie'], line['nomDeLaBire'], line['pu'], int(line['nbreCartons']) * int(line['parCarton']), line['codification'])

	cnx.close()

def save_in_db(cnx, brasseur, type, price, quantity, codification):
	return True

if __name__ == '__main__':
	main()