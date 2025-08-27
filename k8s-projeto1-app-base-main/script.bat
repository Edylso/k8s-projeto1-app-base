echo "Criando as imagens....."

docker build -t edilso/projeto-backend:1.0 backend/.
docker build -t edilso/projeto-database:1.0 database/.

echo "Realizando o push das imagens....."

docker push edilso/projeto-backend:1.0
docker push edilso/projeto-database:1.0

echo "Criando os serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments no cluster kubernetes..."

kubectl apply -f ./deployment.yml
