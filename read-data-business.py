# python code to extract review objects from Yelp JSON data
import json
import codecs
import unicodedata
import sys
import time

try:
	f = codecs.open('tmpNFvucr',mode='r',encoding='utf-8')
	lines = f.readlines()
	f3 = codecs.open('business.txt','w', encoding='utf-8')
	f3.write("business_id~"+"name~"+"stars~"+"review_count~"+"categories~"+"open")
	f3.write('\n')
	for line in lines:
		obj = json.loads(line)
		if obj['type'] == "business":
			try:
				f3.write(obj['business_id']+'~')
				f3.write(obj['name']+'~')
				f3.write(str(obj['stars'])+'~')
				f3.write(str(obj['review_count'])+'~')
				for c in obj['categories']:
					f3.write(str(c)+';')
				f3.write('~'+str(obj['open']))
				f3.write('\n')
			except UnicodeEncodeError, err:
				print 'ERROR:', err
				print json.dumps(obj,indent=2)
				break
	f3.close()
	f.close()
except IOError, err:
	print 'ERROR:', err

	

	

	

