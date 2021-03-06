echo "" && echo "##### LIMPIANDO AMBIENTE DOCKER LOCAL #####" && echo ""
docker container rm --force dev-mysql
docker container rm --force dev-ibmmq
docker container rm --force dev-activemq
docker container rm --force dev-ldap-apache
docker container rm --force dev-sonarqube
docker network rm dev-network

echo "" && echo "##### DESCARGANDO PROYECTOS GITHUB #####" && echo ""
cd ..
WORK_DIR=$PWD

rm -rf dev-java-lib
rm -rf dev-mysql
rm -rf dev-ibmmq
rm -rf dev-activemq
rm -rf dev-ldap-apache
rm -rf dev-sonarqube

echo ""
git clone https://github.com/guidomantilla/dev-java-lib

echo ""
git clone https://github.com/guidomantilla/dev-mysql

echo ""
git clone https://github.com/guidomantilla/dev-ibmmq

echo ""
git clone https://github.com/guidomantilla/dev-activemq

echo ""
git clone https://github.com/guidomantilla/dev-ldap-apache

echo ""
git clone https://github.com/guidomantilla/dev-sonarqube



echo "" && echo "##### PROYECTOS DESCARGADOS: #####"  && echo ""
echo "$(ls -h)"

echo "" && echo "##### CREANDO AMBIENTE DOCKER LOCAL #####"  && echo ""
cd $WORK_DIR/dev-main
docker-compose up -d --build

