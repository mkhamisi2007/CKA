kubectl create ns admission-demo
kubectl create secret docker-registry my-docker-secret --docker-username=mkhamisi2007 --docker-password=XXXX --docker-email=m_khamisi_2007@yahoo.com
docker build -t mkhamisi2007/admission-python:v1 .
docker push mkhamisi2007/admission-python:v1


openssl genrsa -out tls.key 2048
openssl req -new -key tls.key -subj "/CN=image-policy-webhook.admission-demo.svc" -out tls.csr
cat > csr.conf <<EOF
subjectAltName = DNS:image-policy-webhook.admission-demo.svc,DNS:image-policy-webhook.admission-demo.svc.cluster.local
EOF
