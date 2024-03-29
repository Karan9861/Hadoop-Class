# HIVE
cd course/softwares
wget https://apache.osuosl.org/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz
tar -xzf apache-hive-3.1.2-bin.tar.gz
mv apache-hive-3.1.2-bin hive


#############
rm -r hive
rm apac

#############

nano ~/.bashrc
export HIVE_HOME=$HOME/course/softwares/hive
export PATH=$PATH:$HIVE_HOME/sbin:$HIVE_HOME/bin
export CLASSPATH=$CLASSPATH:$HADOOP_HOME/lib/*:$HIVE_HOME/lib/*
source ~/.bashrc

cd $HIVE_HOME/conf
nano hive-env.sh
export HADOOP_HOME=$HOME/course/softwares/hadoop-3.3.4

# Metastore - Apache Derby configuration
cd course/softwares
wget http://archive.apache.org/dist/db/derby/db-derby-10.4.2.0/db-derby-10.4.2.0-bin.tar.gz
tar zxvf db-derby-10.4.2.0-bin.tar.gz
mv db-derby-10.4.2.0-bin derby

nano ~/.bashrc
export DERBY_HOME=$HOME/course/softwares/derby
export PATH=$PATH:$DERBY_HOME/bin
export CLASSPATH=$CLASSPATH:$DERBY_HOME/lib/derby.jar:$DERBY_HOME/lib/derbytools.jar
source ~/.bashrc

mkdir $DERBY_HOME/data

# Configure Derby for Hive
cd $HIVE_HOME/conf
nano hive-site.xml
<configuration>

   <property>
   	<name>javax.jdo.option.ConnectionURL</name>
   	<value>jdbc:derby:;databaseName=metastore_db;create=true</value>
    <description>JDBC connect string for a JDBC metastore </description>
   </property>
   
</configuration>

nano jpox.properties

javax.jdo.PersistenceManagerFactoryClass =

org.jpox.PersistenceManagerFactoryImpl
org.jpox.autoCreateSchema = false
org.jpox.validateTables = false
org.jpox.validateColumns = false
org.jpox.validateConstraints = false
org.jpox.storeManagerType = rdbms
org.jpox.autoCreateSchema = true
org.jpox.autoStartMechanismMode = checked
org.jpox.transactionIsolation = read_committed
javax.jdo.option.DetachAllOnCommit = true
javax.jdo.option.NontransactionalRead = true
javax.jdo.option.ConnectionDriverName = org.apache.derby.jdbc.ClientDriver
javax.jdo.option.ConnectionURL = jdbc:derby://hadoop1:1527/metastore_db;create = true
javax.jdo.option.ConnectionUserName = APP
javax.jdo.option.ConnectionPassword = mine

# Setup Hive in HDFS
$HADOOP_HOME/bin/hadoop fs -mkdir /tmp 
$HADOOP_HOME/bin/hadoop fs -mkdir /user/hive/warehouse
$HADOOP_HOME/bin/hadoop fs -chmod g+w /tmp 
$HADOOP_HOME/bin/hadoop fs -chmod g+w /user/hive/warehouse

cd $HIVE_HOME
bin/schematool -initSchema -dbType derby
bin/hive

