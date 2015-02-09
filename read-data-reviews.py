# python code to extract review objects from Yelp JSON data
import json
import codecs
import unicodedata
import sys
import time

try:
	f = codecs.open('tmpNFvucr',mode='r',encoding='utf-8')
	lines = f.readlines()
	f3 = codecs.open('reviews.csv','w', encoding='utf-8')
	f3.write("business_id,"+"user_id,"+"stars,"+"date,"+"votes1,"+"votes2,"+"votes3")
	f3.write('\n')
	for line in lines:
		obj = json.loads(line)
		if obj['type'] == "review":
			try:
				f3.write(obj['business_id']+',')
				f3.write(obj['user_id']+',')
				f3.write(str(obj['stars'])+',')
				f3.write(obj['date']+',')
				f3.write(str(obj['votes']['useful'])+',')
				f3.write(str(obj['votes']['funny'])+',')
				f3.write(str(obj['votes']['cool']))
				f3.write('\n')
			except UnicodeEncodeError, err:
				print 'ERROR:', err
				print json.dumps(obj,indent=2)
				break
	f3.close()
	f.close()
except IOError, err:
	print 'ERROR:', err

	

	

	

