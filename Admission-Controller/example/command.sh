kubectl create ns admission-demo
kubectl create secret docker-registry my-docker-secret --docker-username=mkhamisi2007 --docker-password=XXXX --docker-email=m_khamisi_2007@yahoo.com
docker build -t mkhamisi2007/admission-python:v1 .
docker push mkhamisi2007/admission-python:v1
