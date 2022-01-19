docker build -t daylanberry/multi-client:latest -t daylanberry/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t daylanberry/multi-server:latest -t daylanberry/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t daylanberry/multi-worker:latest -t daylanberry/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push daylanberry/multi-client:latest
docker push daylanberry/multi-server:latest
docker push daylanberry/multi-worker:latest
docker push daylanberry/multi-client:$SHA
docker push daylanberry/multi-server:$SHA
docker push daylanberry/multi-worker:$SHA
kubectl apply - k8s
kubectl set image deployments/server-deployment server=daylanberry/multi-server:$SHA
kubectl set image deployments/client-deployment client=daylanberry/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=daylanberry/multi-worker:$SHA