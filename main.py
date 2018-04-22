import logging
import sys

from pyspark import SparkConf, SparkContext, SQLContext

bucketName = "yelp-spam-detection"
reviewFileLocation = "gs://" + bucketName + "/output_merged.csv"

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

conf = SparkConf().setAppName('Text Preprocessing')
sc = SparkContext(conf=conf)
