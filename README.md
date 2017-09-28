docker run -p 9000:9000 --restart always --name leanote_mongo -ti notes  

docker exec -i -t  raspi3_leanote_mongo    /bin/bash

apt-get install wget git

cd home

wget https://excellmedia.dl.sourceforge.net/project/leanote-bin/2.5/leanote-linux-arm-v2.5.bin.tar.gz

tar -xzvf leanote-linux-arm-v2.5.bin.tar.gz

rm leanote-linux-arm-v2.5.bin.tar.gz 



git clone https://github.com/Barryrowe/mongo-arm.git

echo "export PATH=$PATH:/home/mongo-arm/binaries/2.1.1/bin" >> /etc/profile

source /etc/profile

mkdir data


nano /etc/supervisor/conf.d/supervisord.conf   
mongod --dbpath /home/data 


mongorestore -h localhost -d leanote --dir /home/leanote/mongodb_backup/leanote_install_data/

chmod +x run.sh

sh /home/leanote/bin/run.sh


user1 username: admin, password: abc123 (管理员, 只有该用户才有权管理后台, 请及时修改密码)
user2 username: demo@leanote.com, password: demo@leanote.com (仅供体验使用)

sudo docker commit -m "run Leanote with mongo on resin/armv7hf-debian" -a "eloco" c685f462779f  eloco/raspi3_leanote_mongo:v3


docker run  --name raspi3_leanote_mongo -p 9000:9000 --restart always -ti  0d8d0c54074b
