# python code to extract review objects from Yelp JSON data
import json
import codecs
import unicodedata
import sys
import time

try:
	f = codecs.open('tmpNFvucr',mode='r',encoding='utf-8')
	lines = f.readlines()
	f3 = codecs.open('users.csv','w', encoding='utf-8')
	f3.write("user_id,"+"review_count,"+"average_stars,"+"votes1,"+"votes2,"+"votes3")
	f3.write('\n')
	for line in lines:
		obj = json.loads(line)
		if obj['type'] == "user":
			try:
				f3.write(obj['user_id']+',')
				f3.write(str(obj['review_count'])+',')
				f3.write(str(obj['average_stars'])+',')
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

	

	

	

