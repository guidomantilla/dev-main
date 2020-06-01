echo "" && echo "##### LIMPIANDO AMBIENTE DOCKER LOCAL #####" && echo ""
docker container rm --force dev-mysql
docker container rm --force dev-ldap-apache-server
docker container rm --force dev-sonarqube-server
docker network rm dev-network

echo "" && echo "##### DESCARGANDO PROYECTOS GITHUB #####" && echo ""
cd ..
WORK_DIR=$PWD

rm -rf dev-mysql
rm -rf dev-java-lib
rm -rf dev-ldap-apache-server

git clone git@github.com:guidomantilla/dev-mysql.git
echo ""
git clone https://github.com/guidomantilla/dev-java-lib
echo ""
git clone https://github.com/guidomantilla/dev-ldap-apache-server

echo "" && echo "##### PROYECTOS DESCARGADOS: #####"  && echo ""
echo "$(ls -h)"

echo "" && echo "##### CREANDO AMBIENTE DOCKER LOCAL #####"  && echo ""
cd $WORK_DIR/dev-main
docker-compose up -d --build

