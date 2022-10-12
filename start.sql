create database iocllive;
CREATE USER 'Xliconmys0618'@'localhost' IDENTIFIED WITH mysql_native_password BY 'XlServMys1706#';
GRANT ALL PRIVILEGES ON iocllive.* TO 'Xliconmys0618'@'localhost';
use iocllive;
source IOCL_DB_SCRIPT_20210505.sql;
source PythonUpdatePilesPhotos.sql
