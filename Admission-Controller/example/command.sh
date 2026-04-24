kubectl create ns admission-demo
kubectl create secret docker-registry my-docker-secret --docker-username=mkhamisi2007 --docker-password=XXXX --docker-email=m_khamisi_2007@yahoo.com -n admission-demo
docker login
docker build -t mkhamisi2007/admission-python:v1 .
docker push mkhamisi2007/admission-python:v1


openssl genrsa -out tls.key 2048
openssl req -new -key tls.key -subj "/CN=image-policy-webhook.admission-demo.svc" -out tls.csr
cat > csr.conf <<EOF
subjectAltName = DNS:image-policy-webhook.admission-demo.svc,DNS:image-policy-webhook.admission-demo.svc.cluster.local
EOF

CA_BUNDLE=$(cat tls.crt | base64 | tr -d '\n')
echo $CA_BUNDLE #----> copy for put in validating-webhook.yaml

kubectl create secret tls webhook-tls \
  --cert=tls.crt \
  --key=tls.key \
  -n admission-demo
  
kubectl apply -f webhook-deployment.yaml
kubectl apply -f validating-webhook.yaml

root@k8n-master:~/admission# kubectl run test-nginx --image=nginx
##--> pod/test-nginx created
root@k8n-master:~/admission# kubectl run test-busybox --image=busybox
##--> Error from server: admission webhook "image-policy.example.com" denied the request: Image 'busybox' is not allowed. Only nginx images are allowed.
