#!/usr//bin/env python
# coding: utf8

import json
import string
import random
import mysql.connector
from pprint import pprint
from datetime import datetime

def main():

	with open('data.json') as data_file:
	    data = json.load(data_file)

	cnx = mysql.connector.connect(user='pasteque', password='pasteque',
	                              host='pasteque-db',
	                              database='pasteque')

	curA = cnx.cursor(buffered=True)
	query = ("SELECT REFERENCE FROM PRODUCTS")
	curA.execute(query)
	products = curA.fetchall()
	curB = cnx.cursor(buffered=True)
	query = ("SELECT REFERENCE FROM CATEGORIES")
	curB.execute(query)
	categories = curB.fetchall()



	for line in data:
		# if 'codification' in line and line['codification'] == 'GREE-33-GING':
		# 	import ipdb; ipdb.set_trace()
		if 'recuLe' in line and 'type' in line and line['type'] != u'coffret' and line['type'] != u'Coffret' and line['type'] != u'Valisette' and line['contenance'] in (33, 50, 75):
			print line
			print "Import de:"
			print "  Brasseur: %s" % line['brasserie']
			print "  Type: %s" % line['nomDeLaBire']
			print "  Prix achat: %s" % line['pu']
			print "  Quantité: %i" % line['nbreBouteilles']
			print "  Code: %s" % line['codification']
			sp = line['codification'].split('-')
			cat_ref = sp[0]
			category_id = get_category_id_from_reference(cnx, cat_ref)
			# if (line['codification'],) in stock:
			# 	add_product(cnx)
			save_in_db(cnx, line['brasserie'], line['nomDeLaBire'], line['pu'],line['nbreBouteilles'], line['codification'], line['contenance'], category_id)

	cnx.close()

def id_generator(size=32, chars=string.hexdigits[:16]):
	return ''.join(random.choice(chars) for _ in range(size))

def save_in_db(cnx, brasseur, type, price, quantity, reference, contenance, category_id):
	product_id = product_exists(cnx, reference)
	pricebuy = price
	if not product_id:
		name = u'Bière %s' % reference
		if contenance == 33:
			pricesell = 3
		if contenance == 50:
			pricesell = 3.75
		if contenance == 75:
			pricesell = 6.25
		product_id = add_product(cnx, reference, name, pricebuy, pricesell, category_id)
	add_mvt(cnx, product_id, quantity, pricebuy)

def add_product(cnx, reference, name, pricebuy, pricesell, category_id):
	product_id = id_generator()
	cur = cnx.cursor(buffered=True)
	query = "INSERT INTO PRODUCTS VALUES('%s','%s','',NULL,'%s',%f,%f,'%s',NULL,'%s',NULL,NULL,NULL,NULL,'','',NULL,0,0,0)" % (product_id, reference, name, pricebuy, pricesell, category_id, '004')
	print query
	cur.execute(query)
	cur = cnx.cursor(buffered=True)
        query = "INSERT INTO `PRODUCTS_CAT` VALUES ('%s',NULL)" % product_id
	cur.execute(query)
	cnx.commit()
	return product_id

def get_category_id_from_reference(cnx, reference):
	# import ipdb; ipdb.set_trace()
	print "Get category_id for %s" % reference
	cur = cnx.cursor(buffered=True)
	query = "SELECT ID FROM CATEGORIES WHERE REFERENCE='%s'" % reference
	cur.execute(query)
	return cur.fetchone()[0]

def product_exists(cnx, reference):
	cur = cnx.cursor(buffered=True)
	query = "SELECT ID FROM PRODUCTS WHERE REFERENCE='%s'" % reference
	cur.execute(query)
	if cur.rowcount:
		print "Reference %s already in base" % reference
		return cur.fetchone()[0]
	else:
		print "Reference %s not in base" % reference
		return False

def add_mvt(cnx, product_id, units, pricebuy):
	current_stock = get_current_stock(cnx, product_id)
	if current_stock != False:
		new_stock = current_stock + units
		update_stock(cnx, product_id, new_stock)
	else:
		new_stock = units
		insert_stock(cnx, product_id, new_stock)
	add_diary(cnx, product_id, new_stock, pricebuy)

def get_current_stock(cnx, product_id):
	cur = cnx.cursor(buffered=True)
	query = "SELECT UNITS FROM STOCKCURRENT WHERE PRODUCT='%s'" % product_id
	cur.execute(query)
	if cur.rowcount:
		print "Reference %s already in stock" % product_id
		return cur.fetchone()[0]
	else:
		print "Reference %s not in stock" % product_id
		return False

def update_stock(cnx, product_id, units):
	cur = cnx.cursor(buffered=True)
	query = "UPDATE STOCKCURRENT SET UNITS=%i WHERE PRODUCT='%s'" % (units,product_id)
	cur.execute(query)
	cnx.commit()
	return True

def insert_stock(cnx, product_id, units):
	cur = cnx.cursor(buffered=True)
	query = "INSERT INTO STOCKCURRENT VALUES (0,'%s',NULL, %i)" % (product_id, units)
	print query
	cur.execute(query)
	cnx.commit()
	return True

def add_diary(cnx, product_id, units, pricebuy):
	id = id_generator()
	cur = cnx.cursor(buffered=True)
	query = "INSERT INTO STOCKDIARY VALUES ('%s','%s',1,0,'%s',NULL,%i,%f)" % (id,datetime.now().strftime('%Y-%m-%d %H:%M:%S'),product_id,units,pricebuy)
	print query
	cur.execute(query)
	cnx.commit()
	return True

if __name__ == '__main__':
	main()
