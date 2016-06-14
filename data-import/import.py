#!/usr//bin/env python
# coding: utf8

import json
import mysql.connector
from pprint import pprint

def main():

	with open('data.json') as data_file:
	    data = json.load(data_file)

	cnx = mysql.connector.connect(user='pasteque', password='pasteque',
	                              host='pasteque.escale-biere.com',
	                              database='pasteque')

	curA = cnx.cursor(buffered=True)
	query = ("SELECT REFERENCE FROM PRODUCTS")
	curA.execute(query)
	stock = curA.fetchall()
	curB = cnx.cursor(buffered=True)
	query = ("SELECT REFERENCE FROM CATEGORIES")
	curB.execute(query)
	categories = curB.fetchall()



	for line in data:
		if 'achetLe' in line and 'type' in line and line['type'] != u'coffret' and line['type'] != u'Coffret':
			#pprint(line['type'])
			print "Import de:"
			print "  Brasseur: %s" % line['brasserie']
			print "  Type: %s" % line['nomDeLaBire']
			print "  Prix achat: %s" % line['pu']
			print "  Quantité: %i" % (int(line['nbreCartons']) * int(line['parCarton']))
			print "  Code: %s" % line['codification']
			sp = line['codification'].split('-')
			cat_ref = sp[0]
			category_id = get_category_id_from_reference(cnx, cat_ref)
			# if (line['codification'],) in stock:
			# 	add_product(cnx)
			save_in_db(cnx, line['brasserie'], line['nomDeLaBire'], line['pu'], int(line['nbreCartons']) * int(line['parCarton']), line['codification'])
			import ipdb; ipdb.set_trace()

	cnx.close()

def save_in_db(cnx, brasseur, type, price, quantity, codification):
	return True

def add_product(cnx):
	return True

def get_category_id_from_reference(cnx, reference):
	cur = cnx.cursor(buffered=True)
	query = ("SELECT ID FROM CATEGORIES WHERE REFERENCE='%s'" % reference)
	cur.execute(query)
	return cur.fetchone()[0]

if __name__ == '__main__':
	main()