
import pandas as pd
import csv
import json
import requests
import time
import glob
from datetime import date, datetime, timedelta
from json import dumps
from elasticsearch import helpers, Elasticsearch
from multiprocessing import Process,freeze_support
import logging
import sys
logging.basicConfig(stream=sys.stdout, level=logging.INFO
)


# Create con
ES_HOST = '10.10.10.116'  # Elasticsearch host
ES_PORT = 9200            # Elasticsearch port
FILE_PATH = 'multidatatype.csv' # Input file path
ES_INDEX = 'test'               # Index name
ES_DOCTYPE = '_doc'             # Es doctype

es = Elasticsearch([{'host':  ES_HOST, 'port' : ES_PORT}])

#Test con
con_test = requests.get('http://{}:{}/'.format(ES_HOST, ES_PORT))
logging.info(con_test.content)

#Process list
processes = []

#JSON serializer for objects not serializable by default json code(date)
def json_serial(obj):
    if isinstance(obj, (datetime, date)):
        return obj.isoformat()

#Dump doc to ES    
def func(csvFileName, index, doc_type):
    #print(csvFileName)
    with open(csvFileName, 'r', encoding='utf-8') as csvFile:
        reader = csv.DictReader(csvFile)
        # for row in reader:
            #es.index(index, doc_type='my-type', body=json.dumps({'TagName':row['TagName'],
             #                                                    'TimeStamp': datetime.today() - timedelta(hours=2),
              #                                                    'Value': float(row['Value'])},
               #                                                    default=json_serial)) 
        helpers.bulk(es, reader, index=ES_INDEX, doc_type=ES_DOCTYPE)
