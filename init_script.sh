echo "export PYSPARK_PYTHON=python3" | sudo tee -a  /etc/profile.d/spark_config.sh  /etc/*bashrc /usr/lib/spark/conf/spark-env.sh;
echo "export PYTHONHASHSEED=0" | sudo tee -a /etc/profile.d/spark_config.sh /etc/*bashrc /usr/lib/spark/conf/spark-env.sh;
echo "spark.executorEnv.PYTHONHASHSEED=0" | sudo tee -a /etc/spark/conf/spark-defaults.conf;

# Add repo destination that contains python3.6
echo "deb http://ftp.de.debian.org/debian testing main" | sudo tee -a /etc/apt/sources.list;
echo 'APT::Default-Release "stable";' | sudo tee -a /etc/apt/apt.conf.d/00local;

# clean old dependencies
sudo apt-get autoclean;
sudo apt-get update;
# Need to be run one at a time and constant supervision
sudo apt-get upgrade;
sudo apt-get -u dist-upgrade;

# In case the set up crash
# sudo dpkg --configure -a;

# Set up python
sudo apt-get -t testing install python3.6;
wget https://bootstrap.pypa.io/get-pip.py;
sudo python3.6 get-pip.py;
python3 -m pip install --upgrade pip;
python3 -m pip install --user numpy scipy matplotlib ipython jupyter pandas sympy nose scikit-learn;
export PATH="/home/teekayu9/.local/bin:$PATH"

source ~/.bashrc
