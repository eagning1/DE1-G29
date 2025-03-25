ystem and install required dependencies
sudo apt update -y
sudo apt install -y openjdk-8-jdk wget curl

# Install Spark
SPARK_VERSION="3.1.2"
HADOOP_VERSION="3.2"
SPARK_HOME="/home/ubuntu/spark"

# Download and extract Spark if not already done
if [ ! -d "$SPARK_HOME" ]; then
    echo "Downloading Spark..."
    wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
    tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
    sudo mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} ${SPARK_HOME}
    rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
fi

# Set environment variables for Spark
echo "Setting up Spark environment variables"
echo "export SPARK_HOME=${SPARK_HOME}" >> ~/.bashrc
echo "export PATH=\$SPARK_HOME/bin:\$PATH" >> ~/.bashrc
echo "export SPARK_WORKER_MEMORY=8g" >> ~/.bashrc
echo "export SPARK_WORKER_CORES=4" >> ~/.bashrc
echo "export PYSPARK_PYTHON=python3" >> ~/.bashrc
source ~/.bashrc

# Configure Spark worker to connect to the master node
MASTER_IP="130.238.27.217"
WORKER_IP=$(hostname -I | awk '{print $1}')

echo "Setting Spark worker to connect to master node ${MASTER_IP}..."
# Configure Spark to use the master node and worker settings
echo "spark.master=spark://$MASTER_IP:7077" > $SPARK_HOME/conf/spark-defaults.conf
echo "spark.worker.memory=8g" >> $SPARK_HOME/conf/spark-defaults.conf
echo "spark.worker.cores=4" >> $SPARK_HOME/conf/spark-defaults.conf

# Start the Spark worker
echo "Starting Spark worker..."
$SPARK_HOME/sbin/start-worker.sh spark://$MASTER_IP:7077

# Print status of the Spark worker
echo "Spark worker is running on IP: $WORKER_IP"

