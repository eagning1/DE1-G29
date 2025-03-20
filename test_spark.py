from pyspark.sql import SparkSession

# Initialize Spark session
spark = SparkSession.builder \
    .master("spark://192.168.2.205:7077") \
    .appName("SparkWorkerTest") \
    .getOrCreate()

# Create a dummy RDD
data = [("Alice", 1), ("Bob", 2), ("Charlie", 3)]
rdd = spark.sparkContext.parallelize(data)

# Perform a simple transformation (map)
mapped_rdd = rdd.map(lambda x: (x[0], x[1] * 2))

# Perform an action (collect)
result = mapped_rdd.collect()

# Print the results
print("Test results from Spark workers:")
for item in result:
    print(item)

# Stop the Spark session
spark.stop()

